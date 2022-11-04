#### Webfinger 

#### PRs: https://github.com/owncloud/android/pull/3632

Devices: Samsung A51 Android12 <br>
Server: 10.11.0


---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | 
| :-------- | :---- | :------- | :----: | :------------------------- | 
|**View**||||||
| Login view | Open app with webfinger support | Only username displayed, with "Next" button. Correct view in both orientations | P m12  |  |
|**Actions**||||||
| Webfinger + Basic  | Correct lookup server, pointing to basic auth  | After solving lookup, username and password are displayed | NA  | No server available |
| Webfinger + OAuth2  | Correct lookup server, pointing to OAuth2  | After solving lookup, button to go to browser displayed | P m12  |  |
| Webfinger + OIDC  | Correct lookup server, pointing to OIDC  | After solving lookup, button to go to browser displayed |  P m12 |  |
| Edit connection  | Log in correctly in server with webfinger<br>2. Go to "Manage accounts" and click the key icon to edit the account<br>3. Reconnect to the server  | Correct re-authentication in edit mode | P m12 |  |
|**Errors**||||||
| Empty username | 1. Click on "Next" button when the Username is empty| Correct error message | P m12 |  |
| No connection | 1. Remove device connection<br>2. Enter username to connect webfinger | Correct error message | P m12 |  |
| Lookup server down | 1. Make server non accessible<br>2. Enter username to connect webfinger | Correct error message | P m12 |  |
|**Regression**||||||
| Webfinger empty + Basic  | Connect to basic auth server | Correct authentication | P m12  |  |
| Webfinger empty + OAuth2  | Connect to basic OAuth2 server | Correct authentication | P m12   |  |
| Webfinger empty + OIDC  | Connect to basic OIDC server | Correct authentication |  P m12  |  |
|**Upgrade**||||||
| From non-webfinger  | 1. Add an account from non-webfinger<br>2. Update to version with webfinger<br>3. In "Manage Accounts", press the key to re-authenticate<br>4. Remove account and add again  | Correct authentication in all cases|  P m12  |  |