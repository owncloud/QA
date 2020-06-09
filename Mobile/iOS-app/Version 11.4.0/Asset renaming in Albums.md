### Name format changing of uploaded album files

#### PR: [https://github.com/owncloud/ios-app/pull/687](https://github.com/owncloud/ios-app/pull/687)

Devices: iPhone XR v13.4, iPadAir v13.4<br>
Server: 10.4.1

---

 
| Test Case | Steps | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- | 
|**Settings**|
| Preserve original media | Open Settings | Option to preserve media names is correctly displayed in both orientations | P m13 t13 |  |
| Convert videos | Open Settings | Option to convert videos to MP4 is correctly displayed in both orientations | P m13 t13 |  |
|**Image upload**|
| Preserve disabled | 1. In Settings disable `Preserve original file names`<br>2. Upload pic from Album | Pic is uploaded with format `Photo_<timestamp creation>_<seqnumber>` | P m13 t13 |
| Preserve enabled | 1. In Settings enable `Preserve original file names`<br>2. Upload pic from Album | Pic is uploaded with format `IMG_<seqnumber>` | P m13 t13 |
| Conflict | 1. Upload pic from Album<br>2. Upload again the same pic | Pic is uplaoded with format `IMG_<seqnumber> (1)` | P m13 t13 |
| Creation timestamp | 1. Upload old HEIC pic from Album<br>2. Enable `conver HEIC to JPG`<br>3. Upload again the same pic | Pic is uplaoded with both formats, and the creation date is the same for both (timestamp in the file name) | P m13 |
| Upload external with legacy format| 1. In app, disable `Preserve original file names`<br>2. With an external app, f. ex. Photos, upload a picture to ownCloud using the Files app | Pic is uploaded with format `Photo_<timestamp creation>_<seqnumber>` | F m13 t13 | Bad file name format
| Upload external with new app format| 1. In app, enable `Preserve original file names`<br>2. With an external app, f. ex. Photos, upload a picture to ownCloud using the Files app | Pic is uploaded with format `IMG_<seqnumber>` | P m13 t13 | 
| Edited image | 1. With an external app, f. ex. Photos, edit a Picture<br>2. Upload the edited picture| Picture upload with the edition, not the base one | P m13 t13 |
|**Video upload**|
| Preserve disabled | 1. In Settings disable `Preserve original file names`<br>2. Upload video from Album | Video is uplaoded with format `Video_<timestamp creation>_<seqnumber>` | P m13 t13 |
| Preserve enabled | 1. In Settings enable `Preserve original file names`<br>2. Upload video from Album | Video is uplaoded with format `IMG_<seqnumber>` | P m13 t13 | 
| Conflict | 1. Upload video from Album<br>2. Upload again the same video | Video is uplaoded with format `IMG_<seqnumber> (1)` | P m13 t13 |
| Upload external with legacy format| 1. In app, disable `Preserve original file names`<br>2. With an external app, f. ex. Photos, upload a video to ownCloud using the Files app | Video is uploaded with format `Video_<timestamp creation>_<seqnumber>` | F m13 t13 | Bad file name format
| Upload external with new app format| 1. In app, enable `Preserve original file names`<br>2. With an external app, f. ex. Photos, upload a video to ownCloud using the Files app | Video is uploaded with format `IMG_<seqnumber>` | P m13 t13 | 
| Creation timestamp | 1. Upload old MOV video from Album<br>2. Enable `convert to MP4`<br>3. Upload again the same video | Video is uplaoded with both formats, and the creation date is the same for both (timestamp in the file name) | P m13 t13 |
|**Video conversion**|
| Manual upload with conversion | 1. In Settings enable `Convert videos to MP4`<br>2. Upload video from Album | Video uploaded in MP4 | F m13 t13 | extension mp4.mp4
| Instant upload with conversion | 1. In Settings enable `Convert videos to MP4` and `Auto Upload Videos` selecting a correct folder<br>2. Take a video with the camera | Video uploaded in MP4 format | F m13 t13 | extension mp4.mp4
| Manual upload without conversion| 1. In Settings disable `Convert videos to MP4`<br>2. Upload video from Album | Video uploaded in MOV/HEIV | P m13 t13
| Instant upload without conversion | 1. In Settings disable `Convert videos to MP4` and `Auto Upload Videos` selecting a correct folder<br>2. Take a video with the camera | Video uploaded in MOV/HEIV format | P m13 t13