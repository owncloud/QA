### What's new screen

#### PRs: https://github.com/owncloud/ios-app/pull/572

Device/s: iPhoneX v13.3, iPhone6 V12.2, iPadPro v13.3<br>
Server: 10.3.2


---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | 
| :-------- | :---- | :------- | :----: | :------------------------- | 
|**Fresh install**||||||
| Fresh install | Install the app and open it | What's new not displayed  | P m12 m13 t13 | What's new displayed | FIXED: not in first installation |
|**Upgrade**||||||
| Upgrade from latest | Upgrade the app and open it | What's new displayed  | P m13 m12 t13| At least one account must be attached! |  |
| Reopen | After upgrading and watching the screen, kill the app and open it again  | What's new is not displayed | P m13 m12 t13 |  |  |
| Switch | After upgrading and watching the screen, switch to other app and switch again to oC  | What's new is not displayed | P m13 m12 t13 |  |  |
| Reopen in account | After upgrading and watching the screen, attach an account, perform some operations, kill the app and open it again  | What's new is not displayed | P m13 m12 t13 |  |  |
| Passcode Lock | Enable the passcode lock in old version and upgrade | What's new is displayed after unlocking | P m13 m12 t13 |  |  |
| Face ID | Enable the face ID in old version and upgrade | What's new is displayed after unlocking | P m13 t13 |  |  |
| Touch ID | Enable the touch ID in old version and upgrade | What's new is displayed after unlocking | P m12 |  |  |