### Markup

#### PRs: https://github.com/owncloud/ios-app/pull/607

Device/s: iPhoneX v13, iPadPro v13 <br>
Server: 10.3.2


---

Prec: app installed and account attached
 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | 
| :-------- | :---- | :------- | :----: | :------------------------- | 
|**View**||||||
| PDF File | Open card for a PDF file| Markup option is there. Check both orientations | P m13 t13 |  |  |
| Image File | Open card for a image file| Markup option is there. Check both orientations | P m13 t13|  |  |
| Video File | Open card for a video file| Crop/Roptate option is there. Check both orientations | DELAYED |  |  |
| Other File | Open card for a non pdf/image/video file| Markup option is NOT there | P m13 t13|  |  |
| Folder | Open card for a folder | Markup option is NOT there | P m13 t13 |  |  |
|**PDF**||||||
| Not downloaded | Markup a non downloaded PDF file | File is opened | P m13 t13 |  |  |
| Downloaded | Markup a downloaded PDF file | File is opened | P m13 t13 |  |  |
| Overwrite | Markup a PDF file<br>Save in the same file | File correctly saved | P m13 t13 |  |  |
| Save Copy | Markup a PDF file<br>Save a copy | File correctly saved in a different file | P m13 t13 |  |  |
| Save Copy no changes | Select Markup a PDF file<br>Save a copy without doing changes | Copy saved in a new file | P m13 t13 | FIXED: Nothing happens -> saved in new file |  |
| Discard changes | Markup a PDF file<br>Discard changes | Nothing happens | P m13 t13 |  |  |
| Share with | Markup a PDF file<br>Share it by mail | Mail received contains the marked pdf | F m13 P t13 | Not accesible in iPhone -> APPLE problem...  |
|**Image**||||||
| Not downloaded | Markup a non downloaded image file | Image is opened | P m13 t13 |  |  |
| Downloaded | Markup a downloaded image file | Image is opened | P m13 t13 |  |  |
| Save changes | Markup an image file<br>Save in the same file | File correctly saved | P m13 t13 |  |  |
| Save Copy | Markup an image file<br>Save a copy | File correctly saved in a different file | P m13 t13 |  |  |
| Save Copy no changes | Select Markup a image file<br>Save a copy without doing changes | Copy saved in a new file | P m13  t13|  |  |
| Discard changes | Markup an image file<br>Discard changes | Nothing happens | P m13 t13 |  |  |
| Share with | Markup a image file<br>Share it by mail | Mail received contains the marked image | F m13 P t13 | Not accesible in iPhone -> APPLE problem...  |
|**Video**| |||||
| Crop & Overwrite | Crop a video<br>Save in the same file | Video correctly saved |  DELAYED |  |  |
| Crop & Save Copy | Crop a video<br>Save a copy | File correctly saved in a different file | DELAYED |  |  |
| Crop video & Discard changes | Crop video<br>Discard changes | Nothing happens | DELAYED |  |  |
| Rotate & Overwrite | Rotate a video<br>Save in the same file | Video correctly saved | DELAYED |  |  |
| Rotate & Save Copy | Rotate a video<br>Save a copy | File correctly saved in a different file |  DELAYED |  |  |
| Rotate video & Discard changes | Rotate video<br>Discard changes | Nothing happens | DELAYED |  |  |
|**Issues**||||||
| Markup no connection | 1. Remove the device connection<br>2. Select markup for a non downloaded file | File can not be downloaded with a correct error | P m13 t13 |  |  |
| Save no connection | 1. Select markup for a file<br>2. Mark the file<br>3.Remove the device connection<br>4. Save the file<br>5. Recover connection | 4. File is queued<br>5. File is uploaded | P m13 t13 |  |  |
|**IAP**||||||
| Feature list | Open Settings, Pro Features | Markup is there | P m13 t13 |  |  |
| Markup scratch | 1. Install the app from scratch<br>2. Open card for a PDF file<br>3.Open card for a image file  | Markup option is marked as pro<br>Purchase card is opened when you select it | P m13 t13 |  |  |
| Markup enterprise | 1. Install the app from scratch<br>2. Add an enterprise account<br>3. Open card for a PDF file | Markup option is not marked as pro and can be used | P m13 t13 |  |  |
| Purchase | 1. Install the app from scratch<br>2. Purchase the markup feature | Markup option is available | P m13 t13 |  |  |
| Subscription | 1. Install the app from scratch<br>2. Subscribe the pro features | Markup option is available<br>When the subscription expires, the markup feature is no longer available | P m13 |  |  |
