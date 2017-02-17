###  Video streaming 

#### Pr: https://github.com/owncloud/ios/pull/XXX 

---
 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :-----:| :-------- | :---- | :-------------- | :----: | :------ |
|**New option in menu**||||||
| 1 | Videos | Swipe on a video file and select "More"|  New option "Download" appears. Check both orientations |  |  |
| 2 | Other files | Swipe on a non-video file and select "More"|  Option "Download" does not appears. Check both orientations |  |  |
|**Preview**||||||
| 3 | Share & delete | Tap on a video |  Only options to share and delete are displayed. Check both 
| 4 | Stop streaming | Tap on a video |  An option to return back to file view is displayed. Check both orientations |  |  |
|**Streaming**||||||
| 5 | Streaming until end with http | Tap on a video and wait until it ends in a http server | Video starts to be played. At the end the video is not downloaded |  |  |
| 6 | Streaming until end with https valid | Tap on a video and wait until it ends in a https valid server | Video starts to be played. At the end the video is not downloaded |  |  |
| 7 | Streaming until end with https self signed or not valid | Tap on a video  | Video is downloaded and not streamed |  |  |
| 8 | Orientation changed | Play a video and during the streaming, change orientation several times | Streaming is not stopped |  |  |
| 9 | Streaming interrupted | 1. Tap on a video and stop it before ending.<br>2. Play again the video | 1. Video is not downloaded<br>2. Video starts again without being downloaded in file list  |  |  |
| 10 | Streaming interrupted II | Tap on a video and during the streaming minimize the app or switch to another one.<br>2. Open the app | Streaming keeps on  |  |  |
| 11 | Delete | Play a video and during the streaming, delete it | Streaming is stopped and video is remove from server. File list is displayed |  |  |
| 12 | Share link | Play a video and during the streaming, share it by link | Streaming continues and video is shared. |  |  |
| 13 | Share users | Play a video and during the streaming, share it with users | Streaming continues and video is shared. |  |  |
|**Download**||||||
| 14 | Download | 1. Swipe over video file and select "Download".<br>2. Tap on the video  | Download is shown, no streaming during download. Check both orientations |  |  |
| 15 | Av. offline | 1. Swipe over video file and select "Available offline".<br>2. Tap on the video  | Download is shown, no streaming during download. Check both orientations |  |  |
| 16 | Downloaded file | 1. Tap on a downloaded video  | Local copy is played, no streaming |  |  |
| 17 | Av. offline file | 1. Tap on a av. offline video  | Local copy is played, no streaming |  |  |
|**New version**||||||
| 18 | View | 1. Upload a new version of a downloaded video on server.<br>2. Tap on it | An alert will be diplayed with the options "preview local" or "remote streaming" and "cancel" |  |  |
| 19 | Preview local | 1. From previous test case, select "Preview local" | Local copy will start to be played |  |  |
| 20 | Remote streaming | 1. From previous test case, select "Remote streaming" | Local copy is removed from device and remote copy starts to be played in streaming. |  |  |
| 21 | Cancel | 1. From previous test case, select "Cancel" | Nothing happens |  |  |
|**Session expiration**||||||
| 22 | Expire during streaming | 1. In a SAML server, play a video streaming<br>2. Session expires<br>3. User input credentials | Streaming keeps on |  |  |