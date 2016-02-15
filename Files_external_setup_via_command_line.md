## 'Files_external - set up via command line' Test Plan


## Testing functionality

|TestID | Test Case | Expected Result | Result | Related Comment
------------ | ------------- | -------------- | ----- | ------
**files_external:create** |  |   |
|  |   |
Create a S3 mountpoint via command line | The mountpoint is created and appears in the server webUI | :construction:  |
Create a DropBox mountpoint via command line | The mountpoint is created and appears in the server webUI | :construction:  |
Create a FTP mountpoint via command line | The mountpoint is created and appears in the server webUI | :construction:  |
Create a GoogleDrive mountpoint via command line | The mountpoint is created and appears in the server webUI | :construction:  |
Create a Local mountpoint via command line | The mountpoint is created and appears in the server webUI | :construction:  |
Create a OpenStack mountpoint via command line | The mountpoint is created and appears in the server webUI | :construction:  |
Create a ownCloud mountpoint via command line | The mountpoint is created and appears in the server webUI | :construction:  |
Create a SFTP mountpoint via command line | The mountpoint is created and appears in the server webUI | :construction:  |
Create a SMB mountpoint via command line | The mountpoint is created and appears in the server webUI | :construction:  |
Create a webDAV mountpoint via command line | The mountpoint is created and appears in the server webUI | :construction:  |
**files_external:config** |  |   |
|  |   |
Configure a S3 mountpoint via command line | The mountpoint is configured with the new data and appears in the server webUI | :construction:  |
Configure a DropBox mountpoint via command line | The mountpoint is configured with the new data and appears in the server webUI | :construction:  |
Configure a FTP mountpoint via command line | The mountpoint is configured with the new data and appears in the server webUI | :construction:  |
Configure a GoogleDrive mountpoint via command line | The mountpoint is configured with the new data and appears in the server webUI | :construction:  |
Configure a Local mountpoint via command line | The mountpoint is configured with the new data and appears in the server webUI | :construction:  |
Configure a OpenStack mountpoint via command line | The mountpoint is configured with the new data and appears in the server webUI | :construction:  |
Configure a ownCloud mountpoint via command line | The mountpoint is configured with the new data and appears in the server webUI | :construction:  |
Configure a SFTP mountpoint via command line | The mountpoint is configured with the new data and appears in the server webUI | :construction:  |
Configure a SMB mountpoint via command line | The mountpoint is configured with the new data and appears in the server webUI | :construction:  |
Configure a webDAV mountpoint via command line | The mountpoint is configured with the new data and appears in the server webUI | :construction:  |
|**files_external:applicable** |  |   |
|  |   |
Add an applicable user to a S3 mountpoint via command line | The mountpoint is configured and visible only for the user | :construction:  |
Add an applicable user to a DropBox mountpoint via command line | The mountpoint is configured and visible only for the user | :construction:  |
Add an applicable user to a GoogleDrive mountpoint via command line | The mountpoint is configured and visible only for the user | :construction:  |
Add an applicable user to a SFTP mountpoint via command line | The mountpoint is configured and visible only for the user | :construction:  |
Remove an applicable user to a S3 mountpoint via command line | The mountpoint is configured and applicable user condition is removed  | :construction:  |
Remove an applicable user to a DropBox mountpoint via command line | The mountpoint is configured and applicable user condition is removed | :construction:  |
Remove an applicable user to a GoogleDrive mountpoint via command line | The mountpoint is configured and applicable user condition is removed | :construction:  |
Remove an applicable user to a SFTP mountpoint via command line | The mountpoint is configured and applicable user condition is removed | :construction:  |
Add an applicable group to a S3 mountpoint via command line | The mountpoint is configured and visible only for the group | :construction:  |
Add an applicable group to a DropBox mountpoint via command line | The mountpoint is configured and visible only for the group | :construction:  |
Add an applicable group to a GoogleDrive mountpoint via command line | The mountpoint is configured and visible only for the group | :construction:  |
Add an applicable group to a SFTP mountpoint via command line | The mountpoint is configured and visible only for the group | :construction:  |
Remove an applicable group to a S3 mountpoint via command line | The mountpoint is configured and applicable group condition is removed  | :construction:  |
Remove an applicable group to a DropBox mountpoint via command line | The mountpoint is configured and applicable group condition is removed | :construction:  | | 
Remove an applicable group to a GoogleDrive mountpoint via command line | The mountpoint is configured and applicable group condition is removed | :construction:  |
Remove an applicable group to a SFTP mountpoint via command line | The mountpoint is configured and applicable group condition is removed | :construction:  |
Remove all applicable conditions of a S3 mountpoint via command line | The mountpoint is configured and applicable conditions are removed | :construction:  |
Remove all applicable conditions of a DropBox mountpoint via command line | The mountpoint is configured and applicable conditions are removed | :construction:  |
Remove all applicable conditions of a GoogleDrive mountpoint via command line | The mountpoint is configured and applicable conditions are removed | :construction:  |
Remove all applicable conditions of a SFTP mountpoint via command line | The mountpoint is configured and applicable conditions are removed | :construction:  |
| **files_external:backends** |  |   |
|  |   |
After configuring some external storages mountpoints, run backends command via CLI | A list of available authentication and their config options is shown | :construction:  |
**files_external:export** |  |   |
 |  |  |   |
