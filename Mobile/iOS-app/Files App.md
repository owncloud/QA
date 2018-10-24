#### Files App - Download & Upload

#### PRs: https://github.com/owncloud/ios-app/pull/67<br>


Device/s: <br>
Server: 

Number of tests: <br>
Number of automated tests:   <br>
Coverage: <br>


---

 
| Test Case | Steps | Expected Result | Result | Related Comment
|:---------:| :---- | :-------------- | :----- | :------------: |
|**Files App**||||||
| Location one account| Attach one account to the app<br>Open available locations in files app | Account is there | P t12 |  |
| Location several account| Attach serveral accounts to the app<br>Open available locations in files app | All Accounts are there, one location per account attached | P t12 |  |
| Browse Basic | Open an ownCloud Files app location | Content is correctly displayed | P t12 |  |
| Browse OAuth2 | Open an ownCloud Files app location | Content is correctly displayed | P t12 |  |
| Create a folder | Open an ownCloud Files app location<br>Create a new folder with special characters | Folder is created in oC app | P t12 |  |
| Move item | Open an ownCloud Files app location<br>Move an item | Item is moved correctly in oC app |  |  |
| Delete one folder | Open an ownCloud Files app location<br>Delete a folder | Folder is deleted in oC app | P t12 |  |
| Download Basic| Open an ownCloud Basic auth Files app location<br>Download a file | File is correctly displayed | F t12 | Fails with zip. A bit inestable. |
| Download OAuth2| Open an ownCloud OAuth2Files app location<br>Download a file | File is correctly displayed | P t12 |  |
| Upload files app| Open a file with Files app, an MSOffice one f.ex.<br>Modify it<br>Save changes | File is correctly uploaded to ownCloud | P m12 | with an docx file |
| Upload external| Open an external app to edit files<br>Create a file and upload to oC via Files App | File is correctly uploaded | F t12 | File is empty. Only in root folder |
| Upload non-root| Open an external app to edit files<br>Create a file and upload to oC via Files App to a non-root folder| File is correctly uploaded |  |  |
| Modify file| Open an ownCloud Files app location<br>Modify it | File is correctly uploaded to oC |  |  |
| Rename remote| Rename a file ir folder in web UI | File is automatically renamed in Files app | P t12 |  |
|**Download oC app**||||||
| Download a file | Tap  | File is correctly displayed | P t12 |  |
| Download a file offline | Switch connection off<br> Tap on a file  | File can not be downloaded to be previewed, so an error is displayed | P t12 | Done in filePreviewing |
|**Security**||||||
| Info about  accepted certificates | Settings -> Security  | Check if the accepted certificates by issue are correct | P t12 |  |
| Revoke certificates | Settings -> Security<br>Revoke certificate<br>Connect again to the URL | Issue to accept the certificate is raised up | P t12 |  |
|**Bookmark list**||||||
| Correct bookmark information | Add a bookmark | Username appears | P t12 |  |