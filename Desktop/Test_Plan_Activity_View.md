# Test Plan Activity View

## Previous requirements

Have a Desktop Client v2.1.0 ready to be used with owncloud

Have a LDAP server ready to be used with owncloud

Have a Redirected server ready to be used with owncloud

## Testing functionality

TestID | Test Case | Expected Result | Result | Related Comment
------------ | ------------- | -------------- | ----- | ------
1 | "Server Activity"  |  1.- Access to the activity tab   2.- Check that the Server activity view is shown| |
2 | "Sync Protocol"  |  1.- Access to the activity tab 2.- Check that the Sync Protocol view is show|  |
3 | "Not synced"  | 1.- Access to the activity tab  2.- Check that the Sync Protocol view is show |  |
4 | The activity feed from the server is listed here in reverse chronologial order  | 1.- Create a new folder/file on the Desktop 2.- Share this folder/file with othe user 3.- Access to the activity tab 4.- Check on Server Activity | |
5 | When a new file or folder is shared with other user | You can see this file/folder on the Server Activity and on the Sync Protocol tab|  |
7 | Create a new folder/file | You can see this file/folder on the Sync Protocol tab|  |
8 | Upload a file with expecial characters and wait to sync| This file is not appear on Sync Procotol tab, because the file was ignored| |
9 | Upload a file with expecial character, and wait to sync| The error appear on the Not Synced tab|  | 
10 | Disable the Activity App |  1.- Access to the activity tab 2.- Click on the Server Activities, you can see this information: "account user1..... does not have activities enabled" | |
11 | Tested with a old Server version (e.g 8.1.4)| 1.- Access to the Activity tab 2.- You can see the 3 options (Server activity, Sync Protocol, Not synced 3.- And the funcionality is the same | | 
12 | Tested with LDAP server| 1.- Access to the Activity tab 2.- You can see the 3 options (Server activity, Sync Protocol, Not synced 3.- And the funcionality is the same|  |
13 | Tested with SAML SSO mode| 1.- Access to the Activity tab 2.- You can see the 3 options (Server activity, Sync Protocol, Not synced 3.- And the funcionality is the same|| 
14 | Tested with SAML Autoprovisioning mode|1.- Access to the Activity tab 2.- You can see the 3 options (Server activity, Sync Protocol, Not synced 3.- And the funcionality is the same |  | 
15 | Tested with redirected server| 1.- Access to the Activity tab 2.- You can see the 3 options (Server activity, Sync Protocol, Not synced 3.- And the funcionality is the same|  | 


