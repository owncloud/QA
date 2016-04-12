###  BUG: Receiving files from external apps display an error

#### Pr: https://github.com/owncloud/android/pull/xxx

Devices:

Server:


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**External apps - Content**||||||
| 1 | Google Drive | Open the app and share with ownCloud| File is correctly shared and stored in ownCloud| | |
| 2 | Moon Reader | Open the app and share with ownCloud|File is correctly shared and stored in ownCloud | | |
| 3 | Gmail | Open the app and share an attached file with ownCloud|File is correctly shared and stored in ownCloud| | |
| 4 | Downloads | Open the app and share with ownCloud|File is correctly shared and stored in ownCloud| | |
|**External apps - No Content**||||||
| 5 | ListMyApps | Open the app and share with ownCloud| An error is shown because no file is available to upload| | |
| 6 | Gtask | Open the app and share with ownCloud|An error is shown because no file is available to upload| | |
| 7 | Google Keep | Open the app and share with ownCloud|An error is shown because no file is available to upload| | |
| 8 | Speed Test | Open the app and share with ownCloud|An error is shown because no file is available to upload| | |
| 9 | Google Play Newsstand | Open the app and share with ownCloud|An error is shown because no file is available to upload| | |
| 10 | Google Play Books | Open the app and share with ownCloud|An error is shown because no file is available to upload| | |
| 11 | Wifi analyzer | Open the app and share with ownCloud|An error is shown because no file is available to upload| | |
| 12 | Youtube | Open the app and share with ownCloud|An error is shown because no file is available to upload| | |
