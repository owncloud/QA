### Set folders at the top (new Setting)

#### Pr: https://github.com/owncloud/ios-app/pull/680

Devices: iPhone XR v13.4, iPadAir v13.4<br>
Server: 10.4.1

---

 
| Test Case | Steps | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- | 
|**View**|
| Setting "Show folders at the top" | Open Settings view | In Advanced Settings section, new setting "Show folders at the top" | P m13 t13|  |
|**Setting enabled**|
| Sort by name asc | List with files and folders<br>Set as sort method "Sort by name asc" | Folders sorted by name first and then, files sorted by name. Both ascending | P m13 t13|  |
| Sort by name desc | List with files and folders<br>Set as sort method "Sort by name desc" | Folders sorted by name first and then, files sorted by name. Both descending | P m13 t13|  |
| Sort by date asc | List with files and folders<br>Set as sort method "Sort by date asc" | Folders sorted by date first and then, files sorted by date. Both ascending | P m13 t13|  |
| Sort by date desc | List with files and folders<br>Set as sort method "Sort by date desc" | Folders sorted by date first and then, files sorted by date. Both descending | P m13 t13|  |
| Sort by kind asc | List with files and folders<br>Set as sort method "Sort by kind asc" | Folders sorted by kind first and then, files sorted by kind. Both ascending | P m13 t13|  |
| Sort by kind desc | List with files and folders<br>Set as sort method "Sort by kind desc" | Folders sorted by kind first and then, files sorted by kind. Both descending | P m13 t13|  |
| Sort by size asc | List with files and folders<br>Set as sort method "Sort by size asc" | Folders sorted by size first and then, files sorted by size. Both ascending | P m13 t13|  |
| Sort by size desc | List with files and folders<br>Set as sort method "Sort by size desc" | Folders sorted by size first and then, files sorted by size. Both descending | P m13 t13|  |
| Sort by shared asc | List with files and folders<br>Set as sort method "Sort by shared asc" | Folders sorted by shared first and then, files sorted by shared. Both ascending | P m13 t13|  |
| Sort by shared desc | List with files and folders<br>Set as sort method "Sort by shared desc" | Folders sorted by shared first and then, files sorted by shared. Both descending | P m13 t13|  |
| Only folders | List with only folders<br>Check all sorting methods | All sorting methods work as expected | P m13 t13|  |
| Only files | List with only files<br>Check all sorting methods | All sorting methods work as expected | P m13 t13|  |
| Empty list | Create a new folder and browse into it (empty list) | No sorting methods available| P m13 t13|  |
| Same field | Duplicate a file in the list<br>Sort by size<br>Sort by date<br>Sort by kind| When two items has the same size/date/kind, is place up/down depending the name asc/desc| P m13 t13|  |
|**Setting disabled**|
| Sort by name asc | List with files and folders<br>Set as sort method "Sort by name asc" | List sorted by name, no consideration for files/folders. Both ascending | P m13 t13|  |
| Sort by name desc | List with files and folders<br>Set as sort method "Sort by name desc" | List sorted by name, no consideration for files/folders. Both descending | P m13 t13|  |
| Sort by date asc | List with files and folders<br>Set as sort method "Sort by date asc" | List sorted by date, no consideration for files/folders. Both ascending |  P m13 t13|  |
| Sort by date desc | List with files and folders<br>Set as sort method "Sort by date desc" | List sorted by date, no consideration for files/folders. Both descending | P m13 t13|  |
| Sort by kind asc | List with files and folders<br>Set as sort method "Sort by kind asc" | List sorted by kind, no consideration for files/folders. Both ascending | P m13 t13|  |
| Sort by kind desc | List with files and folders<br>Set as sort method "Sort by kind desc" | List sorted by kind, no consideration for files/folders. Both descending | P m13 t13|  |
| Sort by size asc | List with files and folders<br>Set as sort method "Sort by size asc" | List sorted by size, no consideration for files/folders. Both ascending |  P m13 t13|  |
| Sort by size desc | List with files and folders<br>Set as sort method "Sort by size desc" | List sorted by size, no consideration for files/folders. Both descending |P m13 t13 |  |
| Sort by shared asc | List with files and folders<br>Set as sort method "Sort by shared asc" | List sorted by shared, no consideration for files/folders. Both ascending | P m13 t13|  |
| Sort by shared desc | List with files and folders<br>Set as sort method "Sort by shared desc" | List sorted by shared, no consideration for files/folders. Both descending | P m13 t13|  |
| Only folders | List with only folders<br>Check all sorting methods | All sorting methods work as expected | P m13 t13|  |
| Only files | List with only files<br>Check all sorting methods | All sorting methods work as expected | P m13 t13|  |
| Empty list | Create a new folder and browse into it (empty list) | No sorting methods available| P m13 t13|  |
| Same field | Duplicate a file in the list<br>Sort by size<br>Sort by date<br>Sort by kind| When two items has the same size/date/kind, is place up/down depending the name asc/desc| P m13 t13|  |
