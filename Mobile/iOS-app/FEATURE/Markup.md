### Markup

#### PRs: 

Device: <br>
Server: 

Reference: https://github.com/owncloud/ios-app/pull/1151

---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | 
| :-------- | :---- | :------- | :----: | :------------------------- | 
|**View**||||||
| PDF File | Open card for a PDF file| Markup option is there. Check both orientations | |  |  |
| Image File | Open card for a image file| Markup option is there. Check both orientations | |  |  |
| Other File | Open card for a non pdf/image/video file| Markup option is NOT there | |  |  |
| Folder | Open card for a folder | Markup option is NOT there | |  |  |
|**PDF**||||||
| Not downloaded | Select `Markup`on a non downloaded PDF file | File is downloaded, opened and markup mode enabled  | |  |  |
| Downloaded | Select `Markup`on a downloaded PDF file | File is opened and markup mode enabled | |  |  |
| Overwrite | 1. Markup a PDF file<br>2. Save selecting `Overwrite original` | File overwritten with the changes| |  |  |
| Save Copy | Markup a PDF file<br>2. Save selecting `Save a Copy` | File correctly saved in a different file | |  |  |
| Save Copy no changes | 1. Markup a PDF file<br>2. Save selecting `Save a Copy` with no changes in the file | Copy saved in a new file | | |  |
| Discard changes | 1. Markup a PDF file<br>2. Discard changes | Back to the list of files with no modifications | |  |  |
|**Image**||||||
| Not downloaded | Select `Markup` on a non downloaded image file | Image downloaded, opened and markup mode enabled| |  |  |
| Downloaded | Select `Markup` on a downloaded image file | Image is opened and markup mode enabled| |  |  |
| Overwrite | 1. Markup an image file<br>2. Save selecting `Overwrite original` | Image overwritten with the changes | |  |  |
| Save Copy | 1. Markup an image file<br>2. Save selecting `Save a Copy` | Image correctly saved in a different file | |  |  |
| Save Copy no changes | 1. Markup an image file<br>2. Save selecting `Save a Copy` with no changes in the image | Copy saved in a new file | | |  |
| Discard changes | 1. Markup an image file<br>2. Discard changes | Back to the list of files with no modifications | |  |  |
|**Issues**||||||
| Markup no connection | 1. Remove the device connection<br>2. Select Markup for a non downloaded file | File can not be downloaded with a correct error | |  |  |
| Save no connection | 1. Select Markup for a file<br>2. Mark the file up<br>3.Remove the device connection<br>4. Save the file<br>5. Recover connection | 4. File is queued<br>5. File is uploaded | |  |  |

