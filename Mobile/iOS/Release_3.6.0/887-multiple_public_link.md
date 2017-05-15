###  Multiple Public Links 

#### PR: https://github.com/owncloud/ios/pull/866 


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**View**||||||
| 1 | Portrait  | Open Share view | Public Links section is correct. "+" Button to add new public links. Icons for delete, get link and more options when public link is created. | P m10 |  |
| 2 | Landscape| Open Share view | Public Links section is correct. "+" Button to add new public links. Icons for delete, get link and more options when public link is created. | P m10 |  |  |
| 3 | Security warning | Enable security warning | Public Links section is correct showing the warning |  |  |  |
|**Creation**||||||
| 4 | Name | 1. Open Share view<br>2. Add a public link with name. Other options default  | Public link created. Check in server | P m10 |  |
| 5 | No Name | 1. Open Share view<br>2. Add a public link with all options default  | Public link created with string name. Check in server | P m10 |  |
| 6 | Allow editing | 1. Open Share view (folder)<br>2. Add a public link with allow editing enabled | Public link created with allow editing. Check in server | F m10 | Option unreachable |
| 7 | Password | 1. Open Share view<br>2. Add a public link with password enabled | Public link created with password. Check in server | P m10 |  |
| 8 | Expiration time | 1. Open Share view<br>2. Add a public link with expiration time | Public link created with expiration time. Check in server |  |  |  |
| 9 | All options | 1. Open Share view<br>2. Add a public link with name, allow editing (folders), password, expiration time | Public link created with all options. Check in server |  |  |  |
|**Edition (link already exists)**||||||
| 10 | Name | 1. Open Share view<br>2. Edit name of public link | Name edited. Check in server |  |  |  |
| 11 | No Name | 1. Open Share view<br>2. Remove name from public link  | Name removed. Check in server |  |  |  |
| 12 | Allow editing | 1. Open Share view (folder)<br>2. Edit option "allow editing" in a public link| Option switched. Check in server | F m10 | Error in SAML |
| 13 | Add Password | 1. Open Share view<br>2. Add password to public link | Password added. Check in server |  |  |  |
| 14 | Edit Password | 1. Open Share view<br>2. Edit password | Password edited. Check in server |  |  |  |
| 15 | Remove Password | 1. Open Share view<br>2. Remove password from public link | Password removed. Check in server |  |  |  |
| 16 | Add expiration time | 1. Open Share view<br>2. Add expiration time to public link | Expiration time added. Check in server |  |  |  |
| 17 | Edit expiration time | 1. Open Share view<br>2. Edit expiration time | Expiration time edited. Check in server |  |  |  |
| 18 | Remove expiration time | 1. Open Share view<br>2. Remove expiration time from public link | Expiration time removed. Check in server |  |  |  |
| 19 | All options | 1. Open Share view<br>2. Edit a public link: name, allow editing (folders), password, expiration time | Public link edited. Check in server |  |  |  |
|**Removal (link already exists)**||||||
| 20 | Remove public link | 1. Open Share view<br>2. Remove public link  | Public link not exists anymore. Check in server |  |  |  |
|**Multiple**||||||
| 21 | Several public links | 1. Open Share view<br>2. Create 5 links with different names  | All links correctly created and displayed. Check in server |  |  |  |
| 22 | Delete | 1. Open Share view<br>2. Remove 2 links of previous test case | These links removed. The other links remain. Check in server |  |  |  |
| 23 | Many public links | 1. Open Share view<br>2. Create 20 links | Links created and correctly displayed. Scroll available. Check in server. |  |  |  |
|**External actions**||||||
| 24 | Creation | 1. Create public links in server<br>2. Open share view in app | Links correctly displayed |  |  |  |
| 25 | Edition | 1. Edit public links in server<br>2. Open share view in app | Links correctly displayed with the edition|  |  |  |
| 26 | Removal | 1. Remove public links in server<br>2. Open share view in app | Links correctly removed |  |  |  |
|**Capabilities**||||||
| 27 | Share link | Disable capability | No public links in app |  |  |  |
| 28 | Enforce password | Enable capability | Password is asked when the public link is created. It can not be disabled |  |  |  |
| 29 | Default expiration | Enable capability | Default expiration is set when the public link is created |  |  |  |
| 30 | Enforced expiration | Enable capability | Expiration is set and can not be disabled |  |  |  |
|**Public link shortcut**||||||
| 31 | Public links | Open Public Links section | Links are correctly displayed using the name |  |  |  |
|**Legacy (version < 10)**||||||
| 32 | Portrait | Open Share view | Public Links section is correct. Switch button to enable |  |  |
| 33 | Landscape | Open Share view | Public Links section is correct. Switch button to enable |  |  |  |
| 34 | Enable | Open Share view and enable public link | Public Links enabled. Check in web and in server side |  |  |
| 35 | Edit options | Open Share view. Enable allow editing, password and expiration| Public Links enabled with the selected options. Check in web and in server side |  |  |
| 36 | Disable | Open Share view and disable public link | Public Links disabled. Check in web and in server side |  |  |
|**Upgrade**||||||
| 37 | Upgrade | 1. Install older version and create some public links<br>2. Upgrade to the new  | Public Links correctly shown |  |  |
|**Errors**||||||
| 38 | No internet connection | 1. Switch internet connection off. <br>2. Create a public link | Error is displayed |  | |
| 39 | No server connection | 1. Switch server off. <br>2. Create a public link | Error is displayed | |  |
|**Password Policy**||||||
| 40 | Minimun characters | 1. Set minimum characters as Password Policy<br>2. Create public link with password that does not match the policy| Correct error displayed | |  |
| 41 | Uppercase | 1. Set Uppercase as Password Policy<br>2. Create public link with password that does not match the policy| Correct error displayed | |  |
| 42 | Number | 1. Set Number as Password Policy<br>2. Create public link with password that does not match the policy| Correct error displayed |  |  |
| 43 | Special characters | 1. Set Special characters as Password Policy<br>2. Create public link with password that does not match the policy| Correct error displayed |  |  |
| 44 | Expiration with passw | 1. Set number of expiration days if password is set<br>2. Create link without expiration | Expiration date is correctly set |  |  |
| 45 | Expiration without passw | Set number of expiration days if password is not set<br>2. Create link without expiration | Expiration date is correctly set |  |  |

