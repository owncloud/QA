###  DB Files migration

#### Pr: https://github.com/owncloud/android/pull/2995

Devices: Pixel2 v11<br>
Server: 10.5

---

Files table

| Field | Type | New Field | New type | Result | Comments |
| :---- | :--- | :-------- | :------- | :----- | :------- |
| \_id | INTEGER | id | INTEGER | 5 2
| filename | TEXT | name | TEXT | Photos Archive.zip
| path | TEXT | remotePath | TEXT | /Photos/ /Archive.zip
| parent | INTEGER | parentId  | INTEGER | 1 1
| created | INTEGER | creationTimeStamp | INTEGER | 0 0
| modified| INTEGER | modificationTimeStamp | INTEGER | 1601471679000 1603188311000
| content\_type| TEXT | mimeType |TEXT | DIR application/zip 
| content\_lenght| INTEGER | length |INTEGER | 1011464 12710025
| media\_path| TEXT | storagePath |TEXT | NULL NULL
| file\_owner| TEXT | owner |TEXT | user1@192.. user1@192...
| last\_sync_date| INTEGER | lastSyncDateForProperties | INTEGER| 1604581139047 1604581139047
| keep\_in_sync| INTEGER | keepInSync |INTEGER| 1 0
| last\_sync\_date\_for_data| INTEGER | lastSyncDateForData | INTEGER | 0 0
| modified_at_last...| INTEGER | modifiedAtLastSyncForData|INTEGER | 0  0
| etag| TEXT | etag |TEXT | 5f7484bf4f216 null
| tree\_etag| TEXT | treeEtag |TEXT | 5f7484bf4f216 1
| share\_by\_link| INTEGER | fileShareViaLink |INTEGER | 0 1
| public\_link| TEXT | sharedByLink |INTEGER | null 
| permissions| TEXT | permissions |TEXT | RDNVCK RDNVW
| remote\_id| TEXT | remoteId |TEXT | 00000017oc794f4ep19m 00003197oc794f4ep19m
| update\_thumbnail| INTEGER | needsToUpdateThumbnail |INTEGER | 0 0
| is\_downloading| INTEGER | fileIsDownloading |INTEGER | 0 0
| etag\_in\_conflict| TEXT | etagInConflict |TEXT | NULL NULL
| shared\_via\_users| INTEGER | sharedWithSharee |INTEGER | 1 0
| private\_link| TEXT | privateLink |TEXT |http://192.168.1.66:33000/f/17  http://192.168.1.66:33000/f/3197

