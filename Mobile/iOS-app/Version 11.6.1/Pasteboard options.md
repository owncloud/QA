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
|Copy one file | 1. Copy one file<br>2. Paste in another location | Correctly pasted | P m14
|Cut one file | 1. Cut one file<br>2. Paste in another location | Correctly pasted and removed from original location | P m14
|Copy one folder | 1. Copy one folder<br>2. Paste in another location | Correctly pasted | P m14
|Cut one folder | 1. Cut one folder<br>2. Paste in another location | Correctly pasted and removed from original location | P m14
|Copy many files | 1. Copy many files<br>2. Paste in another location | Correctly pasted | F m14 | Only one item is pasted
|Copy many folders | 1. Copy many folders<br>2. Paste in another location | Correctly pasted and removed from original location | F m14 | Only one item is pasted
|**Clipboard other oC account**||||||
|Copy one file | 1. Copy one file<br>2. Paste in another oC account  | Correctly pasted | P m14 | Bad file name?
|Cut one file | 1. Cut one file<br>2. Paste in another oC account | Correctly pasted and removed from original location | F m14 | Not pasted
|Copy one folder | 1. Copy one folder<br>2. Paste in another oC account | Correctly pasted | F m14 | Not working
|Cut one folder | 1. Cut one folder<br>2. Paste in another oC account | Correctly pasted and removed from original location | F m14 | Not pasted
|Copy many files | 1. Copy many files<br>2. Paste in another oC account | Correctly pasted | F m14 | Only one item is pasted
|Copy many folders | 1. Copy many folders<br>2. Paste in another oC account | Correctly pasted and removed from original location | F m14 | Not pasted
|**Clipboard to other apps**||||||
|Copy one file | 1. Copy one file<br>2. Paste to another location in Files App  | Correctly copied | P m14 | Correct name?
|Cut one file | 1. Cut one file<br>2. Paste in another location in Files App | Correctly pasted and removed from original location | F m14 | Not pasted 
|Copy one folder | 1. Copy one folder<br>2. Paste to another location in Files App | Correctly copied | F m14 | Not pasted
|Cut one folder | 1. Cut one folder<br>2. Paste in another location in Files App | Correctly pasted and removed from original location | F m14 | Pasted
|Copy many files | 1. Copy many files<br>2. Paste to another location in Files App | Correctly copied | F m14 | Only one is pasted
|Copy many folders | 1. Copy many folders<br>2. Paste to another location in Files App | Correctly copied | F m14 | Not pasted
|**Copy to directory**||||||
|Copy one file | 1. Copy one file<br>2. Choose directory | Correctly copied | P m14
|Copy one folder | 1. Copy one folder<br>2. Copy in another location | Correctly copied | P m14
|Copy many files | 1. Copy many files<br>2. Choose directory | Correctly copied | P m14
|Copy many folders | 1. Copy many folders<br>2. Copy in another location | Correctly copied | P m14