###  Concurrency

#### Pr: https://github.com/owncloud/ios-app/pull/369

Devices: iPhone 6S Plus v11<br>
Server: 10.1

---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | Automated |
| :-------- | :---- | :------- | :----: | :------------------------- | :-------: |
|**Operations**||||||
| Copy + Copy | Copy two big folders to other location at the time | Correctly copied executed concurrently | P m12 |  |  |
| Move + Move | Move two big folders to other location at the time | Correctly moved executed concurrently | P m12 |  |  |
| Copy + Move | Move two big folders to other location at the time | Correctly moved executed concurrently | P m12 |  |  |
| Copy + Delete | Move a big folder to other location at the time other big folder is deleted | Correctly executed concurrently | P m12 |  |  |
| Copy + Duplicate | Copy a big folder to other location at the time other big folder is duplicated | Correctly executed concurrently | P m12 |  |  |
| Delete + Duplicate | Delete a big folder to other location at the time other big folder is duplicated | Correctly executed concurrently | P m12 |  |  |
|**Uploads/Downloads**||||||
| Download several | Download several bigfiles at the time | Correctly downloaded concurrently | P m12 |  |  |
| Upload several | Upload a bigfile at the time other smaller files are uploaded | Correctly downloaded concurrently | F m12 | Status bar crazy |  |
| Upload + Download +  Delete | Upload a bunch of files at the time a big folder is deleted | Correctly executed concurrently | P m12 |  |  |
| Upload + Download + Move | Upload a bunch of files at the time a big folder is moved | Correctly executed concurrently | P m12 |  |  |
| Upload + Download + Duplicate | Upload a bunch of files at the time a big folder is duplicated | Correctly executed concurrently | P m12 |  |  |
| Download + Delete | Download a big file at the time a big folder is deleted | Correctly executed concurrently | P m12 |  |  |
| Download + Move | Download a big file at the time a big folder is moved | Correctly executed concurrently | P m12 |  |  |
| Download + Duplicate | Download a big file at the time a big folder is duplicated | Correctly executed concurrently | P m12 |  |  |
| Download + Upload | Download a big file at the time a bunch of files are uploaded | Correctly executed concurrently | P m12 |  |  |