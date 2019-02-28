#### Image Gallery 

#### PRs: https://github.com/owncloud/ios-app/pull/277

Device/s: 
Server:


---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | Automated |
| :-------- | :---- | :------- | :----: | :------------------------- | :-------: |
|**Only images**||||||
| Non-downloaded | Open a folder that contain only images. Any of them is downloaded. Open the first one and swipe left. Check backwards and both orientations | Images are downlaoded at the time. Gallery runs correctly | | | |
| Downloaded | Open a folder that contain only images. All of them are downloaded. Open the first one and swipe left. Check backwards | Images are not downlaoded, they are. Gallery runs correctly | | | |
| Mix Downloaded - non-Downloaded | Open a folder that contain only images. Some of them are downloaded, other aren't. Open the first one and swipe left. Check backwards and both orientations| Images that are not downlaoded, they are. Other ones, only displayed. Gallery runs correctly | | | |
|**No images**||||||
| No images | Open a folder that does not contain images. Open a file and swipe left (both orientations) | No Gallery| | | |
|**Images-files**||||||
| Non-downloaded | Open a folder that contain many kind of files. Any of them is downloaded. Open the first image one and swipe left. Check backwards and both orientations | Images are downlaoded at the time. Gallery runs correctly only over images | | | |
| Downloaded | Open a folder that contain many kind of files. All of them are downloaded. Open the first image one and swipe left. Check backwards and both orientations | Images are downlaoded at the time. Gallery runs correctly only over images | | | |
| Mix Downloaded-Non downloaded | Open a folder that contain many kind of files. Some of them are downloaded, other aren`t. Open the first image and swipe left. Check backwards and both orientations | Images that are not downlaoded, they are. Other ones, only displayed. Gallery runs correctly | | | |
|**No connection**||||||
| Before gallery - Non downloaded | Remove connection from device. Open image in a non-downloaded folder and swipe left | Gallery runs but no image are shown| | | |
| Before gallery - Downloaded | Remove connection from device. Open image in a downloaded folder and swipe left | Gallery runs and images are displayed even without connection | | | |
| During gallery - Non downloaded |  Open image in a non-downloaded folder and swipe left. during the gallery, remove connection from device. | Gallery runs and images are displayed when the connection is alive. Then, they aren't| | | |
|**Actions**||||||
| Open In  | From gallery, Open In an image | Action correctly done | | | |
| Move | From gallery, Move an image | Action correctly done | | | |
| Rename | From gallery, Rename an image | Action correctly done | | | |
| Duplicate  | From gallery, Duplicate an image | Action correctly done | | | |
| Copy  | From gallery, Copy an image | Action correctly done | | | |
| Delete  | From gallery, Delete an image | Action correctly done | | | |
| Removed item | Start the gallery, and from a different client/web UI, remove/move some images. Run the gallery | Deleted images are not displayed  | | | |
| Renamed item | Start the gallery, and from a different client/web UI, rename some images. Run the gallery | Renamed iteams are displayed  | | | |
