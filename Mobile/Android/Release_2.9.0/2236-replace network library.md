#### Replace network library

#### Pr: https://github.com/owncloud/android/pull/2236

Devices: Nexus5X v8

---

 
| Test  | Test Case | Expected Result | Basic / OAuth2 | SAML | MI  | Comments |
| :----: | :------- | :-------------- | :------------: | :--: | :-: | :------: |
|**URL**||||||
| 1 | http url |  Correct behaviour | P m8 | | |  |
| 1 | https trusted url | Correct behaviour | P m8 | | |
| 1 | https non-trusted url | Show certificate to be approved | P m8 | P m8  |
| 1 | https url with http prefix | Correct error | P m8 | P m8 | | Bad Request |
| 1 | 301 Redirection | Correct behaviour | F m8 | | | Redirections not followed |
| 1 | 302 Redirection | Correct behaviour | F m8 | | | Redirections not followed |
| 1 | SAML url | Correct behaviour |  | P m8 | | Not last commit |
| 1 | No internet connection | Correct error | P m8 | P m8 |
| 1 | No server connection | Correct error | P m8 | P m8 |
| 1 | Maintenance mode | Correct error | F m8 | | | Message not accurate |
| 1 | File Firewall | Correct error | NA | | | Login is not affected |
| 1 | Change server certificate | Alert | P m8 | | | |
|**Login**||||||
| 1 | http url |  Correct behaviour | P m8 | | | Not last commit |
| 1 | https url |  Correct behaviour | P m8 | P m8 |
| 1 | OAuth2 |  Correct behaviour | P m8 |  |
| 1 | OAuth2 token renewal |  Correct behaviour | F m8 | | | Request to renew is not triggered |
| 1 | SAML |  Correct behaviour |  | P m8 | | Not last commit |
| 1 | Incorrect credentials |  Correct error | P m8 |  |
| 1 | Blank credentials |  Correct error | P m8 |  |
| 1 | Special characters |  Correct behaviour | P m8 |  |
| 1 | Same accout twice |  Correct error | P m8 | P m8 |
| 1 | Multiaccount | Both accounts handled correctly | F m8 | F m8 | | Second account with credentials of the first one
|**Uploads**||||||
| 1 | Upload one file | File uploaded | P m8 | P m8 | |
| 1 | Upload big file | File uploaded | P m8 | P m8 | |
| 1 | Upload many files | Files uploaded | P m8 | P m8 | |
| 1 | Upload multiaccount | Files uploaded correctly | F m8 | F m8 | | Bad behaviour in multiaccount
| 1 | Cancel upload | Files removed from upload queue | P m8 | P m8 | |  DELETE send to remove remote folder|
| 1 | Retry cancelled upload | File uploaded | P m8 | | |
| 1 | Connection lost | Correct error message | P m8 | | |
| 1 | Connection recovered | Uploads are retried and finish correctly | F m8 | F m8 | | No chunks|
| 1 | Upload after removing failed | File uploaded | F m8 | | | Folder in dav exists and MKCOL fails. Sent PUT to target folder.|
| 1 | Session expired | Upload resumed | | | | Pending to fix problems with redirections |
| 1 | Instant uploads pics | Pic uploaded | F m8 | F m8 | | Folder not created|
| 1 | Instant uploads videos | Video uploaded | F m8 | F m8 | | Folder not created|
| 1 | Upload from camera | Pic uploaded | P m8 | P m8 | | 
| 1 | Content from other apps | Content uploaded | P m8 | P m8 | |
| 1 | Shared content from other apps | Content uploaded | F m8 | F m8 | | Uploaded but appears as failed. 
| 1 | Copied text from other apps | Content uploaded | P m8 | P m8 | |
| 1 | File Firewall | Correct error | F m8 | | | Error not correct |
|**Downloads**||||||
| 1 | Download one file | File downloaded | P m8 | P m8 | |
| 1 | Download one big file | File downloaded | P m8 | P m8 | |
| 1 | Download many files | Files downloaded | P m8 | P m8 | |
| 1 | Download folder | Content downloaded | F m8 | F m8 | | Only if it is discovered
| 1 | Download folder with many subfolders | Content downloaded | F m8 | F m8 | | Only if it is discovered
| 1 | Cancel download file | File not downloaded | P m8 | P m8 | |
| 1 | Cancel download folder | Remaining content not downloaded | P m8 | P m8 | |
| 1 | Connection lost | Correct message | P m8 | P m8 | |
| 1 | Resume download | Download finishes | P m8 | P m8 | |
| 1 | Send (not downloaded)  | Downloaded first, then Send | P m8 | P m8 | |
| 1 | File Firewall | Correct error | F m8 | | | Error not correct |
|**Av. offline**||||||
| 1 | File as av.offline | File synced | F m8 | | | Downloaded always
| 1 | Folder as av.offline | Folder synced | F m8 | | | Only first depth level
| 1 | Folder with subfolders as av.offline | Folder synced | F m8 | | | Not synced
| 1 | Several files as av.offline | Files synced | F m8 | | | Downloaded always
| 1 | Several folders as av.offline | Folders synced | F m8 | | | Only first depth level
| 1 | Add content to av. offline folder| Folder synced | F m8 | | | Not synced
| 1 | Edit content of av. offline | Content synced | | | |
| 1 | Edit content in server & app of av. offline | Conflict | | | |
| 1 | Solve conflict with local | local version uploaded, remote deleted | | | |
| 1 | Solve conflict with remote | remote version downloaded, local deleted | | | |
| 1 | Solve conflict with both | both synced | | | |
|**File operations**||||||
| 1 | Move one file | Moved to target| P m8 | | |
| 1 | Move one folder | Moved to target| P m8 | | |
| 1 | Move one folder to itself | Correct error | P m8 | | |
| 1 | Move several items | Moved correctly | P m8 | | |
| 1 | Move without connection| Correct error | P m8 | | |
| 1 | Copy one file | Copied to target| P m8 | | |
| 1 | Copy one folder | Copied to target| P m8 | | |
| 1 | Copy one folder to itself | Correct error | P m8 | | |
| 1 | Copy several items | Copied correctly | P m8 | | |
| 1 | Copy without connection| Correct error | P m8 | | |
| 1 | Delete one file | Deleted | P m8 | | |
| 1 | Delete one folder | Deleted | P m8 | | |
| 1 | Delete several items | Deleted correctly | P m8 | | |
| 1 | Delete without connection| Correct error | P m8 | | |
| 1 | Rename one file | Renamed | P m8 | | |
| 1 | Rename one folder | Renamed | P m8 | | |
| 1 | Rename without connection| Correct error | P m8 | | |
| 1 | Create folder | Created | P m8 | | 
| 1 | Create folder without connection| Correct error | P m8 | | |
|**Sharing**||||||
| 1 | Private link | Works properly | P m8 | | 
| 1 | Share file with user | File shared | P m8 | | 
| 1 | Share folder with user | Folder shared | P m8 | | 
| 1 | Share file with group | File shared | P m8 | | 
| 1 | Share folder with group | Folder shared | P m8 | | 
| 1 | Share folder with create permission | Folder shared with create permission (check others are not) | P m8 | | 
| 1 | Share folder with edit permission | Folder shared with edit permission (check others are not) | P m8 | | 
| 1 | Share folder with delete permission | Folder shared with delete permission (check others are not) | P m8 | | 
| 1 | Share folder with reshare permission | Folder shared with reshare permission (check others are not) |  P m8| | 
| 1 | Share folder with all permissions | Folder shared with all permission | P m8 | | 
| 1 | Share folder with no permissions | Folder shared with no permission| P m8 | | 
| 1 | Share file with edit permissions | File shared with edit permission| P m8 | | 
| 1 | Share file with reshare permissions | File shared with reshare permission| P m8 | | 
| 1 | Share file with all permissions | File shared with all permission | P m8 | | 
| 1 | Share file with no permissions | File shared with no permission| P m8 | | 
| 1 | Federated share | Content shared | P m8 | | 
| 1 | Unshare | Content unshared | P m8 | | 
| 1 | Create Private share default | Correctly created | P m8 | | 
| 1 | Create Private share name | Correctly created | P m8 | | 
| 1 | Create Private share expiration | Correctly created | P m8 | | 
| 1 | Create Private share password | Correctly created | P m8 | | 
| 1 | Create Private share expiration + password | Correctly created | P m8 | | 
| 1 | Create Private share download/view | Correctly created | P m8 | | 
| 1 | Create Private share download/view/upload | Correctly created | P m8 | | 
| 1 | Create Private share upload only | Correctly created | P m8 | | 
| 1 | Update Private share name | Correctly updated | P m8 | | 
| 1 | Update Private share expiration | Correctly updated | P m8 | | 
| 1 | Update Private share password | Correctly updated | P m8 | | 
| 1 | Update Private share expiration + password | Correctly updated | P m8 | | 
| 1 | Update Private share download/view | Correctly updated | P m8 | | 
| 1 | Update Private share download/view/upload | Correctly updated | P m8 | | 
| 1 | Update Private share upload only | Correctly updated | P m8 | | 
| 1 | Remove private share| Correctly deleted | P m8 | | 


