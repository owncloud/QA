###  Multiple Public Links 

#### PR: https://github.com/owncloud/android/pull/1961 

Devices: Huawei 6P v7, Galaxy Tab S v6

Servers: 10.0, 9.1, 8.2


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**View**||||||
| 1 | Portrait  | Open Share view | Public Links section is correct. "+" Button to add new public links. Icons for delete, get link and more options when public link is created. | P m7 t6 |  |
| 2 | Landscape| Open Share view | Public Links section is correct. "+" Button to add new public links. Icons for delete, get link and more options when public link is created. | P m7 t6 | FIXED: Crashes if passcode |  |
| 3 | Security warning | Enable security warning | Public Links section is correct showing the warning | P m7 t6 |  |
|**Creation**||||||
| 4 | Name | 1. Open Share view<br>2. Add a public link with name. Other options default  | Public link created. Check in server | P m7 t6 | FIXED: Keyboard not displayed |
| 5 | No Name | 1. Open Share view<br>2. Add a public link with all options default and empty name | Public link created with token name. Check in server | P m7 t6 |  |  |
| 6 | Allow editing | 1. Open Share view (folder)<br>2. Add a public link with allow editing enabled | Public link created with allow editing. Check in server | P m7 t6 |  |  |
| 7 | Password | 1. Open Share view<br>2. Add a public link with password enabled | Public link created with password. Check in server | P m7 t6| FIXED: Keyboard not displayed |
| 8 | Expiration time | 1. Open Share view<br>2. Add a public link with expiration time | Public link created with expiration time. Check in server | P m7 t6 | FIXED: Expiration is not saved |  |
| 9 | All options | 1. Open Share view<br>2. Add a public link with name, allow editing (folders), password, expiration time | Public link created with all options. Check in server | P m7 t6 |  |  |
|**Edition (link already exists)**||||||
| 10 | Name | 1. Open Share view<br>2. Edit name of public link | Name edited. Check in server | P m7 t6 |  |  |
| 11 | No Name | 1. Open Share view<br>2. Remove name from public link  | Name removed. Check in server | P m7 t6 |  |
| 12 | Allow editing | 1. Open Share view (folder)<br>2. Edit option "allow editing" in a public link| Option switched. Check in server | P m7 t6 |  |
| 13 | Add Password | 1. Open Share view<br>2. Add password to public link | Password added. Check in server | P m7 t6|  |
| 14 | Edit Password | 1. Open Share view<br>2. Edit password | Password edited. Check in server | P m7 t6 |  |  |
| 15 | Remove Password | 1. Open Share view<br>2. Remove password from public link | Password removed. Check in server | P m7 t6 |  |
| 16 | Add expiration time | 1. Open Share view<br>2. Add expiration time to public link | Expiration time added. Check in server | P m7  |  |
| 17 | Edit expiration time | 1. Open Share view<br>2. Edit expiration time | Expiration time edited. Check in server | P m7 |  |
| 18 | Remove expiration time | 1. Open Share view<br>2. Remove expiration time from public link | Expiration time removed. Check in server | P m7 t6 |  |
| 19 | All options | 1. Open Share view<br>2. Edit a public link: name, allow editing (folders), password, expiration time | Public link edited. Check in server | P m7 t6 |  |  |
|**Removal (link already exists)**||||||
| 20 | Remove public link | 1. Open Share view<br>2. Remove public link  | Public link not exists anymore. Check in server | P m7 t6 |  |
|**Multiple**||||||
| 21 | Several public links | 1. Open Share view<br>2. Create 5 links with different names  | All links correctly created and displayed. Check in server | P m7 t6|  |
| 22 | Delete | 1. Open Share view<br>2. Remove 2 links of previous test case | These links removed. The other links remain. Check in server | P m7 t6 |  |
| 23 | Many public links | 1. Open Share view<br>2. Create 20 links | Links created and correctly displayed. Scroll available. Check in server. | P m7 t6 |  |
|**External actions**||||||
| 24 | Creation | 1. Create public links in server<br>2. Open share view in app | Links correctly displayed | P m7 t6 |  |
| 25 | Edition | 1. Edit public links in server<br>2. Open share view in app | Links correctly displayed with the edition| P m7 t6 |  |
| 26 | Removal | 1. Remove public links in server<br>2. Open share view in app | Links correctly removed | P m7 t6 |  |
|**Capabilities**||||||
| 27 | Share link | Disable capability | No public links in app | P m7 t6 |  |
| 28 | Enforce password | Enable capability | Password is asked when the public link is created. It can not be disabled | P m7 t6 | FIXED: Switch can be disabled. |
| 29 | Default expiration | Enable capability | Default expiration is set when the public link is created | P m7 t6 | FIXED: App crashes. FIXED: Expiration not disabled. Default date |
| 30 | Enforced expiration | Enable capability | Expiration is set and can not be disabled | P m7 t6 | FIXED: Link saved without expiration |
|**Legacy (version < 10)**||||||
| 31 | Portrait | Open Share view | Public Links section is correct. Switch button to enable | P m7 t6|  |
| 32 | Landscape | Open Share view | Public Links section is correct. Switch button to enable | P m7 t6|  |  |
| 33 | Enable | Open Share view and enable public link | Public Links enabled. Check in web and in server side | P m7 t6|  |
| 34 | Edit options | Open Share view. Enable allow editing, password and expiration| Public Links enabled with the selected options. Check in web and in server side | P m7 t6 | FIXED: Can not be saved |
| 35 | Disable | Open Share view and disable public link | Public Links disabled. Check in web and in server side | P m7 |  |
|**Upgrade**||||||
| 36 | Upgrade | 1. Install older version and create some public links<br>2. Upgrade to the new  | Public Links correctly shown | P m7 t6 |  |
|**Errors**||||||
| 37 | No internet connection | 1. Switch internet connection off. <br>2. Create a public link | Error is displayed | P m7 t6| FIXED: Not appropiate error |
| 38 | No server connection | 1. Switch server off. <br>2. Create a public link | Error is displayed | P m7 t6 | FIXED: Not appropiate error |
|**Password Policy**||||||
| 39 | Minimun characters | 1. Set minimum characters as Password Policy<br>2. Create public link with password that does not match the policy| Correct error displayed | P m7 t6 |  |
| 40 | Uppercase | 1. Set Uppercase as Password Policy<br>2. Create public link with password that does not match the policy| Correct error displayed | P m7 t6 |  |
| 41 | Number | 1. Set Number as Password Policy<br>2. Create public link with password that does not match the policy| Correct error displayed | P m7 t6 |  |
| 42 | Special characters | 1. Set Special characters as Password Policy<br>2. Create public link with password that does not match the policy| Correct error displayed | P m7 t6 |  |
| 43 | Expiration with passw | 1. Set number of expiration days if password is set<br>2. Create link without expiration | Expiration date is correctly set | P m7 t6 |  |
| 44 | Expiration without passw | Set number of expiration days if password is not set<br>2. Create link without expiration | Expiration date is correctly set | P m7 t6 |  |