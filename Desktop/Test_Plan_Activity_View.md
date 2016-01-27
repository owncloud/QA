# Test Plan Activity View

## Previous requirements

Have a Desktop Client v2.1.0 ready to be used with owncloud

Have a LDAP server ready to be used with owncloud

Have a Redirected server ready to be used with owncloud

## Testing functionality

TestID | Test Case | Expected Result | Result | Related Comment
------------ | ------------- | -------------- | ----- | ------
1 | "Server Activity"  |  1.- Access to the activity tab   2.- Check that the Server activity view is shown in reverser chronological order| |
2 | Server Activity | Check that actions done from any other client, such as web interface are shown: upload files / delete / share /rename |
3 | Server Activity - multiple accounts| Check that actions of all the registered accounts done from any other client, such as web interface are shown: upload files / delete / share /rename |
4 | Server Activity - pause/no connection| 1.- Having the desktop client on going pause an account, 2.- Do any action from the server interface, 3.- Resume the sync 4.- Info is shown |
5 | Sync Protocol  |  1.- Access to the activity tab 2.- Check that the Sync Protocol view is show|  |
6 | Sync Protocol multiaccount |  1.- Access to the activity tab check that it is shown info for every registered account  |
7 | Sync Protocol- pause/no connection| 1.- Having the desktop client on going pause an account, 2.- Modify any data (upload/create a folder) 3.- Resume the sync 4.- Info is shown |
8 | Not synced- Upload a file with special characters, such as *, and wait to sync| This file is not appear on Sync Procotol tab, because the file was ignored and it's shown on the not synced| |
9 | Not synced - black listed | 1.- Add a new rule on the edit ignore files 2.- Create a file that meets this list 3.- File is not synced and it's shown on the not synced tab |
10 | Disable the Activity App |  1.- Access to the activity tab 2.- Click on the Server Activities, you can see this information: "account user1..... does not have activities enabled" | |
10 | Disable the Activity App just on one account|  1.- Access to the activity tab 2.- Click on the Server Activities, you can see this information: "account user1..... does not have activities enabled", info is shown for other accounts | |
11 | Tested with a old Server version (e.g 8.1.4)| 1.- Access to the Activity tab 2.- You can see the 3 options (Server activity, Sync Protocol, Not synced 3.- And the funcionality is the same | | 
12 | Tested with SAML SSO mode| 1.- Access to the Activity tab 2.- You can see the 3 options (Server activity, Sync Protocol, Not synced 3.- And the funcionality is the same|| 
13 | Tested with SAML Autoprovisioning mode|1.- Access to the Activity tab 2.- You can see the 3 options (Server activity, Sync Protocol, Not synced 3.- And the funcionality is the same |  | 
14 | Copy button |Check the copy button |  | 



