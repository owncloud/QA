###  DB Files migration

#### Pr: https://github.com/owncloud/android/pull/2995

Devices: Pixel2 v11, Huawei P20Lite<br>
Server: 10.5

---

Files table

| Field | Type | New Field | New type | Value example | Comments |
| :---- | :--- | :-------- | :------- | :----- | :------- |
| \_id | INTEGER | id | INTEGER | 5  | OK 
| filename | TEXT | name | TEXT | Archive.zip  | OK
| path | TEXT | remotePath | TEXT | /Archive.zip | OK 
| parent | INTEGER | parentId  | INTEGER | 1   | OK 
| created | INTEGER | creationTimeStamp | INTEGER | 0 | OK 
| modified| INTEGER | modificationTimeStamp | INTEGER | 1601471679000  | OK (changes by the way)
| content\_type| TEXT | mimeType |TEXT | DIR -  application/zip | OK 
| content\_lenght| INTEGER | length |INTEGER | 1011464 | OK 
| media\_path| TEXT | storagePath |TEXT | /storage/emulated/0/owncloud/account/1 copy 278.txt | OK
| file\_owner| TEXT | owner |TEXT | user1@...  | OK 
| last\_sync_date| INTEGER | lastSyncDateForProperties | INTEGER| 1604929988101 | OK (changes by the way)
| keep\_in_sync| INTEGER | keepInSync |INTEGER| 1 | OK
| last\_sync\_date\_for_data| INTEGER | lastSyncDateForData | INTEGER | 1604929988101 | OK
| modified\_at\_last...| INTEGER | modifiedAtLastSyncForData|INTEGER | 1604927816000  | OK
| etag| TEXT | etag |TEXT | 5f7484bf4f216 | OK
| tree\_etag| TEXT | treeEtag |TEXT | 5f7484bf4f216 | OK
| share\_by\_link| INTEGER | sharedByLink |INTEGER |  1 | OK
| public\_link| TEXT | fileShareViaLink |INTEGER | null | OK (useless?)
| permissions| TEXT | permissions |TEXT | RDNVCK | OK
| remote\_id| TEXT | remoteId |TEXT | 00000017oc794f4ep19m  | OK 
| update\_thumbnail| INTEGER | needsToUpdateThumbnail |INTEGER | 1 | OK
| is\_downloading| INTEGER | fileIsDownloading |INTEGER | 1| OK
| etag\_in\_conflict| TEXT | etagInConflict |TEXT | d627ffed269d0a798e2a844fad3ffb66 | OK
| shared\_via\_users| INTEGER | sharedWithSharee |INTEGER | 1 | OK
| private\_link| TEXT | privateLink |TEXT |http://miaccount/f/17 | OK

