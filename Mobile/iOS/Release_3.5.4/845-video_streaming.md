###  Video streaming 

#### Pr: https://github.com/owncloud/ios/pull/845

Devices: iPhone 6S Plus v10, iPadAir v9 v10

Server: 9.1

---
 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :-----:| :-------- | :---- | :-------------- | :----: | :------ |
|**'Download' option in menu**||||||
| 1 | Video not downloaded | Swipe on a non-downloaded video file and select "More"|  New option "Download" appears. Check both orientations | P m10 t9 |  |
| 2 | Video downloaded | Swipe on a downloaded video file and select "More"|  New option "Download" does not appear. Check both orientations | P m10 t9 |  |
| 3 | Video av. offline | Swipe on a av. offline video file and select "More"|  New option "Download" does not appear. Check both orientations | P m10 t9 |  |
| 4 | Video in av. offline folder | Swipe on a video file in an av. offline and select "More"|  New option "Download" does not appear. Check both orientations | P m10 t9 |  |
| 5 | Other files | Swipe on a non-video file and select "More"|  Option "Download" does not appears. Check both orientations | - | Set in all files |
|**Preview**||||||
| 6 | Share & delete | Tap on a video |  Only options to share and delete are displayed. Check both orientations | P m10 t9  | |
| 7 | Stop streaming | Tap on a video |  An option to return back to file view is displayed. Check both orientations | P m10 | no sense in iPad |
|**Streaming**||||||
| 8 | Streaming until end with http | Tap on a video and wait until it ends in a http server | Video starts to be played. At the end the video is not downloaded | P m10 t9 |  |
| 9 | Streaming until end with https valid | Tap on a video and wait until it ends in a https valid server | Video starts to be played. At the end the video is not downloaded |  |  |
| 10 | Streaming until end with https self signed or not valid | Tap on a video  | Video is downloaded and not streamed | P m10 t9 |  |
| 11 | Orientation changed | Play a video and during the streaming, change orientation several times | Streaming is not stopped | P m10 t9 |  |
| 12 | Streaming interrupted | 1. Tap on a video and stop it before ending.<br>2. Play again the video | 1. Video is not downloaded<br>2. Video starts again without being downloaded in file list  | P m10 t10|  |
| 13 | Streaming interrupted II | Tap on a video and during the streaming minimize the app or switch to another one.<br>2. Open the app | Streaming keeps on  | P m10 t10| User resumes manually |
| 14 | Delete | Play a video and during the streaming, delete it | Streaming is stopped and video is remove from server. File list is displayed | P m10 t10 |  |
| 15 | Share link | Play a video and during the streaming, share it by link | Streaming continues and video is shared. | P m10 t10|  |
| 16 | Share users | Play a video and during the streaming, share it with users | Streaming continues and video is shared. | P m10 t10|  |
|**Download**||||||
| 17 | Download | 1. Swipe over video file and select "Download".<br>2. Tap on the video  | Download is shown, no streaming during download. Check both orientations | P m10 t10|  |
| 17b | Download folder| 1. Swipe over folder with videos and select "Download".<br>2. Browse and tap on a video  | Download is shown, no streaming during download. Check both orientations | P m10 t10| SOLVED: Streaming instead of downloading |
| 18 | Av. offline | 1. Swipe over video file and select "Available offline".<br>2. Tap on the video  | Download is shown, no streaming during download. Check both orientations | P m10 t10|  |
| 19 | Downloaded file | 1. Tap on a downloaded video  | Local copy is played, no streaming | P m10 t10|  |
| 20 | Av. offline file | 1. Tap on a av. offline video  | Local copy is played, no streaming | P m10 t10|  |
|**New version**||||||
| 21 | View | 1. Upload a new version of a downloaded video on server.<br>2. Tap on it | New version is downloaded | P m10 t10|  |
|**External actions**||||||
| 22 | Remove | 1. Start to stream a video<br>2. In server side, remove the video| Streaming is stopped | P m10 t 10 | Without file locking |
| 23 | Rename | 1. Start to stream a video<br>2. In server side, rename the video| Streaming is stopped | P m10 t10|  Without file locking |
| 24 | Move | 1. Start to stream a video<br>2. In server side, move the video| Streaming is stopped | P m10 t10|  Without file locking |
|**Error**||||||
| 25 | Network connection | 1. Start streaming without connection| Streaming does not start | P m10 t10|  |
| 26 | Network connection II | 1. Start streaming<br>2. During the streaming, switch connection off<br>3. Switch connection on| 2. Streaming stops<br>3. Streaming goes on | P m10 t10|  |
| 27 | Server connection | 1. Start streaming<br>2. During the streaming, switch server off<br>3. Switch connection on| Streaming stops<br>3. Streaming goes on | P m10 t10|  |
|**Session expiration**||||||
| 28 | Expire during streaming | 1. In a SAML server, play a video streaming<br>2. Session expires<br>3. User input credentials | Streaming keeps on | P m10 t10| Streaming is stopped |
|**Redirected server**||||||
| 29 | Redirected server | 1. In a redirected server, play a video streaming| Streaming works | P m10 t10 |  |