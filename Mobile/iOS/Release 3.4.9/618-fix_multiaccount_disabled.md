###  BUG: Multiaccount disabled, bad settings view

#### Pr: https://github.com/owncloud/ios/pull/618 

Devices: iPhone 8 v9

Server: v9RC2

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :-----:| :-------- | :-----| :-------------- | :----: | :-------------- |
|**Multiaccount disabled**||||||
| 1 | Passcode enabled - Touch id disabled | 1. Check that the layout is correct     | No empty lines, all the view is correct | P m9 |
| 2 | Passcode enabled - Touch id enabled | 1. Check that the layout is correct     | No empty lines, all the view is correct | P m9 |
| 3 | Passcode disabled | 1. Check that the layout is correct     | No empty lines, all the view is correct | P m9 |
| 4 | Instant upload enabled | 1. Check that the layout is correct     | No empty lines, all the view is correct | P m9 |
| 5 | Instant upload disabled | 1. Check that the layout is correct     | No empty lines, all the view is correct | P m9 |
|**Multiaccount enabled**||||||
| 6 | Passcode enabled - Touch id disabled - 1 account | 1. With one account, check that the layout is correct     | No empty lines, all the view is correct | P m9 |
| 7 | Passcode enabled - Touch id enabled - 1 account| 1. With one account, check that the layout is correct     | No empty lines, all the view is correct | P m9 |
| 8 | Passcode disabled - 1 account| 1. With one account, check that the layout is correct     | No empty lines, all the view is correct | P m9 |
| 9 | Instant upload disabled - 1 account| 1. With one account, check that the layout is correct     | No empty lines, all the view is correct | P m9 |
| 10 | Instant upload enabled - 1 account| 1. With one account, check that the layout is correct     | No empty lines, all the view is correct | P m9 |
| 11 | Passcode enabled - Touch id disabled - several accounts | 1. With several  accounts, check that the layout is correct     | No empty lines, all the view is correct | P m9 |
| 12 | Passcode enabled - Touch id enabled - several accounts| 1. With several accounts, check that the layout is correct     | No empty lines, all the view is correct | P m9 |
| 13 | Passcode disabled - several accounts| 1. With several accounts, check that the layout is correct | No empty lines, all the view is correct | P m9 |
| 14 | Instant upload disabled - several accounts| 1. With several accounts, check that the layout is correct     | No empty lines, all the view is correct | P m9 |
| 15 | Instant upload enabled - several accounts| 1. With several accounts, check that the layout is correct     | No empty lines, all the view is correct | P m9 |
|**Other options**||||||
| 16 | Help enabled| 1. Help branding option enabled | No empty lines, all the view is correct | P m9 |
| 17 | Help disabled| 1. Help branding option disabled | No empty lines, all the view is correct | P m9 |
| 18 | Recommend enabled| 1. Recommend branding option enabled | No empty lines, all the view is correct | P m9 |
| 19 | Recommend disabled| 1. Recommend branding option disabled | No empty lines, all the view is correct | P m9 |
| 20 | Feedback enabled| 1. Feedback branding option enabled | No empty lines, all the view is correct | P m9 |
| 21 | Feedback disabled| 1.Feedback branding option disabled | No empty lines, all the view is correct | P m9 |
| 22 | Impressum enabled| 1. Impressum branding option enabled | No empty lines, all the view is correct | P m9 |
| 23 | Impressum disabled| 1.Impressum branding option disabled | No empty lines, all the view is correct | P m9 |