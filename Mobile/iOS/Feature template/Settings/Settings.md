### Settings

Server(s): <br>
Device(s): <br>
Execution date: <br>
Tester:  <br>
Context: 

---

**oC10**

 
| Test Case | Steps | Expected Result | Result | Related Comment |
| :-------- | :---- | :-------------- | :----: | :-------------- |
| Passcode 4 digit | 1. Enable `Passcode Lock`<br>2. Select `4 digit code`<br>3. Set a code by entering twice<br>4. Don't use Face ID<br>5. Close app and open again| 4-digit passcode asked |  |  |
| Passcode 6 digit | 1. Enable `Passcode Lock`<br>2. Select `6 digit code`<br>3. Set a code by entering twice<br>4. Don't use Face ID<br>5. Close app and open again| 6-digit passcode asked |  |  |
| Passcode Files App| 1. Enable `Passcode Lock` and set a code<br>2. Close app and open Files App. selecting an ownCloud account | Passcode asked (check with 4 and 6 digits) |  |  |
| Passcode removed | 1. Disable `Passcode lock`<br>2. Close app and open again| Passcode not asked anymore |  |  |
| Face ID | 1. Enable `Face ID` (it must be enrolled in device and passcode enabled in advance)<br>2. Close app and open again| Face ID asked |  |  |
| Face ID removed | 1. Disable `Face ID`<br>2. Close app and open again| Face ID not asked.<br> Passcode asked |  |  |
| Face ID failing | 1. Enable `Face ID`<br>2. Close app and open again, making Face ID fail<br>3. Unlock using passcode<br>4. Open app again | Face ID not asked.<br> Passcode asked |  |  |
| Lock | 1. Enable `Passcode lock<`br>2. Set lock application after 1 minute<br>3. Minimize the app and reopen before 1 minute<br>4. Minimize again and reopen after 1 minute| 3. Passcode not asked<br>4. Passcode asked |  |  |
| Certificate different key | 1. Attach one account to the app with non-secure https, accepting the certificate<br>2. In Settings, open "Certificates"<br>3. Revoke the certificate<br>4. Add an account in the same server | 2. Host certificate is there.<br>4. Certificate Approval is asked and differences are displayed (they can be hidden)  |  |  |
| Same key cert | 1. Attach one account to the app with non-secure https, accepting the certificate<br>2. Add another account with different certificate but signed wuith the same key | Certificate Approval is not asked. In Settings > Certificate, it appears as auto approved  |   |  |
| Theme | 1. Select Dark<br>2. Select Light<br>3. Select System Light<br>4. Select System Dark<br>5. Select System | All themes are correcly saved and displayed in file list |  |  |
| Delete unused | 1. Set `Delete unused copies` to 1 minute<br>2. Download two files | After 1 minute, local copies are removed (download icon appears again in the row on the file list) | |  |
| Show hidden | 1. Enable setting `Show hidden files`<br>2. In web, create a file of folder that stars with `.`<br>3. Disable the setting| 2. Item displayed in file list<br>3. Item not displayed in file list|  |  |
| Show folders at the top | 1. Enable setting `Show folders at the top`<br>2. Disable setting `Show folders at the top`| 1. Folders placed at the top in list of files<br>2. Folders mixed with files depending of the sort method in list of files|  |  |
| Prevent gestures disabled | 1. Disable setting `Prevent gestures`<br>2. Try to drag an drop<br>3. Try to do a multiselection with two fingers| Actions are not posible to do |  |  |
| Streaming enabled | 1. Enable setting `Streaming`<br>2. Open a video file| Video is played and not downloaded. Cloud icon remains in the item in list of files |  |  |
| Streaming disabled | 1. Disable setting  `Streaming`<br>2. Open a video file| Video is downloaded and then played. Cloud icon removed from the item in list of files |  |  |
| Media upload HEIC > JPG | 1. Enable setting  `Convert HEIC to JPG`<br>2. Upload an HEIC file| File is saved as JPG |  |  |
| Media upload MP4 | 1. Enable setting `Convert videos to MP4`<br>2. Upload video file in MOV format| Video is saved as MP4 |  |  |
| Media upload Preserve original name enabled | 1. Enable setting `Preserve original media file names`<br>2. Upload a picture| Picture is saved with format `IMG_xxxx` |  |  |
| Media upload Preserve original name disabled | 1. Disable setting `Preserve original media file names`<br>2. Upload a picture| Picture is saved with format `Photo-timestamp_xxxx`|  |  |
| Media upload Prefer unedited (IAP) | 1. Enable setting `Prefer unedited`<br>2. With Photos app, edit a picure with some filters<br>3. Upload a picture| Picture is saved without changes, in original version|  |  |
| Media upload Prefer RAW (IAP) | 1. Enable setting `Prefer RAW`<br>2. With a Photo app like `Halide`, take a RAW picture<br>3. Upload the picture<br>4. Disable `Prefer RAW` and repeat| 3. Uploaded in DNG format<br>4. Uploaded in JPG format |  |  |
| Media upload original videos | 1. Enable setting `Prefer original videos`<br>2. Edit a video, changing orientation or any other change<br>3. Upload the video<br>4. Disable `Prefer original video` and repeat| 3. Uploaded original video<br>4. Uploaded edited video|  |  |
| Documentation | Click on `Documentation`  | Documentation web is opened |  |   |
| Help | Click on `Help`  | Help web is opened |  |  |
| Send feedback | Click on `Send feedback` | feedback mail is opened|  |  |
| Recommend | Click on `Recommend` | Recommend mail is opened|  |  |
| Privacy policy | Click on `Privacy policy` | Privacy policy is opened|  |  |
| Acknowledgement | Click on `Acknowledgement` | Acknowledgement is opened|  |  |
| App version | 1. Click on the App version cell<br>2. Paste in a text editor  | 1. Copied to clipboard<br>2. Information correctly pasted |  |  |