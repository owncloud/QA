## 'Sharee - autocompletion results' Test Plan


## Setup enviroments

1. Create 2 groups.
2. Create 4 users.
3. Configure a LDAP
4. Configure an Active Directory
3. Add 2 users to each group.
4. Upload files with all of them.
5. Create some folders for each user.
6. Linux environment: Ubuntu 14.04  mysql and apache with ssl activated


## Testing functionality

TestID | Test Case | Expected Result | Result | Related Comment
------------ | ------------- | -------------- | ----- | ------
 | **Sharee with regular users** |  |   |
 |  |  |   |
1 | Sharing a file, write down a pattern that matches with a regular user | The user that matches with this pattern is shown in the dropdown | :construction:  |
2 | Sharing a file, write down a pattern that does not match with any regular user | A warning message about no results found is shown in the dropdown | :construction:  |
3 | Sharing a file, write down a pattern that matches with the user logged | The user logged is NOT shown in the dropdown | :construction:  |
4 | Share a file with a user. After that, write down a pattern that matches with some regular users, included the previous one | The usernames that match with this pattern are shown in the dropdown except the one that had been already shared  | :construction:  |
5 | Share a folder with a user. After that, write down a pattern that matches with some regular users, included the previous one | The usernames that match with this pattern are shown in the dropdown except the one that had been already shared  | :construction:  |
6 | Restrict users to only share with users in their groups option active in oC Server; write down a pattern that matches with a regular user that belongs to the same group as the logged user| The user that matches with this pattern is shown in the dropdown | :construction:  |
7 | Restrict users to only share with users in their groups option active in oC Server; write down a pattern that matches with a regular user that does NOT belong to the same group as the logged user| The user that matches with this pattern is NOT shown in the dropdown | :construction:  |
8 | Exclude groups from sharing option active in oC Server and users group is included; try to write down a pattern for sharing| The share textbox is not visible | :construction:  |
9 | Exclude groups from sharing option active in oC Server and user B group is included; write down a pattern that matches with a regular user B that belongs to the excluded group| The username appears in the dropdown | :construction:  |
10 | Allow username autocompletion in share dialog option disabled in oC Server; write down a pattern that matches with a regular user but not completed| The username does NOT appear in the dropdown | :construction:  |
 | **Sharee with regular groups** |  |   |
 |  |  |   |
11 | Sharing a file, write down a pattern that matches with a regular group | The group that matches with this pattern is shown in the dropdown | :construction:  |
12 | Sharing a file, write down a pattern that does not match with any regular group | A warning message about no results found is shown in the dropdown | :construction:  |
13 | Share a file with a group. After that, write down a pattern that matches with some regular groups, included the previous one | The groupnames that match with this pattern are shown in the dropdown except the one that had been already shared  | :construction:  |
14 | Restrict users to only share with users in their groups option active in oC Server; write down a pattern that matches with the group of the logged user | The group that matches with this pattern is shown in the dropdown | :construction:  |
15 | Restrict users to only share with users in their groups option active in oC Server; write down a pattern that does NOT match with the group of the logged user | The group that matches with this pattern is NOT shown in the dropdown | :construction:  |
16 | Exclude groups from sharing option active in oC Server and user B group is included; write down a pattern that matches with a regular excluded group| The group appears in the dropdown | :construction:  17 | Allow username autocompletion in share dialog option disabled in oC Server; write down a pattern that matches with a regular group but not completed| The group does NOT appear in the dropdown | :construction:  |
18 | Allow username autocompletion in share dialog option disabled in oC Server; write down a pattern that matches exactly with a regular group| The groupname appears in the dropdown | :construction:  |
 | **Sharee with LDAP users** |  |   |
 |  |  |   |
19 | Sharing a file, write down a pattern that matches with an LDAP user | The user that matches with this pattern is shown in the dropdown | :construction:  |
20 | Sharing a file, write down a pattern that does not match with any LDAP user | A warning message about no results found is shown in the dropdown | :construction:  |
21 | Share a file with an LDAP user. After that, write down a pattern that matches with some LDAP users, included the previous one | The usernames that match with this pattern are shown in the dropdown except the one that had been already shared  | :construction:  |
22 | Share a folder with an LDAP user. After that, write down a pattern that matches with some LDAP users, included the previous one | The usernames that match with this pattern are shown in the dropdown except the one that had been already shared  | :construction:  |
23 | Allow username autocompletion in share dialog option disabled in oC Server; write down a pattern that matches with a LDAP user but not completed| The username does NOT appear in the dropdown | :construction:  |
24 | Allow username autocompletion in share dialog option disabled in oC Server; write down a pattern that matches exactly with an LDAP user| The username appears in the dropdown | :construction:  |
 | **Sharee with Active Directory users** |  |   |
 |  |  |   |
25 | Sharing a file, write down a pattern that matches with an AD user | The user that matches with this pattern is shown in the dropdown | :construction: |
26 | Sharing a file, write down a pattern that does not match with any AD user | A warning message about no results found is shown in the dropdown | :construction:  |
27 | Share a file with an AD user. After that, write down a pattern that matches with some AD users, included the previous one | The usernames that match with this pattern are shown in the dropdown except the one that had been already shared  | :construction:  |
28 | Share a folder with an AD user. After that, write down a pattern that matches with some AD users, included the previous one | The usernames that match with this pattern are shown in the dropdown except the one that had been already shared  | :construction:  |
29 | Allow username autocompletion in share dialog option disabled in oC Server; write down a pattern that matches with a AD user but not completed| The username does NOT appear in the dropdown | :construction:  |
30 | Allow username autocompletion in share dialog option disabled in oC Server; write down a pattern that matches exactly with an AD user| The username appears in the dropdown | :construction:  |