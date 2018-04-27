#### UI, Theming, File list, Status Bar, Progress tracking

#### Pr: https://github.com/owncloud/ios-app/pull/28

Device: iPhoneX v11.3, iPad Air v2

---

Observation: iPad not optimized, same views as in iPhone. Improvement. 
 
| Test Case| Steps | Expected Result | Result | Related Comment
| :------------- | :------------- | :-------------- | :-----: | :------
|**List of files**|
| List of files | Display list of files in both orientations | Correctly displayed | Passed | iPhoneX can be improved: margins |
| Empty List of files | Display an empty list of files in both orientations | Correctly displayed | Passed | Message indicating no files: "Nothing in here. Upload something!" |
| Long List of files | Display a long list of files in both orientations | Correctly displayed | Passed | Number of files |
|**Item name**|
| Item name | Name of file or folder  | Correctly displayed | Passed |  |
| Long Item name | Name of file or folder very long  | Correctly displayed | Failed | "..." at the end. In the middle? iPhoneX , long name collapses with the notch | | |
| Item name with special characters| Name of file or folder with special characters | Correctly displayed | Passed | | | |
| Item name with unicode/emojis| Name of file or folder with emojis | Correctly displayed | Passed | | | |
|**Item Icon**|
| Folder | Document file in the list (both orientations)  | Correct icon | Passed |  |
| Document | Document file in the list (both orientations) | Correct icon | Passed |  |
| Image | Image file in the list (both orientations) | Correct icon | Passed |  |
| Video | Video file in the list (both orientations) | Correct icon | Passed |  |
| Spread Sheet | Spread Sheet file in the list (both orientations) | Correct icon | Passed |  |
| Slides | Slides file in the list (both orientations) | Correct icon | Passed |  |
| PDF | PDF file in the list (both orientations) | Correct icon | Passed |  |
| Application | Application file in the list (both orientations) | Correct icon | Passed |  |
| Text / exec | text/exec file (html, py, css...) in the list (both orientations) | Correct icon | Passed |  |
| Other | Any of the previous (both orientations) | Placeholder | Failed | application/XML does not display anything |
|**Browsability**|
| Forwards | Browse forward into a 10-depth level folder structure (both orientations) | Correct browsing | Passed |  |
| Backwards | Browse backwards into a 10-depth level folder structure (both orientations)| Correct browsing | Failed | Incorrect message with lack of connection in root folder |
| File in root | In root folder, tap on "File" access | Nothing happens (both orientations)| Passed |  |
| File in non-root | In non-root folder, tap on "File" access (both orientations) | Browse to root | Passed |  |
|**Status Bar**|
| Pull to refresh | Pull to refresh in any folder | Message indicating the status (waiting for server), and final status (everything up-to-date) | Passed |  |
| Browse | Browse to any folder | Message indicating the status (waiting for server), and final status (everything up-to-date) | Passed |  |
| Pull to refresh with no connection | Pull to refresh in any folder | Message indicating the status (contents from ache) | Passed | FIXED: Spinner remains |
| Removed folder | Browse into a folder that was previously removed in web UI | Message indicating the status (this folder no longer exists) | Passed | FIXED: Contents from cache |
|**Theming**|
| light theme | Check app (login, edit, settings and file view) with light theme | Correct displayed | Passed |  |
| dark theme | Check app (login, edit, settings and file view) with dark theme | Correct displayed | Passed |  |
| neutral theme | Check app (login, edit, settings and file view) with neutral theme | Correct displayed | Passed |  |