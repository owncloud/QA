###  App name in touchID alertView

#### Pr: https://github.com/owncloud/ios/pull/630

Devices: iPhone 6 plus v8.4

Server: v9.0.1


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
| 1 | "Unlock" string  |  Change the device language   | "Unlock" is translated or appears the tag "unlock_app" if not translated in that language| P m8 |  |
| 2 | App name in touchID alertView |  1. Enable touchID in device<br>2. Change the app name<br>3. Open the app  | "Unlock" is translated or appears the tag "unlock_app" if not translated in that language| P m8 | The sentence is completely translated |
