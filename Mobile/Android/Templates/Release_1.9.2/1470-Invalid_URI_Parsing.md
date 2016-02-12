###  Invalid URL (with ..) makes the app crash 

#### Pr: https://github.com/owncloud/android/pull/1470

Devices:

Server:


---

 
TestID | Test Case | Steps | Expected Result | Result | Related Comment
:------------ | :------------- | :------------- | :-------------- | :----- | :------
| 1 | URL with ".."   |  1. Type an incorrect URL which contains .. |  URL is rejected but the app does not crash  |
| 2 | Malformed URL |  1. Type a malformed URL |  URL is rejected  |
| 3 | Correct URL |  1. Type a correct URL |  URL is acepted  |
