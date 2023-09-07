### Open with saving changes

#### Pr: https://github.com/owncloud/android/pull/3499

Devices: Nexus 6P v7, Pixel2 v11

Server: 10.9.1

---

 
| Test Case | Steps | Expected Result | Result | Related Comment |
| :-------- | :---- | :-------------- | :----: | :-------------- |
|**Actions**| file already downloaded -> improvement||||||
| Root folder | 1. Txt file in root folder, select "Open with"<br> 2. Select a proper app and edit the file<br>3. Save it and go back to oC | File is synced. Check the new version is upladed in server via web|  P m11 m7 |  |
| Non-Root folder | 1. Txt file in non-root folder, select "Open with"<br> 2. Select a proper app and edit the file<br>3. Save it and go back to oC | File is synced. Check the new version is upladed in server via web| P m11 m7 |  |
| Non-Root folder + Kill | 1. Txt file in non-root folder, select "Open with"<br> 2. Select a proper app and edit the file<br>3. Kill oC app<br>4. Edit the file<br>5. Open oC app  | File is synced when browsing in the containing folder, not before. Check the new version is upladed in server via web| P m11 m7 |  |
|**Errors**|||||||
| No connection |1. Remove connection in the device<br>2. Txt file, select "Open with"<br>3. Select a proper app and edit the file<br>4. Save it and go back to oC<br>5. Recover connection | 4. File not synced, not in the uploads view<br>5. File synced, check the new version is upladed in server via web | P m11 m7|  |
| Conflict |1. Txt file, select "Open with"<br>2. Select a proper app and edit the file<br>3. At the time, modify the file using other client<br>4. Save the original file and go back to oC | Conflict happens | P m11 m7|  |
