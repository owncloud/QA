#### Copy, Move, Picker (Spaces)

#### PRs: 

Devices: Samsung A51 Android 12<br>
Server: oC10.11, oCIS 2.0.0


---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | 
| :-------- | :---- | :------- | :----: | :------------------------- | 
|**Picker**||||||
| View Spaces List | Select a file to copy in a server with custom spaces | List of spaces correctly displayed. Only les inco and cancel option are available | P m12 | FIXED: Share and Copy here options also available |
| View File List | 1. Select a file to copy in a server with custom spaces<br>2. Select any space | List of files correctly displayed. New folder icon, lens icon, copy here, sorting list and cancel options are available | P m12 |  |
| Copy no spaces | Select a file to copy in a server with no custom spaces | Only personal space listed in picker | P m12 |  |
| Copy several spaces | Select a file to copy | Picker shows the list of available spaces. Disabled spaces not listed. Personal space listed | P m12  |  |
| Move in personal| Select a file to move in personal space| Picker shows the root folder of the personal space | P m12  |  |
| Move in custom space | Select a file to move in custom space| Picker shows the root folder of the custom space | P m12  |  |
| Camera uploads Picture | 1. Enable Camera uploads for Pictures in Settings<br>2. Select Picture upload path | Picker shows the root folder of the personal space | P m12 |  |
| Camera uploads Picture switch account | 1. Attach two accounts<br>2. Enable Camera uploads for Pictures in Settings<br>3. Select Picture upload path<br>4. Select a different account to upload pictures (attached before)<br>5. Select Picture upload path | 3. Picker shows the root folder of the personal space<br>5. Picker shows the root folder of the personal space of the new selected account | P m12 |  |
| Camera uploads Video | 1. Enable Camera uploads for Videos in Settings<br>2. Select Video upload path | Picker shows the root folder of the personal space | P m12 |  |
| Camera uploads Video switch account | 1. Attach two accounts<br>2. Enable Camera uploads for Videos in Settings<br>3. Select Video upload path<br>4. Select a different account to upload video (attached before)<br>5. Select Video upload path | 3. Picker shows the root folder of the personal space<br>5. Picker shows the root folder of the personal space of the new selected account| P m12 |  |
| Share with oC | 1. Open Photos/Gallery app<br>2. Select some pictures and share them with oC|   Picker shows the root folder of the personal space | P m12 |  |
| oC10 | 1. Select any item to copy in oC10 account | Root folder displayed, no spaces in oC10 | P m12 | FIXED: Spaces list displayed |
|**Copy Actions**||||||
| Copy file personal | 1. Select a file to copy<br>2. Select a correct target location in personal space | File copied to the new location | P m12  |  |
| Copy multiple files personal | 1. Select several files to copy<br>2. Select a correct target location in personal space | Files copied to the new location | P m12  |  |
| Copy folder personal | 1. Select a folder that contains subfolders with files inside to copy <br>2. Select a correct location in personal space | Folder copied to the new location, including all subfolders and content inside | P m12 | FIXED: Content not copied |
| Copy several folders personal | 1. Select some folder that contains subfolders with files inside to copy <br>2. Select a correct location in personal space | Folders copied to the new location, including all subfolders and content inside | P m12 | FIXED: Content not copied |
| Copy file into new folder personal | 1. Select a file to copy<br>2. In picker, create a new folder in root using the "Create folder" option<br>3. Select the created folder as location in personal space | File copied to the new folder | P m12  |  |
| Copy folder into new folder personal | 1. Select a folder to copy<br>2. In picker, create a new folder in root using the "Create folder" option<br>3. Select the created folder as location in personal space | Folder and its content copied to the new folder | P m12  | FIXED: Content not copied |
| Copy file to same location in personal | 1. Select a file to copy<br>2. Select as location the current location in personal space| File is copied with (2) in the name, and in the same location | P m12 |  |
| Copy folder to same location in personal | 1. Select a folder that contains subfolders with files to copy <br>2. Select as location the current location in personal | Folder and its content is duplicated | P m12 | FIXED: Content not copied |
| Copy file to other location with same name in personal | 1. Select a file to copy<br>2. Create inside the target folder a file with the same name as the original in personal space<br>3. Copy | File is copied with a (2) at the end of the name | P m12 |  |
| Copy folder to other location with same name in personal | 1. Select a folder to copy<br>2. Create inside the target folder another folder with the same name as the original in personal space<br>3. Copy | Folder is copied with a (2) at the end of the name. Content copied inside | P m12 | FIXED: Content not copied |
| Copy file same space | 1. Select a file to copy<br>2. Select a correct target location in same space | File copied to the new location | P m12  |  |
| Copy folder same space| 1. Select a folder that contains subfolders with files inside to copy <br>2. Select a correct location in same custom space | Folder copied moved to the new location, including all subfolders and content inside | P m12 | |
| Copy file new folder same space | 1. Select a file to copy<br>2. In picker, create a new folder in root using the "Create folder" option in the same space<br>3. Select the created folder as location in same space | File copied to the new folder | P m12  |  |
| Copy folder new folder same space | 1. Select a folder to copy<br>2. In picker, create a new folder in root using the "Create folder" option in the same space<br>3. Select the created folder as location in same space | Folder and its content copied to the new folder | P m12  |  |
| Copy file to same location in space | 1. Select a file to copy<br>2. Select as location the current location in same custom space| File is copied with (2) in the name, and in the same location | P m12 | FIXED: Error message, not consistent with personal |
| Copy folder to same location in space | 1. Select a folder that contains subfolders including files to copy <br>2. Select as location the current location in same custom space | Folder and its content is duplicated | P m12 | FIXED: Error message, not consistent with personal |  |  |
| Copy to other location with same name in space | 1. Select an item to copy<br>2. Create in the location folder an item with the same name as the original in same custom space<br>3. Copy | Item is copied with a (2) at the end of the name | P m12  |  |
| Copy file from custom to another custom space | 1. Select a file to copy<br>2. Select a correct target location in a different custom space | File copied to the new location | P m12  |  |
| Copy file from custom to personal space | 1. Select a file to copy in a custom space<br>2. Select a correct target location in personal space | File copied to the new location in personal | P m12  | FIXED: Not copied |
| Copy file from personal to custom space | 1. Select a file to copy in a custom space<br>2. Select a correct target location in personal space | File copied to the new location in personal | P m12  | FIXED: Not copied |
| Copy folder from custom to another space| 1. Select a folder that contains subfolders with files inside to copy <br>2. Select a correct location in another custom space | Folder copied moved to the new location, including all subfolders and content inside | P m12 |  |
| Copy folder from custom to personal space| 1. Select a folder in custom that contains subfolders with files inside to copy <br>2. Select a correct location in personal space | Folder copied moved to the new location, including all subfolders and content inside | P m12 | FIXED: Error |
| Copy folder from personal to custom space| 1. Select a folder in personal that contains subfolders with files inside to copy <br>2. Select a correct location in custom space | Folder copied moved to the new location, including all subfolders and content inside | P m12 | FIXED: Error |
| Copy new folder other custom space | 1. Select a file in custom space to copy<br>2. In picker, create a new folder in root using the "Create folder" option in the another custom space<br>3. Select the created folder as location in that another space | File copied to the new folder | P m12  |  |
| Copy new folder personal space | 1. Select a file in space to copy<br>2. In picker, create a new folder in root using the "Create folder" option in personal space<br>3. Select the created folder as location in that another space | File copied to the new folder |  P m12 | FIXED: Not copied |
| Copy file to in another space with same name| 1. Select a file to copy<br>2. Select as location a folder in another space that contains a file with same name| File is copied with (2) in the name, and in the same location | P m12 |  |
| Copy folder to in another space with same name | 1. Select a folder that contains folder with files to copy <br>2. Select as location a folder in another space that contains a file with same name | Folder and its content is duplicated | P m12 |  |
|**Copy Errors**||||||
| Copy folder to itself | 1. Select a folder to copy<br>2. Select as location the folder itself | Not allowed, error message displayed | P m12 |   
| Copy folder to a descendant | 1. Select a folder to move<br>2. Select as location a folder inside the original folder | Not allowed, error message displayed | P m12 |   |
| Copy to inexistent location | 1. Select an item to copy<br>2. Select a correct location<br>3. Before submitting, remove the target location in webUI or other client | Error message | P m12 | FIXED: Incorrect message | 
| Copy to disabled space | 1. Select an item to copy<br>2. Select another custom space location<br>3. Before submitting, disable the space in webUI | Error message | P m12 | FIXED: No error message |
|**Move Actions**||||||
| Move file personal | 1. Select a file to move<br>2. Select a correct target location in personal space  | File moved to the new location (removed from original location)| P m12  |  |
| Move folder personal | 1. Select a folder that contains subfolders with files inside to move<br>2. Select a correct location in personal space| Folder moved to the new location, including all subfolders and content inside (removed from original location)| P m12 | |
| Move to same location in personal | 1. Select an item to move<br>2. Select as location the current location in personal space| Not posible to move to same location | P m12 |  |
| Move to other location with same name in personal | 1. Select an item to move<br>2. Create in the location folder an item with the same name as the original in custom space<br>3. Move | Item is moved with a (2) at the end of the name | P m12 |  |
| Move file custom space | 1. Select a file to move<br>2. Select a correct target location in custom space  | File moved to the new location (removed from original location)| P m12  |  |
| Move folder custom space | 1. Select a folder that contains subfolders with files inside to move<br>2. Select a correct location in custom space| Folder moved to the new location, including all subfolders and content inside (removed from original location)| P m12 | |
| Move to same location in custom space | 1. Select an item to move<br>2. Select as location the current location in custom space | Not posible to move to same location | P m12 |  |
| Move to other location with same name in custom space | 1. Select an item to move<br>2. Create in the location folder an item with the same name as the original in custom space<br>3. Move | Item is moved with a (2) at the end of the name | P m12 |  |
| Modified | 1. In app, download a txt file<br>2. In server, modify the file<br>3. In app, move the file to another location | Item is moved with the latest downloaded version | F m12 | Conflict ? happens in current master|
| Move downloaded | 1. Select some downloaded items to move<br>2. Select another location in personal to move them<br>3. Move | Downloaded items are moved in the internal storage as well, in the correct location | P m12 |  |
|**Move Errors**||||||
| Move folder to itself | 1. Select a folder to move<br>2. Select as location the folder itself | Not allowed, error message displayed | P m12 |   
| Move folder to a descendant | 1. Select a folder to move<br>2. Select as location a folder inside the original folder | Not allowed, error message displayed | P m12 |   |
| Moved item removed | 1. Select an item to move<br>2. Select a correct location<br>3. Before submitting, remove the original file in webUI or other client | Error message. List of files refreshed without the item | P m12 | FIXED: No error message |
