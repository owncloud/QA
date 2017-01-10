###  Encoding password of share links 

#### PR: https://github.com/owncloud/android/pull/1869 

Devices: Huawei 6P v7, Nexus 5 v5.0.1

Server: 9.1.2


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :------ |
|**Password in links**|||||||
| 1 | Encoded character %20 (space) | 1. Set a password in a shared link that include the encoded character<br>2. Open the link |  The link is opened with the password | P m7 m5 |  |
| 2 | Encoded character %26 (&) | 1. Set a password in a shared link that include the encoded character<br>2. Open the link |  The link is opened with the password | P m7 m5 |  |
| 3 | Encoded character %2F (/) | 1. Set a password in a shared link that include the encoded character<br>2. Open the link |  The link is opened with the password | P m7 m5|  |
| 4 | Encoded character %25 (%) | 1. Set a password in a shared link that include the encoded character<br>2. Open the link |  The link is opened with the password | P m7 m5|  |
|**Only character**|||||||
| 5 | Encoded character %20 (space) | 1. Set a password in a shared link with only the character<br>2. Open the link |  The link is opened with the password | P m7 m5|  |
| 6 | Encoded character %26 (&) | 1. Set a password in a shared link with only the character<br>2. Open the link |  The link is opened with the password | P m7 m5|  |
| 7 | Encoded character %2F (/) | 1. Set a password in a shared link with only the character<br>2. Open the link |  The link is opened with the password | P m7 m5|  |
| 8 | Encoded character %25 (%) | 1. Set a password in a shared link with only the character<br>2. Open the link |  The link is opened with the password | P m7 m5|  |
|**Characters**|||||||
| 9 | Character (space) | 1. Set a password in a shared link with only the character<br>2. Open the link |  The link is opened with the password | P m7 m5|  |
| 10 | Character & | 1. Set a password in a shared link with only the character<br>2. Open the link |  The link is opened with the password | P m7 m5|  |
| 11 | Character / | 1. Set a password in a shared link with only the character<br>2. Open the link |  The link is opened with the password | P m7 m5|  |
| 12 | Character % | 1. Set a password in a shared link with only the character<br>2. Open the link |  The link is opened with the password | P m7 m5|  |