Data configuration for exporting mountpoints is shown | Check that mount configurations are exported | :construction:  |
| **files_external:import** |  |   |
|  |   |
Import the mountpoins from another server | Check that mount configurations are imported | :construction:  |
**files_external:option** |  |   |
|  |   |
Change Mount option for a S3  mount | The option of the mountpoint is disable encryption. Check it with list command | :construction:  |
Change Mount option for a DropBox mount | The option of the mountpoint is disable sharing. Check it with list command | :construction:  |
Change Mount option for a GoogleDrive  mount | The option of the mountpoint is change watcher policy. Check it with list command | :construction:  |
Change Mount option for a SFTP  mount | The option of the mountpoint is ddisable thumbnail. Check it with list command | :construction:  |
**files_external:list** |  |   |
|  |   |
Connect several external storages | Check the list of configured mounts is shown | :construction:  |
**files_external:verify** |  |   |
|  |   |
Verify mount configuration of a S3 mountpoint | The verify command returns status OK, code 0 and no message | :construction:  |
Verify mount configuration of a DropBox mountpoint | The verify command returns status OK, code 0 and no message | :construction:  |
Verify mount configuration of a GoogleDrive mountpoint| The verify command returns status OK, code 0 and no message | :construction:  |
Verify mount configuration of a SFTP mountpoint | The verify command returns status OK, code 0 and no message| :construction:  |
Verify a wrong mount configuration of a S3 mountpoint | he verify command returns status error, code  and error message | :construction:  |
Verify a wrong mount configuration of a DropBox mountpoint | The verify command returns status error, code  and error message | :construction:  |
Verify a wrong mount configuration of a GoogleDrive mountpoint| The verify command returns status error, code  and error message | :construction:  |
Verify a wrong mount configuration of a SFTP mountpoint | The verify command returns status error, code  and error message | :construction:  |
**files_external:delete** |  |   |
|  |   |
Delete a S3 mountpoint via command line | The mountpoint is deleted and does NOT appear in the server webUI | :construction:  |
Delete a DropBox mountpoint via command line | The mountpoint is deleted and does NOT appear in the server webUI | :construction:  |
Delete a FTP mountpoint via command line | The mountpoint is deleted and does NOT appear in the server webUI | :construction:  |
Delete a GoogleDrive mountpoint via command line | The mountpoint is deleted and does NOT appear in the server webUI | :construction:  |
Delete a Local mountpoint via command line | The mountpoint is deleted and does NOT appear in the server webUI | :construction:  |
Delete a OpenStack mountpoint via command line | The mountpoint is deleted and does NOT appear in the server webUI | :construction:  |
Delete a ownCloud mountpoint via command line | The mountpoint is deleted and does NOT appear in the server webUI | :construction:  |
Delete a SFTP mountpoint via command line | The mountpoint is deleted and does NOT appear in the server webUI | :construction:  |
Delete a SMB mountpoint via command line | The mountpoint is deleted and does NOT appear in the server webUI | :construction:  |
Delete a webDAV mountpoint via command line | The mountpoint is deleted and does NOT appear in the server webUI | :construction:  |
