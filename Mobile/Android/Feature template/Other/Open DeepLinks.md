#### Open Deep Links


**Server(s)**: <br>
**Device(s)**: <br>
**Execution date**: <br>
**Tester**: <br>
**Context**: <br>

---

 
| Test Case | Steps | Expected Result | Result | Related Comment |
| :-------- | :---- | :-------------- | :----: | :-------------- |
|**Brandable options**|||||||
| Default scheme (oC10) | 1.Let default scheme `owncloud://` in `setup.xml` file, in field `deep_link_uri_schemes`<br>2. Create a link with that scheme<br>3. Open the link from outside the app | App is opened |  |  |
| Custom scheme (oC10)  | 1. Set a custom scheme like `test://` in `setup.xml` file<br>2. Create a link with that scheme<br>3. Open the link from outside the app | App is opened | |  |
| oCIS | 1. Open an oCIS instalnce with support to deep links (wopi) and click on the link icon of any item<br>2. Create a deeplink with that link<br>3. Open the link from outside the app<br>4. Click on the `OPEN` | 3. Opened in browser but in the upper side, there is an option to open the app<br>4. App opened | |  |
| http scheme | 1. Use `http://` scheme in `setup.xml` file<br>2. Create a link with that scheme<br>3. Open the link from outside the app | Opened in browser  |  | |
| https scheme | 1. Use `https://` scheme in `setup.xml` file<br>2. Create a link with that scheme<br>3. Open the link from outside the app | Opened in browser |  |  |
|**Other**|||
| App without accounts | 1. Create a link over an existing host<br>2. Remove all accounts from the app<br>3. Open the link from outside the app | Redirected to login view with error message: `You need a login user to open the link` |  |  |
| Incorrect format | 1. Create a link with an incorrect format like `oc://android.oc.com/12345/6789`<br>2. Open the link from outside the app | Correct error message: `Invalid deep link format`|  ||
| App not installed | 1. Create a link over an existing host<br>2. Uninstall the app | App not opened | |  |