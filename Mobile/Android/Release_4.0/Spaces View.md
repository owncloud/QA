### Spaces View


#### PR: 

**Devices**: <br>
**Server**: 


| Title | Steps     | Expected Result | Result | Comments |
| :---- | :-------- | :-------------- | :----: | :------- |
|**UI**||||
| View |  1. Enter oCIS with spaces server URL and correct credentials<br>2. In bottom bar, click on Spaces | Top bar: "Spaces", hamburguer and avatar/account selector<br>Bottom bar: 5 items<br>
| Empty list  | 1. Enter oCIS without spaces server URL and correct credentials<br>2. In bottom bar, click on Spaces | Empty view |  |  |
| Non-Empty list. Only Name | 1. In oCIS server, create three different spaces without subtitle and image. (admin permissions to do that)<br>2. In app, in bottom bar, click on Spaces | Spaces correctly listed with correct names, without subtitle and image |  |  |
| Non-Empty list. Name & Subtitle | 1. In oCIS server, create three different spaces without image, adding a subtitle. (admin permissions to do that)<br>2. In app, in bottom bar, click on Spaces | Spaces correctly listed with correct names and subtitles, without image |  |  |
| Non-Empty list. Name, Subtitle and Image| 1. In oCIS server, create three different spaces with image and subtitle. (admin permissions to do that)<br>2. In app, in bottom bar, click on Spaces | Spaces correctly listed with correct names, subtitles and images. |  |  |
| Disable space | 1. Add oCIS with spaces account<br> 2. In server (with permissions) disable one space<br>3. In app, refresh spaces view | Disabled space is not displayed anymore. Check in DB |  |  |
| Remove space | 1. Add oCIS with spaces account<br> 2. In server (with permissions) remove a disabled  space<br>3. In app, refresh spaces view | Removed space is not displayed anymore. Check in DB |  |  |
|**DB**||||
| New field | Install the app and inspect DB with AS | New table for spaces, initially with all fields to null | |  |
| oC10 | 1. Add oC10 account<br>2. Inspect DB with AS| Spaces table with no entries |  |  |
| oCIS with Spaces | 1. Add oCIS with already created spaces account<br>2. Inspect DB with AS | Spaces' table correctly populated for oCIS with spaces |  |  |
| oCIS without Spaces | 1. Add oCIS with already created spaces account<br>2. Inspect DB with AS | Spaces' table correctly populated for oCIS without spaces |  |  |
| Update | 1. Install previous version<br>2. Add oCIS (with spaces) and oC10 accounts<br>3. Update to current version and browse through accounts<br>4. Inspect DB with AS | Spaces' table correctly populated for oCIS account |  |  |