###  Private Sharing: Edit, delete

#### Pr: https://github.com/owncloud/android/pull/


---

 
| Test Case | Expected | Result | Related Comment / Bug link | 
| :-------- | :------- | :----: | :------------------------- | 
|**Edit**||||||
| Show edit view for a private share with no permissions | Click a share with edit and share permissions not guaranteed. "Can edit" and "Can share" are disabled in edit view | P m8 | |
| Show edit view for a private share with edit permission | Click a share with just edit permission guaranteed. "Can edit" is enabled but "Can share" isn't. | P m8 | |
| Show edit view for a private share with share permission | Click a share with just share permission guaranteed. "Can edit" isn't enabled while "Can share" is. | P m8 | |
| Show edit view for a private share with all permissions | Click a share with edit and share permissions guaranteed. Both "Can edit" and "Can share" are enabled | P m8 | |
| Disable edit files | Click "can edit" disables the option. There is no suboptions. Check "Can share" does not change  |  |  |  |  |
| Disable edit folders| Click "can edit" disables the option. Suboptions are hidden. Check "Can share" does not change  |  |  |  |  |
| Loading | After editing an option, Loading dialog is shown before commiting|  |  |  |  |
| Error | En error happens in the edition and it is correctly displayed|  |  |  |  |
|**Delete**||||||
| Delete item | Item not in the list anymore |  |  |  |  |
| Loading | After deleitin an item, Loading dialog is shown before commiting|  |  |  |  |
| Error | En error happens in the deletion and it is correctly displayed|  |  |  |  |

