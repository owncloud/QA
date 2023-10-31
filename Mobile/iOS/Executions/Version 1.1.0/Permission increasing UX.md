###  Permission increasing reshares UX

#### Pr: https://github.com/owncloud/ios-app/pull/467

Devices: iPhoneXR v12<br>
Server: 10.2.1

---

 
| Test Case | Steps | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- | 
|**File**|||||
| File no edit | Share a file with a user, revoking editing and granting sharing | Recipient does not see edit option when resharing | P m12 | FIXED: Edit permission displayed |  |
| File edit | Share a file with a user, granting editing and sharing | Recipient sees edit option when resharing | P m12 |  |  |
|**Folder**|||||
| Folder no edit | Share a folder with a user, revoking whole edit permission and granting sharing | Recipient does not see edit option when resharing | P m12 | FIXED: Edit permission displayed |  |
| Folder edit | Share a folder with a user, granting editing and sharing | Recipient sees edit option when resharing | P m12  |  |  |
| Folder create | Share a folder with a user, granting create and sharing | Recipient sees only create option, but change and delete | P m12 |  |  |
| Folder change | Share a folder with a user, granting change and sharing | Recipient sees only change option, but create and delete | P m12  |  |  |
| Folder delete | Share a folder with a user, granting delete and sharing | Recipient sees only delete option, but change and create | P m12  |  |  |
| Folder 2 edit options | Share a folder with a user, granting create, delete and sharing | Recipient sees only delete and create option, but change | P m12 |  |  |
| Folder edit options + update | Share a folder with a user, granting create, delete and sharing<br>Uncheck edit, and check again | Recipient sees only delete and create option, but change | P m12 | FIXED: Closing and opening edit option, suboptions does not appear |  |
|**Public link folder**|||||
| Folder create | Share a folder with a user, granting create and sharing<br>Recipient create a public link over the item | Options displayed: Download/View and File Drop | P m12 |  |  |
| Folder change | Share a folder with a user, granting change and sharing | FIXED: Options displayed: Download/View  | P m12 | Upload only should be hidden |  |
| Folder delete | Share a folder with a user, granting delete and sharing | Options displayed: Download/View | P m12 | FIXED: Upload only should be hidden |  |