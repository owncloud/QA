#### Multiselection 

#### PRs: https://github.com/owncloud/ios-app/pull/79

Devices: iPhoneX v12.1.2<br>
Server: 10.0.10

Number of tests: <br>
Number of automated tests: <br>
Coverage: <br>


---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | Automated |
| :-------- | :---- | :------- | :----: | :------------------------- | :-------: |
|**View**||||||
| Multiselection portrait (select mode) | Multiselection option in item menu | Correct view of the multiselection in portrait | P m12 t12 | | |
| Multiselection landscape (select mode) | Multiselection option in landscape | Correct view of the option in landscape | P m12 t12 | | |
|**Delete**||||||
| Delete one item | Delete only one item using Select mode| Item deleted | P m12 t12 |  |
| Delete several items | Delete several items using Select mode| Items deleted | P m12 t12|  |
| Delete all items | Delete all items using Select mode| All Items deleted | P m12 t12|  |
|**Move**||||||
| Move one item | Move only one item using Select mode| Item moved | P m12 t12 |  |
| Move several items | Move several items using Select mode| Items moved | P m12 t12|  |
| Move all items | Move all items using Select mode| All Items moved | P m12 t12|  |
| Move item repeated | Move items  which names already exist in the target location| Error message | P m12 t12| Repeated several times  |
| Move item deleted target | Move items to a target that is removed from other client| Error message | P m12 t12|  |
|**Offline**||||||
| Delete | Delete one item using Select mode with no connection| Action enqueued | P m12 t12 |  |
| Move | Move one item using Select mode with no connection| Action enqueued | P m12 t12 |  |
