###  Multiple send

#### PR: https://github.com/owncloud/android/pull/36238

Devices: Pixel5 v12

Server: 10.9.1

---

 
| Test Case | Steps | Expected Result | Result | Related Comment |
| :-------- | :---- | :-------------- | :----: | :-------------: | 
|**Files**|||||||
| Single file downloaded|  |Send available | P m12 m7 | | 
| Single file not downloaded |  | Send available| P m12 m7| | 
| Two files not downloaded |  |Send not available| P m12 m7| | 
| Two files downloaded |  | Send available|P m12 m7 | | 
| Many files downloaded |  | Send available|P m12 m7 | | 
| Many files not downloaded |  |Send not available|P m12 m7 | | 
| Many files, some downloaded, some not downloaded|  | Send not available| P m12 m7| | 
| Single file av offline|  |Send available |P m12 m7 | | 
| Two files av offline |  | Send available| P m12 m7| | 
| Many files av offline |  | Send available|P m12 m7 | | 
| Many files, some av offline, some downloaded|  | Send available|P m12 m7 | | 
| Many files, some av offline, some neither av offline nor downloaded|  | Send not available| P m12 m7| | 
| Many files, some av offline, some downloaded, some neither av offline nor downloaded|  | Send not available|P m12 m7 | | 
|**Folders**|||||||
| One folder |  | Send not available| P m12 m7| | 
| Several folders || Send not available| P m12 m7| | 
|**Files & Folders**|||||||
| Several downloaded files and folders || Send not available| P m12 m7| | 
| Several not downloaded files and folders || Send not available| P m12 m7| | 
| Several av offline files and folders || Send not available| P m12 m7| | 
| Several av offline, downloaded files and folders || Send not available|P m12  m7| | 
|**Actions**|||||||
| Send one downloaded | 1. Select a single downloaded file<br>2. Select Send to email| File is attached | P m12 m7 | 
| Send one not downloaded | 1. Select a single not downloaded file<br>2. Select Send to email| File is attached | P m12 m7 | 
| Send two downloaded | 1. Select two downloaded files<br>2. Select Send to email| Files are attached | P m12 m7 | 
| Send many downloaded | 1. Select >10 downloaded files<br>2. Select Send to email| Files are attached | P m12 m7| 