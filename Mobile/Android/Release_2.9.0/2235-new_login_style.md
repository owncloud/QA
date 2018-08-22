#### New login style

#### Pr: https://github.com/owncloud/android/pull/2235

Devices: Nexus 5X v8, Samsung Tab S2 v6
Server: 10.0.9

---

 
| Test n | Test Case | Steps | Expected Result | Result | Related Comment
| :----: | :-------- | :---- | :-------------- | :-----: | :------
|**Basic**||||||
| 1 | Portrait | Login in a basic auth server| Login view is correct| P m8 t6 |  |
| 2 | Landscape | Login in a basic auth server| Login view is correct| P m8 t6 |  |
| 3 | Edit | After login, go to Settings and select edit account| Edit view is correct| F m8 P t6 | Not complete |
|**OAuth2**||||||
| 4 | Portrait | Login in a OAuth2 server| Login view is correct| P m8 t7 |  |
| 5 | Landscape | Login in a OAuth2 server| Login view is correct| P m8 t7 |  |
| 6 | Edit | After login, go to Settings and select edit account| Edit view is correct| P m8 t7 |  |
|**SAML**||||||
| 7 | Portrait | Login in a SAML server| Login view is correct| P m8 t7|  |
| 8 | Landscape | Login in a SAML server| Login view is correct| P m8 t7|  |
| 9 | Edit | After login, go to Settings and select edit account| Edit view is correct| P m8 t7 |  |
|**Upgrade**||||||
| 10 | Upgrade | Upgrade the app grom the latest version| Login view is OK| P m8 |  |
|**Branding**||||||
| 11 | Use backr. image | 1. Set to true<br>2. Set to false | 1. Image displayed<br>2. Image not displayed | F m8 t7 | With false, blank |