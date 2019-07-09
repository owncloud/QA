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
| Show edit view for a private share with create permissions (folder) | Click a share with create permissions guaranteed. "Can edit" and "create" are enabled, "Can share" is disabled | P m8 | |
| Show edit view for a private share with create and change permissions (folder) | Click a share with create and change permissions guaranteed. "Can edit", "create" and "change" are enabled, "Can share" is disabled | P m8 | |
| Show edit view for a private share with create and delete permissions (folder) | Click a share with create and delete permissions guaranteed. "Can edit", "create" and "delete" are enabled, "Can share" is disabled | P m8 | |
| Show edit view for a private share with create, change and delete permissions (folder) | Click a share with create, change and delete permissions guaranteed. "Can edit", "create", "change" and "delete" are enabled, "Can share" is disabled | P m8 | |
| Show edit view for a private share with change permissions (folder) | Click a share with change permissions guaranteed. "Can edit", and "change" are enabled, "Can share" is disabled | P m8 | |
| Show edit view for a private share with change and delete permissions (folder) | Click a share with change and delete permissions guaranteed. "Can edit", "change" and "delete" are enabled, "Can share" is disabled | P m8 | |
| Show edit view for a private share with delete permissions (folder) | Click a share with delete permissions guaranteed. "Can edit", and "delete" are enabled, "Can share" is disabled | P m8 | |
| Disable edit files | Click "can edit" disables the option. There is no suboptions. Check "Can share" does not change  | P m8 |  |  |  |
| Disable edit folders| Click "can edit" disables the option. Suboptions are hidden. Check "Can share" does not change  | P m8 |  |  |  |
| Loading | After editing an option, Loading dialog is shown before commiting| P m8 |  |  |  |
| Error | En error happens in the edition and it is correctly displayed| P m8 | The error will be shown in the edit permission dialog itself, before was being shown in the background activity snackbar, didn't look fine |  |  |
|**Delete**||||||
| Delete item | Item not in the list anymore |  |  |  |  |
| Loading | After deleting an item, Loading dialog is shown before commiting|  |  |  |  |
| Error | An error happens in the deletion and it is correctly displayed|  |  |  |  |

