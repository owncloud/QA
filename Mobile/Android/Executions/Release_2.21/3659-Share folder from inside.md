###  Share from inside

#### PR: https://github.com/owncloud/android/pull/3659

Devices: Pixel5 v12, Nexus6P v7

Server: 10.10.0

---

 
| Test Case | Steps | Expected Result | Result | Related Comment |
| :-------- | :---- | :-------------- | :----: | :-------------: | 
|**Folder**|||||||
| Root | Open app  | Root folder does not show the share icon. Check in both orientations | P m12 m7 | | 
| Non root folder | 1. Open app<br>2. Browse to any folder<br>3. Click the share icon<br>4. Share with other user  | 2. Share icon on the top bar<br>3. Share view opened over the folder's name<br>4. Folder shared correctly, check in web | P m12 m7 | | 
| Share with picker | 1. Open Photos app<br>2. Share any item with oC | Share icon not visible in folder picker| P m12 | FIXED: Icon showed with no action| 
| Auto uploads Photo picker | 1. Enable photo auto uploads<br>2. Share any item with oC | Share icon not visible in folder picker| P m12 m7 | | 
| Auto uploads Video picker | 1. Enable video auto uploads<br>2. Share any item with oC | Share icon not visible in folder picker| P m12 m7 | | 
| Copy picker | 1. Select to Copy any item | Share icon not visible in folder picker| P m12 m7 | | 
| Move picker | 1. Select to Move any item | Share icon not visible in folder picker| P m12 m7 | | 