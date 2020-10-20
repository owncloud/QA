###  Favorites in Share Sheet

#### PR: https://github.com/owncloud/ios-app/pull/817

Devices: iPhoneXR v13.4, iPadAir v13<br>
Server: 10.5

---

 
| Test Case | Steps | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- | 
|**List**|||||
| No favorites | Share from Photos (or any other app) to oC with no favorites | No favorites in list | P m13 | DONE: Hide if not favorites?.<br>FIXED: Multiselection in favorites picker|  |
| One folder root | Share from Photos (or any other app) to oC with one folder in favorites | Only that folder in the list | P m13 |  |  |
| One folder non-root | Share from Photos (or any other app) to oC with one folder (non-root) in favorites | Only that folder in the list | P m13 |  |  |
| Several folders root and non-root | Share from Photos (or any other app) having several folders (root and non-root) in favorites | All folders are listed | P m13 |  |  |
| File root | Share from Photos (or any other app) having a file in root in favorites | No favorites in the list| P m13 |  |  |
| File non-root | Share from Photos (or any other app) having a file in non-root in favorites | No favorites in the list| P m13 |  |  |
| Files and folders | Share from Photos (or any other app) having a files and folders in root and non-root in favorites | Only folders in the list| P m13 |  |  |
|**Save**|||||
| Folder root | Share from Photos (or any other app) to oC with one folder in favorites<br>Save the file | File correctly saved | P m13 |  |  |
| Folder non-root | Share from Photos (or any other app) to oC with one folder (non-root) in favorites | File correctly saved | P m13 |  |  |
