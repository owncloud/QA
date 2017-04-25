###  Multiple Public Links 

#### PR: https://github.com/owncloud/android/pull/XXX 


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**View**||||||
| 1 | Portrait  | Open Share view | Public Links section is correct. "+" Button to add new public links. Icons for delete, get link and more options when public link is created. |  |  |
| 2 | Landscape| Open Share view | Public Links section is correct. "+" Button to add new public links. Icons for delete, get link and more options when public link is created. |  |  |  |
|**Creation**||||||
| 3 | Name | 1. Open Share view<br>2. Add a public link with name. Other options default  | Public link created. Check in server |  |  |  |
| 4 | No Name | 1. Open Share view<br>2. Add a public link with all options default  | Public link created with string name. Check in server |  |  |  |
| 5 | Allow editing | 1. Open Share view (folder)<br>2. Add a public link with allow editing enabled | Public link created with allow editing. Check in server |  |  |  |
| 6 | Password | 1. Open Share view<br>2. Add a public link with password enabled | Public link created with password. Check in server |  |  |  |
| 7 | Expiration time | 1. Open Share view<br>2. Add a public link with expiration time | Public link created with expiration time. Check in server |  |  |  |
| 8 | All options | 1. Open Share view<br>2. Add a public link with name, allow editing (folders), password, expiration time | Public link created with all options. Check in server |  |  |  |
|**Edition (link already exists)**||||||
| 9 | Name | 1. Open Share view<br>2. Edit name of public link | Name edited. Check in server |  |  |  |
| 10 | No Name | 1. Open Share view<br>2. Remove name from public link  | Name removed. Check in server |  |  |  |
| 11 | Allow editing | 1. Open Share view (folder)<br>2. Edit option "allow editing" in a public link| Option switched. Check in server |  |  |  |
| 12 | Add Password | 1. Open Share view<br>2. Add password to public link | Password added. Check in server |  |  |  |
| 13 | Edit Password | 1. Open Share view<br>2. Edit password | Password edited. Check in server |  |  |  |
| 14 | Remove Password | 1. Open Share view<br>2. Remove password from public link | Password removed. Check in server |  |  |  |
| 15 | Add expiration time | 1. Open Share view<br>2. Add expiration time to public link | Expiration time added. Check in server |  |  |  |
| 16 | Edit expiration time | 1. Open Share view<br>2. Edit expiration time | Expiration time edited. Check in server |  |  |  |
| 17 | Remove expiration time | 1. Open Share view<br>2. Remove expiration time from public link | Expiration time removed. Check in server |  |  |  |
| 18 | All options | 1. Open Share view<br>2. Edit a public link: name, allow editing (folders), password, expiration time | Public link edited. Check in server |  |  |  |
|**Removal (link already exists)**||||||
| 19 | Remove public link | 1. Open Share view<br>2. Remove public link  | Public link not exists anymore. Check in server |  |  |  |
|**Multiple**||||||
| 20 | Several public links | 1. Open Share view<br>2. Create 5 links with different names  | All links correctly created and displayed. Check in server |  |  |  |
| 21 | Delete | 1. Open Share view<br>2. Remove 2 links of previous test case | These links removed. The other links remain. Check in server |  |  |  |
| 22 | Many public links | 1. Open Share view<br>2. Create 20 links | Links created and correctly displayed. Scroll available. Check in server. |  |  |  |
|**External actions**||||||
| 23 | Creation | 1. Create public links in server<br>2. Open share view in app | Links correctly displayed |  |  |  |
| 24 | Edition | 1. Edit public links in server<br>2. Open share view in app | Links correctly displayed with the edition|  |  |  |
| 25 | Removal | 1. Remove public links in server<br>2. Open share view in app | Links correctly removed |  |  |  |
|**Capabilities**||||||
| 26 | Share link | Disable capability | No public links in app |  |  |  |
| 27 | Enforce password | Enable capability | Password is asked when the public link is created. It can not be disabled |  |  |  |
| 28 | Default expiration | Enable capability | Default expiration is set when the public link is created |  |  |  |
| 29 | Enforced expiration | Enable capability | Expiration is set and can not be disabled |  |  |  |
|**Legacy (version < 10)**||||||
| 30 | Portrait | Open Share view | Public Links section is correct. Switch button to enable |  |  |
| 31 | Landscape | Open Share view | Public Links section is correct. Switch button to enable |  |  |  |
| 32 | Enable | Open Share view and enable public link | Public Links enabled. Check in web and in server side |  |  |
| 33 | Edit options | Open Share view. Enable allow editing, password and expiration| Public Links enabled with the selected options. Check in web and in server side |  |  |
| 34 | Disable | Open Share view and disable public link | Public Links disabled. Check in web and in server side |  |  |
|**Upgrade**||||||
| 35 | Upgrade | 1. Install older version and create some public links<br>2. Upgrade to the new  | Public Links correctly shown |  |  |

