###  Hidden files

#### Pr: https://github.com/owncloud/ios-app/pull/394

Devices: iPhoneX v12<br>
Server: 10.1

---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | 
| :-------- | :---- | :------- | :----: | :------------------------- | 
|**View**|||||
| Option hidden files | In Settings, check the new option in both orientations | Correct view | P m12 t12 |  |  |
|**Actions**|||||
| Option enabled | In Settings enable the option to show hidden files | Files that starts with "." are in the list | P m12 t12|  |  |
| Option disabled | In Settings disable the option to show hidden files | Files that starts with "." are not in the list | P m12 t12 |  |  |
| Change name | Add a "." to the item name | Item is not in the list anymore | P m12 t12|  |  |
| Change name remote | Add a "." to the item name in web UI | Item is not in the list anymore | P m12 t12|  |  |
| Switch option | With several hidden files, switch the option | Items are shown/hidden in the list | P m12 t12|  |  |
| Files app hidden | With the option disabled, open files app over an account with hidden files | Items are not shown | P m12 t12 |  |  |
| Files app shown | With the option enabled, Open files app over an account with shown files | Items are shown | P m12 t12|  |  |
| Change name Files app | In Files App, rename any item starting with "." | Item hidden | NA | Not allowed by Files app |  |