### Spaces View

Server(s): <br>
Device(s): <br>
Execution date: <br>
Tester:  <br>
Context: <br>

--

Tests: 17<br>
Automated: 3 (18%)


| Title | Steps     | Expected Result | Result | Comments |
| :---- | :-------- | :-------------- | :----: | :------- |
|**Spaces view**||||
| View |  1. Login in oCIS account with spaces<br>2. In bottom bar, click on Spaces | Top bar: "Spaces", hamburguer and avatar/account selector<br>Bottom bar: 5 items<br> | | |
| Empty list  | 1. Login in oCIS account without spaces<br>2. In bottom bar, click on Spaces | Empty view |  |  |
| Non-Empty list. Only Name  | 1. In oCIS server, create three different spaces without subtitle and image (admin permissions to do that)<br>2. In app, in bottom bar, click on Spaces | Spaces correctly listed with correct names, without subtitle and image | [AUTO](https://github.com/owncloud/android-scenario-testing/blob/master/src/test/resources/io/cucumber/spaces.feature)  |  |
| Non-Empty list. Name & Subtitle | 1. In oCIS server, create three different spaces without image, adding a subtitle (admin permissions to do that)<br>2. In app, in bottom bar, click on Spaces | Spaces correctly listed with correct names and subtitles, without image | [AUTO](https://github.com/owncloud/android-scenario-testing/blob/master/src/test/resources/io/cucumber/spaces.feature)  |  |
| Non-Empty list. Name, Subtitle and Image| 1. In oCIS server, create three different spaces with image and subtitle (admin permissions to do that)<br>2. In app, in bottom bar, click on Spaces | Spaces correctly listed with correct names, subtitles and images. | | |
| Change title | 1. In oCIS server, change title of an existing space (admin permissions to do that)<br>2. In app, pull to refresh in spaces view | Space correctly renamed |  |  |
| Change subtitle | 1. In oCIS server, change subtitle of an existing space (admin permissions to do that)<br>2. In app, pull to refresh in spaces view | Space subtitle correctly renamed |  |  |
| Change image | 1. In oCIS server, change image of an existing space (admin permissions to do that)<br>2. In app, pull to refresh in spaces view | Space image correctly updated |   |   | 
| Change all | 1. In oCIS server, change title, subtitle and image of an existing space (admin permissions to do that)<br>2. In app, pull to refresh in spaces view | Title, subtitle and image correctly updated |  |  |
| Set long space name | 1. In oCIS server, change title of an existing space with another one very long (+100 characters)<br>2. In app, pull to refresh in spaces view | Space name correctly updated and displayed in both orientations |   |   | 
| Set long subtitle | 1. In oCIS server, change subtitle of an existing space with another one very long (+100 characters)<br>2. In app, pull to refresh in spaces view | Space subtitle correctly updated and displayed in both orientations |  |   | 
| Disable space | 1. Add oCIS with spaces account<br> 2. In server (with permissions) disable one space<br>3. In app, refresh spaces view | Disabled space is not displayed anymore |  [AUTO](https://github.com/owncloud/android-scenario-testing/blob/master/src/test/resources/io/cucumber/spaces.feature) |  |
| Disable all space | 1. Add oCIS with spaces account<br> 2. In server (with permissions) disable all spaces<br>3. In app, refresh spaces view | No spaces, empty view |  |   |
| Remove space | 1. Add oCIS with spaces account<br> 2. In server (with permissions) remove a disabled  space<br>3. In app, refresh spaces view | Removed space is not displayed anymore |  |  |
|**Document provider**||||
| List | 1. Open any app with support with Document Provider (SAF)<br> 2. Select an oCIS account | List of spaces including personal are listed |  |   |
|**Errors**||||||
| Lack of internet connection | 1. Remove connection from device<br>2. Open list of spaces| Error: `Spaces coult nod be refreshed`<br>`because an error occurred`<br>`while connecting to the server`  | | |
| Server down | 1. Switch server off<br>2. Open list of spaces| Error: `Spaces coult nod be refreshed`<br>`because an error occurred`<br>`while connecting to the server`  | | 
