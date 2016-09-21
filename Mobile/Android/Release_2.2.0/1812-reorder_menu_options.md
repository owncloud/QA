###  Reorder menu items in multiselect 

#### Pr: https://github.com/owncloud/android/pull/1812 

Devices: Nexus5 v6, Nexus7 v4.3, Nexus10 v5, Huawei 6P v7

Server: 9.1.1

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**One File options**||||||
| 1 | New order portrait|  Long press on a file | New order: Share, Download/Update, Av. offline, Open with, Send, Move, Copy, Rename, Details, Remove. Icons are also in tool bar, if room | P m6 t4  t5 m7| Send/Details options while sync... in text |
| 2 | New order landscape|  Long press on a file | New order: Share, Download/Update, Av. offline, Open with, Send, Move, Copy, Rename, Details, Remove. Icons are also in tool bar, if room | P m6 t4 t5 m7|  |
|**One Folder options**||||||
| 3 | New order portrait|  Long press on a folder | New order: Share, Download/Update, Move, Copy, Rename, Remove. Icons are also in tool bar, if room | P m6 t4 t5 m7|  |
| 4 | New order landscape|  Long press on a folder | New order: Share, Download/Update, Move, Copy, Rename, Remove. Icons are also in tool bar, if room | P m6 t4 t5 m7|  |
|**Several File options**||||||
| 5 | New order portrait|  Long press on a file and select several files | New order: Download/Update, Av. offline, Move, Copy, Remove. Icons are also in tool bar, if room | P m6 t4 t5 m7|  |
| 6 | New order landscape|  Long press on a file and select several files | New order: Download/Update, Av. offline, Move, Copy, Remove. Icons are also in tool bar, if room | P m6 t4 t5 m7|  |
|**Several Folder options**||||||
| 7 | New order portrait|  Long press on a folder and select several folders | New order: Download/Update, Move, Copy, Remove. Icons are also in tool bar, if room | P m6 t4 t5 m7|  |
| 8 | New order landscape|  Long press on a folder and select several folders| New order: Download/Update, Move, Copy, Remove. Icons are also in tool bar, if room | P m6 t4 t5 m7|  |
|**File&Folder options**||||||
| 9 | New order portrait|  Long press and select files and folders | New order: Download/Update, Move, Copy, Remove. Icons are also in tool bar, if room | P m6 t4 t5 m7|  |
| 10 | New order landscape|  Long press and select files and folders | New order: Download/Update, Move, Copy, Remove. Icons are also in tool bar, if room | P m6 t4 t5 m7|  |