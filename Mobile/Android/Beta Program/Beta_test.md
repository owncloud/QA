###  Beta test 

Device: Huawei 6P v7, Galaxy Tab S v6

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :---: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**Installation**||||||
| 1 | Only beta | Install the version in a device with any other ownCloud instalation | Success | P m7 t6 |  |
| 2 | After official | 1. Install a debug/release version of ownCloud<br>2. Install the beta version | Both installed | P m7 t6 |  |
| 3 | Before official | 1. Install the beta version<br>2. Install a debug/release version of ownCloud| Both installed | P m7 t6 |  |
| 4 | Accounts in device | Install beta and release/debug and attach accounts to both of them| In device accounts, the accounts have different type | P m7 t6 |  |
|**Actions**||||||
| 5 | Upload | 1. Attach the same account in both apps<br>2. Upload manually a file to beta | Finished upload notification only appears to the beta. Check uploads view | P m7 t6|  |
| 6 | Instant Uploads | 1. Attach the same account in both apps<br>2. Enable instant uploads and take some pics<br>3. Disable instant uploads in release/debug version and take more pics| 2. Uploaded in both accounts<br>3. Uploaded only in beta | P m7 t6 |  |
| 7 | Download | 1. Attach the same account in both apps<br>2. Download a file to beta | Finished download notification only appears to the beta| P m7 t6 |  |
| 8 | Refresh account | 1. Attach the same account in both apps<br>2. Refresh account in beta | Only beta is refreshed. In release/debug the folders are not discovered | P m7 t6 |  |
| 9 | Document Provider | 1. Attach the same account in both apps<br>2. Share content from other apps in both| Content is correctly shared in both | P m7 t6| FIXED: Crash |
| 10 | Manage Space - Clear account | 1. Attach the same account in both apps<br>2. In device settings, clear data and manage space | Data cleared | P m7 t6 | FIXED: Crash |