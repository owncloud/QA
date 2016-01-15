###  Populate Server Credentials from URL

#### Pr: https://github.com/owncloud/ios/pull/515


---


TestID | Test Case | Steps | Expected Result | Result | Related Comment
:------------ | :------------- | :------------- | :-------------- | :----- | :------
| 1 | Server URL without username:password auth   |  1. Open app <br>2. Paste URL into Server URL field<br>3. Select Username field<br> |  4. Username and Password fields should remain blank<br> 5. Login button should be active     |
| 2 | Server URL with username:password auth   |  1. Open app <br>2. Paste URL with form `https://myuser:mypass@host.com` into Server URL field<br>3. Select Username field<br> |  4. Username field should be populated with `myuser`<br>5. Password field should be populated with `mypass`<br>6. Login button should be active      |
