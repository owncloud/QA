#### Copy, Move, Picker (Spaces)

#### PRs: 

Devices:  <br>
Server: 


---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | 
| :-------- | :---- | :------- | :----: | :------------------------- | 
|**Picker**||||||
| Copy no spaces | Select a file to copy in a server with no custom spaces | Only personal space listed in picker |   |  |
| Copy several spaces | Select a file to copy | Picker shows the list of available spaces. Disabled spaces not listed. Personal space listed |   |  |
| Move in personal| Select a file to move in personal space| Picker shows the root folder of the personal space |   |  |
| Move in custom space | Select a file to move in custom space| Picker shows the root folder of the custom space |  |  |
| Camera uploads Picture | 1. Enable Camera uploads for Pictures in Settings<br>2. Select Picture upload path | Picker shows the root folder of the personal space |  |  |
| Camera uploads Picture switch account | 1. Attach two accounts<br>2. Enable Camera uploads for Pictures in Settings<br>3. Select Picture upload path<br>4. Select a different account to upload pictures (attached before)<br>5. Select Picture upload path | 3. Picker shows the root folder of the personal space<br>5. Picker shows the root folder of the personal space of the new selected account |  |  |
| Camera uploads Video | 1. Enable Camera uploads for Videos in Settings<br>2. Select Video upload path | Picker shows the root folder of the personal space |  |  |
| Camera uploads Video switch account | 1. Attach two accounts<br>2. Enable Camera uploads for Videos in Settings<br>3. Select Video upload path<br>4. Select a different account to upload video (attached before)<br>5. Select Video upload path | 3. Picker shows the root folder of the personal space<br>5. Picker shows the root folder of the personal space of the new selected account|  |  |
| Share with oC | 1. Open Photos/Gallery app<br>2. Select some pictures and share them with oC|  Picker shows the list of all spaces, including personal and excluding disabed spaces |  |  |
|**Copy Actions**||||||
| Copy file personal | 1. Select a file to copy<br>2. Select a correct target location in personal space | File copied to the new location |   |  |
| Copy folder personal | 1. Select a folder that contains subfolders with files inside to copy <br>2. Select a correct location in personal space | Folder copied moved to the new location, including all subfolders and content inside |  | |
| Copy new folder personal | 1. Select a file to copy<br>2. In picker, create a new folder in root using the "Create folder" option<br>3. Select the created folder as location in personal space | File copied to the new folder |   |  |
| Copy file to same location in personal | 1. Select a file to copy<br>2. Select as location the current location in personal space| File is copied with (2) in the name, and in the same location |  |  |
| Copy folder to same location in personal | 1. Select a folder that contains subfolders with files to copy <br>2. Select as location the current location in personal | Folder and its content is duplicated |  |  |
| Copy to other location with same name in personal | 1. Select an item to copy<br>2. Create in the location folder an item with the same name as the original in personal space<br>3. Copy | Item is copied with a (2) at the end of the name |  |  |
| Copy file same space | 1. Select a file to copy<br>2. Select a correct target location in same space | File copied to the new location |   |  |
| Copy folder same space| 1. Select a folder that contains subfolders with files inside to copy <br>2. Select a correct location in same custom space | Folder copied moved to the new location, including all subfolders and content inside |  | |
| Copy new folder same space | 1. Select a file to copy<br>2. In picker, create a new folder in root using the "Create folder" option in the same space<br>3. Select the created folder as location in same space | File copied to the new folder |   |  |
| Copy file to same location in space | 1. Select a file to copy<br>2. Select as location the current location in same custom space| File is copied with (2) in the name, and in the same location |  |  |
| Copy folder to same location in space | 1. Select a folder that contains subfolders with files to copy <br>2. Select as location the current location in same custom space | Folder and its content is duplicated |  |  |
| Copy to other location with same name in space | 1. Select an item to copy<br>2. Create in the location folder an item with the same name as the original in same custom space<br>3. Copy | Item is copied with a (2) at the end of the name |  |  |
| Copy file another space | 1. Select a file to copy<br>2. Select a correct target location in a different space | File copied to the new location |   |  |
| Copy folder another space| 1. Select a folder that contains subfolders with files inside to copy <br>2. Select a correct location in another space | Folder copied moved to the new location, including all subfolders and content inside |  | |
| Copy new folder other space | 1. Select a file to copy<br>2. In picker, create a new folder in root using the "Create folder" option in the another space<br>3. Select the created folder as location in that another space | File copied to the new folder |   |  |
| Copy file to same location in another space | 1. Select a file to copy<br>2. Select as location the current location in another space| File is copied with (2) in the name, and in the same location |  |  |
| Copy folder to same location in another space | 1. Select a folder that contains subfolders with files to copy <br>2. Select as location the current location in another space | Folder and its content is duplicated |  |  |
| Copy to other location with same name in another space | 1. Select an item to copy<br>2. Create in the location folder an item with the same name as the original in another custom space<br>3. Copy | Item is copied with a (2) at the end of the name |  |  |
| Modified | 1. In app, download a txt file<br>2. In app, copy the file to another location | Item is copied and downloaded in the target location |  |  |
|**Copy Errors**||||||
| Copy folder to itself | 1. Select a folder to copy<br>2. Select as location the folder itself | Not allowed, error message displayed |  |   
| Copy folder to a descendant | 1. Select a folder to move<br>2. Select as location a folder inside the original folder | Not allowed, error message displayed |  |   |
| Copy to inexistent location | 1. Select an item to copy<br>2. Select a correct location<br>3. Before submitting, remove the target location in webUI or other client | Error message |  |  |
| Copy to disabled space | 1. Select an item to copy<br>2. Select another custom space location<br>3. Before submitting, disable the space in webUI | Error message |  |  |
|**Move Actions**||||||
| Move file personal | 1. Select a file to move<br>2. Select a correct target location in personal space  | File moved to the new location (removed from original location)|   |  |
| Move folder personal | 1. Select a folder that contains subfolders with files inside to move<br>2. Select a correct location in personal space| Folder moved to the new location, including all subfolders and content inside (removed from original location)|  | |
| Move to same location in personal | 1. Select an item to move<br>2. Select as location the current location in personal space| Item is created with (2) in the name, and in the same location |  |  |
| Move to other location with same name in personal | 1. Select an item to move<br>2. Create in the location folder an item with the same name as the original in custom space<br>3. Move | Item is moved with a (2) at the end of the name |  |  |
| Move file custom space | 1. Select a file to move<br>2. Select a correct target location in custom space  | File moved to the new location (removed from original location)|   |  |
| Move folder custom space | 1. Select a folder that contains subfolders with files inside to move<br>2. Select a correct location in custom space| Folder moved to the new location, including all subfolders and content inside (removed from original location)|  | |
| Move to same location in custom space | 1. Select an item to move<br>2. Select as location the current location in custom space| Item is created with (2) in the name, and in the same location |  |  |
| Move to other location with same name in custom space | 1. Select an item to move<br>2. Create in the location folder an item with the same name as the original in custom space<br>3. Move | Item is moved with a (2) at the end of the name |  |  |
| Modified | 1. In app, download a txt file<br>2. In server, modify the file<br>3. In app, move the file to another location | Item is moved with the latest downloaded version |  |  |
|**Move Errors**||||||
| Move folder to itself | 1. Select a folder to move<br>2. Select as location the folder itself | Not allowed, error message displayed |  |   
| Move folder to a descendant | 1. Select a folder to move<br>2. Select as location a folder inside the original folder | Not allowed, error message displayed |  |   |
| Moved item removed | 1. Select an item to move<br>2. Select a correct location<br>3. Before submitting, remove the original file in webUI or other client | Error message. List of files refreshed without the item |  |  |
