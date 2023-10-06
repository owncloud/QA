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
| Scheme | 1. Set a custom scheme like `test://` in `setup.xml` file<br>2. Create a link with that scheme<br>3. Open the link from outside the app | App is opened |  |  |
| Host | 1. Set a custom host in `setup.xml` file<br>2. Create a link with that host<br>3. Open the link from outside the app | App is opened |  |  |
| Scheme & Host | 1. Set a custom scheme and host in `setup.xml` file<br>2. Create a link with that setup<br>3. Open the link from outside the app | App is opened |  |  |
| http scheme | 1. Use `http://` scheme in `setup.xml` file<br>2. Create a link with that scheme<br>3. Open the link from outside the app | App is opened after desambiguation |  |  |
| https scheme | 1. Use `https://` scheme in `setup.xml` file<br>2. Create a link with that scheme<br>3. Open the link from outside the app | App is opened after desambiguation |  |  |
|**Hosts**|||||||
| Regular host | 1. Create a link over a regular host (like `owncloud.com`) <br>3. Open the link from outside the app | App is opened |  |  |
| Subdomain host | 1. Create a link over a host with subdomain (like `cloud.owncloud.com`) <br>3. Open the link from outside the app | App is opened |  |  |
| Subfolder host | 1. Create a link over a host with subfolder (like `mydomain.com/owncloud`) <br>3. Open the link from outside the app | App is opened |  |  |
|**Other**|||
| App not installed | 1. Create a link over an existing host<br>2. Uninstall the app | Opened in browser |  |  |