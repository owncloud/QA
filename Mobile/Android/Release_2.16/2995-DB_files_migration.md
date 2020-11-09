###  DB Files migration

#### Pr: https://github.com/owncloud/android/pull/2995

Devices: Pixel2 v11<br>
Server: 10.5

---

Files table

| Field | Type | New Field | New type | Result | Comments |
| :---- | :--- | :-------- | :------- | :----- | :------- |
| \_id | INTEGER | id | INTEGER | 5 2 | OK 
| filename | TEXT | name | TEXT | Photos Archive.zip  | OK
| path | TEXT | remotePath | TEXT | /Photos/ /Archive.zip | OK 
| parent | INTEGER | parentId  | INTEGER | 1 1  | OK 
| created | INTEGER | creationTimeStamp | INTEGER | 0 0 | OK. Always 0?
| modified| INTEGER | modificationTimeStamp | INTEGER | 1601471679000 1603188311000  | changes by the way
| content\_type| TEXT | mimeType |TEXT | DIR application/zip | OK 
| content\_lenght| INTEGER | length |INTEGER | 1011464 12710025 | OK 
| media\_path| TEXT | storagePath |TEXT | NULL NULL | OK
| file\_owner| TEXT | owner |TEXT | user1@192.. user1@192...  | OK 
| last\_sync_date| INTEGER | lastSyncDateForProperties | INTEGER| 1604665214788 1604665214788 | bad mapping (0,0)
| keep\_in_sync| INTEGER | keepInSync |INTEGER| 1 0| NA
| last\_sync\_date\_for_data| INTEGER | lastSyncDateForData | INTEGER | 0 0 | OK
| modified\_at\_last...| INTEGER | modifiedAtLastSyncForData|INTEGER | 0  0 | OK
| etag| TEXT | etag |TEXT | 5f7484bf4f216 null | look at it correctly
| tree\_etag| TEXT | treeEtag |TEXT | 5f7484bf4f216 1  | Look into
| share\_by\_link| INTEGER | sharedByLink |INTEGER | 0 1 | OK
| public\_link| TEXT | fileShareViaLink |INTEGER | null | OK
| permissions| TEXT | permissions |TEXT | RDNVCK RDNVW | OK
| remote\_id| TEXT | remoteId |TEXT | 00000017oc794f4ep19m 00003197oc794f4ep19m  | OK 
| update\_thumbnail| INTEGER | needsToUpdateThumbnail |INTEGER | 0 0| OK
| is\_downloading| INTEGER | fileIsDownloading |INTEGER | 0 0 | OK| OK
| etag\_in\_conflict| TEXT | etagInConflict |TEXT | NULL NULL| OK
| shared\_via\_users| INTEGER | sharedWithSharee |INTEGER | 1 0| OK
| private\_link| TEXT | privateLink |TEXT |http://192.168.1.66:33000/f/17  http://192.168.1.66:33000/f/3197 | OK

