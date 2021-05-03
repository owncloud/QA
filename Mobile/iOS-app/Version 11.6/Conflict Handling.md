### Conflict handling

#### PR: https://github.com/owncloud/ios-app/pull/961

Devices: iPhoneXR v14.4, iPadAir v13.4<br>
Server: 10.6

---

 
| Test Case | Steps | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- |
|**Conflict detection**|||
| Conflict detected | 1. Edit a file with device 1<br>2. Edit the same file with device 2<br>3. Submit changes with device 1<br>4. Submit changes with device 2 just a couple of seconds later | Device 1 uploads its new version correctly<br>Device 2 shows the conflict with three options: Cancel, Replace, Keep Both | P m14 F t13 | Dialog not totally visible |
|**Conflict handling**|||
| Cancel | 1. Cause a conflict following steps in Conflict detection case<br>2. In Device 2, Select `Cancel` |  Device 1 uploads its new version correctly<br> Local copy in Device 2 is deleted | F m14  t13 | File is not updated after cancelling |
| Replace | 1. Cause a conflict following steps in Conflict detection case<br>2. In Device 2, Select `Replace` |  Device 1 uploads its new version correctly<br> Device 2 replaces its version with the server version uploaded by Device 1<br>Device 1 updates its version to the Device 2 one | P m14 t13 |  |
| Keep Both | 1. Cause a conflict following steps in Conflict detection case<br>2. In Device 2, Select `Keep Both` |  Device 1 uploads its new version correctly<br> Device 2 keeps its version locally and creates a new file with the version uploaded by Device 1 | P m14 t13| Timestamp? |