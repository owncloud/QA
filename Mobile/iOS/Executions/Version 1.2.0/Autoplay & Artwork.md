###  Autoplay & Artwork

#### Pr: https://github.com/owncloud/ios-app/pull/498

Devices: iPhoine 6SPlus v12<br>
Server: 10.3

---

 
| Test Case | Steps | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- | 
|**Autoplay**|||||
| Music | Play the first music file inside a folder that only contains music<br>Move forward till the last 5 seconds | When the song finishes, the next one plays| P m13 | |  |
| Music - last file | Play the last music file inside a folder that only contains music<br>Move forward till the last 5 seconds | When the song finishes, no more music is played| P m13 | |  |
| Music - Artwork | Play a music file that contains artwork | Artwork is shown in the screen during the music playing | P m13 | |  |
| Music - Other | Play the first music file inside a folder that contains music and other stuff (pdfs etc...) | Next song is played, ignoring the other files | P m13 | |  |
| Video | Play the first music file inside a folder that only contains music<br>Move forward till the last 5 seconds | When the song finishes, the next one plays| P m13 | |  |
| Video - last file | Play the last music file inside a folder that only contains music<br>Move forward till the last 5 seconds | When the song finishes, no more music is played| P m13 | |  |
| Video - Other | Play the first music file inside a folder that contains music and other stuff (pdfs etc...) | Next song is played, igniring the other files | P m13 | |  |
| Video - Music | Play the first music file inside a folder that contains music and other stuff (pdfs etc...) | Next song is played, igniring the other files | P m13 | |  |
| Music streaming | Play the first music file inside a folder<br>Move forward till the last 5 seconds | When the song finishes, the next one plays. Neither of them are downloaded| P m13 | |  |
| Video streaming | Play the first video file inside a folder<br>Move forward till the last 5 seconds | When the video finishes, the next one plays. Neither of them are downloaded| P m13 | |  |
| Backgroung playing | Play the first music file inside a folder that contains music, with streaming enabled in Settings<br>Switch to other app or switch the screen off |Next songs are played, regadless the device mode | P m13 | |  |