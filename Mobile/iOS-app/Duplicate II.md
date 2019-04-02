#### Duplicate 

#### PRs: https://github.com/owncloud/ios-app/pull/348

Devices: iPhoneX v12<br> 
Server: 10.1

---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | Automated |
| :-------- | :---- | :------- | :----: | :------------------------- | :-------: |
|**View**||||||
| Duplicate item | Duplicate an item in the list| Duplicated: <name> copy | P m12 t12 | | |
| Duplicate copy | Duplicate a copy item in the list| Duplicated: <name> copy 1 | P m12 t12 | | |
| Duplicate copy 1 | Duplicate a copy 1 item in the list| Duplicated: <name> copy 2 | P m12  t12| | |
| Duplicate copy when copy X exists | Rename a file with <name> copy<br>Duplicate a file with the same name | Duplicated: <name> copy 1 | P m12 t12 | | |