### New List Layout

#### PRs: https://github.com/owncloud/ios-app/pull/594

Device/s: iPhoneX v13, iPadPro13<br>
Server: 10.3.2


---

Prec: app installed and account attached
 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | 
| :-------- | :---- | :------- | :----: | :------------------------- | 
|**View**||||||
| Orientation | Open file list | File list is correct in both orientations | P m13 t13 |  |  |
| Long names | Open file list and rename an item with a very long name | File list is correct in both orientations. Item name fits the view | P m13 t13 |  |  |
|**Fresh install**||||||
| Non downloaded file | Open file list | Files that are not downloaded have the "Download" mark | P m13 t13 |  |  |
| Downloading file | Download a non-downloaded file | Mark is removed | P m13 t13 |  |  |
| Downloaded file | Open file list | Files that are downloaded does not have the "Download" mark | P m13 t13 |  |  |
| Av. offline file | Open file list | Files that are av. offline have the "Av. offline" mark instead of the "Download" | P m13 t13 |  |  |
| Av. offline folder | Open file list | Folders that are av. offline have the "Av. offline" mark instead of the "Download" | P m13 t13|  |  |
| Remove Av. offline | Unset an av. offline item as not av. offline | "Download" mark is set and "Av. offline" mark is removed | P m13 t13|  |
| Private link file | Share a file with another user | Private share mark is there | P m13 t13 |  |  |
| Public link file | Create a public link over a file in the list | Public link mark is there | P m13 t13 |  |  |
| Private link folder | Share a folder with another user | Private share mark is there | P m13 t13 |  |  |
| Public link folder | Create a public link over a folder in the list | Public link mark is there | P m13 t13 |  |  |
| Remove sharing marks | Remove the public/privare shares over a shared item | Dharing marks are not there anymore | P m13 t13 |  |  |
|**Upgrade**||||||
| Upgrade with new icons | Install older version with downlaoded files, av. offline, private shares and public links<br>Upgrade to the current one | Items are correctly displayed  | P m13 |  |  |