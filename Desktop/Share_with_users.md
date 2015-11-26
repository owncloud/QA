## Desktop Client: 'Sharing with users' Test Plan


## Previous requirements

Prepare a OC server with ssl activated and trusted certificates.

Enable LDAP, external storage, Password Policy (enterprise), SharePoint (enterprise) apps.

Have a LDAP server ready to be used with owncloud.

Have an Active Directory server ready to be used with owncloud.

Have ready two external storages of your choice e.g SMB, FTP, S3, ownCloud.

## Testing setup


TestID | Test Case | Expected Result | Result | Related Comment
------------ | ------------- | -------------- | ----- | ------
1 | Enable encryption app and encryption default module | Encryption is enabled correctly | :white_check_mark:  |
2 | Populate owncloud server with users and groups | Users and groups are correctly created | :white_check_mark:  |
3 | Share a folder remotely using federated sharing with admin user of the other server. | folder can be opened in recipient server without problems | :white_check_mark:  |
4 | Set up LDAP, as admin check users. log in with a LDAP user | Users are loaded. LDAP user logs in without problems. | :white_check_mark:  |
5 | Set up two external storages different, disable encryption in one of them.| No errors in this process | :white_check_mark:  |

## Testing functionality

TestID | Test Case | Expected Result | Result | Related Comment
------------ | ------------- | -------------- | ----- | ------
1 | Share a file with a user | The file appears in server | :construction:  |
2 | Share a file with a user that has been already shared another file | Both files appear in server | :construction:  |
3 | Share a folder with a user | The folder appears in server | :construction:  |
4 | Share a folder with a user that has been already shared another file | Both folders appear in server | :construction:  |
5 | Share a file with a group| The file appears in server | :construction:  |
6 | Share a folder with an LDAP user | The folder appears in server | :construction:  |
7 | Share a file with an Active Directory user| The file appears in server | :construction:  |
8 | Share a folder with a Shibboleth user autoprovisioned| The folder appears in server | :construction:  |
9 | Share a file with a Shibboleth SSO user| The file appears in server | :construction:  |
10 | Try to Share a folder with a user that belongs to a oC server version below 8.2.X| It's not possible to share with users | :construction:  |
11 | Share a file with one user whose name contains special characters such as @ or .| The file appears in server | :construction:  |
12 | Share a folder with one users a file whose name contains special characters such as @ or . | The folder appears in server | :construction:  |
13 | Try to federate share a file with one user | Not possible yet | :construction:  |
15 | Share a file from S3 with a user | The file appears in server | :construction:  |
16 | Share a folder from SMB with a user | The folder appears in server | :construction:  |
17 | Share a file from WND with a user | The file appears in server | :construction:  |
18 | Share a folder from Sharepoint with a user | The folder appears in server | :construction:  |
19 | Share a file from a Federated Sharing with a user | The file appears in server | :construction:  |
20 | Share a folder from redirected server with a user | The folder appears in server | :construction:  |
21 | Using a redirected server, Share a file with a user | The file appears in server | :construction:  |
22 | Share a file with user B with Can Share permissions enabled. Login as User B and reshare it | The file can be reshared in the server with other user| :construction:  |
23 | Share a file with user B with Can Edit permissions enabled. Login as User B and edit it  | The file can be edited in the server with other user | :construction:  |
24 | Share a file with user B with Change permission enabled. Login as User B and change it  | The file can be changed in the server with other user | :construction:  |
25 | Share a file with user B with Can Edit permissions enabled. Login as User B and edit it. Change via Desktop the permissions. try to edit it again | The file can be edited in the server with other user | :construction:  |
26 | Share a folder with user B with Can Share permissions enabled. Login as User B and reshare it | The folder can be reshared in the server with other user | :construction:  |
27 | Share a folder with user B with Can Edit permissions enabled. Login as User B and edit it  | The folder can be edited in the server with other user | :construction:  |
28 | Share a folder with user B with Change permission enabled. Login as User B and change it  | The folder can be changed in the server with other user | :construction:  |
29 | Share a folder with user B with Create permissions enabled. Login as User B and create a file in it | The folder can be edited creating a file in the server with other user | :construction:  |
30 | Share a folder with user B with Create permissions enabled. Login as User B and create a folder in it | The folder can be edited creating a folder in the server with other user | :construction:  |
31 | Share a folder with user B with Can Edit permissions enabled. Login as User B and delete it  | The folder can be edited in the server with other user | :construction:  |
32 | Share a folder with user B with Can Edit permissions enabled. Login as User B and edit it. Change via Desktop the permissions. Try to edit it again | The folder cannot be edited the second time | :construction:  |
33 | Share a file with user B without Can Share permission enabled. Login as User B and try to reshare it | The file cannot be reshared | :construction:  |
34 | Share a file with user B without Can Edit permission enabled. Login as User B and try to edit it  | The file cannot be edited | :construction:  |
35 | Share a file with user B without Change permission enabled. Login as User B and try to change it  | The file cannot be changed | :construction:  |
36 | Share a folder with user B without Can Share permission enabled. Login as User B and try to reshare it | The folder cannot be reshared | :construction:  |
37 | Share a folder with user B without Can Edit permissions enabled. Login as User B and try to edit it  | The folder cannot be edited | :construction:  |
38 | Share a folder with user B without Create permissions enabled. Login as User B and try to create a file in it  | The folder cannot be edited creating a file in it | :construction:  |
39 | Share a folder with user B without Change permissions enabled. Login as User B and try to change it  | The folder cannot be changed | :construction:  |
40 | Share a folder with user B without Delete permissions enabled. Login as User B and try to delete it  | The folder cannot be edited deleting files/folders in it | :construction:  |
41 | Share link a file and download it | The file is shared | :construction:  |
42 | Share link a folder and download it | The folder is shared | :construction:  |
43 | Share link a file and disable it after | The link should not be enabled any longer | :construction:  |
44 | Share link a file and 'add to your owncloud' a user that belongs to the server| The file is shared | :construction:  |
45 | Share link a file and 'add to your owncloud' a user that belongs to the server and has been already shared another file| The file is shared | :construction:  |
46 | Share link a file and 'add to your owncloud' with a user that belongs to another server| The file is shared | :construction:  |
47 | Try to share link a file and 'add to your owncloud' with an LDAP user| The file is shared | :construction:  |
48 | Try to share link a file and 'add to your owncloud' with an Active Directory user| The file is shared | :construction:  |
49 | Try to share link a file and 'add to your owncloud' with a Shibboleth user autoprovisioned| The file is shared | :construction:  |
50 | Try to share link a file and 'add to your owncloud' with a Shibboleth user SSO| The file is shared | :construction:  |
51 | Share link a file and 'add to your owncloud' with a user that belongs to another oC server below 8.2.X version| The file is shared | :construction:  |
52 | Share link a file with a user and set a password | The file is shared with a pwd | :construction:  |
53 | Share link a file with a user and set a pwd with special characters | The file is shared with a pwd | :construction:  |
54 | Share link a file with setting a password and modifiying it later | The file is shared and the pwd is changed | :construction:  |
55 | Share link a file with a user and set a password. Modify Password Policies and retry | The pwd is updated | :construction:  |
56 | With Password Policy App enabled, Share link a file with a user  and set a password that matches with the pwd policy| The file is shared with pwd | :construction:  |
57 | With Password Policy App enabled, Share link a file with a user  and set a password that does not match with the pwd policy| An error should be shown | :construction:  |
58 | Share link a file with a user and set a valid Expiration date | The file is shared with an expiration date | :construction:  |
59 | Share link a file with a user and set a password and a expiration date | The file is shared with pwd and expiration date | :construction:  |
60 | Share link a file with a user and set a password and a expiration date. Change the expiration date | The file is shared with the updated expiration date | :construction:  |
61 | Share link a file with a user and set a password and a expiration date. Change the pwd | The file is shared with the updated pwd | :construction:  |
62 | Try to search a user that has already been shared the file in the users searchbox | The user should not be shown | :construction:  |
63 | Try to search yourself in the users searchbox | The user should not be shown | :construction:  |
64 | Search for 'pa' pattern | All users that contains this pattern should be shown | :construction:  |
65 | Try to search a remote user in the users searchbox | The user should not be shown (not developed yet) | :construction:  |
66 | Share a file with more than 4 users | The users should be listed and ordered chronologicaly. If is needed a scrollbar will appear | :construction:  |
67 | Sharing API  | The users should be listed and ordered chronologicaly. If is needed a scrollbar will appear | :construction:  |
