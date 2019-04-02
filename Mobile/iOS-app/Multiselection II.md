#### Multiselection II

#### PRs: https://github.com/owncloud/ios-app/pull/327

Devices: iPhoneX v12, iPadAir v12<br>
Server: 10.0.10


---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | Automated |
| :-------- | :---- | :------- | :----: | :------------------------- | :-------: |
|**View**||||||
| Multiselection portrait (select mode) | Multiselection option in item menu | Correct view of the multiselection in portrait | P m12 t12| | |
| Multiselection landscape (select mode) | Multiselection option in landscape | Correct view of the option in landscape | P m12 t12 | | |
|**Open In**||||||
| Open In downloaded file | Open In only one file by using select mode| Item opened with the selected app (check both orientations) | P m12 t12 |  |
| Open In non downloaded file | Open In only one file by using select mode| Item downloaded and opened with the selected app (check both orientations) | P m12 t12 |  |
| Open In several files | Open In only one file by using select mode| Items opened with the selected app | P m12 t12 | FIXED: Crash |
| Open In one folder | Open In a folder by using select mode| Option disabled | P m12 t12 |  |
| Open In several items | Open In several files and folders by using select mode| Option disabled | P m12 t12 |  |
|**Copy**||||||
| Copy one item | Copy only one item using select mode| Item copied | P m12 t12|  |
| Copy several items | Copy several items using select mode| Items copied | P m12 t12|  |
| Copy item repeated | Copy items which names already exist in the target location| Error message | P m12 | |
| Copy item deleted target | Copy items to a target that is removed from other client| Error message | P m12 t12 | Error repeated -> to improve |
|**Duplicate**||||||
| Duplicate one item | Duplicate only one item using select mode| Item duplicated | P m12 t12|  |
| Duplicate several items  | Duplicate several files and folders using select mode| Items duplicated | P m12 t12 |  |
|**Regression**||||||
| Move items |Move several items using select mode| Items moved | P m12 t12 |  |
| Delete items | Delete several items using select mode | Items deleted | P m12 t12 |  |
