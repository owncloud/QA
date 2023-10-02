#### Previews

#### PR: 

Server(s): <br>
Device(s): <br>
Execution date: <br>
Tester:  <br>
Context: <br>


| Test Case | Steps | Expected Result | Result | Related Comment |
| :-------- | :---- | :-------------- | :----: | :-------------- |
| **Download and preview** |   |  |
| .txt | Download a txt file | The content is correctly displayed| [AUTO](https://github.com/owncloud/android-scenario-testing/blob/master/src/test/resources/io/cucumber/download.feature) | |
| .png | Download a png file | Image is correctly displayed| | |
| .jpg | Download a jpg file | Image is correctly displayed| | |
| .gif | Open a GIF file | GIF correctly reproduced in both orientations |
| Audio without coverart | Open a MP3 file that does not include cover | Music played and placeholder not displayed |
| Audio with coverart | Open a MP3 file that includes cover| Music played and cover displayed |
| Stream a video with https (trusted server) | 1. With a https server stream a video. Use the controls to move forward and backward and change orientation | Video is streamed correctly |
| Markdown | 1. Download a markdown file (.md)<br>2. Click on `Text` tab | 1. Markdown file displayed and correctly rendered<br>2. Original text displayed | | |
| Unsupported | Download a unsupported file (pdf, office...) | Menu to open in a different app is raised up| | |
| Open with | 1. Download a file<br>2. Select the option `Open with`<br>3. Select an app from the list<br>4. Edit the file and save | 3. Correctly opened<br>4. Correctly edited and synced with server| | |