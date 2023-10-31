###  Summary 

#### PR: https://github.com/owncloud/ios/pull/529
#### Library PR: https://github.com/owncloud/ios/pull/108


Test ID| Test case     | Steps           | Expected result | Result | Comments
|:----|:------------- |:---------------|:-------------|:-------------:|:------------
|1| Search with LDAP users| 1. Login in a server which uses LDAP<br> 2. Select to share a file/folder with users<br> 3. Input a string. Use possible names and surnames of users<br> 4. In web browser, perform the same action.| 3. Users matching the pattern are returned <br> 4. It's obtained the same result as in device| P (m9, t8)| Servers 8.2.x.<br> Tested too with groups
|2| Search with non LDAP users | Perform the same actions as in Test Case 1 with non LDAP users| The result in server and device is the same|  P (m8, t9)|  Servers 8.2.x <br> Tested too with groups
