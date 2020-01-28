### Markup

#### PRs: https://github.com/owncloud/ios-app/pull/607

Device/s: <br>
Server: 


---

Prec: app installed and account attached
 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | 
| :-------- | :---- | :------- | :----: | :------------------------- | 
|**View**||||||
| PDF File | Open card for a PDF file| Markup option is there. Check both orientations |  |  |  |
| Image File | Open card for a image file| Markup option is there. Check both orientations |  |  |  |
| Video File | Open card for a video file| Crop/Roptate option is there. Check both orientations |  |  |  |
| Other File | Open card for a non pdf/image/video file| Markup option is NOT there |  |  |  |
| Folder | Open card for a folder | Markup option is NOT there |  |  |  |
|**PDF**||||||
| Overwrite | Markup a PDF file<br>Save in the same file | File correctly saved |  |  |  |
| Save Copy | Markup a PDF file<br>Save a copy | File correctly saved in a different file |  |  |  |
| Discard changes | Markup a PDF file<br>Discard changes | Nothing happens |  |  |  |
|**Image**||||||
| Save changes | Markup an image file<br>Save in the same file | File correctly saved |  |  |  |
| Save Copy | Markup an image file<br>Save a copy | File correctly saved in a different file |  |  |  |
| Discard changes | Markup an image file<br>Discard changes | Nothing happens |  |  |  |
|**Video**||||||
| Crop & Overwrite | Crop a video<br>Save in the same file | Video correctly saved |  |  |  |
| Crop & Save Copy | Crop a video<br>Save a copy | File correctly saved in a different file |  |  |  |
| Crop video & Discard changes | Crop video<br>Discard changes | Nothing happens |  |  |  |
| Rotate & Overwrite | Rotate a video<br>Save in the same file | Video correctly saved |  |  |  |
| Rotate & Save Copy | Rotate a video<br>Save a copy | File correctly saved in a different file |  |  |  |
| Rotate video & Discard changes | Rotate video<br>Discard changes | Nothing happens |  |  |  |

