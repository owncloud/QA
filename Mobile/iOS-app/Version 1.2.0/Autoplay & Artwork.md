###  Autoplay & Artwork

#### Pr: https://github.com/owncloud/ios-app/pull/498

Devices: <br>
Server: 

---

 
| Test Case | Steps | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- | 
|**Autoplay**|||||
| Music | Play the first music file inside a folder that only contains music<br>Move forward till the last 5 seconds | When the song finishes, the next one plays|  | |  |
| Music - last file | Play the last music file inside a folder that only contains music<br>Move forward till the last 5 seconds | When the song finishes, no more music is played|  | |  |
| Music - Artwork | Play a music file that contains artwork | Artwork is shown in the screen during the music playing |  | |  |
| Music - Other | Play the first music file inside a folder that contains music and other stuff (pdfs etc...) | Next song is played, igniring the other files |  | |  |
| Video | Play the first music file inside a folder that only contains music<br>Move forward till the last 5 seconds | When the song finishes, the next one plays|  | |  |
| Video - last file | Play the last music file inside a folder that only contains music<br>Move forward till the last 5 seconds | When the song finishes, no more music is played|  | |  |
| Video - Other | Play the first music file inside a folder that contains music and other stuff (pdfs etc...) | Next song is played, igniring the other files |  | |  |
| Video - Music | Play the first music file inside a folder that contains music and other stuff (pdfs etc...) | Next song is played, igniring the other files |  | |  |
| Backgroung playing | Play the first music file inside a folder that contains music and other stuff (pdfs etc...) | Next song is played, igniring the other files |  | |  |
