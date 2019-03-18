#### Notch support

#### Pr: https://github.com/owncloud/android/pull/2454

Devices: Nexus 5X v8, Pixel 2 v9 


---

 
| Test | Test Case | Steps | Expected Result | Result | Related Comment
| :----: | :-------- | :---- | :-------------- | :-----: | :------
| 1 | Corner notch portrait | Check the drawer in a device with corner notch | Correct displayed | P m9 |
| 2 | Corner notch landscape | Check the drawer in a device with corner notch | Correct displayed | NA | Does not appear in landscape
| 3 | Double notch portrait | Check the drawer in a device with double notch | Correct displayed | P m9 |
| 4 | Double notch landscape | Check the drawer in a device with double notch | Correct displayed | NA | Does not appear in landscape
| 5 | Tall notch portrait | Check the drawer in a device with tall notch | Correct displayed | P m9 |
| 6 | Tall notch landscape | Check the drawer in a device with tall notch | Correct displayed | NA |  Does not appear in landscape
| 7 | "None" notch portrait | Check the drawer in a device with floating notch | Correct displayed | P m9 m8 |
| 8 | "None" notch landscape | Check the drawer in a device with floating notch | Correct displayed | P m9 m8 |
