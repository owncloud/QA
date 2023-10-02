#### Details View

#### PR: 

Server(s): <br>
Device(s): <br>
Execution date: <br>
Tester:  <br>
Context: <br>


| Test Case | Steps | Expected Result | Result | Related Comment |
| :-------- | :---- | :-------------- | :----: | :-------------- |
| Open view | 1. Select any item of the list and click on 3-dot-button, then click `Details` | Details view opened |  | |
|**Thumbnail**|||
| Image thumbnail | 1. Open `Details`of image file | Thumbnail displayed on the top, correct in both orientations |   | |
| Txt thumbnail | 1. Open `Details`of txt file | Thumbnail displayed on the top, correct in both orientations |  |  |
| No thumbnail| 1. Open `Details`of any file that lacks of preview | Placeholder displayed on the top, correct in both orientations |   | |
|**Statuses**|||
| Download | 1. Open `Details` of any file that is not downloaded<br>2. Click on the thumbnail | File is downloaded |  | |
| Progress bar | 1. Open `Details` of any file that is not downloaded<br>2. Click on the thumbnail | File is downloaded |  | |
| Preview | 1. Open `Details` of any previewable file that is downloaded<br>2. Click on the thumbnail | File is previewed |  | |
| Downloaded badge | 1. Open `Details`of any downloaded file (with green badge in list of files) | Green badge on the bottom left corner of the thumbnail/placeholder |   | |
| Av. offline badge | 1. Open `Details`of any av. offline file (with purple badge in list of files) | Purple badge on the bottom left corner of the thumbnail/placeholder |   | |
| Syncing badge| 1. Open `Details`of any no-previewable big file (~1G)<br>2. | Green badge on the bottom left corner of the thumbnail/placeholder |   |  |
|**Info**|||
| Type & Size| 1. Open `Details`of any file | `Type` and `Size` date is correct (compare with web client) |   |  |
| Modified date | 1. Open `Details`of any file | `Modified` date is correct (check response from server or DB) |   |  |
| Created date | 1. Open `Details`of any file | `Created` date is correct (check response from server or DB) |   |  |
| Last sync date | 1. Open `Details`of any file | `Last Sync` date is correct (check response from server or DB)|   |  |
| Location root | 1. Open `Details`of any file in root folder | `Location`is `/` |   |  |
| Location non-root (long) | 1. Open `Details` of any file in non-root and deep folder | `Location` is correct and string does not overflow. File name not included |   |  |
| Space | 1. Open `Details` of any file on oC10 account<br>2. Open `Details` of any file on oCIS account, personal space<br>3. Open `Details` of any file on oCIS account, no-personal space | 1. `Space` is hidden<br>2. `Space` is `Personal`<br>3. `Space` name is correct|  |  |