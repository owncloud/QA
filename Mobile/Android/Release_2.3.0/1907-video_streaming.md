###  Video streaming 

#### Pr: https://github.com/owncloud/android/pull/1907 

Device: Huawei 6P v7, Galaxy Tab S2 v5

Check with different video formats

---
 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :-----:| :-------- | :---- | :-------------- | :----: | :------ |
|**Preview**||||||
| 1 | Not download options | Tap on a video | Options to download, av. offline, send, sort, grid view are not displayed. Check both orientations | P m7 t5 | 
|**Streaming**||||||
| 2 | Streaming until end with http | Tap on a video and wait until it ends in a http server | Video starts to be played. At the end the video is not downloaded | P t5 m7 |  |
| 3 | Streaming until end with https valid | Tap on a video and wait until it ends in a https valid server | Video starts to be played. At the end the video is not downloaded | P m5 t7 |  |
| 4 | Streaming until end with https self signed or not valid | Tap on a video  | Video is downloaded and not streamed | P m5 t7 | iPad goes to root |
| 5 | Orientation changed | Play a video and during the streaming, change orientation several times | Streaming is not stopped | P m5 t7 | Only full screen  |
| 6 | Full screen | Play a video and during the streaming, change to full screen | Streaming is not stopped |  P m5 t7 | Streaming starts again |
| 7 | Streaming interrupted | 1. Tap on a video and stop it before ending.<br>2. Play again the video | 1. Video is not downloaded<br>2. Video starts again without being downloaded in file list  | P m7 t5 |  |
| 8 | Streaming interrupted II | Tap on a video and during the streaming minimize the app or switch to another one.<br>2. Open the app (passcode enabled) | Streaming keeps on  | P m7 t5 |  |
| 9 | Multiple streaming | Using two or more devices, stream the same file at the same time | Streaming works in all devices | P m7 t5 |  |
| 10 | Delete | Play a video and during the streaming, delete it | Streaming is stopped and video is remove from server. File list is displayed | P t5 m7 |  |
| 11 | Rename | Play a video and during the streaming, rename it | Streaming is not stopped and video is rename also in server (check in web) | NA |  |
| 12 | Details | Play a video and during the streaming, rename it | Streaming is not stopped and video is rename also in server (check in web) | P t5 m7 |  |
| 13 | Share link | Play a video and during the streaming, share it by link | Streaming continues and video is shared. | P m7 t5 | FIXED: Video is freezed |
| 14 | Share users | Play a video and during the streaming, share it with users | Streaming continues and video is shared. | P m7 t5 | FIXED: Video is freezed |
|**Download**||||||
| 15 | Download | 1. Long press over video file and select "Download".<br>2. Tap on the video  | Download is shown, no streaming during download. Check both orientations | P m7 F t5 | Change orientation stream+dload |
| 16 | Av. offline | 1. Long press over video file and select "Available offline".<br>2. Tap on the video  | Download is shown, no streaming during download. Check both orientations | F m7 t5 | FIXED: Option missed. Change orientation stream+dload |
| 17 | Downloaded file | 1. Tap on a downloaded video  | Local copy is played, no streaming | P m7 t5 |  |
| 18 | Av. offline file | 1. Tap on a av. offline video  | Local copy is played, no streaming | F m7 t5 | FIXED: Option missed. Change orientation stream+dload |
|**New version**||||||
| 19 | View | 1. Upload a new version of a downloaded video on server.<br>2. Tap on it | New version will be downloaded | P t5 m7 |  |
|**External actions**||||||
| 20 | Remove | 1. Start to stream a video<br>2. In server side, remove the video| Streaming is stopped | F m7 t5 | Without file locking. Crash if video is removed |
| 21 | Rename | 1. Start to stream a video<br>2. In server side, rename the video| Streaming goes on | F m7 t5 | Without file locking. Crash if video is removed |
| 22 | Move | 1. Start to stream a video<br>2. In server side, move the video| Streaming is stopped | F m7 t5 | Without file locking. Crash if video is removed |
|**Error**||||||
| 23 | Network connection | 1. Start streaming without connection| Streaming does not start | F m7 t5 | Error message improved |
| 24 | Network connection II | 1. Start streaming<br>2. During the streaming, switch connection off<br>3. Switch connection on| 2. Streaming stops<br>3. Streaming goes on | F m7 t5 | Error message is repeated |
| 25 | Server connection | 1. Start streaming<br>2. During the streaming, switch server off<br>3. Switch connection on| Streaming stops<br>3. Streaming goes on | F m7 t5 | Error message is repeated |
|**Session expiration**||||||
| 26 | Expire during streaming | 1. In a SAML server, play a video streaming<br>2. Session expires<br>3. User input credentials | Streaming keeps on | F m7 t5 | Crash when expires |
|**Redirected server**||||||
| 27 | Redirected server | 1. In a redirected server, play a video streaming| Streaming works | P t5 m7|  |