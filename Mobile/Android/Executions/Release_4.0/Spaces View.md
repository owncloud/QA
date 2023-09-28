### Spaces View


**Devices**: Samsung A51 Android12<br>
**Server**: 10.11


| Title | Steps     | Expected Result | Result | Comments |
| :---- | :-------- | :-------------- | :----: | :------- |
|**UI**||||
| View |  1. Enter oCIS with spaces server URL and correct credentials<br>2. In bottom bar, click on Spaces | Top bar: "Spaces", hamburguer and avatar/account selector<br>Bottom bar: 5 items<br> | P m12
| Empty list  | 1. Enter oCIS without spaces server URL and correct credentials<br>2. In bottom bar, click on Spaces | Empty view | P m12 |  |
| Non-Empty list. Only Name  | 1. In oCIS server, create three different spaces without subtitle and image. (admin permissions to do that)<br>2. In app, in bottom bar, click on Spaces | Spaces correctly listed with correct names, without subtitle and image | P m12 |  |
| Non-Empty list. Name & Subtitle | 1. In oCIS server, create three different spaces without image, adding a subtitle. (admin permissions to do that)<br>2. In app, in bottom bar, click on Spaces | Spaces correctly listed with correct names and subtitles, without image | P m12 |  |
| Non-Empty list. Name, Subtitle and Image| 1. In oCIS server, create three different spaces with image and subtitle. (admin permissions to do that)<br>2. In app, in bottom bar, click on Spaces | Spaces correctly listed with correct names, subtitles and images. | P m12 | |
| Change title | 1. In oCIS server, change title of an existing space (admin permissions to do that)<br>2. In app, pull to refresh in spaces view | Space correctly renamed | P m12 |  |
| Change subtitle | 1. In oCIS server, change subtitle of an existing space (admin permissions to do that)<br>2. In app, pull to refresh in spaces view | Space subtitle correctly renamed | P m12 |  |
| Change image | 1. In oCIS server, change image of an existing space (admin permissions to do that)<br>2. In app, pull to refresh in spaces view | Space image correctly updated | P m12  | Need to browse. Reload mechanism to do   | 
| Change all | 1. In oCIS server, change title, subtitle and image of an existing space (admin permissions to do that)<br>2. In app, pull to refresh in spaces view | Title, subtitle and image correctly updated | P m12 |  |
| Set long space name | 1. In oCIS server, change title of an existing space with another one very long (+100 characters)<br>2. In app, pull to refresh in spaces view | Space name correctly updated and displayed in both orientations | P m12  |   | 
| Set long subtitle | 1. In oCIS server, change subtitle of an existing space with another one very long (+100 characters)<br>2. In app, pull to refresh in spaces view | Space subtitle correctly updated and displayed in both orientations | P m12  |   | 
| Disable space | 1. Add oCIS with spaces account<br> 2. In server (with permissions) disable one space<br>3. In app, refresh spaces view | Disabled space is not displayed anymore | P m12 |  |
| Disable all space | 1. Add oCIS with spaces account<br> 2. In server (with permissions) disable all spaces<br>3. In app, refresh spaces view | No spaces, empty view | P m12 |  FIXED: Blank view |
| Remove space | 1. Add oCIS with spaces account<br> 2. In server (with permissions) remove a disabled  space<br>3. In app, refresh spaces view | Removed space is not displayed anymore | P m12 |  |
| Update | 1. Install previous version<br>2. Add oCIS (with spaces) and oC10 accounts<br>3. Update to current version and browse through accounts<br>4. Open app | Spaces correctly listed in oCIS account.<br>No spaces in oC10 account | P m12 | FIXED: Crash |