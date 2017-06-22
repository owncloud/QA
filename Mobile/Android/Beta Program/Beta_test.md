###  Beta test 


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :---: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**Installation**||||||
| 1 | Only beta | Install the version in a device with any other ownCloud instalation | Success |  |  |
| 2 | After oficial | 1. Install a debug/release version of ownCloud<br>2. Install the beta version | Both installed |  |  |
| 3 | Before oficial | 1. Install the beta version<br>2. Install a debug/release version of ownCloud| Both installed |  |  |
| 4 | Accounts in device | Install beta and release/debug and attach accounts to both of them| In device accounts, the accounts have different type |  |  |
|**Actions**||||||
| 5 | Upload | 1. Attach the same account in both apps<br>2. Upload manually a file to beta | Finished upload notification only appears to the beta. Check uploads view|  |  |
| 6 | Instant Uploads | 1. Attach the same account in both apps<br>2. Enable instant uploads and take some pics<br>3. Disable instant uploads in release/debug version and take more pics| 2. Uploaded in both accounts<br>3. Uploaded only in beta |  |  |
| 7 | Download | 1. Attach the same account in both apps<br>2. Download a file to beta | Finished download notification only appears to the beta|  |  |
| 8 | Refresh account | 1. Attach the same account in both apps<br>2. Refresh account in beta | Only beta is refreshed. In release/debug the folders are not discovered |  |  |
| 9 | Document Provider | 1. Attach the same account in both apps<br>2. Share content from other apps in both| Content is correctly shared in both |  |  |