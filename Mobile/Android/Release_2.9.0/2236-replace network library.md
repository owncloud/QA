#### Replace network library

#### Pr: https://github.com/owncloud/android/pull/2236

Devices: Nexus5X v8, Sa,sung Galaxy S7 Edge v7

---

| Test Case | Expected Result | Basic / OAuth2 | SAML | MI  | MI - tunnel | Comments |
| :-------: | :-------------- | :------------: | :--: | :-: | :---------: | :------: | 
|**URL**||||||
| http url |  Correct behaviour | P m8 | | P m7 |  |
| https trusted url | Correct behaviour | P m8 | | | P m7
| https non-trusted url | Show certificate to be approved | P m8 | P m8  | P m7
| https url with http prefix | Correct error | P m8 | P m8 | P m8 | P m7 | Bad Request |
| 301 Redirection | Correct behaviour | F m8 | | || Redirections not followed |
| 302 Redirection | Correct behaviour | F m8 | | || Redirections not followed |
| SAML url | Correct behaviour |  | P m8 | || Not last commit |
| No internet connection | Correct error | P m8 | P m8 | P m8 | P m7
| No server connection | Correct error | P m8 | P m8 | P m8 | P m7
| Maintenance mode | Correct error | F m8 | | F m8 | F m7| Message not accurate |
| File Firewall | Correct error | NA | | NA || Login is not affected |
| Change server certificate | Alert | P m8 | | P m8 | P m7 |
|**Login**||||||
| http url |  Correct behaviour | P m8 | | P m7| | Not last commit |
| https url |  Correct behaviour | P m8 | P m8 | P m8 | P m7
| OAuth2 |  Correct behaviour | P m8 |  |
| OAuth2 token renewal |  Correct behaviour | F m8 | | || Request to renew is not triggered |
| SAML |  Correct behaviour |  | P m8 || | Not last commit |
| Incorrect credentials |  Correct error | P m8 |  |
| Blank credentials |  Correct error | P m8 |  | P m7 | P m7
| Special characters |  Correct behaviour | P m8 |  | P m7 | P m7
| Same accout twice |  Correct error | P m8 | P m8 | P m7 | P m7
| Multiaccount | Both accounts handled correctly | F m8 | F m8 | F m8 | F m8 | Second account with credentials of the first one
|**Uploads**||||||
| Upload one file | File uploaded | P m8 | P m8 | P m7 | P m7 
| Upload one file (move) | File uploaded | P m8 | P m8 | P m7 | P m7 
| Upload big file | File uploaded | P m8 | P m8 | | |
| Upload many files | Files uploaded | P m8 | P m8 | P m7 | P m7
| Upload multiaccount | Files uploaded correctly | F m8 | F m8 | F m7 | F m7 | Bad behaviour in multiaccount
| Cancel upload | Files removed from upload queue | P m8 | P m8 | P m7 | P m7 | DELETE send to remove remote folder|
| Retry cancelled upload | File uploaded | P m8 | | P m7 | P m7 |
| Connection lost | Correct error message | P m8 | | P m7 | P m7 |
| Connection recovered | Uploads are retried and finish correctly | F m8 | F m8 | F m7 | F m7 | No chunks|
| Upload after removing failed | File uploaded | F m8 | | F m7 | F m7 | Folder in dav exists and MKCOL fails. Sent PUT to target folder.|
| Session expired | Upload resumed | | | | | Pending to fix problems with redirections |
| Instant uploads pics | Pic uploaded | F m8 | F m8 | F m8 | F m8 | Folder not created. MI |
| Instant uploads videos | Video uploaded | F m8 | F m8 | F m8 | F m8 | Folder not created|
| Upload from camera | Pic uploaded | P m8 | P m8 | P m7 | P m8 
| Content from other apps | Content uploaded | P m8 | P m8 | P m7 | P m8 | in MI, the only way to upload content
| Shared content from other apps | Content uploaded | F m8 | F m8 | NA | NA | Uploaded but appears as failed. 
| Copied text from other apps | Content uploaded | P m8 | P m8 | NA | NA
| File Firewall | Correct error | F m8 |  | F m7 | | Error not correct | 
| Antivirus | Correct error | F m7 |  | F m7 | | Error not correct | 
|**Downloads**||||||
| Download one file | File downloaded | P m8 | P m8 | P m7 | P m7
| Download one big file | File downloaded | P m8 | P m8 | |
| Download many files | Files downloaded | P m8 | P m8 | P m7 | P m7
| Download folder | Content downloaded | F m8 | F m8 | | F m7 | Only if it is discovered
| Download folder with many subfolders | Content downloaded | F m8 | F m8 | F m7 | F m7 | Only if it is discovered
| Download downloaded file | No downlaod, only display | F m8 | F m8 | F m7 | F m7 | Downloaded again
| Cancel download file | File not downloaded | P m8 | P m8 | P m7 | P m7
| Cancel download folder | Remaining content not downloaded | P m8 | P m8 | P m7 | P m7
| Connection lost | Correct message | P m8 | P m8 | P m7 | P m7
| Resume download | Download finishes | P m8 | P m8 | P m7 | P m7
| Send (not downloaded)  | Downloaded first, then Send | P m8 | P m8 | P m7 | P m7
| File Firewall | Correct error | F m8 | | F m7 | | Error not correct |
|**Av. offline**||||||
| File as av.offline | File synced | F m8 | | | | Downloaded always
| Folder as av.offline | Folder synced | F m8 | | | | Only first depth level
| Folder with subfolders as av.offline | Folder synced | F m8 | | | | Not synced
| Several files as av.offline | Files synced | F m8 | | | | Downloaded always
| Several folders as av.offline | Folders synced | F m8 | | | | Only first depth level
| Add content to av. offline folder| Folder synced | F m8 | | | | Not synced
| Edit content of av. offline | Content synced | | | |
| Edit content in server & app of av. offline | Conflict | | | |
| Solve conflict with local | local version uploaded, remote deleted | | | |
| Solve conflict with remote | remote version downloaded, local deleted | | | |
| Solve conflict with both | both synced | | | |
|**File operations**||||||
| Move one file | Moved to target| P m8 | | |
| Move one folder | Moved to target| P m8 | | |
| Move one folder to itself | Correct error | P m8 | | |
| Move several items | Moved correctly | P m8 | | |
| Move without connection| Correct error | P m8 | | |
| Copy one file | Copied to target| P m8 | | |
| Copy one folder | Copied to target| P m8 | | |
| Copy one folder to itself | Correct error | P m8 | | |
| Copy several items | Copied correctly | P m8 | | |
| Copy without connection| Correct error | P m8 | | |
| Delete one file | Deleted | P m8 | | |
| Delete one folder | Deleted | P m8 | | |
| Delete several items | Deleted correctly | P m8 | | |
| Delete without connection| Correct error | P m8 | | |
| Rename one file | Renamed | P m8 | | |
| Rename one folder | Renamed | P m8 | | |
| Rename without connection| Correct error | P m8 | | |
| Create folder | Created | P m8 | | 
| Create folder without connection| Correct error | P m8 | | |
|**Sharing**||||||
| Private link | Works properly | P m8 | | 
| Share file with user | File shared | P m8 | | 
| Share folder with user | Folder shared | P m8 | | 
| Share file with group | File shared | P m8 | | 
| Share folder with group | Folder shared | P m8 | | 
| Share folder with create permission | Folder shared with create permission (check others are not) | P m8 | | 
| Share folder with edit permission | Folder shared with edit permission (check others are not) | P m8 | | 
| Share folder with delete permission | Folder shared with delete permission (check others are not) | P m8 | | 
| Share folder with reshare permission | Folder shared with reshare permission (check others are not) |  P m8| | 
| Share folder with all permissions | Folder shared with all permission | P m8 | | 
| Share folder with no permissions | Folder shared with no permission| P m8 | | 
| Share file with edit permissions | File shared with edit permission| P m8 | | 
| Share file with reshare permissions | File shared with reshare permission| P m8 | | 
| Share file with all permissions | File shared with all permission | P m8 | | 
| Share file with no permissions | File shared with no permission| P m8 | | 
| Federated share | Content shared | P m8 | | 
| Unshare | Content unshared | P m8 | | 
| Create Private share default | Correctly created | P m8 | | 
| Create Private share name | Correctly created | P m8 | | 
| Create Private share expiration | Correctly created | P m8 | | 
| Create Private share password | Correctly created | P m8 | | 
| Create Private share expiration + password | Correctly created | P m8 | | 
| Create Private share download/view | Correctly created | P m8 | | 
| Create Private share download/view/upload | Correctly created | P m8 | | 
| Create Private share upload only | Correctly created | P m8 | | 
| Update Private share name | Correctly updated | P m8 | | 
| Update Private share expiration | Correctly updated | P m8 | | 
| Update Private share password | Correctly updated | P m8 | | 
| Update Private share expiration + password | Correctly updated | P m8 | | 
| Update Private share download/view | Correctly updated | P m8 | | 
| Update Private share download/view/upload | Correctly updated | P m8 | | 
| Update Private share upload only | Correctly updated | P m8 | | 
| Remove private share| Correctly deleted | P m8 | | 


