###  Concurrency

#### Pr: https://github.com/owncloud/ios-app/pull/369

Devices: iPhone 6S Plus v11<br>
Server: 10.1

---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | Automated |
| :-------- | :---- | :------- | :----: | :------------------------- | :-------: |
|**Operations**||||||
| Copy + Copy | Copy two big folders to other location at the time | Correctly copied executed concurrently |  |  |  |
| Move + Move | Move two big folders to other location at the time | Correctly moved executed concurrently |  |  |  |
| Copy + Move | Move two big folders to other location at the time | Correctly moved executed concurrently |  |  |  |
| Copy + Delete | Move a big folder to other location at the time other big folder is deleted | Correctly executed concurrently |  |  |  |
| Copy + Duplicate | Copy a big folder to other location at the time other big folder is duplicated | Correctly executed concurrently |  |  |  |
| Delete + Duplicate | Delete a big folder to other location at the time other big folder is duplicated | Correctly executed concurrently |  |  |  |
|**Uploads/Downloads**||||||
| Upload + Delete | Upload a bunch of files at the time a big folder is deleted | Correctly executed concurrently |  |  |  |
| Upload + Move | Upload a bunch of files at the time a big folder is moved | Correctly executed concurrently |  |  |  |
| Upload + Duplicate | Upload a bunch of files at the time a big folder is duplicated | Correctly executed concurrently |  |  |  |
| Download + Delete | Download a big file at the time a big folder is deleted | Correctly executed concurrently |  |  |  |
| Download + Move | Download a big file at the time a big folder is moved | Correctly executed concurrently |  |  |  |
| Download + Duplicate | Download a big file at the time a big folder is duplicated | Correctly executed concurrently |  |  |  |
| Download + Upload | Download a big file at the time a bunch of files are uploaded | Correctly executed concurrently |  |  |  |