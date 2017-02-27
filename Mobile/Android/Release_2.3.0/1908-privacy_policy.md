###  Privacy Policy 

#### Pr: https://github.com/owncloud/ios/pull/1908 


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**Settings view**||||||
| 1 | Enabled | Enable branding option |  In Settings view appears the option "Privacy Policy" |  |  |
| 2 | Disabled | Disable branding option |  In Settings view does not appear the option "Privacy Policy" |  |  |
|**Privacy Policy**||||||
| 3 | Enabled | 1. Enable branding option and set URL<br>2. Open Privacy Policy | Privacy Policy is displayed |  |  |
| 4 | Enabled | 1. Enable branding option and do not set URL<br>2. Open Privacy Policy | Privacy Policy is not displayed |  |  |
|**Orientation**||||||
| 5 | Portrait | Open privacy policy | Privacy Policy is correctly displayed |  |  |
| 6 | Landscape | Open privacy policy | Privacy Policy is correctly displayed |  |  |