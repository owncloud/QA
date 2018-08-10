#### Adapt "Share with" for MDMs

#### Pr: https://github.com/owncloud/ios/pull/1068

Server: 10.0.8<br>
Devices: iPadAir v11, iPhoneX v11


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**non-wrapped**|||||
| 1 | Option enabled - root | Try to share with owncloud in root folder.<br>k-is-select-folder-available-share-in YES | Shared correctly | P t11 m11|  |
| 2 | Option enabled - non root | Try to share with owncloud in a folder with special characters in 3rd depth level.<br>k-is-select-folder-available-share-in YES| Shared correctly | P t11 m11|  |
| 3 | Option disabled | Try to share with owncloud. <br>k-is-select-folder-available-share-in NO | Only posible in root folder  | P t11 m11|  |
|**wrapped-not tunnelled**| **MI v4.1**||||
| 4 | Option enabled - root| Try to share with owncloud.<br>k-is-select-folder-available-share-in YES | Shared correctly | P t11 m11|  |
| 5 | Option enabled - non root | Try to share with owncloud in a folder with special characters in 3rd depth level.<br>k-is-select-folder-available-share-in YES | Shared correctly | P t11 m11|  |
| 6 | Option disabled | Try to share with owncloud.<br>k-is-select-folder-available-share-in NO | Only posible in root folder  | P t11 m11 |  |
|**wrapped-tunnelled**|**MI v4.1**||||
| 7 | Option disabled | Try to share with owncloud.<br>k-is-select-folder-available-share-in NO | Only posible in root folder  | P t11 m11|  |
|**icon in upper bar**|||||
| 8 | Icon correct | Try to share with owncloud | Icon of owncloud in upper bar  | P t11 m11 |  |
