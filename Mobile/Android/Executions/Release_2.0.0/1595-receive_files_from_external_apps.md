###  BUG: Receiving files from external apps display an error

#### Pr: https://github.com/owncloud/android/pull/1595

Devices: Nexus7 v4.3, Nexus 6P v6

Server: v9.0.1 RC2


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**External apps - Content**||||||
| 1 | Google Drive | Open the app and share with ownCloud| File is correctly shared and stored in ownCloud| P t4 m6|  |
| 2 | Moon Reader | Open the app and share with ownCloud|File is correctly shared and stored in ownCloud | P t4 m6| |
| 3 | Gmail | Open the app and share an attached file with ownCloud|File is correctly shared and stored in ownCloud| P t4 m6| |
| 4 | Downloads | Open the app and share with ownCloud|File is correctly shared and stored in ownCloud| P t4 m6| |
| 5 | Dropbox | Open the app and share with ownCloud|File is correctly shared and stored in ownCloud| P t4 m6| |
|**External apps - No Content (text)**||||||
| 6 | ListMyApps | Open the app and share with ownCloud| An error is shown because no file is available to upload| P t4 m6| |
| 7 | Gtask | Open the app and share with ownCloud|An error is shown because no file is available to upload| P t4 m6| |
| 8 | Google Keep | Open the app and share with ownCloud|An error is shown because no file is available to upload| P t4 m6| |
| 9 | Speed Test | Open the app and share with ownCloud|An error is shown because no file is available to upload| P t4 m6| |
| 10 | Google Play Newsstand | Open the app and share with ownCloud|An error is shown because no file is available to upload| P t4 m6| |
| 11 | Google Play Books | Open the app and share with ownCloud|An error is shown because no file is available to upload| P t4 m6| |
| 12 | Wifi analyzer | Open the app and share with ownCloud|An error is shown because no file is available to upload| P t4 m6| |
| 13 | Youtube | Open the app and share with ownCloud|An error is shown because no file is available to upload| P t4 m6| Shares the URL of the streaming|
