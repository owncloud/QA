#### Image Gallery 

#### PRs: https://github.com/owncloud/ios-app/pull/277

Device/s: iPadAir2 v12, iPhoneX v12<br>
Server: 10.0.10


---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | Automated |
| :-------- | :---- | :------- | :----: | :------------------------- | :-------: |
|**Only images**||||||
| Non-downloaded | Open a folder that contain only images. Any of them is downloaded. Open the first one and swipe left. Check backwards and both orientations | Images are downlaoded at the time. Gallery runs correctly | P t12 m12 | Everyone is downloaded till it finishes even when it passes | |
| Downloaded | Open a folder that contain only images. All of them are downloaded. Open the first one and swipe left. Check backwards | Images are not downlaoded, they are. Gallery runs correctly | P m12 F t12 | Huge images make it slower. Spinner? | |
| Mix Downloaded - non-Downloaded | Open a folder that contain only images. Some of them are downloaded, other aren't. Open the first one and swipe left. Check backwards and both orientations| Images that are not downlaoded, they are. Other ones, only displayed. Gallery runs correctly | P t12 m12 | | |
|**No images**||||||
| No images | Open a folder that does not contain images. Open a file and swipe left (both orientations) | No Gallery| P t12 m12 | | |
|**Images-files**||||||
| Non-downloaded | Open a folder that contain many kind of files. Any of them is downloaded. Open the first image one and swipe left. Check backwards and both orientations | Images are downlaoded at the time. Gallery runs correctly only over images | P m12 t12| | |
| Downloaded | Open a folder that contain many kind of files. All of them are downloaded. Open the first image one and swipe left. Check backwards and both orientations | Images are downlaoded at the time. Gallery runs correctly only over images | P m12 t12| | |
| Mix Downloaded-Non downloaded | Open a folder that contain many kind of files. Some of them are downloaded, other aren`t. Open the first image and swipe left. Check backwards and both orientations | Images that are not downlaoded, they are. Other ones, only displayed. Gallery runs correctly | P m12 t12| | |
|**No connection**||||||
| Before gallery - Non downloaded | Remove connection from device. Open image in a non-downloaded folder and swipe left | Gallery runs but no image are shown| P m12 t12 | | |
| Before gallery - Downloaded | Remove connection from device. Open image in a downloaded folder and swipe left | Gallery runs and images are displayed even without connection | P m12 t12 | | |
| During gallery - Non downloaded |  Open image in a non-downloaded folder and swipe left. during the gallery, remove connection from device. | Gallery runs and images are displayed when the connection is alive. Then, they aren't| P m12 t12 | | |
|**Actions**||||||
| Open In  | From gallery, Open In an image | Action correctly done | P m12 | | |
| Move | From gallery, Move an image | Action correctly done | | Gallery off | |
| Rename | From gallery, Rename an image | Action correctly done | | Gallery off | |
| Duplicate  | From gallery, Duplicate an image | Action correctly done | | Gallery off | |
| Copy  | From gallery, Copy an image | Action correctly done | | Gallery off | |
| Delete  | From gallery, Delete an image | Action correctly done | | Gallery off | |
| Removed item | Start the gallery, and from a different client/web UI, remove/move some images. Run the gallery | Deleted images are not displayed  | P m12 t12| | |
| Renamed item | Start the gallery, and from a different client/web UI, rename some images. Run the gallery | Renamed iteams are displayed  | P m12 t12 | | |
