###  BUG: Multiaccount disabled, bad settings view

#### Pr: https://github.com/owncloud/ios/pull/618 

Devices:

Server:

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :-----:| :-------- | :-----| :-------------- | :----: | :-------------- |
|**Multiaccount disabled**||||||
| 1 | Passcode enabled - Touch id disabled | 1. Check that the layout is correct     | No empty lines, all the view is correct |  |
| 2 | Passcode enabled - Touch id enabled | 1. Check that the layout is correct     | No empty lines, all the view is correct |  |
| 3 | Passcode disabled | 1. Check that the layout is correct     | No empty lines, all the view is correct |  |
| 4 | Instant upload enabled | 1. Check that the layout is correct     | No empty lines, all the view is correct |  |
| 5 | Instant upload disabled | 1. Check that the layout is correct     | No empty lines, all the view is correct |  |
|**Multiaccount enabled**||||||
| 6 | Passcode enabled - Touch id disabled - 1 account | 1. With one account, check that the layout is correct     | No empty lines, all the view is correct |  |
| 7 | Passcode enabled - Touch id enabled - 1 account| 1. With one account, check that the layout is correct     | No empty lines, all the view is correct |  |
| 8 | Passcode disabled - 1 account| 1. With one account, check that the layout is correct     | No empty lines, all the view is correct |  |
| 9 | Instant upload disabled - 1 account| 1. With one account, check that the layout is correct     | No empty lines, all the view is correct |  |
| 10 | Instant upload enabled - 1 account| 1. With one account, check that the layout is correct     | No empty lines, all the view is correct |  |
| 11 | Passcode enabled - Touch id disabled - several accounts | 1. With several  accounts, check that the layout is correct     | No empty lines, all the view is correct |  |
| 12 | Passcode enabled - Touch id enabled - several accounts| 1. With several accounts, check that the layout is correct     | No empty lines, all the view is correct |  |
| 13 | Passcode disabled - several accounts| 1. With several accounts, check that the layout is correct | No empty lines, all the view is correct |  |
| 14 | Instant upload disabled - several accounts| 1. With several accounts, check that the layout is correct     | No empty lines, all the view is correct |  |
| 15 | Instant upload enabled - several accounts| 1. With several accounts, check that the layout is correct     | No empty lines, all the view is correct |  |
|**Other options**||||||
| 16 | Help enabled| 1. Help branding option enabled | No empty lines, all the view is correct |  |
| 17 | Help disabled| 1. Help branding option disabled | No empty lines, all the view is correct |  |
| 18 | Recommend enabled| 1. Recommend branding option enabled | No empty lines, all the view is correct |  |
| 19 | Recommend disabled| 1. Recommend branding option disabled | No empty lines, all the view is correct |  |
| 20 | Feedback enabled| 1. Feedback branding option enabled | No empty lines, all the view is correct |  |
| 21 | Feedback disabled| 1.Feedback branding option disabled | No empty lines, all the view is correct |  |
| 22 | Impressum enabled| 1. Impressum branding option enabled | No empty lines, all the view is correct |  |
| 23 | Impressum disabled| 1.Impressum branding option disabled | No empty lines, all the view is correct |  |