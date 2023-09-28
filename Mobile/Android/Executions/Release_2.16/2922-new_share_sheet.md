###  New share sheet

#### Pr: https://github.com/owncloud/android/pull/2922

Devices: Pixel2 v11, Nexus P6 v7, Huawei P20L v9, Pixel2 v6 (emulator)<br>
Server: 10.5

---
 
| Test Case | Description | Expected | Result | Comments |
| :-------- | :---------- | :------- | :----: | :------- | 
| **API >= 24** |||||
| Share a file by link | Share a file by link<br>After creating, open the link | New share sheet is displayed | P m7 m9 m11 | FIXED: lack of title<br>FIXED: Wording: Share with -> Send link |  |
| Private link file| Open share section of a file<br>Open the private link (top right) | New share sheet is displayed | P m7 m9 m11 | FIXED: Wording: Share with -> Send link |  |
| Share a folder by link | Share a folder by link<br>After creating, open the link | New share sheet is displayed |  P m7 m9 m11|Wording: FIXED: Share with -> Send link  |  |
| Private link folder| Open share section of a folder<br>Open the private link (top right) | New share sheet is displayed | P m7 m9 m11 | FIXED: Wording: Share with -> Send link |  |
| Send file | Open menu of a file and select Send | New share sheet is displayed | P m7 m9 m11 | Only for Android 7<br> FIXED: Using the title "Share with" |  |
| **API < 24** |||||
| Share a file by link | Share a file by link<br>After creating, open the link | Old share sheet is displayed | P e6 |  |  |
| Private link file| Open share section of a file<br>Open the private link (top right) | Old share sheet is displayed | P e6 |  |  |
| Share a folder by link | Share a folder by link<br>After creating, open the link | Old share sheet is displayed | P e6 |  |  |
| Private link folder| Open share section of a folder<br>Open the private link (top right) | Old share sheet is displayed | P e6 |  |  |
| Send file | Open menu of a file and select Send | Old share sheet is displayed | P e6 |  |  |

