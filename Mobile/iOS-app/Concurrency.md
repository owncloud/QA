###  Concurrency

#### Pr: https://github.com/owncloud/ios-app/pull/369

Devices: iPhone 6S Plus v12, iPad Air v12<br>
Server: 10.1

---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | Automated |
| :-------- | :---- | :------- | :----: | :------------------------- | :-------: |
|**Actions (10 as budget)**|
| Copy 5 | Copy 5 big folders to other location at the time | Correctly copied executed concurrently. Check in status view | P m12 t12 |  |  |
| Move 5 | Move 5 big folders to other location at the time | Correctly copied executed concurrently. Check in status view | P m12 t12 |  |  |
| Duplicate 5 | Duplicate 5 items | Correctly copied executed concurrently. Check in status view | P m12 t12 |  |  |
| Remove 5 | Remove 5 items | Correctly copied executed concurrently. Check in status view | P m12 t12 |  |  |
| Copy 15 | Copy 15 items to other location at the time | Only 10 are concurrent. At the end, action ends correctly. Check in status view | P m12 t12 | |  |
| Move 15 | Move 15 items to other location at the time | Only 10 are concurrent. At the end, action ends correctly. Check in status view | P m12 t12 |  |  |
| Duplicate 15 | Duplicate 15 items  | Only 10 are concurrent. At the end, action ends correctly. Check in status view | P m12 t 12|  |  |
| Remove 15 | Remove 15 items | Only 10 are concurrent. At the end, action ends correctly. Check in status view | P m12 t12 |  |  |
| Rename concurrent | Perform 5 operations at the time an item is rename | Correctly renamed. Check in status view  | P m12 t12 |  |  |
| Change value | Set 20 as number of actions<br> Execute 15 actions<br>Execute 25 actions| 15 are concurrent, 25 are not (only 15)| P m12 | Operations run very fast, difficult to keep many operations at the time |  |
|**Transfers (6 as budget, 3 + 3)**|
| Upload 3 | Upload 3 items to oC | Correctly uploaded, concurrently. Check in status view | P m12 t12 |  |  |
| Download 3 | Download 3 items from oC | Correctly downloadded, concurrently. Check in status view | P m12 t12 |  |  |
| Upload 7 | Upload 7 items to oC | Only 3 are concurrent. At the end, action ends correctly. Check in status view | P m12 t12 |  |  |
| Download 7 | Download 7 items from oC | Only 3 are concurrent. At the end, action ends correctly. Check in status view | P m12 t12 |  |  |
| 2 + 1 | Upload 2 items and download 1 to oC | Correctly uploaded, concurrently. Check in status view | P m12 t12 |  |  |
| 4 + 1 | Upload 4 items and download 1 to oC | Only 3 items are upload concurrently at the time the download is done | P m12 t12|  |  |
| 5 + 5 | Upload 5 items and download another 5 from oC | Only 3 items from each type are done concurrently | P m12 t12 |  |  |
| Change value | Set 12 as number of transfers<br> Execute 10 transfers<br>Execute 15 transfers| 10 are concurrent, 15 are not (only 12)| P m12 |  |  |
| Cancel one download | Trigger a download<br>Cancel it| Transfer not completed | P m12 t12|  |
| Cancel all download | Trigger several transfers<br>Cancel all any ongoing transfer meanwhile it is being done| Transfers are not completed | P m12 t12 |  |
| Cancel one upload | Trigger a upload<br>Cancel it| Transfer not completed | P m12 t12 |  |
| Cancel all uploads | Trigger several transfers<br>Cancel all any ongoing transfer meanwhile it is being done| Transfers are not completed | P m12 t12 |  |
|**Everything**|
| 5 actions + 3 transfers | Upload 3 items and duplicate 5 items at the time  | All of the run concurrently | P m12 t12 |  |  |
| 5 actions + 5 transfers | Download 5 items and duplicate 5 items at the time  | Only 3 transfers run concurrently.  | P m12 t12 |  |  |
| 15 actions + 3 transfers | Upload 3 items and move 15 items at the time  | Only 10 actions run concurrently.  | P m12 t12 |  |  |
| 15 actions + 8 transfers | Upload 4 items, download 4 items and copy 15 items at the time  | Only 10 actions and 3 transfers run concurrently.  | P m12 t12 |  |  |
|**All category**|
| 1 action | Upload 3 items, download another 3 and duplicate another 3  | They are execute one by one | P m12 t12 |  |  |
| 5 actions | Upload 3 items, download another 3 and duplicate another 3  | Only five at the time | P m12 t12 |  |  |