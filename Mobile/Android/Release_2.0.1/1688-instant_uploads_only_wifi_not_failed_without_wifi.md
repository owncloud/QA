###  BUG: Only WiFi instant uploads fail when no WiFi is available

#### Pr: https://github.com/owncloud/android/pull/1688

Devices: Nexus7 v4.3, Nexus 5 v5, HTC one v4.3

Server: 9.0.2

---

Precondition: Instant uploads enabled with "only wifi"
 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
| 1 | No connection | 1. Set the device in airplane mode<br>2. Take a pic or video<br> 3. Disable the airplane mode| 2. The pic is added to the uploads list in "current" section, but there is no error notification <br>3. File is uploaded| P t4 m5 |  |
| 2 | 3G/4G Connection | 1. Switch the device wifi connection off<br>2. Take a pic or video<br> 3. Enable the wifi connection | 2. The pic is added to the uploads list in "current" section, but there is no error notification <br>3. File is uploaded| P m4 | Notification about uploading is visible |