###  BUG: Only WiFi instant uploads fail when no WiFi is available

#### Pr: https://github.com/owncloud/android/pull/1688

Devices: 

Server:

---

Precondition: Instant uploads enabled with "only wifi"
 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
| 1 | No connection | 1. Set the device in airplane mode<br>2. Take a pic or video<br> 3. Disable the airplane mode| 2. The pic is added to the uploads list in "current" section, but there is no error notification <br>3. File is uploaded|  |  |
| 2 | 3G/4G Connection | 1. Switch the device wifi connection off<br>2. Take a pic or video<br> 3. Enable the wifi connection | 2. The pic is added to the uploads list in "current" section, but there is no error notification <br>3. File is uploaded|  |  |