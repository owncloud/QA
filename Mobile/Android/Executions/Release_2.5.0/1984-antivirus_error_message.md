###  Antivirus error message 

#### Pr: https://github.com/owncloud/android/pull/1984 

Devices: Huawei 6P v7, Samsung Galaxy Tab S2

Server: v9.1l, v10.0.2


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :------ |
| 1 | Notification | Upload eicar.com file | Upload fails. Error shown in notifications bar. Check both orientations  | P m7 t5|  |
| 2 | Uploads view | Upload eicar.com file | Upload fails. Error shown in uploads view. Check both orientations  | P m7 t5 | Message: Unsupported media type |