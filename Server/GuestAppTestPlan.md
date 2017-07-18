## 'Guest App' Test Plan


## Testing functionality

Test Case | Expected Result | Result | Related Comment
------------- | -------------- | ----- | ------
**CLI commands** |  |   |
|  |   |
Enable Guest app via CLI using ```occ app:enable guests``` | The apps gets enabled | :construction:  |
Disable Guest app via CLI using ```occ app:disable guests``` | The apps gets disabled | :construction:  |
**Add Guest User in sharetabview** |  |   |
|  |   |
Create a guest user via email | Check that the user recieves the email and can register into oC | :construction:  |
Try to create a guest user via email with an invalid email format | An error message should be shown | :construction:  |
Try to create a guest user via email with an already used email | An warning about a username with that email already exists should be shown | :construction:  |
Try to create a guest user via email already registered by email | A warning about the token is invalid should be shown | :construction:  |
Create a guest user via email using a password that fits password policy | Check that the user recieves the email and can register into oC | :construction:  |Create a guest user via email using a password that doesn't fit password policy | Check that the user recieves the email and cannot register into oC. A warning related password policy should be shown | :construction:  |
**Users Menu** |  |   |
|  |   |
Delete a guest user in user's menu | The user is deleted and no longer available in oC. Check that user disappears from sharetabviews | :construction:  |
Try to create a guest user in users menu adding it to the guest_group| The user should not be created. A warning should be shown | :construction:  |
Change the guest user's password in users menu | The new password is set for the guest user | :construction:  |
**Guest User account**
|  |   |
Log in the guest user account  | Check that the shared file/folder appears with the right permissions | :construction:  |
Reshare a folder with folder permissions to another guest user | Check that the shared works fine | :construction:  |
In personal page, change users email. Then as admin try to create a new guest user with the old mail  | Check that the mail with was used for the register is kept | :construction:  |
**Settings page**
|  |   |
Change Guest Group name  | The group name for guest is changed. Check this change in Users Page and the shares are kept | :construction:  |
Set Guest Group name as empty  | A warning error should be shown and the previous name should be kept | :construction:  |
Set Guest Group name as empty  | A warning error should be shown and the previous name should be kept | :construction:  |
Limit guest access to an app whitelist checked, modify the list and save  | Check that only apps listed are available for guests users | :construction:  |


