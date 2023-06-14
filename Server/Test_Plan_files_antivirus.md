References: [Template](https://github.com/owncloud/QA/edit/master/Server/Test_Plan_files_antivirus.md)

## Setup

  - Download:
     - https://www.eicar.org/?page_id=3950
     - https://github.com/fire1ce/eicar-standard-antivirus-test-files
  - `oc10.sh files_antivirus` 
     -> https://oc10110a2-antivirus-110rc2-20220729.jw-qa.owncloud.works

## File antivirus Test Plan

### Installing the app
| Test Case                                | Expected Result                          | Result | Related Comment |
| ---------------------------------------- | ---------------------------------------- | ------ | --------------- |
| Enable the app in the WebGUI             | No problems found.                       | 🚧     |                 |
| Disable and enable the app using CLI.    | No problems found.                       | 🚧     |                 |


### Input field validation

| Test Case                                | Expected Result                          | Result | Related Comment |
| ---------------------------------------- | ---------------------------------------- | ------ | --------------- |
| Enter an invalid hostname e.g. 'localhost%&$#+~' and save the antivirus settings | saving is rejected |    🚧     |                 |
| Enter a negative number as "Port" and save the antivirus settings | saving is rejected |    🚧     |                 |
| Enter a number larger than 65535 as "Port" and save | saving is rejected |    🚧     |                 |
| Enter a floating point number as "Port" and save the antivirus settings | saving is rejected |    🚧     |                 |
| Enter "0" as "Port" and save the antivirus settings | saving is rejected |    🚧     |  
| Enter a non numerical string as "Port" and save the antivirus settings | saving is rejected |    🚧     |              |
| Enter a negative number as "Stream Length" and save the antivirus settings | saving is rejected |    🚧     |                 |
| Enter a floating point number as "Stream Length" and save the antivirus settings | saving is rejected |    🚧     |                 |
| Enter a floating point number as "Stream Length" and save the antivirus settings | saving is rejected |    🚧     |   
| Enter a non numerical string as "Stream Length" and save the antivirus settings | saving is rejected |    🚧     |              |
| Enter "0" as "Stream Length" and save the antivirus settings | saving is rejected |    🚧     |
| Enter a negative number, less than -1 as "File size limit" and save the antivirus settings | saving is rejected |    🚧     |                 |
| Enter a floating point number as "File size limit" and save the antivirus settings | saving is rejected |    🚧     |                 |
| Enter a non numerical string as "File size limit" and save the antivirus settings | saving is rejected |    🚧     |              |
| Enter "0" as "File size limit" and save the antivirus settings | saving is rejected |    🚧     |  

### clamAV executable mode upload

1. setup the file antivirus app to use clamAV in "Executable" mode
2. upload `eicar.com`, `eicar_com.zip` and `eicarcom2.zip` from https://www.eicar.org/?page_id=3950 via all available endpoints. (See "Tips how to test different endpoints with curl")

None of these uploads should be possible.

| upload test ↓ Testfile→       | eicar.com | eicar_com.zip | eicarcom2.zip |
| ----------------------------- | --------- | ------------- | ------------- |
| old dav path without chunking	|    🚧     |       🚧       |      🚧       |		
| old dav path with chunking    |    🚧     |       🚧       |      🚧       |
| new dav path without chunking |    🚧     |       🚧       |      🚧       |
| new dav path with chunking    |    🚧     |       🚧       |      🚧       |
| public upload                 |    🚧     |       🚧       |      🚧       |
| files_texteditor app          |    🚧     |       -       |      -        |

### clamAV daemon mode upload

1. setup the file antivirus app to use clamAV in "Daemon" mode
2. upload `eicar.com`, `eicar_com.zip` and `eicarcom2.zip` from https://www.eicar.org/?page_id=3950 via all available endpoints. (See "Tips how to test different endpoints with curl")

None of these uploads should be possible.

| upload test ↓ Testfile→       | eicar.com | eicar_com.zip | eicarcom2.zip |
| ----------------------------- | --------- | ------------- | ------------- |
| old dav path without chunking	|    🚧     |       🚧       |      🚧       |		
| old dav path with chunking    |    🚧     |       🚧       |      🚧       |
| new dav path without chunking |    🚧     |       🚧       |      🚧       |
| new dav path with chunking    |    🚧     |       🚧       |      🚧       |
| public upload                 |    🚧     |       🚧       |      🚧       |
| files_texteditor app          |    🚧     |       -       |      -        |

### clamAV daemon (socket) mode upload

1. setup the file antivirus app to use clamAV in "Daemon (Socket)" mode
2. upload `eicar.com`, `eicar_com.zip` and `eicarcom2.zip` from https://www.eicar.org/?page_id=3950 via all available endpoints. (See "Tips how to test different endpoints with curl")

None of these uploads should be possible.

| upload test ↓ Testfile→       | eicar.com | eicar_com.zip | eicarcom2.zip |
| ----------------------------- | --------- | ------------- | ------------- |
| old dav path without chunking	|    🚧     |       🚧       |      🚧       |		
| old dav path with chunking    |    🚧     |       🚧       |      🚧       |
| new dav path without chunking |    🚧     |       🚧       |      🚧       |
| new dav path with chunking    |    🚧     |       🚧       |      🚧       |
| public upload                 |    🚧     |       🚧       |      🚧       |
| files_texteditor app          |    🚧     |       -       |      -        |

### Filesize limit

set "File size limit" to 100 bytes
uploads of `eicar.com` (68byte) should be blocked
uploads of `eicar_com.zip` (184byte) should pass

| upload test ↓ Testfile→       | expected result | eicar.com |
| ----------------------------- | ---------------------- | -------------------------- |
| old dav path without chunking	| blocked |   🚧                   |
| old dav path with chunking    | blocked |   🚧                   |
| new dav path without chunking | blocked |   🚧                   |
| new dav path with chunking    | blocked |   🚧                   |
| public upload                 | blocked |   🚧                   |


| upload test ↓ Testfile→       | expected result | eicar.com.zip |
| ----------------------------- | ---------------------- | -------------------------- |
| old dav path without chunking	| passed |    🚧                   |
| old dav path with chunking    | blocked |   🚧                   |
| new dav path without chunking | passed |    🚧                   |
| new dav path with chunking    | blocked |   🚧                   |
| public upload                 | passed |    🚧                   |


### background scan

run these steps between every test case in this chapter:
1. disable antivirus app
2. upload `eicar.com`, `eicar_com.zip` and `eicarcom2.zip` from https://www.eicar.org/?page_id=3950 to the owncloud system under test
3. enable antivirus app
4. set "When infected files were found during a background scan" to "logSetting"
5. set "File size limit" to "fileSizeLimit"
6. wait 15 min (or change `$this->setInterval(60 * 15);` in `lib/Cron/Task.php` to a smaller number)
7. trigger cron job by running `occ system:cron -vvv -p`
8. check logfile
9. check files

| Test Case                                | Expected Result                          | Result | Related Comment |
| ---------------------------------------- | ---------------------------------------- | ------ | --------------- |
| logSetting = "Only log"<br>fileSizeLimit="-1" | 1. `eicar.com`, `eicar_com.zip` and `eicarcom2.zip` are logged as infected<br>2. all files still exist on the system | 🚧     |                 |
| logSetting = "Only log"<br>fileSizeLimit="100" | 1. only `eicar.com` is logged as infected<br>2. all files still exist on the system | 🚧     |                 |
| logSetting = "Delete file"<br>fileSizeLimit="-1" | 1. `eicar.com`, `eicar_com.zip` and `eicarcom2.zip` are logged as infected and deleted<br>2. `eicar.com`, `eicar_com.zip` and `eicarcom2.zip` disappear from the system | 🚧     |                 |
| logSetting = "Delete file"<br>fileSizeLimit="100" | 1. only `eicar.com` is logged as infected  and deleted<br>2. only `eicar.com` disappears from the system | 🚧     |                 |

## Tips how to test different endpoints with curl

1. setup variables:
```
user=admin
pwd=admin
host=localhost
path=owncloud
```

2. split file for chunking
```
split -d -b 50 eicar.com eicar.com_
```
you will end up with `eicar.com_00` and `eicar.com_01`
do the same for the zip files. There will be more "chunks" as the zip files are bigger

3. upload v1 dav path without chunking
```
curl --user $user:$pwd http://$host/$path/remote.php/webdav/virus --request PUT --data-binary "@eicar.com"
```

4. upload v1 dav path with chunking
The amount of chunks might vary depending on the split size and the original file size
```
curl --user $user:$pwd http://$host/$path/remote.php/webdav/virus-chunking-1234-2-0 --request PUT --data-binary "@eicar.com_00" -H "OC-Chunked:1"
curl --user $user:$pwd http://$host/$path/remote.php/webdav/virus-chunking-1234-2-1 --request PUT --data-binary "@eicar.com_01" -H "OC-Chunked:1"
```
or to do all 3 uploads in a loop:
```
BASEFILES="eicar.com eicar_com.zip eicarcom2.zip"
for BASEFILE in $BASEFILES
do
    ID=$RANDOM
    NUM=0
    FILES=`ls ${BASEFILE}_*`
    COUNT=`echo $FILES | wc -w`
    echo uploading $FILES
    for FILE in $FILES
    do
        echo chunk name: VIRUS$BASEFILE-chunking-${ID}-${COUNT}-${NUM}
        curl --user $user:$pwd http://$host/$path/remote.php/webdav/VIRUS$BASEFILE-chunking-${ID}-${COUNT}-${NUM} --request PUT --data-binary "@$FILE" -H "OC-Chunked:1"
        let NUM=NUM+1
    done
done
```

5. upload v2 dav path without chunking
```
curl --user $user:$pwd http://$host/$path/remote.php/dav/files/$user/virus --request PUT --data-binary "@eicar.com"
```

6. upload v2 dav path with chunking
The amount of chunks might vary depending on the split size and the original file size
```
curl --user $user:$pwd http://$host/$path/remote.php/dav/uploads/$user/12345 --request MKCOL
curl --user $user:$pwd http://$host/$path/remote.php/dav/uploads/$user/12345/0 --request PUT --data-binary "@eicar.com_00"
curl --user $user:$pwd http://$host/$path/remote.php/dav/uploads/$user/12345/1 --request PUT --data-binary "@eicar.com_01"
curl --user $user:$pwd http://$host/$path/remote.php/dav/uploads/$user/12345/.file --request MOVE -H "Destination: http://$host/$path/remote.php/dav/files/$user/virus"
 ```
or to do all 3 uploads in a loop:
```
BASEFILES="eicar.com eicar_com.zip eicarcom2.zip"
for BASEFILE in $BASEFILES
do
    ID=$RANDOM
    curl --user $user:$pwd http://$host/$path/remote.php/dav/uploads/$user/$ID --request MKCOL
    NUM=0
    FILES=`ls ${BASEFILE}_*`
    echo uploading $FILES
    for FILE in $FILES
    do
        curl --user $user:$pwd http://$host/$path/remote.php/dav/uploads/$user/$ID/$NUM --request PUT --data-binary "@$FILE"
        let NUM=NUM+1
    done
    echo "moving $BASEFILE"
    curl --user $user:$pwd http://$host/$path/remote.php/dav/uploads/$user/$ID/.file --request MOVE -H "Destination: http://$host/$path/remote.php/dav/files/$user/virus_$BASEFILE"
done
```
