###  Upload shows files 

#### Pr: https://github.com/owncloud/android/pull/1399

Devices:

Server:

---

 
TestID | Test Case | Steps | Expected Result | Result | Related Comment
:------------ | :------------- | :------------- | :-------------- | :----- | :------
**Show a preview**|
1|Sharing files|Try to share a file from an external app to oC|The upload view shows the content of all the folders' tree (included files) and the folder is correcly uploaded|
2|Empty folder|Try to share a file to oC using as target an empty file| Nothing is displayed in the upload view. The file is uploaded
**Update list**|
3|New folder|1. Using web app, create a new folder<br>2. With an external app, try to upload a file to this folder|The folder appears in the upload view
4|Delete folder|1. Using web app, delete a folder<br>2. With an external app, try to upload a file to this folder|The folder does not appear in the upload view
5|Update folder|1. Using web app, add/remove files from a folder<br>2. With an external app, try to upload a file to this folder|The folder contains the updated content in uploads view