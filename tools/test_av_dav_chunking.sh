#! /bin/bash
# 
# (C) 2021 jw@owncloud.com
#
# From https://github.com/owncloud/QA/edit/master/Server/Test_Plan_Files_Antivirus.md

user=admin
pwd=admin
host=localhost
path=owncloud

mkdir -p /tmp/eicar-files
cd /tmp/eicar-files

BASEFILES="eicar.com eicar_com.zip eicarcom2.zip"

for f in $BASEFILES; do
  test -e $f || wget https://secure.eicar.org/$f
  split -d -b 50 $f ${f}_
done

curls() { curl -s --user $user:$pwd http://$host/$path/"$@" | grep s:message || echo -e " \t ****** UPLOADED! ******"; }

echo -e "\nPress Enter to upload v1 dav path without chunking"; read a
###############################################################

for f in $BASEFILES; do
  echo -n $f
  curls remote.php/webdav/virus --request PUT --data-binary "@$f"
  sleep 1
done

echo -e "\nPress Enter to upload v1 dav path with chunking"; read a
###############################################################

for BASEFILE in $BASEFILES
do
    ID=$RANDOM
    NUM=0
    FILES=$(ls ${BASEFILE}_*)
    COUNT=$(echo $FILES | wc -w)
    echo uploading $FILES
    for FILE in $FILES
    do
        echo chunk name: VIRUS$BASEFILE-chunking-${ID}-${COUNT}-${NUM}
        curls remote.php/webdav/VIRUS$BASEFILE-chunking-${ID}-${COUNT}-${NUM} --request PUT --data-binary "@$FILE" -H "OC-Chunked:1"
        let NUM=NUM+1
    done
    sleep 1
done

echo -e "\nPress Enter to upload v2 dav path without chunking"; read a
###############################################################

for f in $BASEFILES; do
  echo -n $f
  curls remote.php/dav/files/$user/virus --request PUT --data-binary "@$f"
  sleep 1
done

echo -e "\nPress Enter to upload v2 dav path with chunking"; read a
###############################################################

for BASEFILE in $BASEFILES
do
    ID=$RANDOM
    echo -n "MKCOL: "
    curls remote.php/dav/uploads/$user/$ID --request MKCOL
    NUM=0
    FILES=$(ls ${BASEFILE}_*)
    echo uploading $FILES
    for FILE in $FILES
    do
        curls remote.php/dav/uploads/$user/$ID/$NUM --request PUT --data-binary "@$FILE"
        let NUM=NUM+1
    done
    echo "moving $BASEFILE"
    curls remote.php/dav/uploads/$user/$ID/.file --request MOVE -H "Destination: http://$host/$path/remote.php/dav/files/$user/virus_$BASEFILE"
    sleep 3
done

echo "Log in as $user at http://$host/$path and confirm that no file called 'virus' was uploaded."

rm -rf /tmp/eicar-files

