#### Download 

Server(s): <br>
Device(s): <br>
Execution date: <br>
Tester:  <br>
Context: <br>

---

Tests: 9<br>
Automated: 1 (11%)

| Title | Steps     | Expected Result | Result | Comments |
| :---- | :-------- | :-------------- | :----: | :------- |
|**Download**||||
| Single not-previewable file | Click on a single file that is not previewable (f. ex, MSOffice file, PDF file...) | Details view is displayed with the download progress bar<br>File downloaded showing the green badge next to the thumbnail<br>`Open with` shown when download finishes<br>`Download success` notification shown when download finishes |  | |
| Single previewable file | Click on a single file that is previewable (f. ex, image, txt file...) | Progress bar shown and file previewed<br>`Download success` notification shown when download finishes<br>File downloaded showing the green badge next to the thumbnail | [AUTO](https://github.com/owncloud/android-scenario-testing/blob/master/src/test/resources/io/cucumber/download.feature) | |
| Download a big file | Click on a single file which size is greater than 500MB | File is downloaded after showing the progress<br>`Download success` notification shown when download finishes<br>File downloaded showing the green badge next to the thumbnail |  | |
| Multiple file | 1. Click on a file to enable multiselection mode<br>2. Select several non-downloaded files<br>3. Select download icon on the top (down arrow icon) | Files are downloaded (green badge next to the thumbnail)<br>One notification of success for every downloaded file |  | |
| Folder with subfolders | 1. Select a folder that contains files and subfolders by long pressing on it<br>2. Click on sync button (circle arrow)  | All files inside (including ones inside subfolders) downloaded showing the green badge next to the thumbnail<br>One notification of success for every downloaded file | | |
| Huge number | 1. Select a folder which contains 1000 files (create it with LLNL utility)<br>2. Click on sync button (circle arrow)| All files inside are downloaded<br>One notification of success for every downloaded file |  | |
| Cancel | 1. Click in a big sized file<br>2. Cancel download before it finishes by clicking on `(x)` on the top bar | File is not downloaded (no green badge) |  |  |
|**Errors**||||
| Connection | 1. Click in a single file to download<br>2. Before it finishes, remove device connection | File is not downloaded (no green badge)<br>Error in notification: `Download failed` | | |
| Lost credentials (oC10)| 1. In a OAuth2 server with a session active, revoke token from server<br>2. Click in a single big file to download| File does not start to download<br>Error in snackbar: `Failed because wrong username or password` | | |