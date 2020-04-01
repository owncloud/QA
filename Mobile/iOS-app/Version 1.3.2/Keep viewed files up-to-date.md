### Keep viewed files up-to-date

#### Pr: https://github.com/owncloud/ios-app/pull/653

Devices: iPhone XR v13.4<br>
Server: 10.4

---

 
| Test Case | Steps | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- | 
|**App**|
| txt | Open the same txt file in the app and in other client<br>Modify it in the other client| In the app, the file is updated with the changes done in the other client | P m13 | FIXED: not updated. spinner forever |  |
| doc | Open the same doc file in the app and in other client<br>Modify it in the other client| In the app, the file is updated with the changes done in the other client | P m13 |  |  |
| xls | Open the same xls file in the app and in other client<br>Modify it in the other client| In the app, the file is updated with the changes done in the other client | P m13 |  |  |
| ppt | Open the same ppt file in the app and in other client<br>Modify it in the other client| In the app, the file is updated with the changes done in the other client | P m13 |  |  |
| pdf | Open the same pdf file in the app and in other device<br>Modify it in the other device, by using the markup feature| In the app, the file is updated with the changes done in the other client | P m13 |  |  |
| png | Open the same png file in the app and in other device<br>Modify it in the other device, by using the markup feature | In the app, the file is updated with the changes done in the other client | P m13 |  |  |
| jpg | Open the same png file in the app and in other device<br>Modify it in the other device, by using the markup feature | In the app, the file is updated with the changes done in the other client | P m13 | FIXED: updated only the first time |  |
|**Files**|
| doc | Open the same doc file in Files App in two devices<br>Modify the file in one of them| Check in the other that the size and date change correctly | P m13 |  |  |
| pdf | Open the same pdf file in Files App in two devices<br>Modify the file in one of them| Check in the other that the size and date change correctly | P m13 |  |  |
| jpg | Open the same png file in Files App in two devices<br>Modify the file in one of them| Check in the other that the size and date change correctly | P m13 |  |  |
|**Other**|
| Available offline | Set a file and a folder as av. offline<br>Download other three files<br>In Settings, set expiration local files to 1 minute<br>Wait one minute| Av. offline content is not deleted locally<br>Downloaded files are deleted | P m13|
| No connection | Remove device connection<br>Open the same txt file in the app and in other client<br>Modify it in the other client<br>Recover connection| Changes are reflected in the other device| P m13 |  |  |
|issue 3803 |||Not reproducible with the new implementation|
