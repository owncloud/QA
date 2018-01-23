#### Open with (wrapped and unwrapped apps)

#### Pr: https://github.com/owncloud/ios/pull/1010

Devices: iPhoneX v11.2, iPadAir v11.2, iPhone6Plus v10, iPadMini v10

Server: 10.0.4


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**Non-wrapped**|||||||
| 1 | iPhone | 1. Swipe over a file and select Open with | All apps available | P m10 m11  |  |
| 2 | iPad  | 1. Swipe over a file and select Open with | All apps available | P t10 t11 |  |
|**wrapped**|||||||
| 3 | iPhone without whitelist | 1. Swipe over a file and select Open with | All apps available | P m11  |  |
| 4 | iPad  without whitelist | 1. Swipe over a file and select Open with | All apps available | P t11 |  |
| 5 | iPhone with whitelist| 1. Swipe over a file and select Open with | Only whitelisted app can open the file | P m11  |  |
| 6 | iPad with whitelist | 1. Swipe over a file and select Open with | Only whitelisted app can open the file | P t11 |  |
