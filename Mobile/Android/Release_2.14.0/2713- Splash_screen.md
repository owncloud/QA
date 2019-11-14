###  Splash screen

#### Pr: https://github.com/owncloud/android/pull/2713

Devices: Xiaomi MIA2 v9, Nexus9 v7 <br>
Server: 10.3

---

 
| Test Case | Description | Expected | Result | Comments  
| :-------- | :---------- | :------- | :----: | :---------- 
| From scratch portrait | Install the app from scratch and open it (portrait) | Splash screen displayed and then, welcome wizard | P m9 t9 | Welcome wizard in release mode |  |
| From scratch landscape | Install the app from scratch and open it (landscape) | Splash screen displayed and then, welcome wizard | P m9 t9 | Welcome wizard in release mode |  |
| Kill app (portrait) | From any view, kill the app<br>Reopen the app | Splash screen displayed and then, file list | P m9 t9|  |  |
| Kill app (landscape) | From any view, kill the app<br>Reopen the app | Splash screen displayed and then, file list | P m9 t9 |  |  |
| No accounts | Remove all accounts in the app, and kill it | Splash screen displayed and then, login view | P m9 t9 |  |  |
| Passcode | Create a passcode in settings<br>Kill the app and reopen it | Splash screen displayed and then, passcode view | P m9 t9 |  |  |
| Pattern | Create a pattern in settings<br>Kill the app and reopen it | Splash screen displayed and then, pattern view | P m9 t9 |  |  |
| Fingerprint | Enable fingerprint lock in settings<br>Kill the app and reopen it | Splash screen displayed and then, fingerprint view | P m9 t9 |  |  |
|**Branding**| 1 device||||
| Background color | Set a new background color in setup.xml (property: splash_background)  | Splash screen displayed with the new background color | P m9 |  |  |
| Logo | Set a new logo in drawable/splash_image.png  | Splash screen displayed with the new logo | P m9 |  |  |
| Image | Set a new background image in drawable/splash_image.png  | Splash screen displayed with the new image | P m9 |  |  |

