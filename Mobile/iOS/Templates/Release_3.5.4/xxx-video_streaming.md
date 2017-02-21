###  Video streaming 

#### Pr: https://github.com/owncloud/ios/pull/XXX 

---
 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :-----:| :-------- | :---- | :-------------- | :----: | :------ |
|**'Download' option in menu**||||||
| 1 | Video not downloaded | Swipe on a non-downloaded video file and select "More"|  New option "Download" appears. Check both orientations |  |  |
| 2 | Video downloaded | Swipe on a downloaded video file and select "More"|  New option "Download" does not appear. Check both orientations |  |  |
| 3 | Video av. offline | Swipe on a av. offline video file and select "More"|  New option "Download" does not appear. Check both orientations |  |  |
| 4 | Video in av. offline folder | Swipe on a video file in an av. offline and select "More"|  New option "Download" does not appear. Check both orientations |  |  |
| 5 | Other files | Swipe on a non-video file and select "More"|  Option "Download" does not appears. Check both orientations |  |  |
|**Preview**||||||
| 6 | Share & delete | Tap on a video |  Only options to share and delete are displayed. Check both 
| 7 | Stop streaming | Tap on a video |  An option to return back to file view is displayed. Check both orientations |  |  |
|**Streaming**||||||
| 8 | Streaming until end with http | Tap on a video and wait until it ends in a http server | Video starts to be played. At the end the video is not downloaded |  |  |
| 9 | Streaming until end with https valid | Tap on a video and wait until it ends in a https valid server | Video starts to be played. At the end the video is not downloaded |  |  |
| 10 | Streaming until end with https self signed or not valid | Tap on a video  | Video is downloaded and not streamed |  |  |
| 11 | Orientation changed | Play a video and during the streaming, change orientation several times | Streaming is not stopped |  |  |
| 12 | Streaming interrupted | 1. Tap on a video and stop it before ending.<br>2. Play again the video | 1. Video is not downloaded<br>2. Video starts again without being downloaded in file list  |  |  |
| 13 | Streaming interrupted II | Tap on a video and during the streaming minimize the app or switch to another one.<br>2. Open the app | Streaming keeps on  |  |  |
| 14 | Delete | Play a video and during the streaming, delete it | Streaming is stopped and video is remove from server. File list is displayed |  |  |
| 15 | Share link | Play a video and during the streaming, share it by link | Streaming continues and video is shared. |  |  |
| 16 | Share users | Play a video and during the streaming, share it with users | Streaming continues and video is shared. |  |  |
|**Download**||||||
| 17 | Download | 1. Swipe over video file and select "Download".<br>2. Tap on the video  | Download is shown, no streaming during download. Check both orientations |  |  |
| 18 | Av. offline | 1. Swipe over video file and select "Available offline".<br>2. Tap on the video  | Download is shown, no streaming during download. Check both orientations |  |  |
| 19 | Downloaded file | 1. Tap on a downloaded video  | Local copy is played, no streaming |  |  |
| 20 | Av. offline file | 1. Tap on a av. offline video  | Local copy is played, no streaming |  |  |
|**New version**||||||
| 21 | View | 1. Upload a new version of a downloaded video on server.<br>2. Tap on it | An alert will be diplayed with the options "preview local" or "remote streaming" and "cancel" |  |  |
| 22 | Preview local | 1. From previous test case, select "Preview local" | Local copy will start to be played |  |  |
| 23 | Remote streaming | 1. From previous test case, select "Remote streaming" | Local copy is removed from device and remote copy starts to be played in streaming. |  |  |
| 24 | Cancel | 1. From previous test case, select "Cancel" | Nothing happens |  |  |
|**Error**||||||
| 25 | Network connection | 1. Start streaming without connection| Streaming does not start |  |  |
| 26 | Network connection II | 1. Start streaming<br>2. During the streaming, switch connection off<br>3. Switch connection on| 2. Streaming stops<br>3. Streaming goes on |  |  |
| 27 | Server connection | 1. Start streaming<br>2. During the streaming, switch server off<br>3. Switch connection on| Streaming stops<br>3. Streaming goes on |  |  |
|**Session expiration**||||||
| 28 | Expire during streaming | 1. In a SAML server, play a video streaming<br>2. Session expires<br>3. User input credentials | Streaming keeps on |  |  |
|**Redirected server**||||||
| 29 | Redirected server | 1. In a redirected server, play a video streaming| Streaming works |  |  |