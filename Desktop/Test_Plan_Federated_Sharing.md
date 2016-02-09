## Test Plan Federated Sharing

## Previous requirements

Have a Desktop Client vXXXX ready to be used with owncloud

Have a LDAP server

Have a differents servers Maintenance version (v XXXXXX, v XXXXXXX, XXXXXXXX)

Have a Encryption server



## Testing functionality

###Federated share

TestID |  Test Case | Expected Result | Result | Related Comment
------------ | ------------- | -------------- | ----- | ------ | ------
1 | share a file (userA) to (userB) |  shared file can be seen from the userB ||
2 | share a folder (userA) to (userB) |  shared folder can be seen from the userB and access to its contents ||
3 |  unshare a file/folder in your ownCloud (userB) |  shared file/folder no longer visible from the userB ||
4 |share a file (userA) to (userB) |  shared file can be seen from the userB ||
5 |share a folder (userA) in (userB), delete file in userA |  file is shown in userA ||
6 |share a file (userA) in (userB), update the file in userA |  file is updated in userB ||
7 | share a file (userA) in (userB) using an LDAP user |  shared file can be seen from the userB ||
8 |share a file (userA) in (userB) using different O.C server versions |  shared file can be seen from the userB ||
9 | share a folder (userA) in (userB), userA with encryption enable |  shared folder and files can be seen in both users ||
10 | share a file (userA) in (userB) using different O.C versions both servers with encryption |  shared file can be seen from the userB ||
11 | share a file (userA) to (userB) and edit it |  shared file can be seen modified from the userB ||
12 | share a file (userA) to (userB) and edit it from userB (allowed editing unmarked when sharing) |  shared file can be seen modified from both users ||
13 | share a file (userA) to (userB) and check edition is not possible form userB (allowed editing unmarked when sharing) |  shared file cannot be modified from both users ||
14 | share a folder (userA) to (userB) and edit it |  shared folder can be seen modified from the userB ||
15 |  share a file (userA) to (userB) and rename it in userA |  shared file in userA is seen with the new name and old named in userB ||
16 |  share a file (userA) to (userB) and rename it from userB |  shared file can be seen renamed form the userB and old named in userA ||
17 | share a folder (userA) to (userB) and rename it in userA |  shared folder can be seen new named in userA and old named in userB ||
18 |  share a folder (userA) to (userB) and rename it in userB |  shared folder can be seen new named in userB and old named in userA ||
19 |  share a folder (userA) to (userB) and rename a file in dir|  shared file can be seen renamed form both users ||
20 |  share a folder (userA) to (userB) and rename a file in dir userB |  shared file can be seen renamed form both users ||
21 | share a file (userA) to (userB) and delete a file in dir userB |  shared file should not be seen in both users ||
22 |share a file (userA) to (userB) with the same name as one deleted before in userB and restore it |  shared file and file restored should appear in userB ||
23 |  share a file (userA) to (userB) with the same as one that already exists in userB |  shared file in userB should be shared as name(2) ||
24 |  share a file (userA) to (userB) and after share another file with the same as the previous one, but from a folder in userA|  shared file in userB should be shared as name(2) ||
25 |  share a file (userA) to (userB) with the same as one that already exists in userB, and edit it in userB |  shared file in userB should be shared as name(2) and edit in both servers ||
26 | share a file (userA) to (userB) and after share another file with the same name as the previous one, but from a folder in userA, and edit it in userA |  Shared file in userB should be shared as name(2) and edit in both users ||


###Federated share link

TestID |  Test Case | Expected Result | Result | Related Comment
------------ | ------------- | -------------- | ----- | ------ | ------
1 | Share a file with link (userA), add link to your O.C (userB) |  Shared file can be seen from the userB ||
2 | Share a folder with link (userA), add link to your O.C (userB) |  Shared folder can be seen from the userB and access to its contents||
3 | Unshare a file/folder in your O.C (userB) |  Shared file is no longer visible from the userB ||
4 | Share a file with userA, add link to your O.C (userB), delete file in userA | Shared file is not longer visible form the userB ||
5 | Share a file with link password-protected (userA), add link to your O.C with the correct password (userB) | Shared file can be seen from the userB||
6 | Share a file with link password-protected (userA), add link to your O.C with a wrong password (userB) | Error is notified and file is not visible ||
7 | Share a file with link password-protected (userA), and link to your O.C with the correct password (userB), change the password (userA) |  File is not accessible anymore ||
8 | Share a folder with link (userA) allowing editing, add link to your O.C (userB), upload a file inside the folder (userB) | File is shown in userA ||
9 | Share a file with link (userA), add link to your O.C (userB), update the file in userA | File is updated in userB ||
10 | Share a file with link (userA), add link to your O.C (userB), using an LDAP user | Shared file can be seen from the userB||
11 | Share a file with link (userA), add link to your O.C (userB), using an Active Directory user | Shared file can be seen from the userB||
12 | Share a file with link (userA), add link to your O.C (userB), using different O.C versions | Shared file can be seen from the userB||
13 | Share a folder with link (userA), add link to your O.C (userB), using different O.C versions | Shared folder can be seen from the userB||
14 | Share a file with link (userA), add link to your O.C (userB), using userA with encrytion | Shared file can be seen from the userB||
15 | Share a file with link (userA), add link to your O.C (userB), using different O.C versions both servers with encryption| Shared file can be seen from the userB||
16 | Share a file with link (userA), add link to your O.C (userB), and modify the file from userA | Shared file can be seen modified from the userB||
17 | Share a file with link (userA), add link to your O.C (userB), and modify the file from userB (allow editing marked when sharing) | Shared file can be seen modified from both servers|
18 | Share a file with link (userA), add link to your O.C (userB), and rename the folder | Shared file can be seen renamed from the userB and oldnamed in userA||
19 | Share a file with link (userA), add link to your O.C (userB), and rename the file in userA | Shared file can be seen renamed from the userB and old named in userA||
20 | Share a folder with link (userA), add link to your O.C (userB), using different O.C versions | Shared folder can be seen renamed from the userB and old named in userA||
21 | Share a folder with link (userA) to userB and add files in dir in userB | Added files can be seen in both users||
22 | Share a folder with link (userA) to userB and delete a file in dir in userB | Shared file gone in both users||
23 | Share a folder with link (userA) to userB and rename a file dir in userB | Shared file can be seen renamed from both users||
24 | Share a folder with link (userA) to userB and reneme a file in dir userA | Shared file can be seen renamed from both users||
25 | Share a file with link (userA) to userB with the same a one that alredy exist in userB | Shared file in userB should be shared as name(2)||
26 | Share a file with link (userA) to userB and after share another file with the same name as the previous one, but from a folder in userA | Shared file in useB should be shared as name(2)||
27 | Edit a file using the text editor | Shared file should be edited in both users||


###Check admin restriction

TestID |  Test Case | Expected Result | Result | Related Comment
------------ | ------------- | -------------- | ----- | ------ | ------
1 | Disable allow users on this server to send shares to other servers | An error message is thrown and file is not sent ||
2 | Disable allow users on this server to receive shares from other servers | An error message is thrown and file is not received ||