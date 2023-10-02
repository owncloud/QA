###  Remove support to capability number of characters to search sharee

#### Pr: https://github.com/owncloud/android/pull/2853

Devices: Pixel2 Android 10<br>
Server: 10.4.1

---

 
| | With no server value (default = 2) | With server value = 1 | With server value = 2 | With server value = 5 |
| :-: | :-: | :-: | :-: | :-: |
| 1 char | Request sent. No results retrieved  | Request sent. Matches retrieved | Request sent. No results retrieved  | Request sent. No results retrieved |
| 2 char | Request sent. Matches retrieved | Request sent. Matches retrieved | Request sent. Matches retrieved  | Request sent. No results retrieved |
| 3 char | Request sent. Matches retrieved | Request sent. Matches retrieved | Request sent. Matches retrieved | Request sent. No results retrieved |
| 5 char | Request sent. Matches retrieved | Request sent. Matches retrieved | Request sent. Matches retrieved | Request sent. Matches retrieved |