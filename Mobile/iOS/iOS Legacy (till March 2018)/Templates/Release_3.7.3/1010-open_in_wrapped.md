#### Open with (wrapped and unwrapped apps)

#### Pr: https://github.com/owncloud/ios/pull/1010



---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**Non-wrapped**|||||||
| 1 | iPhone | 1. Swipe over a file and select Open with | All apps available |   |  |
| 2 | iPad  | 1. Swipe over a file and select Open with | All apps available |  |  |
|**wrapped**|||||||
| 3 | iPhone without whitelist | 1. Swipe over a file and select Open with | All apps available |   |  |
| 4 | iPad  without whitelist | 1. Swipe over a file and select Open with | All apps available |  |  |
| 5 | iPhone with whitelist| 1. Swipe over a file and select Open with | Only whitelisted app can open the file |   |  |
| 6 | iPad with whitelist | 1. Swipe over a file and select Open with | Only whitelisted app can open the file | |  |
