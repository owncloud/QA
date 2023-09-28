#### Webfinger 

Server(s): <br>
Device(s): <br>
Execution date: <br>
Tester:  <br>
Context: <br>

---

**1. Non Authenticated Webfinger**

Pre-requisite: built app with Webfinger support. Field `webfinger_lookup_server` set up in advance in [setup.xml](https://github.com/owncloud/android/blob/master/owncloudApp/src/main/res/values/setup.xml) file. 
 
| Test Case | Steps | Expected | Result | Related Comment / Defect  | 
| :-------- | :---- | :------- | :----: | :------------------------ | 
|**View**||||||
| Login view | Install app from scratch | Only username file displayed, with `Proceed` button. Correct view in both orientations |  |  |
|**Actions**||||||
| Webfinger + Basic Auth | Enter correct username | After resolving, username and password fields are displayed | NA  | No basic auth server available |
| Webfinger + OAuth2  | Enter correct username | After resolving, app goes directly to browser to complete authentication and authorization |   |  |
| Webfinger + OIDC  | Enter correct username | After resolving, app goes directly to browser to complete authentication and authorization|   |  |
| Edit connection  | 1. Log in correctly in server with non authenticated webfinger<br>2. Open drawer and select "Manage accounts"<br>3. Click the key button to edit the connected credentials<br>4. Enter credentials and submit them | Re-authentication done in edit mode |  |  |
|**Errors**||||||
| Empty username | 1. Click on `Proceed` button when the `Username` field is empty| Error: Username empty |  |  |
| No connection | 1. Remove device connection<br>2. Enter `Username` and click on `Proceed`| Error: Device is not connected to a network |  |  |
| Lookup server down | 1. Make lookup server not accessible<br>2. Enter username and click on `Proceed` | Error: It was no found |  |  |


**2. Authenticated Webfinger**