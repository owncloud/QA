### Save account type and new tab for Spaces


#### PR: 

**Devices**: <br>
**Server**: 


| Title | Steps     | Expected Result | Result | Comments |
| :---- | :-------- | :-------------- | :----: | :------- |
|**Detection**||||
| oC10 | Enter oC10 server URL and correct credentials | Straight to the list of files<br>4 regular items in bottom bar: Files, Uploads, Private links and Av. offline  |  |  |
| oCIS with spaces | Enter oCIS server with spaces URL and correct credentials | Straight to the list of files<br>5 items in bottom bar: Personal, Spaces, Uploads, Private links and Av. offline<br>Spaces option with correct icon (same as web)  |  |  |
| oCIS without spaces | Enter oCIS server without spaces URL and correct credentials | Straight to the list of files<br>4 items in bottom bar: Files, Uploads, Private links and Av. offline  |  |  |
|**DB**||||
| New field | Install the app and inspect DB with AS | Capabilities table contains new field to distinguish spaces/non-spaces accounts, initially to NULL | |  |
| oC10 | 1. Add oC10 account<br>2. Inspect DB with AS| Capabilities' table correctly populated for oC10 |  |  |
| oCIS with Spaces | 1. Add oCIS with Spaces account<br>2. Inspect DB with AS | Capabilities' table correctly populated for oCIS with spaces |  |  |
| oCIS without Spaces | 1. Add oCIS without Spaces account<br>2. Inspect DB with AS | Capabilities' table correctly populated for oCIS without spaces |  |  |
| Update | 1. Install previous version<br>2. Add oCIS and oC10 accounts<br>3. Update to current version and browse through accounts<br>4. Inspect DB with AS | Capabilities' table correctly populated for every account |  |  |