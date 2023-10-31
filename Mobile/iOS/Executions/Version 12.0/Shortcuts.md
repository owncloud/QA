###  Shortcuts

#### Pr: 

Devices: <br>
Server: 

---

 
| Test Case | Steps | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- | 
|**Create Folder**|||||
| Create Folder in root | Create an action in Shortcuts app: create a folder in root<br>Run the action | Folder is created |  |   |  |
| Create Folder in non-root | Create an action in Shortcuts app: create a folder in non-root<br>Run the action | Folder is created |  |   |  |
| Create Folder existing name | Create an action in Shortcuts app: create a folder with an existing name<br>Run the action | Error displayed |  |  |  |
| Create Folder passcode | Create an action in Shortcuts app: create a folder with passcode enabled<br>Run the action | Error displayed |  |  |  |
| Create Folder no bookmark | Create an action in Shortcuts app: create a folder in a deleted bookmark<br>Run the action | Error displayed |  |  |  |
|**Delete Path Item**|||||
| Delete folder in root | Create an action in Shortcuts app: delete item in root<br>Select a folder<br>Run the action | Folder is deleted |  |  |  |
| Delete file in root | Create an action in Shortcuts app: delete item in root<br>Select a file<br>Run the action | File is deleted |  |  |  |
| Delete folder in non-root | Create an action in Shortcuts app: delete item in non-root<br>Select a folder<br>Run the action | Folder is deleted |  |  |  |
| Delete file in non-root | Create an action in Shortcuts app: delete item in non-root<br>Select a file<br>Run the action | File is deleted |  |  |  |
| Delete item passcode | Create an action in Shortcuts app: delete a item with passcode enabled<br>Run the action | Error displayed |  |  |  |
| Delete non-existing | Create an action in Shortcuts app: delete a non existing item<br>Run the action | Error displayed |  |  |  |
| Create item no bookmark | Create an action in Shortcuts app: create a folder in a deleted bookmark<br>Run the action | Error displayed |  |  |  |
|**Get Account**|||||
| Get Account | Create an action in Shortcuts app: Get Account List<br>Create a second action: Get Account<br>Create a third action: Share by mail<br>Select the UUID<br>Run the action | UUID is correctly shared |  |  |  |
| Get Account passcode | Create an action in Shortcuts app: Get account with passcode enabled<br>Run the action | Error displayed |  |  |  |
| Get Account non-existing | Create an action in Shortcuts app: Get non existing item<br>Run the action | Error displayed |  |  |  |
|**Get Account List**|||||
| Get Account List | Create an action in Shortcuts app: Get Account List<br>Send the list for email by adding a new step in the shortcut | Runs OK and the list is correct<br>Run the action |  |  |  |
| Get Account List passcode | Create an action in Shortcuts app: Get account with passcode enabled<br>Run the action | Error displayed |  |  |  |
| Get Account List with no accounts | Create an action in Shortcuts app: Get non existing item<br>Run the action | Runs OK |   |  |  |
|**Get Directory List**|||||
| Get Directory List root | Create an action in Shortcuts app: Get Directory List<br>Select root folder<br>Send the list for email by adding a new step in the shortcut<br>Run the action  | Runs OK |  |  |  |
| Get Directory List non-root | Create an action in Shortcuts app: Get Directory List<br>Select non-root folder<br>Run the action | Runs OK |  |  |  |
| Get Directory List passcode | Create an action in Shortcuts app: Get Directory List with passcode enabled<br>Run the action | Error displayed |  |  |  |
| Get Directory List with non existing path | Create an action in Shortcuts app: Get Directory List<br>Set a non existing folder<br>Run the action | Error displayed |   |  |  |
| Get Directory List with non existing account | Create an action in Shortcuts app: Get Directory List<br>Remove the account<br>Run the action | Error displayed |   |  |  |
|**Get File**|||||
| Get File root | Create an action in Shortcuts app: Get File<br>Select a file in root folder<br>Send the file by email by adding a new step in the shortcut<br>Run the action | Runs OK |  |  |  |
| Get File non-root | Create an action in Shortcuts app: Get File<br>Select file in non-root folder<br>Send the file by email by adding a new step in the shortcut<br>Run the action | Runs OK |  |  |  |
| Get File passcode | Create an action in Shortcuts app: Get File with passcode enabled<br>Run the action | Error displayed |  |  |  |
| Get File with non existing path | Create an action in Shortcuts app: Get File<br>Set a non existing file<br>Run the action | Error displayed |   |  |  |
| Get File with non existing account | Create an action in Shortcuts app: Get File<br>Remove the account<br>Run the action | Error displayed |   |  |  |
|**Get File Info**|||||
| Get File Info root | Create an action in Shortcuts app: Get File Info<br>Select a file in root folder<br>Send the info by email by adding a new step in the shortcut<br>Run the action | Runs OK |  |  |  |
| Get File Info non-root | Create an action in Shortcuts app: Get File Info<br>Select file in non-root folder<br>Send the info by email by adding a new step in the shortcut<br>Run the action | Runs OK |  |  |  |
| Get File Info passcode | Create an action in Shortcuts app: Get File Info with passcode enabled<br>Run the action | Error displayed |  |  |  |
| Get File Info with non existing path | Create an action in Shortcuts app: Get File Info<br>Set a non existing file<br>Run the action | Error displayed |   |  |  |
| Get File Info with non existing account | Create an action in Shortcuts app: Get FileInfo<br>Remove the account<br>Run the action | Error displayed |   |  |  |
|**Path exists**|||||
| Path existing root| Create an action in Shortcuts app: Path exists<br>Select a item in root folder<br>Send the info by email by adding a new step in the shortcut<br>Run the action | Returns 1|  |  |  |
| Path existing non-root| Create an action in Shortcuts app: Path exists<br>Select a item in non-root folder<br>Send the info by email by adding a new step in the shortcut<br>Run the action | Returns 1|  |  |  |
| Path existing with non existing path | Create an action in Shortcuts app: Get File Info<br>Set a non existing file<br>Send the info by email by adding a new step in the shortcut<br>Run the action | Returns 0 |   |  |  |
| Path existing passcode | Create an action in Shortcuts app: Path existing with passcode enabled<br>Run the action | Error displayed |  |  |  |
| Path existing with non existing account | Create an action in Shortcuts app: Path existing<br>Remove the account<br>Run the action | Error displayed |   |  |  |
|**Save Files**|||||
| Save Files root | Create an action in Shortcuts app: Save Files<br>Copy a file in any location to clipboard (using Files App, f.ex.)<br>Create the action saving the file in root folder<br>Run the action | File saved in root |  |  |  |
| Save Files root | Create an action in Shortcuts app: Save Files<br>Copy a file in any location to clipboard (using Files App, f.ex.)<br>Create the action saving the file in non-root folder<br>Run the action | File saved in non-root |  |  |  |
| Save Files passcode | Create an action in Shortcuts app: Save Files with passcode enabled<br>Run the action | Error displayed |  |  |  |
| Save Files in non existing path | Create an action in Shortcuts app: Save Files<br>Set a non existing path<br>Run the action | Error displayed |   |  |  |
| Save Files in non existing account | Create an action in Shortcuts app: Save Files<br>Remove the account<br>Run the action | Error displayed |   |  |  |
