#
# References:
# - https://www.elastic.co/blog/configuring-ssl-tls-and-https-to-secure-elasticsearch-kibana-beats-and-logstash
# - https://techoverflow.net/2021/08/02/simple-elasticsearch-setup-with-docker-compose/
# - https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html
# - https://confluence.owncloud.com/display/~abarz/Set+up+oC+and+elastic-search+with+docker
#
# To use with authentication,
# - In 7.2 docker parameter -e "ELASTIC_PASSWORD=my_own_password"
# - in elasticsearch.yml: xpack.security.enabled: true
#
# Evaluate SSL options:
# - https://nginxproxymanager.com/ a docker image wit a UI
#
#
# Requires:
# - 4GB of RAM, minimum, it's java!
# - vm.max_map_count=262144 - see below.

source ./env.sh				# we need OC10_ADMIN_PASS

elastic_port="9200"			# always 9200, for both http or https
elastic_proto="http"			# "http", or "https" untested! (Ignored in 2.1.0 or before)

apt install -y docker-compose docker.io	# assert docker is here
occ app:enable search_elastic		# so that we can get it's version number

version_gt() { test "$(echo -e "$1\n$2" | sort -V | head -n 1)" != "$1"; }
version="$(occ app:list search_elastic --output json | jq '.. | select(.Version?) | .Version' -r)"
if [ -z "$version" ]; then
  echo "search_elastic app not installed? Could not get version."
  sleep 5
  exit 0
fi

elastic_pass="$(tr -dc 'a-z0-9' < /dev/urandom | head -c 10)"

if version_gt "$version" 2.1.0; then
  echo "Server protocol: $elastic_proto"
else
  echo "Server url is written without protocol in search_elastic <= 2.1.0"
  elastic_proto=""
fi

if version_gt "$version" 2.0.0; then
  use_authentication=true
  if [ -n "$elastic_proto" ]; then
    elastic_url="$elastic_proto://elastic:$elastic_pass@"	# host and port are added later
  else
    elastic_url="elastic:$elastic_pass@"
  fi
else
  echo "Server authentication is not supported in search_elastic <= 2.0.0"
  echo "Will configure a server without authentication"
  use_authentication=false
  elastic_url=""
fi

## avoid errors:
# bootstrap check failure [1] of [2]: max virtual memory areas vm.max_map_count [65530] is too low, increase to at least [262144]
# bootstrap check failure [2] of [2]: the default discovery settings are unsuitable for production use; at least one of [discovery.seed_hosts, discovery.seed_providers, cluster.initial_master_nodes] must be configured
##
echo > /etc/sysctl.d/88-elastic.conf vm.max_map_count=262144
sysctl -w vm.max_map_count=262144
sysctl vm.max_map_count		# should print out 262144
pwdfile=/run/secrets/bootstrapPassword.txt
mkdir -p "$(dirname $pwdfile)"
echo $elastic_pass > $pwdfile
chmod 400 $pwdfile		# must have file permissions 400 or 600,

# choose a version seen in https://github.com/elastic/elasticsearch/branches
# Check for latest image https://hub.docker.com/_/elasticsearch/tags
img=docker.elastic.co/elasticsearch/elasticsearch:7.17.9	# latest known es7
img=docker.elastic.co/elasticsearch/elasticsearch:8.16.0	# try es8 ? -> fails with "Cannot connect"


# we place plugins in a persistant directory, so that we can restart the docker. That is needed after installing a plugin.
plugin_dir=/usr/share/elasticsearch/plugins/	# with v8, the ingest-attachment is no longer a plugin.
config_dir=/usr/share/elasticsearch/config/	# needs mode 777, and then still explodes with missing files. Do not use.
config_file=$config_dir/elasticsearch.yml
mkdir -p $config_dir
cat <<EOC>>$config_file
cluster.name: docker-cluster
node.name: es01
path.data: /usr/share/elasticsearch/data
network.host: 0.0.0.0
discovery.type: single-node
EOC
# don't do this for es:8, there the module is auto-enabled.
#echo "$img" | grep -q "elasticsearch:7" && echo "ingest.attachment.enabled: true" >> $config_file
chmod -R 777 $config_dir		# phew...

