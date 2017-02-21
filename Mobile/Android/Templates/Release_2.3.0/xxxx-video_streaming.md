###  Video streaming 

#### Pr: https://github.com/owncloud/android/pull/XXX 

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
| 9 | Delete | Play a video and during the streaming, delete it | Streaming is stopped and video is remove from server. File list is displayed |  |  |
| 10 | Rename | Play a video and during the streaming, rename it | Streaming is not stopped and video is rename also in server (check in web) |  |  |
| 11 | Details | Play a video and during the streaming, rename it | Streaming is not stopped and video is rename also in server (check in web) |  |  |
| 12 | Share link | Play a video and during the streaming, share it by link | Streaming continues and video is shared. |  |  |
| 13 | Share users | Play a video and during the streaming, share it with users | Streaming continues and video is shared. |  |  |
|**Download**||||||
| 14 | Download | 1. Long press over video file and select "Download".<br>2. Tap on the video  | Download is shown, no streaming during download. Check both orientations |  |  |
| 15 | Av. offline | 1. Long press over video file and select "Available offline".<br>2. Tap on the video  | Download is shown, no streaming during download. Check both orientations |  |  |
| 16 | Downloaded file | 1. Tap on a downloaded video  | Local copy is played, no streaming |  |  |
| 17 | Av. offline file | 1. Tap on a av. offline video  | Local copy is played, no streaming |  |  |
|**New version**||||||
| 18 | View | 1. Upload a new version of a downloaded video on server.<br>2. Tap on it | An alert will be diplayed with the options "preview local" or "remote streaming" and "cancel" |  |  |
| 19 | Preview local | 1. From previous test case, select "Preview local" | Local copy will start to be played |  |  |
| 20 | Remote streaming | 1. From previous test case, select "Remote streaming" | Local copy is removed from device and remote copy starts to be played in streaming. |  |  |
| 21 | Cancel | 1. From previous test case, select "Cancel" | Nothing happens |  |  |
|**Error**||||||
| 22 | Network connection | 1. Start streaming without connection| Streaming does not start |  |  |
| 23 | Network connection II | 1. Start streaming<br>2. During the streaming, switch connection off<br>3. Switch connection on| 2. Streaming stops<br>3. Streaming goes on |  |  |
| 24 | Server connection | 1. Start streaming<br>2. During the streaming, switch server off<br>3. Switch connection on| Streaming stops<br>3. Streaming goes on |  |  |
|**Session expiration**||||||
| 25 | Expire during streaming | 1. In a SAML server, play a video streaming<br>2. Session expires<br>3. User input credentials | Streaming keeps on |  |  |
|**Redirected server**||||||
| 26 | Redirected server | 1. In a redirected server, play a video streaming| Streaming works |  |  |