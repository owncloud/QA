###  Fix: users can not login in oc 10 

#### Pr: https://github.com/owncloud/android/pull/1891 

Devices: Nexus5 v6.0, Nexus10 v51.


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
| 1 | Login in oC 10 basic auth |  Login in a server oC 10 with basic auth | Success | P m6 t5|  |
| 2 | Login in oC 10 SAML |  Login in a server oC 10 with SAML | Success | - |  |
| 3 | Login in oC 9.1 basic auth |  Login in a server oC 9.1 with basic auth | Success | P m6 |  |
| 4 | Login in oC 9.1 SAML |  Login in a server oC 9.1 with SAML | Success | P m6 |  |
| 5 | Login in oC 9.0 basic auth |  Login in a server oC 9.0 with basic auth | Success | P m6 |  |
| 6 | Login in oC 9.0 SAML |  Login in a server oC 9.0 with SAML | Success | P m6  |  |
| 7 | Login in oC 8.2 basic auth |  Login in a server oC 8.2 with basic auth | Success | P m6 |  |
| 8 | Login in oC 8.2 SAML |  Login in a server oC 8.2 with SAML | Success | P m6 |  |
| 9 | Login in oC 8.1 basic auth |  Login in a server oC 8.1 with basic auth | Success | P m6 |  |
| 10 | Login in oC 8.1 SAML |  Login in a server oC 8.1 with SAML | Success | P m6 |  |