## We cannot easily persist the entire config_dir, there are many files and subfolders needed in there...
# opts="-v $plugin_dir:$plugin_dir -v $config_dir:$config_dir -e discovery.type=single-node"
opts="-v $plugin_dir:$plugin_dir -v $config_file:$config_file -e discovery.type=single-node"
# -v $pwdfile:$pwdfile -e ELASTIC_PASSWORD_FILE="$pwdfile"
# opts="$opts -e node.name=es01 -e cluster.initial_master_nodes=es01"

if $use_authentication; then
  opts="$opts -e xpack.security.enabled=true -e ELASTIC_PASSWORD=$elastic_pass"
fi

#echo "$img" | grep -q "elasticsearch:7" && opts="$opts -e ingest.attachment.enabled=true"	# elastic7 also explodes when this is in the config_file

if [ "$elastic_proto" = "https" ]; then
  # we don't have an ssh.key yet, this will cause an error, but only after the config_dir inside docker is initialized.
  # We can harvest this, and run a new contianer from the modded config_dir.
  opts="$opts -e xpack.security.http.ssl.enabled=true -e xpack.security.transport.ssl.enabled=true"
fi

# Static setting are documented in https://www.elastic.co/guide/en/elasticsearch/reference/current/settings.html as
# "can only be configured on an unstarted or shut down node using elasticsearch.yml."
# These can be set in docker like this:
opts="$opts -e xpack.security.authc.api_key.enabled=true"	# enable the API Key service

# opts="$opts -e 'ES_JAVA_OPTS=-Xms512m -Xmx512m'"	# probably not needed. FIXME: docker -e does not handle whitespace.

docker pull $img || { sleep 30; docker pull $img; } || { sleep 60; docker pull $img; }	# their dockerhub is unreliable
## The next line may output: [ingest-attachment] is no longer a plugin but instead a module packaged with this distribution of Elasticsearch
## Maybe the line is not needed altogether with modern es??
docker run --rm --name es01 $opts $img bin/elasticsearch-plugin install -b ingest-attachment || exit 0;
# docker rm es01 > /dev/null 2>&1 || true
if [ "$elastic_proto" = "https" ]; then
  ## we have two options to provide the cert data. a) elasticsearch.yml config file, b) environment
  ## a) the config can be prepared by letting it crash like this:
  # echo "Expected error message: java.lang.IllegalArgumentException: a key must be provided to run as a server."
  # # the key should be configured using the [xpack.security.http.ssl.key] or [xpack.security.http.ssl.keystore.path] setting
  # docker run --name es01 $opts $img > /dev/null
  # docker cp -a es01:$config_dir .
  # docker rm es01
  # mv config $config_dir
  # opts="-v $config_dir:$config_dir $opts"
  ## add the needed keys to the config
  ## b) by pumping up the environment
  cert_ipaddr=$(docker run --rm --name es01 $opts $img hostname -I)
  docker run --rm --name es01 $opts $img bin/elasticsearch-certutil cert --keep-ca-key --pem --name es01 --dns es01.local --ip $cert_ipaddr --out $config_dir/certs2.zip
  unzip -v $config_dir/certs2.zip
  opts="$opts \
      -e node.name=es01 \
      -e ELASTIC_PASSWORD=${ELASTIC_PASSWORD} \
      -e bootstrap.memory_lock=true \
      -e xpack.security.enabled=true \
      -e xpack.security.http.ssl.enabled=true \
      -e xpack.security.http.ssl.key=certs/es01/es01.key \
      -e xpack.security.http.ssl.certificate=certs/es01/es01.crt \
      -e xpack.security.http.ssl.certificate_authorities=certs/ca/ca.crt \
      -e xpack.security.http.ssl.verification_mode=certificate \
      -e xpack.security.transport.ssl.enabled=true \
      -e xpack.security.transport.ssl.key=certs/es01/es01.key \
      -e xpack.security.transport.ssl.certificate=certs/es01/es01.crt \
      -e xpack.security.transport.ssl.certificate_authorities=certs/ca/ca.crt \
      -e xpack.security.transport.ssl.verification_mode=certificate \
"
  # XXX FIXME: what about these?
  #    -e xpack.license.self_generated.type=${LICENSE} \
  #    -e cluster.initial_master_nodes=es01,es02,es03 \
  #    -e discovery.seed_hosts=es02,es03 \
  #    -e cluster.name=${CLUSTER_NAME} \

  # docker cp es01:/usr/share/elasticsearch/config/certs/http_ca.crt .
  # curl --cacert http_ca.crt -u elastic https://localhost:$elastic_port
