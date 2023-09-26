#### Sharing flow tests

#### Pr: 

---
 
| Test | Test Case | Expected Result | Result | Related Comment
| :---- | :-------- | :---- | :-------------- | :-----: | 
| **Share File** | |  |
| No shares | Initial view | "No public links created yet" | DONE | Already implemented in ShareFileFragmentTest
| Correct View | Share created | icons for send link, delete and edit are there| DONE | Implemented in ShareFileFragmentTest
| **Create share** | |  |
| Create one share default name when there's no shares yet | name: by default. permissions: by default | Public share with correct name in Share Activity | DONE |
| Create one share default name with already existing shares | name: by default. permissions: by default | Public share with correct name in Share Activity | DONE |
| Create several shares  | Create three shares with different names | Three shares in list | DONE |
| Loading while creating one share | Create one share | Loading status is displayed | DONE |
| Error while creating one share | Create one share | Error message displayed and share is not created | |
| **Edition Files** | |  |
| Edit name | One share created before. Open share and edit the name | Public share with correct name in Share Activity | DONE |
| Add password | One share created before with no password. Open share and add a password | Public share with password | DONE |
| Remove password | One share created before with password. Open share and remove the password | Public share with no password | DONE |
| Add expiration date | One share created before with no expiration date. Open share and add an expiration date | Public share with expiration date | DONE |
| Remove expiration date | One share created before with expiration date. Open share and remove the expiration date | Public share with no expiration date | DONE |
| Loading while editing one share | Edit one share | Loading status is displayed | DONE |
| Error while editing one share | Edit one share | Error message displayed and share is not edited | |
| **Edition Folders** | |  |
| Edit name | One share created before. Open share and edit the name | Public share with correct name in Share Activity | DONE |
| Edit permission | One share created before with "Download/View" permission. Open share and edit the permission to "Download/View/Upload" | Public share with correct permissions |   DONE|
| Edit permission II | One share created before with "Download/View" permission. Open share and edit the permission to "Upload Only (file drop)" | Public share with correct permissions | DONE |
| Edit permission III | One share created before with "Download/View/Upload" permission. Open share and edit the permission to "Download/View" | Public share with correct permissions | DONE |
| **Deletion** | |  |
| Delete all shares | With one share created before, delete it | No more shares, "No public links created yet"  | DONE |
| Delete one share | With several shares share, delete one | Removed one is not there anymore | DONE |
| Loading while deleting one share | Remove one share | Loading status after removal is displayed | DONE |
| Error while deleting one share | Remove one share | Error message displayed and share is not removed | |
| **Capabilities** | |  |
| enableMultiplePublicSharing true| Add one share before | "+" is displayed | DONE | Already implemented in ShareFileFragmentTest
| enableMultiplePublicSharing false | Add one share before | "+" is not displayed | DONE |Already implemented in ShareFileFragmentTest
