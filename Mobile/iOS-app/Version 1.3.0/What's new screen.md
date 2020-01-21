### What's new screen

#### PRs: https://github.com/owncloud/ios-app/pull/572

Device/s: <br>
Server: 10.3.2


---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | 
| :-------- | :---- | :------- | :----: | :------------------------- | 
|**Fresh install**||||||
| Fresh install | Install the app and open it | What's new not displayed  | P m12 t13 |  |  |
|**Upgrade**||||||
| Upgrade from latest | Upgrade the app and open it | What's new displayed  |  |  |  |
| Reopen | After upgrading and watching the screen, kill the app and open it again  | What's new is not displayed |  |  |  |
| Switch | After upgrading and watching the screen, switch to other app and switch again to oC  | What's new is not displayed |  |  |  |
| Reopen in account | After upgrading and watching the screen, attach an account, perform some operations, kill the app and open it again  | What's new is not displayed |  |  |  |
| Passcode Lock |  | What's new is not displayed |  |  |  |