fi
docker run --name es01 $opts -d $img

sleep 5
elastic_host=$(docker inspect es01 | jq '.[0].NetworkSettings.IPAddress' -r)
if [ -z "$elastic_host" ]; then
  echo "search_elastic: ERROR: could not get ip addr from server."
  docker logs es01 || true
fi
elastic_url="$elastic_url$elastic_host:$elastic_port"	# complete the url

## this is a java monster. It takes 30 seconds to boot and check if configs are wrong.
for wait in 15 15 15 15 20 20 30 30; do
  echo "waiting for elasticsearch to start ..."
  sleep $wait
  started="$(docker logs es01 | grep -F 'health status changed from [YELLOW] to [GREEN]')"
  test -n "$started" && break;
done
echo $started
if [ -z "$started" ]; then
  echo "ERROR: Failed to start docker $img"
  docker logs es01 || true
else
  loaded=$(docker logs es01 | grep -F 'loaded plugin [ingest-attachment]')
  echo $loaded
  if [ -z "$loaded" ]; then
    echo "search_elastic: ERROR: plugin ingest-attachment was not loaded. Check the logs"
    docker logs es01 || true
  fi
  docker exec es01 bin/elasticsearch-plugin list
  if [ "$elastic_proto" = "https" ]; then
    docker exec es01 sh -c "echo 'xpack.security.http.ssl.enabled: true' >> $config_dir/elasticsearch.yml"
    docker exec es01 sh -c "echo 'xpack.security.transport.ssl.enabled: true' >> $config_dir/elasticsearch.yml"
  fi
  if $use_authentication; then
    docker exec es01 sh -c "echo 'xpack.security.enabled: true' >> $config_dir/elasticsearch.yml"
    docker exec es01 bin/elasticsearch-keystore show bootstrap.password || true
    # docker exec es01 bin/elasticsearch-setup-passwords auto -b
    # Changed password for user apm_system
    # PASSWORD apm_system = GXNX6kOyPhODGR9GcZPl
    #
    # Changed password for user kibana_system
    # PASSWORD kibana_system = qkbif6hBbWeTIqoVwZX5
    #
    # Changed password for user kibana
    # PASSWORD kibana = qkbif6hBbWeTIqoVwZX5
    #
    # Changed password for user logstash_system
    # PASSWORD logstash_system = cRLUuXwwTKwrb9JN5Rkm
    #
    # Changed password for user beats_system
    # PASSWORD beats_system = 4ukaSKpfplA7WXUaF54U
    #
    # Changed password for user remote_monitoring_user
    # PASSWORD remote_monitoring_user = Fu6rOmOg22dqdMT7Hdz9
    #
    # Changed password for user elastic
    # PASSWORD elastic = 8mUS6nmLKtuzluOOz9bw
    curl -s -u elastic:$elastic_pass $elastic_url
  else
    curl -s $elastic_url
  fi
fi


## connect to owncloud and initialize an index
if version_gt "$version" 2.1.99; then
  echo " ... configuring elastic search connection with app version 2.2.0 or later"
  ## via occ and mysql: (requires internal knowledge about interface ICredentialsManager, oc will explode, if we do something wrong there)
  # occ config:app:set search_elastic servers             --value "$elastic_proto://$elastic_host:$elastic_port"
  # occ config:app:set search_elastic auth_param:username --value "elastic"
  # occ config:app:set search_elastic server_auth         --value "userPass"	# or "apiKey"
  # encrypted like lib/private/Security/CredentialsManager.php -> store
  # crypted="$(php -r 'require_once "/var/www/owncloud/lib/base.php"; echo OC::$server->getCrypto()->encrypt(\json_encode("$argv[1]")) . "\n";' "$elastic_pass")"
  # mysql owncloud -e "DELETE FROM oc_credentials WHERE identifier = 'search_elastic:auth_param:apiKey'"
  # mysql owncloud -e "DELETE FROM oc_credentials WHERE identifier = 'search_elastic:auth_param:password'"
  # mysql owncloud -e "INSERT INTO oc_credentials (user, identifier, credentials) VALUES ('', 'search_elastic:auth_param:password', '$crypted')"


  ## via REST API json (requires internal knowledge about login form fields, oc protected by API):
  elastic_auth="\"authParams\": { \"username\":\"elastic\", \"password\":\"$elastic_pass\" }"
  elastic_json="{ \"servers\":\"$elastic_proto://$elastic_host:$elastic_port\", \"authType\":\"userPass\", $elastic_auth }"

  requesttoken=$(curl -s -L -c cookie.jar 'http://localhost' | sed -n -e 's@">$@@' -e 's@.*name="requesttoken" value="@@p')
  curl -L -s -b cookie.jar -c cookie.jar 'http://localhost/index.php/login' --data-raw "user=admin&password=$OC10_ADMIN_PASS&timezone-offset=2&timezone=Europe%2FBerlin&requesttoken=$requesttoken" | grep admin
  # This grep only finds '				value="admin"			' when the password did not match.

  curl -v -L -b cookie.jar -c cookie.jar -X POST -H "Content-Type: application/json" -d "$elastic_json" 'http://localhost/index.php/apps/search_elastic/settings/servers'

