###  Spaces

**Server(s)**: <br>
**Device(s)**: <br>
**Execution date**: <br>
**Tester**: <br>
**Context**: <br>

---
 
| Test Case | Description | Expected | Result | Comments |
| :-------- | :---------- | :------- | :----: | :------- |
|**Sidebar options**||
| oC10 server | Authenticate in a oC10 server | "Files" instead of "Personal" in sidebar<br>No Spaces entry in sidebar |   |  |  |
| No spaces| Authenticate in a oCIS server account with no spaces available | "Spaces" entry in side menu with no spaces<br>"Personal" instead of "Files" in sidebar |  |  |  |
| Spaces available | 1. In web, create some spaces in an oCIS account<br>2. In app, authenticate in the account | "Personal" and "Spaces" are listed, includind the created spaces |  |  |  |
| Disconnect | 1. Add three accounts<br>2. Check disconnect button in every account | Account menus are collapsed|   |  |  |
| Avatar (oC10) | 1. In web, add avatar to an account<br>2. In web, edit avatar, adding a different one<br>3. In web, remove avatar  | Check avatar is correctly displayed in sidebar after every step |   |  |  |
| Quick access | Open "Quick access" in sidebar from any account | Available sections: Available offline, PDF, Documents, Images, Videos, Audios |   |  |  |
| Quick access II | Check every section to display correct list depending on the account content| List correct  |  |  |
| Status | 1. Upload a big file<br>2. Copy a bunch of files<br>3. Remove a very huge amount of files | Status view shows the current status of all operations. Operations disappear after finishing |  |  |
| Plus and settings |   | '+' and Settings are placed in the bottom side|   |  |  |
|**Spaces list (local)**| **Admin or Space admin user**|
| Create new space with title and subtitle| 1. Open sidebar and select `Spaces`<br>2. Click on 3-dot-button on the top right<br>3. Create space<br>4. Add title and subtitle<br>5. Create | Space is created with correct title and subtitle (check in server) | |  |  |
| Create new space with title | 1. Open sidebar and select `Spaces`<br>2. Click on 3-dot-button on the top right<br>3. Create space<br>4. Add title and let subtitle empty<br>5. Create | Space is created with correct title and without subtitle (check in server) | |  |  |
| Create new space with quota | 1. Open sidebar and select `Spaces`<br>2. Click on 3-dot-button on the top right<br>3. Create space<br>4. Add quota 10GB<br>5. Create | Space is created with correct title quota 10GB(check in server) | | |  |
| No title | 1. Open sidebar and select `Spaces`<br>2. Click on 3-dot-button on the top right<br>3. Create space | `Create`is disabled because no name was typed | |  |
| Rename space | 1. In the space 3-dot-button, select `Edit Space`<br>2. Rename the space<br>3. Save | Space is renamed correctly (check in server) | |  |  |
| Change subtitle |  1. In the space 3-dot-button, select `Edit Space`<br>2. Change subtitle<br>3. Save | Space's subtitle changed (check in server)  | | |  |  |
| Remove subtitle |  1. In the space 3-dot-button, select `Edit Space`<br>2. Remove subtitle<br>3. Save | Space's subtitle removed (check in server)  | |  |  |
| Change quota |  1. In the space 3-dot-button, select `Edit Space`<br>2. Change limit space<br>3. Save | Space's quota changed(check in server)  | |  |  |
| Disable space | 1. In an existing space, click on the space 3-dot-button<br>2. Select `Disable space`<br>3. On the top-right 3-dot-button, select `Show disabled spaces`| 2. Space not listed (check also in server)<br>3. Space listed as disabled ||  |  |
| Enable space | 1. Disable a space<br>2. On the top-right 3-dot-button, select `Show disabled spaces`<br>.3. Click on the space 3-dot-button<br>4. Enable  | Space listed (check also in server)  ||  |  |
| Remove space | 1. Disable a space<br>2. On the top-right 3-dot-button, select `Show disabled spaces`<br>.3. Click on the space 3-dot-button<br>4. Delete and confirm deletion | Space removed and not listed anymore (check also in server)  | |  |  |
| Edit description | 1. In an existing space, click on the space 3-dot-button<br>2. Select `Edit description`<br>3. Add description in markdown | Check description in the root folder of the space. (check also in server) | | | 
| Remove description | 1. In an existing space with description, click on the space 3-dot-button<br>2. Select `Edit description`<br>3.Remove  description| Check empty description in the root folder of the space. (check also in server) | |  |
| Edit image - Pick a Photo | 1. In an existing space, click on the space 3-dot-button<br>2. Select `Edit Image`<br>3. Pick a photo| Check image is updated (check also in server) |  |  |  |
| Edit image - Text | 1. In an existing space, click on the space 3-dot-button<br>2. Select `Edit Image`<br>3. Write text | Check image is updated with the written text (check also in server) | |  |  |
| Edit image - Emoji | 1. In an existing space, click on the space 3-dot-button<br>2. Select `Edit Image`<br>3. Pick emoji from keyboard | Check image is updated with the emoji (check also in server) | |  |  |
|**Spaces list (remote)**| In a remote authenticated oCIS session|
| Create new space | Using web, create new space with title | Space is listed in app, in both sidebar and list of spaces |  |  |  |
| Rename space | Using web, rename an existing space | Space is renamed correctly in app | |  |  |
| Add subtitle | Using web, create space with subtitle| Check that space is created with subtitle  |   |  |  |
| Edit subtitle | 1. Using web, create space with subtitle<br>2. In web, change subtitle, adding a very long one (exceeding screen size) | 1. Check that space is created without subtitle in app (grid mode)<br>2. Subtitle added in app |  |  |  |
| Set icon | Using web, create space with an icon as image |  In app, check that space is created with the icon (emoji) as image |  |  |  |
| Edit image | 1. Using web, create space with image<br>2. In web, edit the space to add another image |  1. In app, check that space is created with image<br>2. Image is displayed in app in the top side of the files view and list of spaces |  |  |  |
| Change quota | 1. Using web, create space<br>2. In web, edit the quota, from 1GB to 5GB| Check in app that the quota was correctly edited |  |  |  |
| Disable space | 1. Using web, create a new space and wait till app detects it<br>2. In web, disable the space| In app, space is not available |  |  |  |
| Enable space | 1. Using web, over a disabled space, open the list of options and select "Enable"<br>2. In app, open space | Content is available (check also in server) and thumbnail visible |   |  |  |
| Remove space | 1. Using web, disable an existing space<br>2. In web, remove the space | In app, space removed and no longer listed |   |  |  |
| Remove space from inside | 1. In app, enter in an existing space<br>2. Using web, disable an existing space | In app, moved to the list of spaces, showing correctly the disabled one |   |  |  |
|**Spaces file operations (local)**| 
| Create folder root | Create a new folder with special characters in spaces' root by using the '+' button on the top | Folder created in spaces (check in server) |  |  |  |
| Create folder non-root | Create a new folder with special characters in spaces' not root by using the '+' button on the top | Folder created in spaces (check in server) |   |  |  |
| Upload file root | Upload a new file in spaces' root by using the '+' button on the top | File created in root (check in server) |   |  |  |
| Upload file non-root | Upload 30 files in spaces' not root by using the '+' button on the top | File created in non-root (check in server) |   |  |  |
| Upload several files root | Upload 30 files in spaces' root by using the '+' button on the top | File created in spaces (check in server) |   |  |  |
| Upload several file non-root | Upload a new file in spaces' not root by using the '+' button on the top | File created in spaces (check in server) |   |  |  |
| Upload from gallery root | Upload a pic or video from gallery in spaces' root by using the '+' button on the top | File created in spaces (check in server) |   |  |  |
| Upload from gallery non-root | Upload a pic or video from gallery in spaces' not root by using the '+' button on the top | File created in spaces (check in server) |  |  |  |
| Upload several from gallery root | Upload 30 pics or videos from gallery in spaces' root by using the '+' button on the top | File created in spaces (check in server) |   |  |  |
| Upload several from gallery non-root | Upload 30 pics or videos from gallery in spaces' not root by using the '+' button on the top | File created in spaces (check in server) |   |  |  |
| Take photo root | In root folder, take a picture from camera by using the option in '+' button on the top  | Picture uploaded (check in server) |    |  |  |
| Take photo non-root | In non-root folder, take a picture from camera by using the option in '+' button on the top  | Picture uploaded (check in server) |    |  |  |
| Take video root | In root folder, take a video from camera by using the option in '+' button on the top  | Video uploaded (check in server) |   |  |  |
| Take video non-root | In non-root folder, take a video from camera by using the option in '+' button on the top  | Video uploaded (check in server) |    |  |  |
| Scan document root | In root folder, scan a new document by using the option in '+' button on the top | Document uploaded (check in server) |  |  |  |
| Scan document non-root | In non-root folder, scan a new document by using the option in '+' button on the top | Document uploaded (check in server) |  |  |  |
| Open in | Select any file of the spaces list to "Open In" | File opened in external app |  |  |  |
| Move file| 1. Select any file of the spaces list to "Move"<br>2. Select target folder in the space | File moved to the target inside the space (check in server) |   |  |  |
| Move folder| 1. Select any folder with subfolders of the spaces list to "Move"<br>2. Select target folder in the space | Folder and its content moved to the target inside the space (check in server) |  |  |  |
| Move to same place| 1. Select any item of the spaces list to "Move"<br>2. Select as target folder in the space the current container folder | Error, not posible |   |  |  |
| Copy file| 1. Select any file of the spaces list to "Copy"<br>2. Select target folder in the space | File copied to the target inside the space (check in server) |  |  |  |
| Copy folder| 1. Select any folder with subfolders of the spaces list to "Copy"<br>2. Select target folder in the space | Folder and its content copied to the target inside the space (check in server) |   |  |  |
| Copy to same place| 1. Select any item of the spaces list to "Copy"<br>2. Select as target folder in the space the current container folder | Error, not posible | |  |  |
| Rename | 1. Select any item of the spaces list to "Rename"<br>2. Enter same name<br>3. Enter different name | 2. Error<br>3. Item correctly renamed (check in server) |  |  |  |
| Duplicate file | Select any file of the spaces list to "Duplicate" | Item correctly duplicated in the same location (check in server) |   |  |  |
| Duplicate folder | Select any folder with subfolders of the spaces list to "Duplicate" | Folder and subfolders correctly duplicated in the same location (check in server) |   |  |  |
| Cut/Paste file | 1.Select any file of the spaces list to "Cut"<br>2. Select as target folder to paste, the current container folder<br>3. Select as target folder to paste, another container folder| 2. Error, no posible<br>3. File correctly pasted (check in server) |   |  |  |
| Cut/Paste folder | 1.Select any folder with subfolders of the spaces list to "Cut"<br>2. Select as target folder to paste, the current container folder<br>3. Select as target folder to paste, another container folder| 2. Error, no posible<br>3. Folder and subfolders correctly pasted (check in server) |   |  |  |
| Delete file | 1. Select any file of the spaces list to "Delete"| File correctly deleted (check in server) |   |  |  |
| Delete folder | 1. Select any folder with subfolders of the spaces list to "Delete"| Folder and subfolders correctly deleted (check in server) |   |  |  |
| Delete by swipe | 1. Select any item of the spaces list to "Delete", using the swipe action in the row| Item correctly deleted (check in server) |    |  |  |
| Av. offline file | 1. Select any file of the spaces list to "Available offline" | File correctly av.offline.<br>Check that file appears in "Quick access" as av. offline<br> Check tha file is open and accesible in offline|    |  |  |
| Av. offline folder | 1. Select any folder of the spaces list to "Available offline" | Folder correctly av.offline.<br>Check that folder appears in "Quick access" as av. offline<br> Check that folder is open and accesible in offline|    |  |  |
|**Spaces file operations (remote)**| 
| Create folder root | In web, create a new folder with special characters in spaces' root  | Folder listed in app |  |  |  |
| Create folder non-root | In web, create a new folder with special characters in spaces' not root  | Folder listed in app |    |  |  |
| Upload file root | In web, upload a new file in spaces' root | File listed in app |  |  |  |
| Upload file non-root | In web, upload 30 files in spaces' not root | Files listed in app |   |  |  |
| Upload several files root | In web, upload 30 files in spaces' root | Files listed in app |   |  |  |
| Upload several file non-root | In web, upload a new file in spaces' not root | Files listed in app |  |  |  |
| Move file| 1. In web, select any file of the spaces list to "Move"<br>2. Select target folder in the space | File listed in the target inside the space in the app |   |  |  |
| Move folder| 1. In web, select any folder with subfolders of the spaces list to "Move"<br>2. Select target folder in the space | Folder and its content listed in the target inside the space in the app |   |  |  |
| Rename | 1. In web, select any item of the spaces list to "Rename"<br>2. Enter different name | Item correctly listed with new name in app|   |  |  |
| Delete file | 1. In web, select any file of the spaces list to "Delete"| File correctly deleted in app |   |  |  |
| Delete folder | 1. In web, select any folder with subfolders of the spaces list to "Delete" | Folder and subfolders correctly deleted in app |   |  |  |
|**iOS Files app**| 
| Only personal  | 1. Log in a account with no spaces<br>2. Open Files App | Straight to the list of files |   |  |
| With spaces | 1. Log in a account with some spaces<br>2. Open Files App | After selecting the account, the list of spaces is there to browse through |   |  |
| Browse spaces | 1. Log in a account with some spaces<br>2. Open Files App | After selecting the account, the list of spaces is there to browse through |  |  |
| Create folder root | Create a new folder with special characters in spaces' root  | Folder created in spaces (check in server) |  |  |  |
| Create folder non-root | Create a new folder with special characters in spaces' not root | Folder created in spaces (check in server) |  |  |  |
| Copy to root| 1. Select a diferent provider and copy some files and folders from there<br>2. Paste into an space in its root folder | Content correctly copied, check in server |  |  |  |
| Copy to non-root| 1. Select a diferent provider and copy some files and folders from there<2. Paste into an space in any non-root folder | Content correctly copied, check in server |  |  |  |
| Move file| 1. Select any file of the spaces list to "Move"<br>2. Select target folder in the space | File moved to the target inside the space (check in server) |  |  |  |
| Move folder| 1. Select any folder with subfolders of the spaces list to "Move"<br>2. Select target folder in the space | Folder and its content moved to the target inside the space (check in server) |  |  |  |
| Move to same place| 1. Select any item of the spaces list to "Move"<br>2. Select as target folder in the space the current container folder | Error,not posible |  |  |  |
| Copy file| 1. Select any file of the spaces list to "Copy"<br>2. Select target folder in the space | File copied to the target inside the space (check in server) |  |  |  |
| Copy folder| 1. Select any folder with subfolders of the spaces list to "Copy"<br>2. Select target folder in the space | Folder and its content copied to the target inside the space (check in server) |  |  |  |
| Copy to same place| 1. Select any item of the spaces list to "Copy"<br>2. Select as target folder in the space the current container folder | Error, not posible |  |  |  |
| Rename | 1. Select any item of the spaces list to "Rename"<br>2. Enter same name<br>3. Enter different name | 2. Error<br>3. Item correctly renamed (check in server) |  |  |  |
| Duplicate file | Select any file of the spaces list to "Duplicate" | Item correctly duplicated in the same location (check in server) |  |  |  |
| Duplicate folder | Select any folder with subfolders of the spaces list to "Duplicate" | Folder and subfolders correctly duplicated in the same location (check in server) |  |  |  |
| Share with user as viewer | Share any item with user as viewer | Check with the recipient user that can view and preview the content and the item is shared in app and web | 
| Share by link | Share any item by link | Check that the link works fine and the item is shared by link in app and web | 
|**Spaces sharing and membering - manager (local)**| 
| Add member as viewer | 1. In the 3-dot-button of a space, select `Members`<br>2. Click on `Invite` to add another user as viewer to the space| Check in web that the user appears in the list of recipients with viewer permission |  | |
| Add member as editor | 1. In the 3-dot-button of a space, select `Members`<br>2. Click on `Invite` to add another user as editor to the space| Check in web that the user appears in the list of recipients with editor permission  | | |
| Add member as manager | 1. In the 3-dot-button of a space, select `Members`<br>2. Click on `Invite` to add another user as manager to the space| Check in web that the user appears in the list of recipients with manager permission |  | |
| Change member's role | 1. In the 3-dot-button of a space, select `Members`<br>2. Change the rol of a viewer user to editor<br>3. Change the rol of the editor to manager<br>3. Change the rol of the manager to viewer| 1. New options to add content are now available, but not sharing options<br>2. Sharing options are now available<br>3. No sharing, no upload options available. Check in web. |  |  |
| Add default expiration | 1. In the 3-dot-button of a space, select `Members`<br>2. Click on `Invite` to add a new member to any space, granting any level of permission<br>3. Click on `Add` | Member is added, including an expiration date one week later from the creation date. Check in web | 
| Add custom expiration | 1. In the 3-dot-button of a space, select `Members`<br>2. Click on `Invite` to add a new member to any space, granting any level of permission<br>3. Click on `Add`<br>4. Click on the default date and select a different one | Member is added, including the chosen expiration date. Check in web | 
| Edit expiration | 1. In the 3-dot-button of a space, select `Members`<br>2. Click on `Invite` to add a new member to any space, granting any level of permission and an expiration date<br>3. Click on the expiration date and select a different one | Member is updated, with the new expiration date. Check in web | 
| Remove expiration | 1. In the 3-dot-button of a space, select `Members`<br>2. Add a new member to any space, granting any level of permission and an expiration date<br>3. Remove the expiration date | 3. Check in web that the membership has no expiration date | 
| Unshare member | 1. In the 3-dot-button of a space, select `Members`<br>2. Remove an existing member from the space | Check in web that the user is not in the list of members anymore | |
| Edit last manager | 1. Space with several members but only one manager, that is the current user<br>2. In the 3-dot-button of the space, select `Members`<br>2. Click over the member with `Manager` permission in the list | Not allowed to edit, at least one manager is mandatory | | 
| Create link with name | 1. In the 3-dot-button of a space, select `Members`<br>2. Create a link to the space with name| Check in web that the name was correctly added to the newly created link | 
| Create link as viewer | 1. In the 3-dot-button of a space, select `Members`<br>2. Create a link as viewer to the space| Check in web that the link was created with viewer permissions | 
| Create link as editor | 1. In the 3-dot-button of a space, select `Members`<br>2. Create a link as editor to the space| Check in web that the link was created with editor permissions  | 
| Create link as secret drop | 1. In the 3-dot-button of a space, select `Members`<br>2. Create a secret drop link to the space| Check in web that the link was created with secret drop permissions | 
| Create link with password | 1. In the 3-dot-button of a space, select `Members`<br>2. Create a link to the space including password | Check with the recipient user that the link is open after typing the correct password. | 
| Create link with default expiration date | 1. In the 3-dot-button of a space, select `Members`<br>2. Click on `Add` for adding a new expiration date<br>3. `Share`| Check in web the expiration date is correct, 8 days later than the creation date  |  | 
| Create link with custom  expiration date | 1. In the 3-dot-button of a space, select `Members`<br>2. Click on `Add` for adding a new expiration date<br>3. Click on the dedfault date and pick a differnet one<br>4. `Share` | Check in web the expiration date is the chose one  |  | 
| Create link with everything | 1. In the 3-dot-button of a space, select `Members`<br>2. Create a link to the space including name, password expiration date and edit permission | Check in web the link is correct, including all name, password, expiration date and edit permission |  | |
| Edit link with name | 1. Create a link on a space adding name <br>2. In the 3-dot-button of a space, select `Members`<br>3. Edit the link name | Check in web that the name was correctly edited  |  | |
| Edit link permission | 1. Create a link on a space adding edit permission <br>2. In the 3-dot-button of a space, select `Members`<br>3. Edit permission setting secret drop | Check in web that the permission was correctly updated to secret drop  |  | |
| Edit expiration date | 1. Create a link on a space adding expiration date<br>2. In the 3-dot-button of a space, select `Members`<br>3. Edit expiration date | Check in web that the expiration date was correctly updated |  | |
| Remove link | 1. Create a link on a space<br>2. In the 3-dot-button of a space, select `Members`<br>3. Remove the link| Check in web that the link was removed |  | |
| Copy private link | 1. In the 3-dot-button of a space, select `Members`<br>2. Clock on `Copy Private Link`<br>3. Paste the content somewhere (notes app, mail...) | The link is the same as the link copied in the web over the same space | 
|**Spaces sharing and membering (remote)**| 
| Add member as viewer | In web, add another user as viewer to a space| In app, check the user is in list of `Members` with viewer permission | 
| Add member as editor | In web, add another user as editor to the space| In app, check the user is in list of `Members` with editor permission  | 
| Add member as manager | In web, add another user as manager to the space| In app, check the user is in list of `Members` with manager permission| 
| ----- Change member's role | 1. In web, change the rol of a viewer user to editor<br>2. Change the rol of the editor to manager<br>3. Change the rol of the manager to viewer| 1. In app, new options to add content are now available, but not sharing options<br>2. In app, sharing options are now available<br>3. In app, no sharing, no upload options available. | 
| Add expiration | 1. In web, add a new member to any space, granting any level of permission<br>2. Add an expiration date | In app, check the user is in list of `Members` with an expiration date of membership |  | |
| Remove expiration | 1. In web, add a new member to any space, granting any level of permission and an expiration date<br>3. Remove the expiration date | 3. In app, check that the membership has no expiration date |  | |
| Unshare member | In web, remove an existing member from the space | In app, check with the recipient user that can not access the space anymore |  | |
| Create link with name | In web, create a link to any space with name| In app, check that the name was correctly added to the newly created link | | |
| Create link as viewer | In web, create a link as viewer to the space| In app, check that  the link was created with viewer permissions |  | |
| Create link as editor | In web, create a link as editor to the space| In app, check that the link was created with editor permissions  |  | |
| Create link as secret drop | In web, create a secret drop link to the space| In app, check that the link was created with secret drop permissions | | |
| Create link with password | In web, create a link to the space including password | In app, check that the link is open after typing the correct password | | |
| Create link with default expiration date | In web, create a link to the space including  expiration date | Check in app the expiration date is correct  | | |
| Create link with everything | In web, create a link to the space including name, password expiration date and edit permission | Check in app the link is correct, including all name, password, expiration date and edit permission | | |
| Edit link with name | In web, edit a link on a space changing the name | Check in app that the name was correctly edited  |  | |
| Edit link permission | In web, edit a link on a space setting secret drop permission  | In app, check that the permission was correctly updated to secret drop  |  | |
| Edit expiration date | In web, edir a link on a space editing expiration date| In app,check that the expiration date was correctly updated |  | |
| Remove link | 1. In web, remove any link on a space | In app, check that the link was removed |  | |
|**User with edit/view permission**|
| No options | 1. In an existing space, click on the space 3-dot-button<br>2. Click on `Members` | 1. Only available `Members`, `Details` (check in server) |  |  |  |
| Manage Members not available | 1. In an existing space, click on the space 3-dot-button<br>2. Click on `Members` | No way to add a new member or modify an existing one. Just listing|  |  |  |
| Details | 1. In an existing space, click on the space 3-dot-button<br>2. Click on `Details` | Check in web that the name, subtitle, qouta and members of the space are correctly displayed|  |  |  |
|**Spaces share as viewer**| 
| Share file/folder | Open file/folder card | No available |   |  |
| Links | Open file/folder card |   No available |  |  |
| Favorite | Open file/folder card | No available |  | |
| Open In | Open file/folder card | Available |   |  |
| Move | Open file/folder card | No available |   |  |
| Rename | Open file/folder card |No available |   |  |
| Duplicate | Open file/folder card |  No available |  |  |
| Copy | Open file/folder card | Available |   |  |
| Available Offline | Open file/folder card | Available |   |  |
| Cut | Open file/folder card | No available |   |    |
| Delete | Open file/folder card | No available |  |  |
| Upload file | Open "+" menu | No available |  |  |
| Create folder | Open "+" menu | No available |   |   |
| Upload from photo library | Open "+" menu | No available |   |   |  |
| Take photo or video | Open "+" menu | No available |  |   |
| Scan document | Open "+" menu | No available |   |  |
| Download and preview | Click on any previewable file (txt, image...)| File correctly previewed |  |  |
|**Spaces share as editor**| 
| Share file/folder | Open file/folder card | |   |  |
| Links | Open file/folder card |  No available |  |  |
| Favorite | Open file/folder card | Available |  |  |
| Open In | Open file/folder card | Available |   |  |
| Move | Open file/folder card | Available |   |  |
| Rename | Open file/folder card |Available |    |  |
| Duplicate | Open file/folder card |  Available|    |  |
| Copy | Open file/folder card | Available |    |  |
| Available Offline | Open file/folder card | Available |   |  |
| Cut | Open file/folder card | Available |    |  |
| Delete | Open file/folder card | Available |    |  |
| Upload file | Open "+" menu | Available |    |  |
| Create folder | Open "+" menu | Available |    |  |
| Upload from photo library | Open "+" menu | Available |   |  |
| Take photo or video | Open "+" menu | Available |    |  |
| Scan document | Open "+" menu | Available |   |  |
| Download and preview | Click on any previewable file (txt, image...)| File correctly previewed |   |  |
|**Spaces share as manager**| 
| Share file/folder | Open file/folder card |Available |   |  |
| Links | Open file/folder card |  Available |    |  |
| Favorite | Open file/folder card | Available | |  |
| Open In | Open file/folder card | Available |  |  |
| Move | Open file/folder card | Available |   |  |
| Rename | Open file/folder card |Available |    |  |
| Duplicate | Open file/folder card |  Available|    |  |
| Copy | Open file/folder card | Available |   |  |
| Available Offline | Open file/folder card | Available |   |  |
| Cut | Open file/folder card | Available | |  |
| Delete | Open file/folder card | Available |   |  |
| Upload file | Open "+" menu | Available |    |  |
| Create folder | Open "+" menu | Available|    |  |
| Upload from photo library | Open "+" menu | Available |  |  |
| Take photo or video | Open "+" menu | Available |  |  |
| Scan document | Open "+" menu | Available |   |  |
| Download and preview | Click on any previewable file (txt, image...)| File correctly previewed |  |  |
|**Miscellaneous**|
| Introduction view |Open app from scratch | Splash view + correct introduction |  |  | Lost
| Dark Themes  | 1. Set Dark theme, open sidebar and browse though folders | Theme correctly applied |  |  |
| Light Themes  | 1. Set Light theme, open sidebar and browse though folders | Theme correctly applied |  | |
| Auto uploads Personal | 1. Enable camera uploads<br>2. Set a Personal space as destination | Correctly set|   |  |
| Auto uploads Space with permissions | 1. Enable camera uploads<br>2. Set a custom space with editor or manager permission as destination | Correctly set |   |  |
| Auto uploads Space without permissions | 1. Enable camera uploads<br>2. Set a custom space with viewer permission as destination | Not posible, account with no write permission |   |  |
| Auto uploads Space without permissions | 1. Enable camera uploads<br>2. Set a custom space with viewer permission as destination | Not posible, account with no write permission |   ||
