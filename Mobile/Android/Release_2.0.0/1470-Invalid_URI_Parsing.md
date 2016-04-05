###  Invalid URL (with ..) makes the app crash 

#### Pr: https://github.com/owncloud/android/pull/1470

Devices: Phone Nexus 5 v5.0.1, Tablet Nexus 7 v4.3

Server: 8.2.2 and 9


---

 
TestID | Test Case | Steps | Expected Result | Result | Related Comment
:------------ | :------------- | :------------- | :-------------- | :----- | :------
| 1 | URL with ".."   |  1. Type an incorrect URL which contains .. |  URL is rejected but the app does not crash  | P m5 t4
| 2 | Malformed URL |  1. Type a malformed URL |  URL is rejected  | P m5 t4
| 3 | Correct URL |  1. Type a correct URL |  URL is acepted  | P m5 t4
