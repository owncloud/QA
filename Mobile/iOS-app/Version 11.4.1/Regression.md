#### Regression 11.4.1

#### PR: https://github.com/owncloud/ios-app/pull/778<br>


Device/s: iPhoneXR v13.7, iPadAir v13<br>
Server: 10.5.0

How to read Results:

P -> Passed<br>
F -> Failed<br>
m -> mobile (iPhone)<br>
t -> tablet (iPad)<br>
13 -> iOS version<br>
NA -> non applicable

P 13 -> Passed in an iPhone with iOS13<br>
F t13 -> Failed in an iPad with iOS13<br>
P m13 t12 -> Passed with an iPhone with iOS13 and an iPad with iOS12 <br>
P m13 F t12 -> Passed with an iPhone with iOS13 and failed with an iPad with iOS12 <br>

---

 
| Test Case | Steps | Expected Result | Result | Related Comment
| :-------- | :---- | :-------------- | :----: | :------------- |
|**Auth**||||||
| Basic auth http | 1. Type an correct URL to the app with http and basic auth | 2. Host certificate is there. Credentials are asked  | P m13 t13 |  |
| Basic auth https | 1. Type an correct URL to the app with https and basic auth | 2. Host certificate is there, asked from approval. Credentials are asked  | P m13 t13  |  |
| OAuth2 http | 1. Type an correct URL to the app with OAuth2 and http | 2. Host certificate is there. Switch to web View  |  P m13 t13 |  |
| OAuth2 https | 1. Type an correct URL to the app with OAuth2 and https | 2. Host certificate is there, asked from approval. Switch to web View  | P m13 t13  |  |
| Basic auth right credentials | 1. Type an correct URL to the app with basic auth<br>Type correct credentials | File list accesible |  P m13 t13 |  |
| OAuth2 right credentials | 1. Type an correct URL to the app with O2uth3<br>Type correct credentials in web view and authorize | File list accesible | P m13 t13  |  |
| Basic auth wrong credentials | 1. Type an correct URL to the app with basic auth<br>Type wrong credentials | Error | P m13 t13  |  |
| OIDC | 1. Type an correct URL to the app with OIDC auth<br>Type correct credentials | File list accesible |  P m13 t13 |   |
|**Item Actions**||||||
| Create folder | In (+) menu of the list of files, select create folder | Correctly created |   |  |
| Open In | Open a file in a 3rd party app | Correctly downloaded and sent |  P m13  |  |
| Copy file | Copy a file to another location | Correctly copied |  P m13 | |
| Copy folder| Copy a folder to another location | Correctly copied |  P m13 |  |
| Move file | Move a file to another location | Correctly moved |  P m13 |  |
| Move folder| Move a folder to another location | Correctly moved |  P m13 |  |
| Duplicate file | Duplicate a file to another location | Correctly duplicated |  P m13 |  |
| Duplicate folder| Duplicate a folder to another location | Correctly duplicated |  P m13 |  |
| Rename file | Rename a file | Correctly renamed |  P m13 |  |
| Rename folder| Rename a folder  | Correctly renamed |   P m13|  |
| Delete file | Delete a file | Correctly deleted |  P m13 |  |
| Delete folder| Delete a folder  | Correctly deleted |  P m13 |  |
| Favorite file | Open the card of a file and click the favorite star | File is favorited (check in server) |  P m13 |  |
| Unfavorite file | Open the card of a favorited file and click the favorite star | File is unfavorited (check in server) |  P m13 |  |
| Sort Date | Sort the file list by date  | Newest on the top |  P m13 |  |
| Sort A-Z | Sort the file list by A-Z  | A on the top |  P m13 |  |
| Sort Z-A | Sort the file list by Z-A  | Z on the top |  P m13 |  |
| Sort Type | Sort the file list by type  | Grouped by type |  P m13 |  |
| Sort Size | Sort the file list by size  | Biggest on the top |  P m13 |  |
| Sort Date | Sort the file list by date  | Newest on the top |   P m13|  |
| Sort Shared | Sort the file list by shared  | Shared on the top |   P m13|  |
|**Upload & Download**||||||
| Upload photo in root | Select "Upload from photo library"<br>Select one pic| File is uploaded in root folder |  P m13 t13 |  |
| Upload photo in non-root | Select "Upload from photo library" in a non-root folder<br>Select one pic| File is uploaded in non-root folder|  P m13 t13 |  |
| Upload video in root | Select "Upload from photo library"<br>Select one video| File is uploaded in root folder |  P m13 t13 | |
| Upload video in non-root | Select "Upload from photo library" in a non-root folder<br>Select one video| File is uploaded in non-root folder|  P m13 t13 | |
| Upload a bunch of files | Select "Upload from  Files in a non-root folder<br>Select a huge amount of files| All files are uplaoded |   P m13 t13| |
| Download file in non-root | Tap on a single file | File is downloaded in non-root folder. Download icon disappears|  P m13 t13 | |
| Download big file in root | Tap on a single file which size is > 1 GB | File is downloaded in root folder. Download icon disappears| P m13 t13 | |
| Download several files | Tap on several files | all are enqueued and filly downloaded | P m13 t13 | |
| Download a bunch of files | Tap on a huge number of files| all are enqueued and fully downloaded | P m13 t13 | |
|**Auto uploads**||||||
| Auto uploads Photos | In Settings, Media Upload, enable Auto uploads for photos with a correct target folder<br>Take some photos and videos| Pics are uploaded after opening the app. Videos are not uploaded | P m13 |   |
| Auto uploads videos | In Settings, Media Upload, enable Auto uploads for videos with a correct target folder<br>Take some photos and videos| Videos are uploaded after opening the app. Photos are not uploaded | P m13 |   |
|**Files preview**||||||
| PDF | Download an open a PDF file | Correctly displayed | P m13 t13 |  |
| PDF search | Download an open a PDF file and search by a pattern | Correct search |  P m13 t13  |  |
| PDF Go To Page | Download an open a PDF file and go to a page | Correct jump |  P m13 t13  |  |
| PDF List of Contents | Download an open a PDF file and open the list of contents. Switch thumbils/list| Correct displayed |  P m13  t13 |  |
| Doc | Download an open a Doc file | Correctly displayed |  P m13 t13|  |
| Excel | Download an open a excel file | Correctly displayed |  P m13 t13|  |
| Ppt | Download an open a ppt file | Correctly displayed |  P m13 t13|  |
| Txt | Download an open a txt file | Correctly displayed |  P m13 t13|  |
| Image | Download an open a png, jpg files | Correctly displayed | P m13  t13|  |
| GIF | Download an open a GIF file | Correctly displayed | P m13 t13 |  |
| Video | Download an open a video file. Go back and the video stops | Correctly played |  P m13 t13 |  |
| Audio | Download an open a video file. Go back and the music stops | Correctly played |  P m13 t13 |  |
| Non openable | Download an open a non openable file | Placeholder displayed with date and size| P m13 t13|   |
| Damaged | Download an open a damaged file | Placeholder displayed |  P m13 t13|  |
|**Files App**| **2 auth methods** |||||
| Location one account| Attach one account to the app<br>Open available locations in files app | Account is there | P m13 |  |
| Location several account| Attach serveral accounts to the app<br>Open available locations in files app | All Accounts are there, one location per account attached | P m13 |  |
| Browse Basic | Open an ownCloud Files app location | Content is correctly displayed | P m13|  |
| Browse OAuth2 | Open an ownCloud Files app location | Content is correctly displayed | P m13|  |
| Download Basic| Open an ownCloud Basic auth Files app location<br>Download a file | File is correctly displayed |P m13  |  |
| Download OAuth2| Open an ownCloud OAuth2Files app location<br>Download a file | File is correctly displayed |  P m13|  |
| Create a folder | Open an ownCloud Files app location<br>Create a new folder with special characters | Folder is created in oC app | P m13 | |
| Rename downloaded item (file and folder)| Open an ownCloud Files app location<br>Rename an downloaded item | Item is remed correctly in oC app | P m13 |  |
| Rename non-downloaded item (file and folder) | Open an ownCloud Files app location<br>Rename an non-downloaded item | Item is renamed correctly in oC app |  P m13| |
| Move downloaded item (file and folder)| Open an ownCloud Files app location<br>Move an downloaded item | Item is moved correctly in oC app |  P m13|  |
| Move non-downloaded item (file and folder) | Open an ownCloud Files app location<br>Move an non-downloaded item | Item is moved correctly in oC app | P m13|  |
| Move a folder with subfolders| Open an ownCloud Files app location<br>Move a folder that contains subfolders to another folder with special characters | Item is moved correctly in oC app | P m13 |  |
| Copy Paste downloaded item | Open an ownCloud Files app location<br>Copy and Paste an downloaded item | Item is pasted correctly in oC app | P m13 |  |
| Copy Paste non-downloaded item | Open an ownCloud Files app location<br>Copy and Paste an non-downloaded item | Item is pasted correctly in oC app |  P m13|  |
| Duplicate item downloaded| Open an ownCloud Files app location<br>Duplicate an downloaded item | Item is duplicated correctly in oC app |  P m13 |  |
| Duplicate item non-downloaded | Open an ownCloud Files app location<br>Duplicate an non-downloaded item | Item is duplicated correctly in oC app |   P m13|  |
| Share item downloaded | Open an ownCloud Files app location<br>Share an item by email | Item is sent correctly  | P m13 |  |
| Share item non-downloaded | Open an ownCloud Files app location<br>Share an item by email | Item is downloaded and  sent correctly  | P m13  |   |
| Item info | Open an ownCloud Files app location<br>Open info option | Item info is correct  | P m13 | |
| Delete one folder | Open an ownCloud Files app location<br>Delete a folder | Folder is deleted in oC app | P m13 |  |
| Delete one file | Open an ownCloud Files app location<br>Delete a file | File is deleted in oC app | P m13 |  |
| Upload files app| Open a file with Files app, an MSOffice one f.ex.<br>Modify it<br>Save changes | File is correctly uploaded to ownCloud | P m13 |  |
| Upload external| Open an external app to edit files<br>Create a file and upload to oC via Files App | File is correctly uploaded | P m13 |  |
| Upload non-root| Open an exterl app to edit files<br>Create a file and upload to oC via Files App to a non-root folder| File is correctly uploaded | P m13 |  |
| Modify file| Open an ownCloud Files app location<br>Modify it | File is correctly uploaded to oC | P m13  |   |
| Copy from other location | Open another location in Files app and copy content<br>Paste it into ownCloud location | Content upload to oC | P m13 |  |
| Copy to other location |Open an ownCloud Files app location<br>Copy content and Paste it into another location | Content correctly pasted | P m13 |  |
| Move between oC accounts root | Move a file from an oC account to anocther one in root folder | Content correctly moved |  P m13|  |
| Move between oC accounts non-root | Move a file from an oC account to anocther one in non-root folder | Content correctly moved |  P m13|  |
| Copy between oC accounts root | Copy a file from an oC account to anocther one in root folder | Content correctly copied |  P m13|  |
| Copy between oC accounts non-root | Copy a file from an oC account to anocther one in non-root folder | Content correctly copied | P m13 |  |
|**Remote actions (Files App)**||||||
| Rename remote| Rename a file or folder in web UI | File is automatically renamed in Files app | P m13 |  |
| Move remote| Move a file or folder in web UI | File is automatically moved in Files app |P m13 |  | |
| Delete remote| Delete a file or folder in web UI | Delete is automatically moved in Files app | P m13 |  |
| Upload remote| Upload new content in web UI | New content refreshed in Files app | P m13 |  |
|**Error handling (Files App)**||||||
| Colliding name | Move, copy or rename a folder, so the target collides with an existing item | Correct error | P m13 | |
| Target folder deleted | Operations to perform in Files app after deleting target folder: move, copy | Correct error | P m13 | |
|**Private Share**||||||
| Share with a user | Open Share<br>Type a correct user name<br>Select user | Sharees list updated with the user | P m13  |  |
| Share with a group | Open Share<br>Type a correct group name<br>Select group | Group list updated with the user. Check that every user in the group can access the file | P m13 |  |
| Permissions | 1. Open Share<br>2. Type a correct user name<br>3. Select user<br>4. Revoke "Can Edit and Change" permission | Share is created with the correct permissons (check in web UI) | P m13 |  |
| Edit | 1. Using a created share, modify permissions (grant new permissions and revoke existing permissions)| Share is updated with the correct permissons (check in web UI) |  P m13|  |
| Delete | Delete an existing share by swiping left in the list of shares| Share is removed (check in web UI) | P m13 |  |
|**Public Link**||||||
| Create with name | Select to create a public link with an specific name | Correct creation with name (check in web UI)|  P m13 |  | | 
| Create with Download/View/Upload | Select to create a public link with Download/View/Upload permission | Correct creation with permissions (check in web UI)| P m13 | | | 
| Create with Upload Only | Select to create a public link with "Upload Only" permission | Correct creation with permissions (check in web UI)| P m13| | | 
| Create with Password | Select to create a public link with password | Correct creation with password (check in web UI). Open the link in browser and check password is asked| P m13| | | 
| Create with Expiration | Select to create a public link with expiration date | Correct creation with expiration date (check in web UI) | P m13| | | 
| Edit | 1. In the list of shares, open an existing public share<br>2. Change the name, the permission, password and expiration date | Correct edition (check in web UI). Get the link and open in browser to check password is correct. | P m13| | | 
| Delete | 1. In the list of shares, delete an existing public link | Public link is deleted (check in web ui)  | P m13| | | 
|**Private link**||||||
| Get link View | Open Share view | Option correctly displayed | P m13  |    | | 
| Copy link | Get copy link and paste in the browser | File correctly linked | P m13 | | | 
|**Share Sheet**||||||
| Root | Save an external file in the root | File correctly saved | P m13  t13 |  |  |
| Non root | Save an external file in non-root folder | File correctly saved | P m13  t13 |  |  |
| Share text | In Safari, open a web page and select text<br>Share it with oC | Text saved in a text file |  P m13  t13|   |  |
| Share link | In Safari, open a web page and select a link<br>Share it with oC | Link saved correctly|  P m13  t13| |  |
| Share image | In Safari, open a web page and select an image onto a web<br>Share it with oC | Image saved correctly| P m13 t13 | |  |
| Several accounts | Add several accounts<br>Save an external file in the root folder of one of them, that is not the current one | File correctly saved in the selected account |  P m13 t13|  |  |
|**IAP features**| Use an enterprise server |||||
| Document Scanner PDF | Open (+) menu in root folder<br>Select Scan Document<br>Scan a document<br>Set a file name and a correct location<br>Select PDF as format | PDF file correctly uploaded | P m13 | |
| Document Scanner JPG | Open (+) menu in root folder<br>Select Scan Document<br>Scan a document<br>Set a file name and a correct location<br>Select JPG as format | JPG file correctly uploaded | P m13 | |
| Markup PDF Overwrite | Open card of PDF file<br>Select Markup<br>Add some strokes, sign and some shapes<br>Overwrite the file with new changes | File correctly saved with new changes | P m13 | |
| Markup JPG New file | Open card of image file<br>Select Markup<br>Add some strokes, sign and some shapes<br>Save in a new file | New file correctly saved with new changes | P m13 | |
| Shortcuts | Open Shortcuts app (iOS>13) and create a shortcut to create new folder in an existing oc account<br>Execute the shortcut | Folder is created | P m13 | |
| Media upload Prefer unedited (IAP) | 1. Enable setting "Prefer unedited"<br>2. With photos app, edit a picure with some filters...<br>3. Upload a picture| Picture is saved with out changes, in original version| P m13 |  |
| Media upload Prefer RAW (IAP) | 1. Enable setting "Prefer RAW"<br>2. With a photo app like Halide, take a RAW picture<br>3. Upload the picture<br>4. Disable "Prefer RAW" and repeat| 3. Upload in DNG format<br>4. Upload in JPG| P m13 |  |
|**Miscellaneous**||||||
| Thumbnails | Open a folder which contains images | thumbnails are correctly displayed for downloaded and non downloaded images, in portrait and landscape | P m13  | |
| Searching | Input a pattern to filter in the current folder | Results correct filtered | P m13  | 
| Quota correct | Open the root folder | Quota is correctly displayed | P m13 | |
| Contextual menu | Long press over an item of the list | Contextual menu displayed| P m13 | FIXED: Bottom bar with icons|
| Take photo and video | In file list,in the (+) menu, select "Take photo or video"<br>Take a photo and then, a video | Both are uploaded to the current folder| P m13 | |
| Quick access | Open quick access section and check images, pdfs and documents |  Check that the info showed matches with the account| P m13 | |
|**Upgrade**||||||
| 11.4 | Install 11.4<br>Attach an OAuth2 and a basic auth accounts<br>Download some content and enable all settings as posible<br>Upgrade to current| Everything correct | P m13 t13 | |
| IAP | Install 11.4<br>Attach a non-enterprise account<br>Purchase all Pro Features<br>Upgrade to current| Pro Photo Upload feature is purchased and available | P m13 t13| |

