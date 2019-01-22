#### Copy 

#### PRs: https://github.com/owncloud/ios-app/pull/207

Devices: iPadAir2 v12<br>
Server: 10.0.9

Number of tests: <br>
Number of automated tests: <br>
Coverage: <br>


---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | Automated |
| :-------- | :---- | :------- | :----: | :------------------------- | :-------: |
|**View**||||||
| Copy option portrait| Copy option in item menu | Correct view of the option in portrait | P t12 m12 | | |
| Copy option landscape| Copy option in landscape by swiping | Correct view of the option in landscape | P t12 m12 | | |
|**Actions with copy option**||||||
| Copy file | 1. Select copy option from the card<br>2. Select a location | File copied | P t12 m12 |  |
| Copy folder | 1. Select copy option from the card<br>2. Select a location | Folder copied | P t12 m12 | |
| Copy folder to itself | 1. Select copy option from the card of a folder<br>2. Select as location the folder itself | Not allowed | F t12 m12 | Weird error message, same as Move. Check separately |
| Copy to same location | 1. Select copy option from the card of a folder<br>2. Select as location the current location | Nothing happens | P t12 m12 | Correct error message |
| Copy to inexistent location | 1. Select copy option from the card<br>2. Select a location<br>3. Before confirming, remove the location in web UI | Error message | P t12 m12 | |
| Copy to a place with same name | 1. Select copy option from the card<br>2. Select a location in which there is an item with the same name | Error message | P t12 m12 | |
| Copy with no connection | 1. Select copy option from the card after removing connection<br>2. Recover connection | File is copied to the target folder| P t12 m12 | |
| Copy with no server connection | 1. Select copy option from the card after removing server connection | Error message | F t12 m12 | Check separately |