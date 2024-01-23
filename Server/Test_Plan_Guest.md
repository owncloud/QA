## 'Guest App' Test Plan

- Run Testplan with encryption enabled

## Testing functionality

Test Case | Expected Result | Result | Related Comment
------------- | -------------- | ----- | ------
**CLI commands** |  |   |
|  |   |
Enable Guest app via CLI using ```occ app:enable guests``` | The apps is enabled | :construction:  |
Disable Guest app via CLI using ```occ app:disable guests``` | The apps is disabled | :construction:  |
**Web Frontend (Classic Design)** |  |   |
|  |   |
Enable Guest app via Web Frontend (Classic Design) using App Section in Settings Page | The apps is enabled | :construction:  
Disable Guest app via Web Frontend (Classic Design) using App Section in Settings Page | The apps is disabled | :construction:  |
**Add Guest User in sharetabview** |  |   |
|  |   |
Create a guest user via email |  | :construction:  |
Try to create a guest user via email sharing from another guest user | Only Federation is offered, not guest | :construction:  |
Try to create a guest user via email when a server email is not set or it is invalid|  An error message should be shown | :construction:  |
Try to create a guest user via email with an invalid email format | An error message should be shown | :construction:  |
Try to create a guest user via email with an email used by a normal user | Converted into sharing with this normal user | :construction:  |
Create a guest user via email using a password that fits password policy | Check that the user receives the email and can register into oC | :construction:  | 
Create a guest user via email using a password that doesn't fit password policy | Check that the user receives the email and cannot register into oC. A warning related to password policy should be shown | :construction:  |
**Users Menu** |  |   |
|  |   |
Delete a guest user in user's menu | The user is deleted and no longer available in oC. Check that user disappears from sharetabviews | :construction:  |
Try to create a guest user in users menu adding it to the guest_app group| The user is created. but cannot be added to the group | :construction:  |
Change the guest user's password in users menu | The new password is set for the guest user | :construction:  |
**Guest User account**|  |   |
|  |   |
Log in the guest user account  | Check that the shared file/folder appears with the right permissions | :construction:  |
Reshare a folder with folder permissions to another guest user | Check that the shared folder works fine | :construction:  |
In personal page, change users email. Then as admin try to create a new guest user with the old mail  | Check that the mail which was used for the register is kept | :construction:  |
**Settings page**|  |   |
|  |   |
Change Guest Group name  | The group name for guest is changed. Check this change in Users Page and the shares are kept | :construction:  |
Set Guest Group name as empty  | A warning error should be shown and the previous name should be kept | :construction:  |
Limit guest access to an app whitelist checked, modify the list and save  | Check that only apps listed are available for guests users | :construction:  |
**WebUI and browsers**|  |   |
|  |   |
Check that guests menu in sharing section works fine using FireFox as browser |  | :construction:  |
Check that guests menu in sharing section works fine using Chrome as browser |  | :construction:  |
Check that guests menu in sharing section works fine using IE11 as browser |  | :construction:  |
Check that guests menu in sharing section works fine using Edge as browser |  | :construction:  |
Check that guests menu in sharing section works fine using Safari as browser |  | :construction:  |
**Translations**|  |   |
|  |   |
Check that translations to German and Arabic happens |  | :construction:  |