elif version_gt "$version" 2.1.0; then
  # since 2.1.1 we need an encrypted password in a separate database field.
  # encrypted like search_elastic/lib/SearchElasticConfigService.php setServerPassword
  crypted="$(php -r 'require_once "/var/www/owncloud/lib/base.php"; echo OC::$server->getCrypto()->encrypt("$argv[1]") . "\n";' "$elastic_pass")"

  occ config:app:set search_elastic servers     --value "$elastic_proto://$elastic_host:$elastic_port" 	# specifying user:pass@ fails to connect in search_elastic 2.1.1 and up
  occ config:app:set search_elastic server_user --value "elastic"
  occ config:app:set search_elastic server_pass --value "$crypted"
else
  occ config:app:set search_elastic servers --value "$elastic_url" 			# specifying user:pass@ is a malformed URL in search_elastic 2.0.0
fi
# occ config:app:delete search_elastic scanExternalStorages	# only way to enable this option before 2.1.0-rc3: https://github.com/owncloud/search_elastic/issues/260
occ config:app:set search_elastic nocontent --value false	# false: enable contents search. - true: only file name search
## connectors management, new in 2.4.0
occ config:app:set search_elastic connectors_write --value "Legacy,RelevanceV2"
occ config:app:set search_elastic connectors_search --value "RelevanceV2"

## populate the index. Hope this is not needed: occ search:index:fillSecondary RelevanceV2 $USER
occ search:index:create --all
occ search:index:reset -f	# needed so that the web UI acknowledges '0 nodes marked as indexed, 0 documents in index using 226 bytes'
sleep 3				# TODO: delay does not help here. file scan does not help here. User must force edit a file via web ui.
occ search:index:update		# try trigger 'OCA\Search_Elastic\Jobs\UpdateContent' -- FIXME: this probably only says 'No pending jobs found.'

instanceid=$(sed -ne "s/^.*'instanceid'//p" o/config/config.php |  sed -e "s/[^']*'//" -e "s/'.*//")
mysql owncloud -e "SELECT * FROM oc_appconfig WHERE appid = 'search_elastic'"
mysql owncloud -e 'SELECT * FROM oc_credentials where identifier like "search_elastic:%"'


## communication log done with
##
##  docker exec -ti es01 bin/elasticsearch-sql-cli http://elastic:$elastic_pass@localhost:$elastic_port
##  sql> select "file.content_length",mtime, name, size, users from "oc-$instanceid";
##
# 48190 write(7, "POST /_sql?error_trace HTTP/1.1\r\nAccept-Charset: UTF-8\r\nAuthorization: Basic ZWxhc3RpYzp1YTkxMTZycTdl\r\nContent-Type: application/json\r\nAccept: application/json\r\nCache-Control: no-cache\r\nPragma: no-cache\r\nUser-Agent: Java/17.0.1\r\nHost: localhost:9200\r\nConnection: keep-alive\r\nContent-Length: 250\r\n\r\n", 298 <unfinished ...>
# 48190 write(7, "{\"query\":\"select \\\"file.content_length\\\",mtime, name, size, users from \\\"oc-ocfa7cgsd87h\\\"\",\"mode\":\"cli\",\"version\":\"7.17.0\",\"time_zone\":\"Z\",\"request_timeout\":\"90000ms\",\"page_timeout\":\"45000ms\",\"columnar\":false,\"binary_format\":false,\"keep_alive\":\"5d\"}"

