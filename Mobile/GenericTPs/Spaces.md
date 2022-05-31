###  Spaces (oCIS)

---
 
| Test Case | Description | Expected | Result | Comments |
| :-------- | :---------- | :------- | :----: | :------- |
|**Spaces detection**||
| oC10 server | Authenticate in a oC10 server | Straigth to the list of files |  |  |  |
| No spaces| Authenticate in a oCIS server account with no spaces available | Straigth to the list of files |  |  |  |
| Spaces available | Authenticate in a oCIS server account with spaces available (created remotely)| Personal and spaces are listed (check with server) |  |  |  |
|**Spaces list (local)**| In a local authenticated oCIS session|
| Create new space | Create new space with title | Space is created with correct title (check in server) |  |  |  |
| Rename space | Rename an existing space | Space is renamed correctly (check in server) |  |  |  |
| Add subtitle | 1. Create space without subtitle<br>2. Edit the space to add a subtitle | Subtitle is displayed below the title (check also in server) |  |  |  |
| Edit subtitle | 1. Create space without subtitle<br>2. Edit the space to add a subtitle<br>3. Change subtitle | New subtitle correctly displayed (check also in server) |  |  |  |
| Add image | 1. Create space without image<br>2. Edit the space to add a image | Image is displayed by clicking on the space name, in the top side of the files view (check also in server) |  |  |  |
| Edit image | 1. Create space without image<br>2. Edit the space to add a image<br>3. Replace the image for another one | Last image is displayed by clicking on the space name, in the top side of the files view (check also in server) |  |  |  |
| Change quota | 1. Create space<br>2. Edit the quota, from 1GB to 5GB<br>3. Upload a 2GB file<br>4. Upload a 6GB file | 2. Check in server that the quota was correctly edited<br>3. Upload succeeded<br>4. Upload fails |  |  |  |
| Disable space | 1. Create a new space<br>2. Upload some files or create folders inside<br>3. Disable the space<br>4. Enter in the space | Content is not available (check also in server) |  |  |  |
| Remove space option availability | 1. Open the list of options of an available and enabled space<br>2. Disable the space | 1. Remove option is not available<br>2. Remove option is available |  |  |  |
| Remove space | 1. Disable an existing space<br>2. Remove the space | Space removed and no longer listed (check also in server) |  |  |  |
|**Spaces list (remote)**| In a remote authenticated oCIS session|
| Create new space | Using web, create new space with title | Space is listed in app |  |  |  |
| Rename space | Using web, rename an existing space | Space is renamed correctly in app |  |  |  |
| Add subtitle | 1. Using web, create space without subtitle<br>2. In web, edit the space to add a subtitle | 1. Check that space is created without subtitle in app<br>2. Subtitle added in app |  |  |  |
| Edit subtitle | 1. Using web, create space without subtitle<br>2. In web, edit the space to add a subtitle<br>3. In web, change subtitle | 1. Check that space is created without subtitle in app<br>2. Subtitle added in app<br>3. Subtitle changed in app |  |  |  |
| Add image | 1. Using web, create space without image<br>2. In web, edit the space to add a image | 1. In app, check that space is created without image<br>2. Image is displayed in app by clicking on the space name, in the top side of the files view |  |  |  |
| Edit image | 1. Using web, create space without image<br>2. In web, edit the space to add a image<br>3. In web, replace the image for another one |  1. In app, check that space is created without image<br>2. Image is displayed in app by clicking on the space name, in the top side of the files view<br>3. Last image is displayed in app by clicking on the space name, in the top side of the files view (check also in server) |  |  |  |
| Change quota | 1. Using web, create space<br>2. In web, edit the quota, from 1GB to 5GB| Check in app that the quota was correctly edited |  |  |  |
| Disable space | 1. Using web, create a new space<br>2. Upload some files or create folders inside<br>3. In web, disable the space<br>4. In app, enter in the space | 3. In app, space is marked as disabled<br>4. In app, content is not available  |  |  |  |
| Remove space | 1. Using web, disable an existing space<br>2. In web, remove the space | In app, space removed and no longer listed |  |  |  |
| Remove space from inside | 1. In app, enter in an existing space<br>2. Using web, disable an existing space<br>3. In web, remove the space | In app, error when any action is done over the removed space |  |  |  |
|**Spaces file operations (local)**| 
| Create folder root | Create a new folder with special characters in spaces' root by using the '+' button on the top | Folder created in spaces (check in server) |  |  |  |
| Create folder non-root | Create a new folder with special characters in spaces' not root by using the '+' button on the top | Folder created in spaces (check in server) |  |  |  |
| Upload file root | Upload a new file in spaces' root by using the '+' button on the top | File created in root (check in server) |  |  |  |
| Upload file non-root | Upload 30 files in spaces' not root by using the '+' button on the top | File created in non-root (check in server) |  |  |  |
| Upload several files root | Upload 30 files in spaces' root by using the '+' button on the top | File created in spaces (check in server) |  |  |  |
| Upload several file non-root | Upload a new file in spaces' not root by using the '+' button on the top | File created in spaces (check in server) |  |  |  |
| Upload from gallery root | Upload a pic or video from gallery in spaces' root by using the '+' button on the top | File created in spaces (check in server) |  |  |  |
| Upload from gallery non-root | Upload a pic or video from gallery in spaces' not root by using the '+' button on the top | File created in spaces (check in server) |  |  |  |
| Upload several from gallery root | Upload 30 pics or videos from gallery in spaces' root by using the '+' button on the top | File created in spaces (check in server) |  |  |  |
| Upload several from gallery non-root | Upload 30 pics or videos from gallery in spaces' not root by using the '+' button on the top | File created in spaces (check in server) |  |  |  |
| Take photo root | In root folder, take a picture from camera by using the option in '+' button on the top  | Picture uploaded (check in server) |  |  |  |
| Take photo non-root | In non-root folder, take a picture from camera by using the option in '+' button on the top  | Picture uploaded (check in server) |  |  |  |
| Take video root | In root folder, take a video from camera by using the option in '+' button on the top  | Video uploaded (check in server) |  |  |  |
| Take video non-root | In non-root folder, take a video from camera by using the option in '+' button on the top  | Video uploaded (check in server) |  |  |  |
| Scan document root | In root folder, scan a new document by using the option in '+' button on the top | Document uploaded (check in server) |  |  |  |
| Scan document non-root | In non-root folder, scan a new document by using the option in '+' button on the top | Document uploaded (check in server) |  |  |  |
| Open in | Select any file of the spaces list to "Open In" | File opened in external app |  |  |  |
| Move file| 1. Select any file of the spaces list to "Move"<br>2. Select target folder in the space | File moved to the target inside the space (check in server) |  |  |  |
| Move folder| 1. Select any folder with subfolders of the spaces list to "Move"<br>2. Select target folder in the space | Folder and its content moved to the target inside the space (check in server) |  |  |  |
| Move to same place| 1. Select any item of the spaces list to "Move"<br>2. Select as target folder in the space the current container folder | Error,not posible |  |  |  |
| Copy file| 1. Select any file of the spaces list to "Copy"<br>2. Select target folder in the space | File copied to the target inside the space (check in server) |  |  |  |
| Copy folder| 1. Select any folder with subfolders of the spaces list to "Copy"<br>2. Select target folder in the space | Folder and its content copied to the target inside the space (check in server) |  |  |  |
| Copy to same place| 1. Select any item of the spaces list to "Copy"<br>2. Select as target folder in the space the current container folder | Error, not posible |  |  |  |
| Rename | 1. Select any item of the spaces list to "Rename"<br>2. Enter same name<br>3. Enter different name | 2. Error<br>3. Item correctly renamed (check in server) |  |  |  |
| Duplicate file | Select any file of the spaces list to "Duplicate" | Item correctly duplicated in the same location (check in server) |  |  |  |
| Duplicate folder | Select any folder with subfolders of the spaces list to "Duplicate" | Folder and subfolders correctly duplicated in the same location (check in server) |  |  |  |
| Cut/Paste file | 1.Select any file of the spaces list to "Cut"<br>2. Select as target folder to paste, the current container folder<br>3. Select as target folder to paste, another container folder| 2. Error, no posible<br>3. File correctly pasted (check in server) |  |  |  |
| Cut/Paste folder | 1.Select any folder with subfolders of the spaces list to "Cut"<br>2. Select as target folder to paste, the current container folder<br>3. Select as target folder to paste, another container folder| 2. Error, no posible<br>3. Folder and subfolders correctly pasted (check in server) |  |  |  |
| Delete file | 1. Select any file of the spaces list to "Delete"| File correctly deleted (check in server) |  |  |  |
| Delete folder | 1. Select any folder with subfolders of the spaces list to "Delete"| Folder and subfolders correctly deleted (check in server) |  |  |  |
| Delete by swipe | 1. Select any item of the spaces list to "Delete", using the swipe action in the row| Item correctly deleted (check in server) |  |  |  |
| Av. offline file | 1. Select any file of the spaces list to "Available offline" | File correctly av.offline.<br>Check that file appears in "Quick access" as av. offline<br> Check tha file is open and accesible in offline|  |  |  |
| Av. offline folder | 1. Select any folder of the spaces list to "Available offline" | Folder correctly av.offline.<br>Check that folder appears in "Quick access" as av. offline<br> Check that folder is open and accesible in offline|  |  |  |
| Share with user as viewer | Share any item with user as viewer | Check with the recipient user that can view and preview the content | 
| Share with user as editor | Share any item with user as editor | Check with the recipient user that can perform any operation but sharing (upload, edit, delete) | 
| Share with user as manager | Share any item with user as manager | Check with the recipient user that can perform any operation (upload, edit, delete, share)| 
|**Spaces file operations (remote)**| 
| Create folder root | In web, create a new folder with special characters in spaces' root  | Folder listed in app |  |  |  |
| Create folder non-root | In web, create a new folder with special characters in spaces' not root  | Folder listed in app |  |  |  |
| Upload file root | In web, upload a new file in spaces' root | File listed in app |  |  |  |
| Upload file non-root | In web, upload 30 files in spaces' not root | Files listed in app |  |  |  |
| Upload several files root | In web, upload 30 files in spaces' root | Files listed in app |  |  |  |
| Upload several file non-root | In web, upload a new file in spaces' not root | Files listed in app |  |  |  |
| Move file| 1. In web, select any file of the spaces list to "Move"<br>2. Select target folder in the space | File listed in the target inside the space in the app |  |  |  |
| Move folder| 1. In web, select any folder with subfolders of the spaces list to "Move"<br>2. Select target folder in the space | Folder and its content listed in the target inside the space in the app |  |  |  |
| Copy file| 1. In web, select any file of the spaces list to "Copy"<br>2. Select target folder in the space | File listed in the target inside the space in the app |  |  |  |
| Copy folder| 1. In web, select any folder with subfolders of the spaces list to "Copy"<br>2. Select target folder in the space | Folder and its content listed in the target inside the space in app |  |  |  |
| Rename | 1. In web, select any item of the spaces list to "Rename"<br>2. Enter different name | Item correctly listed with new name in app|  |  |  |
| Duplicate file | In web, select any file of the spaces list to "Duplicate" | New item correctly listed in the same location in app |  |  |  |
| Duplicate folder | In web, select any folder with subfolders of the spaces list to "Duplicate" | Folder and subfolders correctly listed in the same location in app |  |  |  |
| Cut/Paste file | 1. In web, select any file of the spaces list to "Cut"<br>2. Select as target folder to paste, another container folder| File correctly listed in app|  |  |  |
| Cut/Paste folder | 1. In web, select any folder with subfolders of the spaces list to "Cut"<br>2. Select as target folder to paste, another container folder| Folder and subfolders correctly listed in app |  |  |  |
| Delete file | 1. In web, select any file of the spaces list to "Delete"| File correctly deleted in app |  |  |  |
| Delete folder | 1. In web, select any folder with subfolders of the spaces list to "Delete" | Folder and subfolders correctly deleted in app |  |  |  |
|**Spaces sharing and membering**| 
| Add member as viewer | Add another user as viewer to the space| Check with the recipient user that can view and preview the content | 
| Add member as editor | Add another user as editor to the space| Check with the recipient user that can perform any operation but sharing (upload, edit, delete) | 
| Add member as manager | Add another user as manager to the space| Check with the recipient user that can perform any operation (upload, edit, delete, share)| 
| Remove member | Remove an existing member from the space | Check with the recipient user that can not access the space anymore | 
|**Files app**| 
| Only personal  | 1. Log in a account with no spaces<br>2. Open Files App | Straight to the list of files |  |  |
| With spaces | 1. Log in a account with some spaces<br>2. Open Files App | After selecting the account, the list of spaces is there to browse through |  |  |
|**iPad**| 