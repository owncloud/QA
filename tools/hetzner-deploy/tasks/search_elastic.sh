#
# References:
# - https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html
# - https://stackoverflow.com/questions/46627979/what-is-the-default-user-and-password-for-elasticsearch#46627980
# - https://confluence.owncloud.com/display/~abarz/Set+up+oC+and+elastic-search+with+docker
#
# To use with authentication,
# - In 7.2 docker parameter -e "ELASTIC_PASSWORD=my_own_password"
# - in elasticsearch.yml: xpack.security.enabled: true
#
# Requires:
# - 4GB of RAM, minimum, it's java!
# - vm.max_map_count=262144 - see below.

# source ./env.sh	# probably not needed

apt install -y  docker.io						# assert docker is here

## avoid errors:
# bootstrap check failure [1] of [2]: max virtual memory areas vm.max_map_count [65530] is too low, increase to at least [262144]
# bootstrap check failure [2] of [2]: the default discovery settings are unsuitable for production use; at least one of [discovery.seed_hosts, discovery.seed_providers, cluster.initial_master_nodes] must be configured
##
echo > /etc/sysctl.d/88-elastic.conf vm.max_map_count=262144
sysctl -w vm.max_map_count=262144
sysctl vm.max_map_count		# should print out 262144
elastic_pass="$(tr -dc 'a-z0-9' < /dev/urandom | head -c 10)"
pwdfile=/run/secrets/bootstrapPassword.txt
mkdir -p "$(dirname $pwdfile)"
echo $elastic_pass > $pwdfile
chmod 400 $pwdfile		# must have file permissions 400 or 600,


# we place plugins in a persistant directory, so that we can restart the docker. That is needed after installing a plugin.
plugin_dir=/usr/share/elasticsearch/plugins/
config_dir=/usr/share/elasticsearch/config/
opts="-v $plugin_dir:$plugin_dir -e ELASTIC_PASSWORD=$elastic_pass"
# -v $pwdfile:$pwdfile -e ELASTIC_PASSWORD_FILE="$pwdfile"
# opts="$opts -e node.name=es01 -e cluster.initial_master_nodes=es01"
opts="$opts -e xpack.security.enabled=true -e discovery.type=single-node"


# choose a version seen in https://github.com/elastic/elasticsearch/branches
img=docker.elastic.co/elasticsearch/elasticsearch:7.17.0	# latest known es7
# img=docker pull docker.elastic.co/elasticsearch/elasticsearch:8.0.0	# try es8 ?

docker pull $img
docker run --rm --name es01 $opts $img bin/elasticsearch-plugin install -b ingest-attachment
docker run --name es01 $opts -d $img

sleep 5
elastic_host=$(docker inspect es01 | jq '.[0].NetworkSettings.IPAddress' -r)
if [ -z "$elastic_host" ]; then
  echo "search_elastic: ERROR: could not get ip addr from server."
  docker logs es01 || true
fi

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
  docker exec -ti es01 sh -c "echo 'xpack.security.enabled: true' >> $config_dir/elasticsearch.yml"
  docker exec es01 bin/elasticsearch-plugin list
  docker exec es01 bin/elasticsearch-keystore show bootstrap.password
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

  curl -s -u elastic:$elastic_pass http://$elastic_host:9200
fi


## connect to owncloud and initialize an index
occ app:enable search_elastic
occ config:app:set search_elastic servers --value "elastic:$elastic_pass@$elastic_host:9200"
occ config:app:delete search_elastic scanExternalStorages	# only way to enable this option: https://github.com/owncloud/search_elastic/issues/260
occ occ config:app:set search_elastic nocontent --value false	# false: enable contents search. - true: only file name search
occ search:index:create --all
occ search:index:reset -f	# needed so that the web UI acknowledges '0 nodes marked as indexed, 0 documents in index using 226 bytes'
sleep 3				# TODO: delay does not help here. file scan does not help here. User must forst edit a file via web ui.
occ search:index:update		# try trigger 'OCA\Search_Elastic\Jobs\UpdateContent' -- FIXME: this probably only says 'No pending jobs found.'

instanceid=$(sed -ne "s/^.*'instanceid'//p" config/config.php |  sed -e "s/[^']*'//" -e "s/'.*//")
echo "select * from oc_appconfig where appid = 'search_elastic';" | mysql owncloud -t


## communication log done with
##
##  docker exec -ti es01 bin/elasticsearch-sql-cli http://elastic:$elastic_pass@localhost:9200
##  sql> select "file.content_length",mtime, name, size, users from "oc-$instanceid";
##
# 48190 write(7, "POST /_sql?error_trace HTTP/1.1\r\nAccept-Charset: UTF-8\r\nAuthorization: Basic ZWxhc3RpYzp1YTkxMTZycTdl\r\nContent-Type: application/json\r\nAccept: application/json\r\nCache-Control: no-cache\r\nPragma: no-cache\r\nUser-Agent: Java/17.0.1\r\nHost: localhost:9200\r\nConnection: keep-alive\r\nContent-Length: 250\r\n\r\n", 298 <unfinished ...>
# 48190 write(7, "{\"query\":\"select \\\"file.content_length\\\",mtime, name, size, users from \\\"oc-ocfa7cgsd87h\\\"\",\"mode\":\"cli\",\"version\":\"7.17.0\",\"time_zone\":\"Z\",\"request_timeout\":\"90000ms\",\"page_timeout\":\"45000ms\",\"columnar\":false,\"binary_format\":false,\"keep_alive\":\"5d\"}"

# condensed form:
curl -H "Content-Type: application/json" -s "http://elastic:$elastic_pass@$elastic_host:9200/_sql" --data '{"query":"select \"file.content_length\",mtime, name, size, users from \"oc-'"$instanceid"'\"","binary_format":false}'  | sed -e 's/\[/\n[/g'

cat >> ./env.sh << EOE
elastic_host=$elastic_host
elastic_user=elastic
elastic_pass=$elastic_pass
instanceid=$instanceid
EOE

cat <<EOS > /usr/bin/elastic_sql
#! /bin/bash
if [ -z "\$1" -o "\$1" = "-h" ]; then
  echo -e "Usage:\n\t \$0" '"select \"file.content_length\",mtime, name, size, users, left(\"file.content\", 50) from \"oc-$instanceid\""'
  echo ""
  exit 1
fi
qq="\$(echo "\$1" | sed -e 's/"/\\\\"/g')";
json="{\"query\":\"\$qq\",\"binary_format\":false}"
url="http://elastic:$elastic_pass@$elastic_host:9200/_sql"
curl -H "Content-Type: application/json" -s "\$url" --data "\$json" | sed -e 's/\[/\n[/g'
echo ""
EOS
chmod a+x /usr/bin/elastic_sql

cat << EOM >>  ~/POSTINIT.msg
elastic_search:  connection: $elastic_host:9200 - user: elastic - password: $elastic_pass
elastic_search:  url: http://elastic:$elastic_pass@$elastic_host:9200
elastic_search:
elastic_search:  Edit some text files, then try
elastic_search:    occ search:index:update
elastic_search:    elastic_sql "show tables"
elastic_search:    elastic_sql "select \"file.content_length\", name, size, users, left(\"file.content\", 50) from \"oc-$instanceid\""
--------------------------------------------------------
EOM