# curl -H "Content-Type: application/json" -s "$elastic_url/_sql" --data '{"query":"select * from \"oc-'"$instanceid"'\"","binary_format":false}'

# cannot pipe into jq, we often have invalid utf8 in the table.
cat <<EOSQ > /usr/bin/elastic_sql
#! /bin/bash
if [ -z "\$1" -o "\$1" = "-h" ]; then
  echo -e "Usage:\n  \$0" "'select \"file.content_length\",mtime, name, size, users, left(\"file.content\", 50) from \"oc-$instanceid\"'"
  echo ""
  exit 1
fi
qq="\$(echo "\$1" | sed -e 's/"/\\\\"/g')";
json="{\"query\":\"\$qq\",\"binary_format\":false}"
url="$elastic_url/_sql"
curl -H "Content-Type: application/json" -s "\$url" --data "\$json" | sed -e 's/\[/\n[/g' -e 's/,/,	/g'
echo ""
EOSQ
chmod a+x /usr/bin/elastic_sql

# cannot pipe into jq, we often have invalid utf8 in the table.
cat <<EOSE > /usr/bin/elastic_search_all
#! /bin/bash
url="$elastic_url/oc-$instanceid/_search"
json="'{ "query": { "size": 1000, "from": 0, "match_all": {} } }'"
# curl -H "Content-Type: application/json" -s "\$url" --data "\$json"
curl -s "\$url?pretty=true&q=*:*&size=10000"
EOSE
chmod a+x /usr/bin/elastic_search_all

elastic_sql "select * from \"oc-$instanceid\"" | strings | head -20

cat <<EOA > /usr/bin/elastic_api_key
#! /bin/bash
# This requires xpack.security.authc.api_key.enabled=true
json="{\"name\":\"jw-qa\", \"metadata\":{ \"application\":\"ownCloud\", \"testing\": true }}"
url="$elastic_url/_security/api_key"
curl -H "Content-Type: application/json" -s "\$url" --data "\$json" | jq
EOA
chmod a+x /usr/bin/elastic_api_key

cat >> ./env.sh << EOE
elastic_proto=$elastic_proto
elastic_user=elastic
elastic_pass=$elastic_pass
elastic_host=$elastic_host
elastic_port=$elastic_port
elastic_url=$elastic_url
instanceid=$instanceid
EOE

cat << EOM >>  ~/POSTINIT.msg
elastic_search:  admin: check the search config, it should not use localhost:9200 unauthenticated, it should use the components of the url below:
elastic_search:  url: $elastic_url
elastic_search:
elastic_search:  Edit some text files, then try
elastic_search:    occ search:index:update
elastic_search:    elastic_sql "show tables"
elastic_search:    elastic_sql 'select "file.content_length", name, size, users, left("file.content", 50) from "oc-$instanceid"'
elastic_search:    elastic_sql 'select "file.content_length", name, size, left("file.content", 50) from "oc-$instanceid"'	# if array is not supported
elastic_search:    elastic_search_all
elastic_search:
elastic_search:  Switch to RelevanceV2 connector https://github.com/owncloud/search_elastic/pull/319
elastic_search:   - Add the "RelevanceV2" connector to the list of write connectors. The list should have both "Legacy" and "RelevanceV2"
elastic_search:   occ config:list search_elastic
elastic_search:
elastic_search:  To setup an https-reverse-proxy for the elastic server, do
elastic_search:    env MKCERT_VALID_DAYS=7 /usr/local/bin/mkcert DNS:localhost
elastic_search:    cp ./jw-qa-ca.crt /usr/local/share/ca-certificates; update-ca-certificates
elastic_search:    /usr/local/bin/nginx_ssl_proxy 19443 http://$elastic_host:9200 ./local_cert.crt ./local_cert.key
elastic_search:  Then try using:
elastic_search:    -    https://localhost:19443
elastic_search:    - or https://localhost:19443/subdomain-redirect/
elastic_search:
elastic_search:  Default is user/pass auth. At admin's settings->search, try to switch to API-Key with the "encoded" value from
elastic_search:	   elastic_api_key
--------------------------------------------------------
EOM

