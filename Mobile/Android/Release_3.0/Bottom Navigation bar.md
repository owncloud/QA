#### Bottom Navigation Bar

#### PRs: https://github.com/owncloud/android/pull/3719

Devices: Samsung A51 v12 <br>
Server: 10.10.0


---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link |
| :-------- | :---- | :------- | :----: | :------------------------- | 
|**Browse**|
|**Files**||||
| From Files root | 1. Open Files tab<br>2. Click on Files tab from root folder | Nothing happens | P m12
| From Files non-root | 1. Open Files tab<br>2. Browse to a deep folder<br>3. Click on Files tab | Browse to root | P m12
| From Uploads | 1. Open Uploads tab<br>2. Click on Files tab | Browse to root | P m12
| From Av. offline | 1. Open Av. offline tab<br>2. Click on Files tab | Browse to root | P m12
| From Links | 1. Open Links tab<br>2. Click on Files tab | Browse to root | P m12
|**Uploads**||||
| From Files | 1. Open Files tab<br>2. Click on Uploads tab | Go to uploads view |P m12
| From Uploads | 1. Open Uploads tab<br>2. Click on Uploads tab | Nothing happens |P m12
| From Av. offline | 1. Open Av. offline tab<br>2. Click on Uploads tab | Go to uploads view |P m12
| From Links | 1. Open Links tab<br>2. Click on Uploads tab | Go to uploads view |P m12
|**Av. offline**||||
| From Files | 1. Open Files tab<br>2. Click on av. offline tab | Go to av. offline view |P m12
| From Uploads | 1. Open Uploads tab<br>2. Click on av. offline tab | Go to av. offline view  |P m12
| From Av. offline | 1. Open Av. offline tab<br>2. Click on av. offline tab | Nothing happens |P m12
| From Links | 1. Open Links tab<br>2. Click on av. offline tab | Go to av. offline view |P m12
|**Links**||||
| From Files | 1. Open Files tab<br>2. Click on links tab | Go to links view |P m12
| From Uploads | 1. Open Uploads tab<br>2. Click on links tab | Go to links view  |P m12
| From Av. offline | 1. Open Av. offline tab<br>2. Click on links tab | Go to links view |P m12
| From Links | 1. Open Links tab<br>2. Click on links tab | Nothing happens |P m12
|**Actions**|
|**Av. offline**||||
| Empty | 1. Open an account with no av. offline items<br>2. Open av. offline tab | Empty view, no items listed | P m12
| One item (file) | 1. Open an account with no av. offline items and set one file as av. offline<br>2. Open av. offline tab | Only one item, the file listed as av. offline | P m12
| One item (folder) | 1. Open an account with no av. offline items and set one folder with subfolders as av. offline<br>2. Open av. offline tab | Only one item, the file listed as av. offline. Item is browsable. | P m12
| 1000 items | 1. Open an account with 1000 items<br>2. Set 1000 items as av. offline<br>4. Open av. offline tab | 1000 items listed as av. offline | P m12
| Actions (file) | 1. Set one file as av. offline<br>2. Open av. offline tab<br>3. Select the item by long press | Actions available: open with, share, unavailable offline and selections | F m12 | Crash
| Actions (folder) | 1. Set one folder as av. offline<br>2. Open av. offline tab<br>3. Select the item by long press | Actions available: open with, details, unavailable offline and selections | F m12 | Crash
| Unav. offline all | 1. Set one or more file as av. offline<br>2. Open av. offline tab<br>3. Select all items by long press<br>4. Select set as unav. offline | All items removed from the av. offline list that is empty now. Items are no longer av.offline in the file list | P m12
| Unav. offline some | 1. Set some (not all) files as av. offline<br>2. Open av. offline tab<br>3. Select some items by long press<br>4. Select set as unav. offline | Items selected are removed from the av. offline list. Other ones keep. Items selected are no longer av.offline in the file list | P m12
| Remove | 1. Set some files as av. offline<br>2. Open av. offline tab<br>3. Go to the file list and remove those files<br>4. Open av.offline tab | 2. Items listed in av. offline tab<br>4. Items not listed in av. offline tab | P m12
| Details (file) | 1. Set one file as av. offline<br>2. Open av. offline tab<br>3. Select the item with the option "Details" | Details correctly displayed | F m12 | crash
|**Links**||||
| Empty | 1. Open an account with no links<br>2. Open links tab | Empty view, no items listed | P m12
| One item | 1. Open an account with no links and create one link over any item<br>2. Open links tab | Only one item, the one listed as linked | P m12
| Several items | 1. Open an account with no links and create some links over different item<br>2. Open links tab | Every item with a link is listed | P m12
| Actions (file) | 1. Create a link over a file<br>2. Open links tab<br>3. Select the item by long press | Actions available: open with, send, share, details and selections | F m12 | crash
| Actions (folder) | 1. Create a link over a folder<br>2. Open links tab<br>3. Select the item by long press | Actions available: share and selections | F m12 | crash
| Remove all links | 1. Create one or more links<br>2. Open links tab<br>3. Remove all links from links tab | All items removed from the links list that is empty now.| P m12
| Remove some | 1. Create links over some (not all) files on the list<br>2. Open links tab<br>3. Remove link from some items | Items selected are removed from the links list. Other ones keep | P m12
| Remove | 1. Create links over some items<br>2. Open links tab<br>3. Go to the file list and remove those files<br>4. Open links tab | 2. Items listed in links tab<br>4. Items not listed in links tab | F m12 | Bar multiselection mode
| Details (file) | 1. Create a link on a folder<br>2. Open links tab<br>3. Select the item with the option "Details" | Details correctly displayed | P m12
|**Other**|||||
|Items in [3179](https://github.com/owncloud/android/pull/3719) |||||
