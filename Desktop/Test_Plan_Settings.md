# Settings

## 1. General settings

### Precondition

1.  Open desktop client
2.  Go to General settings
3.  At the top there are General settings

| ID | Test Case                                   | Steps to reproduce                                                                                                                                                                                                              | Expected Result                                                                                                                                | Result | Related Comment |
|----|---------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1  | Verify client launches on system startup when enabled | Verify oC client is launched on system startup when the settings is ticked | oC client is launched on system startup | | | 
| 2  | Verify client does NOT launch on system startup when disabled | Verify oC client is not launched on system startup when the settings is not ticked | oC client is not launched on system startup | | | 
| 3  | Verify monochrome tray icon is used when enabled | Verify oC uses monochrome icons when the settings is ticked | In the system tray there is an owncloud logo in black&white | | | 
| 4  | Verify colorful tray icon is used when disabled | Verify oC does not use monochrome icons when the settings is not ticked | In the system tray there is a colorful owncloud logo | | | 
| 5  | Verify desktop notifications are shown when enabled | Verify desktop notifications are shown when the settings is ticked | Desktop notifications are shown | | | 
| 6  | Verify desktop notifications are NOT shown when disabled | Verify desktop notifications are not shown when the settings is not ticked | Desktop notifications are not shown | | | 

## 2. Ignored files

### Precondition

1.  On the server there is a folder called Photos with *.jpg and *png files
2.  Open desktop client
3.  Go to General tab
4.  In Advanced settings there is 'Edit ignored files' button <br/>
[Doc](https://doc.owncloud.org/desktop/2.2/architecture.html#ignored-files)

| ID | Test Case                                   | Steps to reproduce                                                                                                                                                                                                              | Expected Result                                                                                                                                | Result | Related Comment |
|----|---------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1  | Verify server-provided ignore patterns are loaded and locked | Verify pattern list has been received from the server | Client includes pattern list from the server. <br/> These entries cannot be removed. | | | 
| 2  | Verify dialog can be canceled without changes | Close the window by clicking on the Cancel button | Window has been closed | | | 
| 3  | Verify hidden files are synced when setting is checked | Verify hidden files are synced when 'Sync hidden files' checkbox is checked | Hidden files are synced when 'Sync hidden files' checkbox is checked | | | 
| 4  | Verify hidden files are NOT synced when setting is unchecked | Verify hidden files are not synced when 'Sync hidden files' checkbox is unchecked | Verify hidden files are not synced when 'Sync hidden files' checkbox is unchecked | | | 
| 5  | Verify user-defined ignore pattern works and files show ignored icon | 1.  Add your own pattern into Pattern (e.g. *.jpg) <br/> 2.  Allow Deletion <br/> 3.  Click OK <br/> 4.  Restart the client <br/> GitHub issue: [#7162](https://github.com/owncloud/client/issues/7162) | *.jpg files have yellow 'Ignored' icon | | | 
| 6  | Verify server folder deletion when ignore pattern allows deletion | Delete Photos folder on the server | Photos folder has been deleted on the client | | | 
| 7  | Verify server folder deletion when ignore pattern does NOT allow deletion | 1.  Restore Photos folder on the server from Deleted files <br/> 2.  Disable Deletion of *.jpg files <br/> 3.  Delete Photos folder on the server | Only *.png file has been deleted | | | 
| 8  | Verify folder rename to a name matching ignore pattern | 1.  Restore Photos folder on the server (let png sync to the client) <br/> 2.  Rename Photos folder to Paris.jpg folder | Photos folder has been replaced by Paris.jpg folder -> Photos folder has been deleted and new Paris.jpg will not be synced. If deletion is not Allowed, png file will be deleted, jpg will stay, folder will not be renamed <br/> GitHub issue: [#7267](https://github.com/owncloud/client/issues/7267) | | | 
| 9  | Verify previously ignored files sync after pattern removal | Remove the pattern | jpg have been synced | | | 

## 3. Crash reporter

### Precondition

1.  Open desktop client
2.  Go to Settings tab
3.  In the middle there are Advanced settings including 'Show crash reporter' checkbox

| ID | Test Case                                   | Steps to reproduce                                                                                                                                                                                                              | Expected Result                                                                                                                                | Result | Related Comment |
|----|---------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1  | Verify crash window opens when triggered from context menu | Start the client with `--debug` flag. <br/> *   macOS: /Applications/owncloud.app/Contents/MacOS/owncloud --debug <br/> *   Windows: cd ""C:\Program files (x86)\owncloud"" &amp;&amp; owncloud --debug <br/> *   Ubuntu: owncloud --debug   <br/> Trigger the crash from the tray context menu. | Crash window has been opened | | | 
| 2  | Verify crash report is NOT sent when 'Don't send' is clicked | Click 'Don't send' button to close the window | Window has been closed, no report sent | | | 
| 3  | Verify crash report is sent successfully with comment | 1.  Trigger the crash again <br/> 2.  Add a comment <br/> 3.  Send the report | *   Message has been shown: Sent! Many thanks. Please refer to crash bp-[ID] in bug reports. <br/> *   Report has been sent to crash report server and it's shown there | | | 
| 4  | Verify sent crash report contains correct data | Verify the report includes correct data | Comment and version are correct | | | 

## 4. Settings tab - basic

| ID | Test Case                                   | Steps to reproduce                                                                                                                                                                                                              | Expected Result                                                                                                                                | Result | Related Comment |
|----|---------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1  | Verify all settings sections and options are present in the UI | Verify Settings tab shows the below settings options<br/><br/> **General Settings**<br/> Checkboxes:<br/> *  Launch on System Startup<br/> *  Use Monochrome Icons<br/> *  Show Desktop Notifications<br/> <br/> Language option<br/> <br/> **Advanced**<br/> Checkboxes:<br/> *  Show sync folders in Explorer's Navigation Pane (Windows)<br/> *  Sync hidden files<br/> *  Show crash reporter<br/> <br/> Buttons:<br/> *  Edit Ignored Files - opens Ignored files dialog<br/> *  Log Settings<br/> <br/> Non VFS mode checkboxes:<br/> *   Ask for confirmation before synchronizing folders larger than 500 MB<br/> *   Ask for confirmation before synchronizing external storages<br/> <br/> **Network**<br/> *  Proxy Settings<br/> *  Download Bandwidth - Upload Bandwidth sections<br/> <br/> **Version**<br/> *  Updates section (Channels are only available in testpilotcloud and on Mac we don't have the update info section)<br/> *  About button - opens About ownCloud dialog when clicked | Settings options are available | | | 

## 5. rtl languages

| ID | Test Case                                   | Steps to reproduce                                                                                                                                                                                                              | Expected Result                                                                                                                                | Result | Related Comment |
|----|---------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1  | Verify UI is correctly inverted for RTL languages (e.g., Arabic) | Start the client with Arabic language or with `-reverse` flag for English. | ui is correctly inverted in all parts | | | 
