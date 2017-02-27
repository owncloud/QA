###  Video streaming 

#### Pr: https://github.com/owncloud/android/pull/1907 

Check with different video formats

---
 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :-----:| :-------- | :---- | :-------------- | :----: | :------ |
|**Preview**||||||
| 1 | Not download options | Tap on a video | Options to download, av. offile, send, sort, grid view are not displayed. Check both orientations | | 
|**Streaming**||||||
| 2 | Streaming until end with http | Tap on a video and wait until it ends in a http server | Video starts to be played. At the end the video is not downloaded |  |  |
| 3 | Streaming until end with https valid | Tap on a video and wait until it ends in a https valid server | Video starts to be played. At the end the video is not downloaded |  |  |
| 4 | Streaming until end with https self signed or not valid | Tap on a video  | Video is downloaded and not streamed |  |  |
| 5 | Orientation changed | Play a video and during the streaming, change orientation several times | Streaming is not stopped |  |  |
| 6 | Full screen | Play a video and during the streaming, change to full screen | Streaming is not stopped |  |  |
| 7 | Streaming interrupted | 1. Tap on a video and stop it before ending.<br>2. Play again the video | 1. Video is not downloaded<br>2. Video starts again without being downloaded in file list  |  |  |
| 8 | Streaming interrupted II | Tap on a video and during the streaming minimize the app or switch to another one.<br>2. Open the app (passcode enabled) | Streaming keeps on  |  |  |
| 9 | Multiple streaming | Using two or more devices, stream the same file at the same time | Streaming works in all devices |  |  |
| 10 | Delete | Play a video and during the streaming, delete it | Streaming is stopped and video is remove from server. File list is displayed |  |  |
| 11 | Rename | Play a video and during the streaming, rename it | Streaming is not stopped and video is rename also in server (check in web) |  |  |
| 12 | Details | Play a video and during the streaming, rename it | Streaming is not stopped and video is rename also in server (check in web) |  |  |
| 13 | Share link | Play a video and during the streaming, share it by link | Streaming continues and video is shared. |  |  |
| 14 | Share users | Play a video and during the streaming, share it with users | Streaming continues and video is shared. |  |  |
|**Download**||||||
| 15 | Download | 1. Long press over video file and select "Download".<br>2. Tap on the video  | Download is shown, no streaming during download. Check both orientations |  |  |
| 16 | Av. offline | 1. Long press over video file and select "Available offline".<br>2. Tap on the video  | Download is shown, no streaming during download. Check both orientations |  |  |
| 17 | Downloaded file | 1. Tap on a downloaded video  | Local copy is played, no streaming |  |  |
| 18 | Av. offline file | 1. Tap on a av. offline video  | Local copy is played, no streaming |  |  |
|**New version**||||||
| 19 | View | 1. Upload a new version of a downloaded video on server.<br>2. Tap on it | New version will be downloaded |  |  |
|**External actions**||||||
| 20 | Remove | 1. Start to stream a video<br>2. In server side, remove the video| Streaming is stopped |  |  |
| 21 | Rename | 1. Start to stream a video<br>2. In server side, rename the video| Streaming goes on |  |  |
| 22 | Move | 1. Start to stream a video<br>2. In server side, move the video| Streaming is stopped |  |  |
|**Error**||||||
| 23 | Network connection | 1. Start streaming without connection| Streaming does not start |  |  |
| 24 | Network connection II | 1. Start streaming<br>2. During the streaming, switch connection off<br>3. Switch connection on| 2. Streaming stops<br>3. Streaming goes on |  |  |
| 25 | Server connection | 1. Start streaming<br>2. During the streaming, switch server off<br>3. Switch connection on| Streaming stops<br>3. Streaming goes on |  |  |
|**Session expiration**||||||
| 26 | Expire during streaming | 1. In a SAML server, play a video streaming<br>2. Session expires<br>3. User input credentials | Streaming keeps on |  |  |
|**Redirected server**||||||
| 27 | Redirected server | 1. In a redirected server, play a video streaming| Streaming works |  |  |