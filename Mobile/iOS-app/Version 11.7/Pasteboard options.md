#### Pasteboard options

#### PRs: https://github.com/owncloud/ios-app/pull/514

Device/s: iPhoneXR v14.6, iPadAir2 v13.4 <br>
Server: 10.7



---

 
| Test Case | Steps | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------: | 
|**View**||||||
| Cut | Open menu from any item | Cut option displayed in both orientations| P m14 t13 | 
| Paste | In root folder, open three-dot-menu | Paste option is displayed in both orientations | P m14 t13|  | 
| Paste II | Copy one item<br>Browse to a folder and open three-dot-menu | Paste option is displayed in both orientations| P m14 t13|  | 
| Copy options | Open menu from any item<br>Select `Copy` | Options displayed: `Choose destination directory` and `Copy to clipboard` | P m14 t13|  | 
|**Clipboard same oC account**||||||
|Copy a non-downloaded file | 1. Copy one file that is not downloaded<br>2. Paste in another location | Correctly pasted | P m14 t13
|Copy a downloaded file | 1. Copy one file that is downloaded<br>2. Paste in another location | Correctly pasted | P m14 t13
|Cut a non-downloaded file | 1. Cut one file that is not downloaded<br>2. Paste in another location | Correctly pasted and removed from original location | P m14 t13
|Cut a downloaded file | 1. Cut one file that is downloaded<br>2. Paste in another location | Correctly pasted and removed from original location | P m14 t13
|Copy one folder | 1. Copy one folder<br>2. Paste in another location | Correctly pasted | P m14 t13
|Cut one folder | 1. Cut one folder<br>2. Paste in another location | Correctly pasted and removed from original location | P m14 t13
|Copy several files | 1. Copy 10 files<br>2. Paste in another location | Correctly pasted | P m14 t13 | FIXED: Only one item is pasted
|Cut several files | 1. Cut 10 files<br>2. Paste in another location | Correctly pasted and removed from original location | P m14 t13 | 
|Copy several folders | 1. Copy many folders<br>2. Paste in another location | Correctly pasted and removed from original location | P m14 t13 | FIXED: Only one item is pasted
|Cut several folders | 1. Cut 10 folders<br>2. Paste in another location | Correctly pasted and removed from original location | P m14  | 
|Copy many files | 1. Copy 100 items to clipboard<br>2. Paste in another location | Correctly pasted | F m14 t13 | Seems to be stucked
|Cut many files | 1. Cut 100 items to clipboard<br>2. Paste in another location | Correctly pasted and removed from original location | P m14 t13 | 
|**Clipboard other oC account**||||||
|Copy a non-downloaded file | 1. Copy one non-downloaded file<br>2. Paste in another oC account  | Correctly pasted | P m14 t13 | FIXED: Bad file name
|Copy a downloaded file | 1. Copy one downloaded file<br>2. Paste in another oC account  | Correctly pasted | P m14 t13 | FIXED: Bad file name
|Cut one file | 1. Cut one file<br>2. Paste in another oC account | Correctly pasted and removed from original location | NA | `Cut` only works in the same account
|Cut several files | 1. Cut 10 files<br>2. Paste in another oC account | Correctly pasted and removed from original location | P m14 t13| 
|Cut many files | 1. Cut 100 files<br>2. Paste in another oC account | Correctly pasted and removed from original location | P m14 t13| 
|Copy one folder | 1. Copy one folder<br>2. Paste in another oC account | Correctly pasted | NA | Not supported
|Cut one folder | 1. Cut one folder<br>2. Paste in another oC account | Correctly pasted and removed from original location | NA | `Cut` only works in the same account
|Copy many files | 1. Copy many files<br>2. Paste in another oC account | Correctly pasted | P m14 t13 | FIXED: Only one item is pasted
|Copy many folders | 1. Copy many folders<br>2. Paste in another oC account | Correctly pasted and removed from original location | NA | Not supported
|**Clipboard to other apps**||||||
|Copy one file | 1. Copy one file<br>2. Paste to another location in Files App  | Correctly copied | P m14 t13 | FIXED: Bad name
|Cut one file | 1. Cut one file<br>2. Paste in another location in Files App | Correctly pasted and removed from original location | NA | Not supported 
|Copy one folder | 1. Copy one folder<br>2. Paste to another location in Files App | Correctly copied | NA | Not supported
|Cut one folder | 1. Cut one folder<br>2. Paste in another location in Files App | Correctly pasted and removed from original location | NA | Not supported 
|Copy many files | 1. Copy many files<br>2. Paste to another location in Files App | Correctly copied | P m14 t13 | FIXED: Only one is pasted
|Copy many folders | 1. Copy many folders<br>2. Paste to another location in Files App | Correctly copied | NA | Not supported
|**Copy to directory**||||||
|Copy one file | 1. Copy one file<br>2. Choose directory | Correctly copied | P m14 t13
|Copy one folder | 1. Copy one folder<br>2. Copy in another location | Correctly copied | P m14 t13
|Copy many files | 1. Copy many files<br>2. Choose directory | Correctly copied | P m14 t13
|Copy many folders | 1. Copy many folders<br>2. Copy in another location | Correctly copied | P m14 t13
|**Copy text**||||||
| Browser | 1. Open Safari<br>2. Copy text from any web<br>3. Paste inside oC account | Correctly copied in a txt file| P m14 t13
|**Errors**||||||
|Copy same location | 1. Copy one folder<br>2. Paste inside itself | Error, not allowed | P m14 t13
|Lack of storage | 1. Copy a big item<br>2. Paste inside the account with not enough space to contain it | Correct error | P m14 t13
|Inexistent target | 1. Copy an item<br>2. Browse to another folder to paste the item<br>3. Before pasting, remove the folder using the web UI | Correct error | P m14 t13