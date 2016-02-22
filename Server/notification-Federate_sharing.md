###  Notification Federated Sharing 

#### Pr:  

Browsers:


Server:
oc9

---

 
| Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
| **Having notification app enable** ||||||
|  1 notification | 1.- U1@s1 shares a file with u2@s2 <br> 2.- Log in as u2@s2 | A notification is shown||Test this test case with Firefox, Chrome, Safari and Edge|
| notification - accept it | 1.- U1@s1 shares with u2@s2 <br> 2.- Log in as u2@s2 3.- Accept it|The file is added to us2@s2 file list|||
| notification - reject it | 1.- U1@s1 shares with u2@s2 <br> 2.- Log in as u2@s2 3.- reject it| The notification is deleted and the file is not added|||
| notification - do nothing | 1.- U1@s1 shares with u2@s2 <br> 2.- Log in as u2@s2 3.- The notification is shown <br> 4.- Log in as us2@s2 using another browser | The notification is there||
| notification - cancel | 1.- U1@s1 shares a file with u2@s2 <br> 2.- us1@s1 remove the fed sharing with us2@s2 <br>  Log in as u2@s2 | Nothing is shown||
|  Special characters |  1.- U1@s1 shares a folder whose name contains special characters with u2@s2 <br> 2.- Log in as u2@s2 | The notification is correctly shown |||
|  Same shared name |  1.- U1@s1 shares a file called "file" with u2@s2 <br>  1.- U2@s1 shares a file called "file" with u2@s2 <br> 3.- Log in as u2@s2 | The 2 notifications are correctly shown |||
| **Having notification app disable** ||||||
|  1 notification | 1.- U1@s1 shares a file with u2@s2 <br> 2.- Log in as u2@s2 |a pop up is shown||Test this test case with Firefox, Chrome, Safari and Edge|

