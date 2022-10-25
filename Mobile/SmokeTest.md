# Smoke test

Device & Android version: <br>
Android app version: <br>
Server version: <br>
OAuth2 version: <br>


Test Case | Steps | Expected Result | Result | Related Comment
| :------ | :---- | :-------------- | :----- | :---------
| Login basic | Login in a server with basic auth | It is possible to access  |  |
| Login OAuth2 | Login in a server with OAuth2  | It is possible to access  |  |
| Login OIDC | Login in a server with OIDC  | It is possible to access  |  |
| New folder | Select to create a new folder |The folder is created with thecorrect name|   |
| Rename | Rename an exsisting folder|  Folder is renamed with the new name |
| Move | 1. Long press on a folder<br>2. Select Move, and a new location | Folder is moved to the specifield location |3
| Copy | 1. Long press on a folder<br>2. Select Copy, and a location to copy to | The folder and all its content is copied in the location, and remains too in the original |
| Delete | 1. Long press on a folder<br>2. Select Delete | Item deleted |
| Sync | 1. Create a folder <br> 2. In web app, upload some files in the folder <br> 3. Sync the folder  | The folder is sync with the content on server |
| Upload  | Select several files from Document provider and camera to upload to oC | Files are uploaded  |
| Download | Tap to download a file | The file is downloaded and marked with green arrow| 
| Av Offline | Long press to set as Av Offline a file | The file is downloaded and set as Av Offline with the purple tick | 
| Av Offline folder | Long press to unset an Av Offline a folder that contains subfolders | The folder and all its content is downloaded and set as Av Offline with the purple tick | 
