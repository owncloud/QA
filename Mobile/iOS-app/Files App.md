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
| Location one account| Attach one account to the app<br>Open available locations in files app | Account is there |  |  |
| Location several account| Attach serveral accounts to the app<br>Open available locations in files app | All Accounts are there, one location per account attached |  |  |
| Browse | Open an ownCloud Files app location | Content is correctly displayed |  |  |
| Download | Open an ownCloud Files app location<br>Download a file | File is correctly displayed |  |  |
| Upload root| Open an external app to edit files<br>Create a file and upload to oC via Files App | File is correctly uploaded |  |  |
| Upload non-root| Open an external app to edit files<br>Create a file and upload to oC via Files App to a non-root folder| File is correctly uploaded |  |  |
| Modify file| Open an ownCloud Files app location<br>Modify it | File is correctly uploaded to oC |  |  |
|**Download oC app**||||||
| Download a file | Tap  | File is correctly displayed |  |  |
| Download a file offline | Switch connection off<br> Tap on a file  | File can not be downloaded to be previewed, so an error is displayed |  |  |
|**Security**||||||
| Info about  accepted certificates | Settings -> Security  | Check if the accepted certificates by issue are correct |  |  |
| Revoke certificates | Settings -> Security<br>Revoke certificate<br>Connect again to the URL | Issue to accept the certificate is raised up |  |  |
|**Bookmark list**||||||
| Correct bookmark information | Add a bookmark | Username appears |  |  |