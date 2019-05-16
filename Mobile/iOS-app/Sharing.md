###  Sharing

#### Pr: https://github.com/owncloud/ios-app/pull/358

Devices: <br>
Server: 

---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | Automated |
| :-------- | :---- | :------- | :----: | :------------------------- | :-------: |
|**Files view**||||||
| Portrait  | Open Card | Options to share correct |  |  |  |
| Landscape | Open Card | Options to share correct |  |  |  |
|**Private Share**||||||
| Portrait view  | Open Private Share view | View correct |  |  |  |
| Landscape | Open Private Share view| View correct |  |  |  |
| Share with a user | Open Share<br>Type a correct user name<br>Select user | Sharees list updated with the user |  |  |
| Share with a group | Open Share<br>Type a correct group name<br>Select group | Group list updated with the user. Check that every user in the group can access the file |  |  |
| Share with a non existing user | Open Share<br>Type a user name that does not exist | Nothing happens|  |  |
| Share with an already shared | Open Share<br>Type a user name which already has the file | Correct error|  |  |
| Share permission OK | Open Share<br>Share with another user with share permission<br>Try to reshare | Recipient can reshare |  |  |
| Share permission denied | Open Share<br>Share with another user with no share permission<br>Try to reshare |  Not posible |  |  |
| Permission inheritance | Open Share<br>Share with another user with no edit permission<br>Recipient tries to reshare with edit permission |  Not posible |  |  |
| Reshare reflected | Open Share<br>Share with another user<br>Recipient reshares |  First user sees both shares |  |  |
| Edit permission OK | Open Share<br>Sghare with another user with edit permission<br>Recipient tries to edit<br>Try the same with Files App | Recipient can edit |  |  |
| Edit permission denied | Open Share<br>Share with another user with no edit permission<br>Recipient tries to edit<br>Try the same with Files App |  It is posible |  |  |
| Edit permission folders view | Open Share<br>Share a folder with another user  |  Create, change, delete options are there. Information icon shows additional infop |  |  |
| Edit permission folders vanished | Open Share<br>Share a folder with another user without change, create and delete | options vanished |  |  |
| Edit permission folders create | Open Share<br>Share a folder with another user with only create  | Recipient can upload content, but change and delete |  |  |
| Edit permission folders Change | Open Share<br>Share a folder with another user with only change  | Recipient can change content, but create and delete |  |  |
| Edit permission folders Delete | Open Share<br>Share a folder with another user with only Delete  | Recipient can delete content, but create and change |  |  |
| Delete one recipient | Open Share<br>Share with several users<br>Delete one recipient | Recpient deleted, but in files view file is still marked as shared (private) |  |  |
| Delete all recipients | Open Share<br>Share with serveral users<br>Delete all recipients | Recipients deleted, in files view file is not marked as shared (private) |  |  |
| Recipient deletes | Share with a user<br>Recipient deletes the file in the file list | File is not shared, check in original user |  |
| Remote share | In web UI create a share with different options | Correctly shown in the app |  |  |
|**Federated Share**||||||
| Share with a user in other server | Open Share<br>Type a correct user name with remote URL<br>Recipient accepts | Sharees list updated with the user<br>Recipient accesses the file |  |  |
| Share with a user which contains @ | Open Share<br>Type a correct user name which contais @ | User in the list of matches |  |  |
| Remove federated | Recipient remove the share | Share is not in the list of shares of the original user |  |  |
|**Public Share**||||||
| View files | Select to create a public link from a file | Correct view and premissions available |  |  | |  
| View folders | Select to create a public link from a folder | Correct view and premissions available |  |  | |  
| Create with name | Select to create a public link with an specific name | Correct creation with name (check in web UI)|  |  | | 
| Create without name | Select to create a public link with no name  | Correct creation with  default name (check in web UI)|  |  | | 
| Create with password| Select to create a public link with password  | Correct creation with password. Paste the link in browser to be asked the password|  |  | | 
| Create without password| Select to create a public link with no password  | Correct creation with no password. Paste the link in browser, password not asked|  |  | | 
| Create with expiration date| Select to create a public link with expiration date  | Correct creation with expiration date. Check in web UI|  |  | | 
| Create without expiration date| Select to create a public link with no expiration date  | Correct creation with no expiration date. Check in web UI|  |  | | 
| Create folder Download/View | Select to create a public link of a folder with Download/View permission  | Correct creation. Check in web UI|  |  | | 
| Create folder Download/View/Upload | Select to create a public link of a folder with Download/View/Upload permission  | Correct creation. Check in web UI|  |  | | 
| Create folder Upload Only (File Drop) | Select to create a public link of a folder with Upload only permission  | Correct creation. Check in web UI|  |  | | 
| Edit name | On a created public link, edit the name  | Correct edition. Check in web UI|  |  | | 
| Edit password | On a created public link, edit the password  | Correct edition. Check in web UI|  |  | | 
| Edit removing password | On a created public link, remove the password  | Correct edition. Check in web UI|  |  | | 
| Edit expiration date | On a created public link, edit the expiration date  | Correct edition. Check in web UI|  |  | | 
| Edit removing expiratin date | On a created public link, remove the expiration date  | Correct edition. Check in web UI|  |  | | 
| Edit share permission | On a created public link, switch the share permission  | Correct edition. Check in web UI|  |  | | 
| Edit file editing permission | On a created public link on a file, switch the edit permission  | Correct edition. Check in web UI|  |  | | 
| Edit folder permission | On a created public link on a folder, switch the permissions through every option | Correct edition. Check in web UI|  |  | | 
| Delete one | Delete an already create public link  |  Link not available anymore, check in file list |  |  | | 
| Delete all | Delete all public link of an item | Links not available anymore, check in file list | |  | | 
| Send link | Create a link and use the open in option to send it | Options to send correctly displayed | | | | 
|**Private link**||||||
| Get link View | Open Share view | Option correctly displayed | | | | 
| Copy link | Get copy link and paste in the browser | File correctly linked | | | | 
|**Capabilities**||||||
| Share API disabled | Open file list | There is no option to share |  |  |
| Allow share via link disabled | Open file list | There is no option to share public, but tthere is for privates |  |  |
| Enforce password protection read only enabled | Create a public share with read only permission  and without password | Not posible |  |  |
| Enforce password protection read write enabled | Create a public share with read and write permission and without password | Not posible |  |  |
| Enforce password protection upload only enabled | Create a public share with upload only permission and without password | Not posible |  |  |
| Default expiration date | Create a public share and enable expiration date | Default date is there |  |  |
| Enforced expiration date | Create a public share and enforce expiration date | Default date is there and can not be removed|  |  |
| Allow resharing enabled | Share a file<br>Recipient tries to reshare  | Recipient can reshare|  |  |
| Allow resharing disabled | Share a file<br>Recipient tries to reshare  | There is no option to reshare |  |  |
| Allow sharing with groups disabled | Share a file with groups | Not posible |  |  |
| Default share permission | Set different options in web UI<br>Create a share in the app | Default options are the same |  |  |
| Allow send federated = false | Try to create a federated share | Not posible |  |  |
| Allow receive federated = false | Try to create a federated share | Not posible |  |  |