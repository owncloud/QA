###  Upload shows files 

#### Pr: https://github.com/owncloud/android/pull/1399

Devices: Nexus5 v5.0.1, Tablet Nexus9 v6

Server: v9

---

 
TestID | Test Case | Steps | Expected Result | Result | Related Comment
:--------: | :------------- | :------------- | :-------------- | :-----: | :------
**Show a preview**|
1|Sharing files|Try to share a file from an external app to oC|The upload view shows the content of all the folders' tree (included files) and the folder is correctly uploaded| P m5 t6 ||
2|Empty folder|Try to share a file to oC using as target an empty folder| Nothing is displayed in the upload view. The file is uploaded| P m5 t6||
**Update list**|
3|New folder|1. Using web app, create a new folder<br>2. With an external app, try to upload a file to this folder|The folder appears in the upload view| P m5 t6| Browsing needed to refresh |
4|Delete folder|1. Using web app, delete a folder<br>2. With an external app, try to upload a file to this folder|The folder does not appear in the upload view|P m5 t6 ||
5|Update folder|1. Using web app, add/remove files from a folder<br>2. With an external app, try to upload a file to this folder|The folder contains the updated content in uploads view|P m5 t6||