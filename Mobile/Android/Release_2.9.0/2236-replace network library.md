#### Replace network library

#### Pr: https://github.com/owncloud/android/pull/2236

Devices: Nexus5X v8

---

 
| Test  | Test Case | Expected Result | Basic / OAuth2 | SAML | MI  | Comments |
| :----: | :------- | :-------------- | :------------: | :--: | :-: | :------: |
|**URL**||||||
| 1 | http url |  Correct behaviour | P m8 | | | basic & oauth2 |
| 1 | https trusted url | Correct behaviour | P m8 | | |
| 1 | https non-trusted url | Show certificate to be approved | P m8 |  |
| 1 | https url with http prefix | Correct error | P m8 | | | Bad Request |
| 1 | 301 Redirection | Correct behaviour | F m8 | | | Redirections not followed |
| 1 | 302 Redirection | Correct behaviour | F m8 | | | Redirections not followed |
| 1 | SAML url | Correct behaviour |  | P m8 | | Not last commit |
| 1 | No internet connection | Correct error | P m8 |  |
| 1 | No server connection | Correct error | P m8 |  |
| 1 | Maintenance mode | Correct error | F m8 | | | Message not accurate |
| 1 | File Firewall | Correct error | NA | | | Login is not affected |
| 1 | Change server certificate | Alert | | | | |
|**Login**||||||
| 1 | http url |  Correct behaviour | P m8 | | | Not last commit |
| 1 | https url |  Correct behaviour | P m8 |  |
| 1 | OAuth2 |  Correct behaviour | P m8 |  |
| 1 | OAuth2 token renewal |  Correct behaviour | F m8 | | | Request to renew is not triggered |
| 1 | SAML |  Correct behaviour |  | P m8 | | Not last commit |
| 1 | Incorrect credentials |  Correct error | P m8 |  |
| 1 | Blank credentials |  Correct error | P m8 |  |
| 1 | Special characters |  Correct behaviour | P m8 |  |
| 1 | Same accout twice |  Correct error | P m8 |  |
| 1 | Multiaccount | Both accounts handled correctly | F m8 |  | | Second account with credentials of the first one
|**Uploads**||||||
| 1 | Upload one file | File uploaded | P m8 | | |
| 1 | Upload big file | File uploaded | P m8 | | |
| 1 | Upload many files | Files uploaded | P m8 | | |
| 1 | Upload multiaccount | Files uploaded correctly | | | |
| 1 | Cancel upload | Files removed from upload queue | P m8 | | |  DELETE send to remove remote folder|
| 1 | Retry cancelled upload | File uploaded | P m8 | | |
| 1 | Connection lost | Correct error message | P m8 | | |
| 1 | Connection recovered | Uploads are retried and finish correctly | F m8 | | | No chunks|
| 1 | Upload after removing failed | File uploaded | F m8 | | | Folder in dav exists and MKCOL fails. Sent PUT to target folder.|
| 1 | Session expired | Upload resumed | | | | Pending to fix problems with redirections |
| 1 | Instant uploads pics | Pic uploaded | F m8 | | | Folder not created|
| 1 | Instant uploads videos | Video uploaded | F m8 | | | Folder not created|
| 1 | Upload from camera | Pic uploaded | P m8 | | | 
| 1 | Content from other apps | Content uploaded | P m8 | | |
| 1 | Shared content from other apps | Content uploaded | F m8 | | | Uploaded but appears as failed
| 1 | Copied text from other apps | Content uploaded | P m8 | | |
|**Downloads**||||||
| 1 | Download one file | File downloaded | P m8 | | |
| 1 | Download one big file | File downloaded | P m8 | | |
| 1 | Download many files | Files downloaded | P m8 | | |
| 1 | Download folder | Content downloaded | F m8 | | | Only if it is discovered
| 1 | Download folder with many subfolders | Content downloaded | F m8 | | | Only if it is discovered
| 1 | Cancel download file | File not downloaded | P m8 | | |
| 1 | Cancel download folder | Remaining content not downloaded | P m8 | | |
| 1 | Connection lost | Correct message | P m8 | | |
| 1 | Resume download | Download finishes | P m8 | | |
|**Av. offline**||||||
|**File operations**||||||
|**Sharing**||||||

