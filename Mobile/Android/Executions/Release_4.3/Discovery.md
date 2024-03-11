### Discovery

Server(s): oCIS 5, oC10.14.0<br>
Device(s): Pixel2 Android11, Galaxy Tab A8 Android 13<br>
Execution date: 06/03/2024<br>
Tester:  jrecio<br>
Context: <br>
 
--

 
| Test Case | Steps | Expected | Result | Related Comment / Defect | 
| :-------- | :---- | :------- | :----: | :------------------------- | 
|**oC10**||||||
| Populated account | 1. Install the app from scratch<br>2. Add an account with several thousands of files in a deep structure<br>3. Just after entering credentials, stay at root folder<br>4. After 1 minute, remove device connection<br>5. Browse through the folder structure | Every folder in the structure is reachable and all files are listed , no matter how deep they are in the tree  | P m11 t13|
| Performant | 1. Install the app from scratch<br>2. Add an account with several thousands of files in a deep structure<br>3. Just after entering credentials, do some heavy operations like uploads, downloads, shares... | Operations are done in a performant way, no lag | P m11 t13  |
| Abort | 1. Install the app from scratch<br>2. Add an account with several thousands of files in a deep structure<br>3. Just after entering credentials, remove the account from the device | Discovery stops (check with a proxy app like mitmp) |  P m11 t13 |
|**oCIS**||||||
| Populated account | 1. Install the app from scratch<br>2. Add an account with several thousands of files in a deep structure, including spaces with also deep structure<br>3. Just after entering credentials, stay at root folder<br>4. After 1 minute, remove device connection<br>5. Browse through the folder structure in all spaces | Every folder in the structure is reachable and all files are listed , no matter how deep they are in the tree  | P m11 t13 |
| Performant | 1. Install the app from scratch<br>2. Add an account with several thousands of files in a deep structure, including spaces with also deep structure<br>3. Just after entering credentials, do some heavy operations like uploads, downloads, shares... | Operations are done in a performant way, no lag | P m11 t13 |
| Abort | 1. Install the app from scratch<br>2. Add an account with several thousands of files in a deep structure<br>3. Just after entering credentials, remove the account from the device | Discovery stops (check with a proxy app like mitmp) | P m11 t13|
| Shares | 1. Install the app from scratch<br>2. Add an account in which already exist shared files (in advance using another client)<br>3. Just after entering credentials, stay at root folder<br>4. After 1 minute, remove device connection<br>5. Open the `Shares` tab in the bottom bar | Shared files correctly listed | NA |
