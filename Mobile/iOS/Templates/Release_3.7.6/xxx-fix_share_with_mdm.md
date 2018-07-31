#### Adapt "Share with" for MDMs

#### Pr: https://github.com/owncloud/ios/pull/


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**non-wrapped**|||||
| 1 | Option enabled - root | Try to share with owncloud in root folder.<br>k-is-select-folder-available-share-in YES | Shared correctly | |  |
| 2 | Option enabled - non root | Try to share with owncloud in a folder with special characters in 3rd depth level.<br>k-is-select-folder-available-share-in YES| Shared correctly | |  |
| 3 | Option disabled | Try to share with owncloud. <br>k-is-select-folder-available-share-in NO | Only posible in root folder  | |  |
|**wrapped-not tunnelled**| **MI v4.1**||||
| 4 | Option enabled - root| Try to share with owncloud.<br>k-is-select-folder-available-share-in YES | Shared correctly | |  |
| 5 | Option enabled - non root | Try to share with owncloud in a folder with special characters in 3rd depth level.<br>k-is-select-folder-available-share-in YES | Shared correctly | |  |
| 6 | Option disabled | Try to share with owncloud.<br>k-is-select-folder-available-share-in NO | Only posible in root folder  |  |  |
|**wrapped-tunnelled**|**MI v4.1**||||
| 7 | Option disabled | Try to share with owncloud.<br>k-is-select-folder-available-share-in NO | Only posible in root folder  | |  |
|**icon in upper bar**|||||
| 8 | Icon correct | Try to share with owncloud | Icon of owncloud in upper bar  |  |  |
