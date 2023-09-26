### Personal Space Graph API


#### PR: 

**Devices**: Samsung A51, Android 12 <br>
**Server**: oC 10.11, oCIS 2.0.0 


| Title | Steps     | Expected Result | Result | Comments |
| :---- | :-------- | :-------------- | :----: | :------- |
|**Discovery**||||
| oC10 | Login in a oC10 account | No spaces tab on the bottom |P m12  |  |
| oCIS | Login in a oCIS account | Spaces tab on the bottom | P m12 |  |
|**Operation Personal oCISs**||||
| Create folder | Create folder in root and non-root | Folder created | P m12 |  |
| Copy from personal | Copy file and folder from personal to any other space | Content created in another space | P m12 |  |
| Copy to personal | Copy file and folder from other space to personal | Content created in personal | P m12 |  |
| Move | Move file and folder inside personal | Content correctly moved | P m12  |  |
| Download | Download file and folder inside personal | Content correctly downloaded | P m12  |  |
| Av. offline | Sync file and folder inside personal | Content correctly synced |P m12   |  |
| Upload | Upload content in root and non-root to personal | Content correctly created | P m12 |  |
| Upload from camera | Upload content from camera in root and non-root to personal | Content correctly created | P m12 |  |
| Upload external | Upload content from Photos app in root and non-root to personal | Content correctly created | P m12 |  |
| Upload text | Upload text from Browser app in root and non-root to personal | Content correctly created | P m12 |  |
| Camera upload | Camera Upload Videos and Pictures in root and non-root to personal | Content correctly created | P m12 |  |
| Delete | Delete file and folder inside personal | Content correctly deleted | P m12  |  |
| Open With / Send | Open With / Send  file and folder inside personal | Content correctly downloaded and opened / sent to other apps | P m12 |  |
| Share with | Share with another user in personal | Content correctly shared | P m12 | |
| Public link | Create a public link in personal | Link correctly created | P m12 |  |
|**Shares space**||||
| No shares | No accepted shares in the account | Empty view| P m12 |  |
| New share | From another account, share file and folder to your account. In server, accept the shares | Shares listed in the shares section in bottom bar| P m12 | TO DO: In first open, pull to refresh does not work |
| Decline share | In server, decline accepted shares | Shares are not listed anymore in the shares section in bottom bar| P m12 | TO DO: In first open, pull to refresh does not work |
|**Internal**||||
| Internal hierarchy | With AS, check how files in personal are stored |  Files inside folder with space id of personal | P m12 |  |