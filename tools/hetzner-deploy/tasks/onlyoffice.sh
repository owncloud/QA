source ./env.sh	# requires oc10_fqdn

occ app:enable onlyoffice
occ app:enable pdf_viewer	# for testing interoperability

mkdir -p /var/www/onlyoffice

volumes="-v /var/log/onlyoffice:/var/log/onlyoffice"
volumes="-v /var/lib/onlyoffice:/var/lib/onlyoffice $volumes"
volumes="-v /var/www/onlyoffice/Data:/var/www/onlyoffice/Data $volumes"

docker run --rm -ti --name onlyoffice -p 780:80 -p 7443:443 $volumes -d onlyoffice/documentserver
## startup takes ca 2 minute. Generating fonts, themes, ...
for wait in 20 20 20 20 20 20 20 20 20 20 20 20; do
  echo "waiting for onlyoffice/documentserver to start ..."
  sleep $wait
  docker logs onlyoffice
  started="$(grep 'nodeJS - worker ' /var/log/onlyoffice/documentserver/converter/out.log 2>&1 | grep started | wc -l)"
  test "$started" -ge 2 && break;
done
if [ "$started" -lt 2 ]; then
  echo "ERROR: Failed to start docker onlyoffice/documentserver"
else
  docker exec onlyoffice sudo supervisorctl start ds:example
fi
  

  
test -z "$oc10_fqdn" && oc10_fqdn="onlyoffice-$(date +%Y%m%d).jw-qa.owncloud.works"


cat << EOM >>  ~/POSTINIT.msg
onlyoffice:  Also enabled app pdf_viewer
onlyoffice:  Try editing at 
onlyoffice:	firefox http://$oc10_fqdn:780/example/
onlyoffice:	firefox http://$(hostname -I | cut -d ' ' -f 1):780/example/
onlyoffice:
onlyoffice:  TODO: add ssl cert.
onlyoffice:  TODO: integrate with owncloud.
--------------------------------------------------------
EOM

