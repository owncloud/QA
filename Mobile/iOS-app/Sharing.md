###  Sharing

#### Pr: https://github.com/owncloud/ios-app/pull/358

Devices: iPhone6Plus v12.2<br>
Server: 10.1

---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | 
| :-------- | :---- | :------- | :----: | :------------------------- | 
|**Files view**||||||
| Portrait  | Open Card | Options to share correct | P m12 | FIXED: Glitches in card  |  |
| Landscape | Open Card | Options to share correct | P m12 | FIXED: Glitches in card |  |
|**Private Share**||||||
| Portrait view  | Open Private Share view | View correct | P m12 |  |  |
| Landscape | Open Private Share view| View correct | P m12 |  |  |
| Share with a user | Open Share<br>Type a correct user name<br>Select user | Sharees list updated with the user | P m12 |  |
| Share with a group | Open Share<br>Type a correct group name<br>Select group | Group list updated with the user. Check that every user in the group can access the file | P m12 |  |
| Share with a non existing user | Open Share<br>Type a user name that does not exist | No matches| P m12 |  |
| Share with an already shared | Open Share<br>Type a user name which already has the file | Correct error| P m12 | FIXED: UX not very good |
| Share permission OK | Open Share<br>Share with another user with share permission<br>Try to reshare | Recipient can reshare | P m12 | FIXED: Recipients should not see himself  |
| Share permission denied | Open Share<br>Share with another user with no share permission<br>Try to reshare |  Not posible | P m12 |  |
| Permission inheritance | Open Share<br>Share with another user with no edit permission<br>Recipient tries to reshare with edit permission |  Not posible | P m12 | Error message improvable |
| Reshare reflected | Open Share<br>Share with another user<br>Recipient reshares |  First user sees both shares | P m12 |  |
| Edit permission OK | Open Share<br>Sghare with another user with edit permission<br>Recipient tries to edit<br>Try the same with Files App | Recipient can edit | P m12 |  |
| Edit permission denied | Open Share<br>Share with another user with no edit permission<br>Recipient tries to edit<br>Try the same with Files App |  It is posible | F m12 | Spinner forever |
| Edit permission folders view | Open Share<br>Share a folder with another user  |  Create, change, delete options are there. Information icon shows additional info | P m12 |  |
| Edit permission folders vanished | Open Share<br>Share a folder with another user without change, create and delete | options vanished | P m12 | FIXED: Can Edit checked |
| Edit permission folders | Open Share<br>Share a folder with another user with all permissions<br>Remove two permissions (change and delete)  | Correctly updated in UI | F m12 | Race conditions |
| Edit permission folders create | Open Share<br>Share a folder with another user with only create  | Recipient can upload content, but change and delete | P m12 |  |
| Edit permission folders Change | Open Share<br>Share a folder with another user with only change  | Recipient can change content, but create and delete | P m12 |  |
| Edit permission folders Delete | Open Share<br>Share a folder with another user with only Delete  | Recipient can delete content, but create and change | P m12 |  |
| Delete one recipient | Open Share<br>Share with several users<br>Delete one recipient | Recpient deleted, but in files view file is still marked as shared (private) | F m12 | Unshare wording  |
| Delete all recipients | Open Share<br>Share with serveral users<br>Delete all recipients | Recipients deleted, in files view file is not marked as shared (private) | P m12 |  |
| Recipient deletes | Share with a user<br>Recipient deletes the file in the file list | File is not shared, check in original user | NA | Server behaviour is keeping the share?
| Remote share | In web UI create a share with different options | Correctly shown in the app | P m12 |  |
| More than 50 results | Perform a recipient search that retrieves more than 50 results| App runs correctly (good performance) | P m12 |  |
|**Federated Share**||||||
| Share with a user in other server | Open Share<br>Type a correct user name with remote URL<br>Recipient accepts | Sharees list updated with the user after accepting in web UI<br>Recipient accesses the file | P m12 |  |
| Share with a user which contains @ | Open Share<br>Type a correct user name which contais @ | User in the list of matches | F m12 | Identified as federated |
| Remove federated | Recipient remove the share | Share is not in the list of shares of the original user | P m12 |  |
| Incorrect federated | URL is not correct | Correct error shown to the user | P m12 |  |
|**Public Share**||||||
| View files | Select to create a public link from a file | Correct view and premissions available | F m12  | Long links overlaps copy button | |  
| View folders | Select to create a public link from a folder | Correct view and premissions available | P m12 | | |  
| Create with name | Select to create a public link with an specific name | Correct creation with name (check in web UI)| P m12 |  | | 
| Create without name | Select to create a public link with no name  | Correct creation with  default name (check in web UI)| F m12 | Crash | | 
| Create with password| Select to create a public link with password  | Correct creation with password. Paste the link in browser to be asked the password| P m12 |  | | 
| Create without password| Select to create a public link with no password  | Correct creation with no password. Paste the link in browser, password not asked| P m12 |  | | 
| Create with expiration date| Select to create a public link with expiration date  | Correct creation with expiration date. Check in web UI| F m12 | Date picker behind keyboard. Default date not saved |  | 
| Create without expiration date| Select to create a public link with no expiration date  | Correct creation with no expiration date. Check in web UI| P m12 |  | | 
| Create folder Download/View | Select to create a public link of a folder with Download/View permission  | Correct creation. Check in web UI| P m12 |  | | 
| Create folder Download/View/Upload | Select to create a public link of a folder with Download/View/Upload permission  | Correct creation. Check in web UI| P m12 |  | | 
| Create folder Upload Only (File Drop) | Select to create a public link of a folder with Upload only permission  | Correct creation. Check in web UI| P m12 |  | | 
| Edit name | On a created public link, edit the name  | Correct edition. Check in web UI| F m12 | Not posible | | 
| Edit password | On a created public link, edit the password  | Correct edition. Check in web UI| P m12 |  | | 
| Edit removing password | On a created public link, remove the password  | Correct edition. Check in web UI|  |  | | 
| Edit expiration date | On a created public link, edit the expiration date  | Correct edition. Check in web UI|  |  | | 
| Edit removing expiratin date | On a created public link, remove the expiration date  | Correct edition. Check in web UI|  |  | | 
| Edit share permission | On a created public link, switch the share permission  | Correct edition. Check in web UI|  |  | | 
| Edit file editing permission | On a created public link on a file, switch the edit permission  | Correct edition. Check in web UI|  |  | | 
| Edit folder permission | On a created public link on a folder, switch the permissions through every option | Correct edition. Check in web UI|  |  | | 
| Delete one | Delete an already create public link  |  Link not available anymore, check in file list | P m12 |  | | 
| Delete all | Delete all public link of an item | Links not available anymore, check in file list | P m12 |  | | 
| Send link | Create a link and use the open in option to send it | Options to send correctly displayed | P m12 | | | 
|**Private link**||||||
| Get link View | Open Share view | Option correctly displayed | F m12 | | | 
| Copy link | Get copy link and paste in the browser | File correctly linked | P m12 | | | 
|**Capabilities**||||||
| Share API disabled | Open file list | There is no option to share | P m12 |  |
| Allow share via link disabled | Open file list | There is no option to share public, but tthere is for privates |  |  |
| Enforce password protection read only enabled | Create a public share with read only permission  and without password | Not posible |  |  |
| Enforce password protection read write enabled | Create a public share with read and write permission and without password | Not posible |  |  |
| Enforce password protection upload only enabled | Create a public share with upload only permission and without password | Not posible |  |  |
| Default expiration date | Create a public share and enable expiration date | Default date is there |  |  |
| Enforced expiration date | Create a public share and enforce expiration date | Default date is there and can not be removed|  |  |
| Allow resharing enabled | Share a file<br>Recipient tries to reshare  | Recipient can reshare| P m12 |  |
| Allow resharing disabled | Share a file<br>Recipient tries to reshare  | There is no option to reshare | F m12 | Options to reshare are there |
| Allow sharing with groups disabled | Share a file with groups | Not posible | P m12 |  |
| Default share permission | Set different options in web UI<br>Create a share in the app | Default options are the same | P m12 |  |
| Allow send federated = false | Try to create a federated share | Not posible | P m12 |  |
| Allow receive federated = false | Try to create a federated share | Not posible | P m12 |  |
|**Favorites**||||
| View | Open card of any item | View is correct | | | | 
| Set fav File | in the app, set a file as favorite | Check in web UI that the file is favorite | | | | 
| Set fav Folder | in the app, set a folder as favorite | Check in web UI that the folder is favorite | | | | 
| Unset fav File | in the app, unset a file as favorite | Check in web UI that the file is not favorite anymore| | | | 
| Unset fav Folder | in the app, set a folder as favorite | Check in web UI that the folder is not favorite anymore | | | | 
| Remote set fav | in web UI, set an item as favorite | Check in the app that the item is favorite | | | | 
| Remote unset fav | in web UI, unset an item as favorite | Check in the app that the item is not favorite anymore | | | | 
|**Quick access**||||
| No Public links | Open Quick Access -> Public Links with no public links| Correct view | | | | 
| Public links | Create some public links<br>Open Quick Access -> Public Links | All public links are there | | | | 
| No Images | Open Quick Access -> Images, but no images in the account| Correct view | | | | 
| Images | Upload some images<br>Open Quick Access -> Images | All images are there | | | | 
| No PDFs | Open Quick Access -> PDFs, but no pdfs in the account| Correct view | | | | 
| PDFs | Upload some PDFs<br>Open Quick Access -> PDFs | All PDFs are there | | | | 
| No Favorites | Open Quick Access -> Favorites, but no favorites in the account| Correct view | | | | 
| Favorites | Set some favorites<br>Open Quick Access -> Favorites | All Favorites are there | | | | 
|**Extra**||||
| 292 | Issue 292 |  | | | | 

