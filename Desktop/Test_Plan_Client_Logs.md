# Client Logs

## 1. Client logs on Mac OS

| ID | Test Case                                   | Steps to reproduce                                                                                                                                                                                                              | Expected Result                                                                                                                                | Result | Related Comment |
|----|---------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1  | Verify Log Output window opens via F12 | Press F12 | Log Output window has been opened | | | 
| 2  | Verify Log Output window opens via Command+L | Press command + L | Log Output window has been opened | | | 
| 3  | Verify 'Open Folder' button works | Click Open Folder button | Folder has been opened | | | 
| 4  | Verify logs are stored in temporary folder when enabled | 1.  Enable logging to temporary folder <br/> 2.  Verify logs are stored in a temporary folder | Logs are stored in a temporary folder | | | 
| 5  | Verify old logs are automatically deleted | 1.  Enable Deleting logs older than 4 hours <br/> 2.  Verify logs older than 4 hours are deleted | Logs older than 4 hours are deleted | | | 
| 6  | Verify log window can be opened via terminal for a running client | Open client with `--logwindow` in one terminal: `/Applications/owncloud.app/Contents/MacOS/owncloud --logwindow` <br/> Then this in second terminal tab opens log window: `/Applications/owncloud.app/Contents/MacOS/owncloud --logwindow`  | Logs can be opened via terminal for already running client <br/> GitHub issue: [#4098](https://github.com/owncloud/client/issues/4098) | | | 

## 2. Client logs on Linux

| ID | Test Case                                   | Steps to reproduce                                                                                                                                                                                                              | Expected Result                                                                                                                                | Result | Related Comment |
|----|---------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1  | Verify Log Output window opens via F12 | Press F12 | Log Output window has been opened | | | 
| 2  | [AUTOMATED] Verify Log Output window opens via Ctrl+L | AUTOMATED - Press Ctrl + L | Log Output window has been opened | | | 
| 3  | Verify 'Open Folder' button works | Click Open Folder button | Folder has been opened | | | 
| 4  | Verify logs are stored in temporary folder when enabled | 1.  Enable logging to temporary folder <br/> 2.  Verify logs are stored in a temporary folder | Logs are stored in a temporary folder | | | 
| 5  | Verify old logs are automatically deleted | 1.  Enable Deleting logs older than 4 hours <br/> 2.  Verify logs older than 4 hours are deleted | Logs older than 4 hours are deleted | | | 
| 6  | Verify log window can be opened via terminal command | Open Terminal and type: `owncloud --logwindow` | Logs have been opened via terminal | | | 

## 3. Client logs on Windows

| ID | Test Case                                   | Steps to reproduce                                                                                                                                                                                                              | Expected Result                                                                                                                                | Result | Related Comment |
|----|---------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1  | Verify Log Output window opens via F12 | Press F12 | Log Output window has been opened | | |
| 2  | Verify Log Output window opens via Ctrl+L | Press Ctrl + L | Log Output window has been opened | | |
| 3  | Verify 'Open Folder' button works | Click Open Folder button | Folder has been opened | | |
| 4  | Verify logs are stored in temporary folder when enabled | 1. Enable logging to temporary folder<br/>2. Verify logs are stored in a temporary folder | Logs are stored in a temporary folder | | |
| 5  | Verify old logs are automatically deleted | 1. Enable Deleting logs older than 4 hours<br/>2. Verify logs older than 4 hours are deleted | Logs older than 4 hours are deleted | | |
| 6  | Verify log window can be opened via modified desktop shortcut | 1. Get to “Start > Programs > Owncloud” and right-click on owncloud icon. Select “Send To > Desktop (Create Shortcut)”.<br/>2. Right click on the newly appearing owncloud icon on desktop and select “Properties”.<br/>3. Select “Target” value in appearing dialog and append following text: `--logwindow`<br/>4. Now start owncloud by double clicking new desktop icon[/list] | Logs have been opened | | |

## 4. Open the Log dialog

| ID | Test Case                                   | Steps to reproduce                                                                                                                                                                                                              | Expected Result                                                                                                                                | Result | Related Comment |
|----|---------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1  | [AUTOMATED] Verify Log dialog opens via keyboard shortcut | Press Ctrl + L | Log dialog has been opened | | |
