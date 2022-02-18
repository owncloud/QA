#
# References:
# - https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html
# - https://confluence.owncloud.com/display/~abarz/Set+up+oC+and+elastic-search+with+docker

# source ./env.sh	# probably not needed

occ app:enable search_elastic

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
opts="-v $plugin_dir:$plugin_dir -v $pwdfile:$pwdfile -e ELASTIC_PASSWORD_FILE=$pwdfile"
# opts="$opts -e node.name=es01 -e cluster.initial_master_nodes=es01"
opts="$opts -e xpack.security.enabled=false -e discovery.type=single-node"


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
else
  loaded=$(docker logs es01 | grep -F 'loaded plugin [ingest-attachment]')
  echo $loaded
  if [ -z "$loaded" ]; then
    echo "search_elastic: ERROR: plugin ingest-attachment was not loaded. Check the logs"
  fi
  docker exec es01 env ELASTIC_PASSWORD_FILE= bin/elasticsearch-plugin list
  docker exec es01 bin/elasticsearch-keystore show bootstrap.password
fi

  
cat << EOM >>  ~/POSTINIT.msg
elastic_search:  password: $elastic_pass
elastic_search:  server: http://$elastic_host:9200
elastic_search:
elastic_search:  TODO: integrate with owncloud.
--------------------------------------------------------
EOM

