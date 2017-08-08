## Sharee - autocompletion results Test Plan


## Setup enviroments

1. Create 2 groups.
2. Create 4 users.
3. Configure a LDAP
4. Configure an Active Directory
5. Configure a SHIB
6. Add 2 users to each group.
7. Upload files with all of them.
8. Create some folders for each user.
9. Linux environment: Ubuntu 14.04  mysql and apache with ssl activated


## Testing functionality



| Test Case                                | Expected Result                          | Result         | Related Comment |
| ---------------------------------------- | ---------------------------------------- | -------------- | --------------- |
| Sharing a file, type a pattern that matches with a regular user | The user that matches with this pattern is shown in the dropdown | :construction: |                 |
| Sharing a file, type a pattern that does not match with any regular user | A warning message about no results found is shown in the dropdown | :construction: |                 |
| Sharing a file, type a pattern that matches with the user logged in | The user logged in is NOT shown in the dropdown | :construction: |                 |
| Share a file with a user. After that, type a pattern that matches with some regular users, including the previous one | The usernames that match with this pattern are shown in the dropdown except the one that had been already shared | :construction: |                 |
| Share a folder with a user. After that, type a pattern that matches with some regular users, including the previous one | The usernames that match with this pattern are shown in the dropdown except the one that had been already shared | :construction: |                 |
| Restrict users to only share with users in their groups option active in oC Server; type a pattern that matches with a regular user that belongs to the same group as the logged in user | The user that matches with this pattern is shown in the dropdown | :construction: |                 |
| Restrict users to only share with users in their groups option active in oC Server; type a pattern that matches with a regular user that does NOT belong to the same group as the logged in user | The user that matches with this pattern is NOT shown in the dropdown | :construction: |                 |
| Exclude groups from sharing option active in oC Server and users group is included; try to type a pattern for sharing | The share textbox is not visible         | :construction: |                 |
| Exclude groups from sharing option active in oC Server and user B group is included; type a pattern that matches with a regular user B that belongs to the excluded group | The username appears in the dropdown     | :construction: |                 |
| Allow username autocompletion in share dialog option disabled in oC Server; type a pattern that matches with a regular user but not completed | The username does NOT appear in the dropdown | :construction: |                 |
| Disable sharing by link option in the admin page, using a regular user use the share dialog to share a file with another regular user. | Users appear in the dropdown, and file is shared correctly. | :construction: |                 |
| **Sharee with regular groups**           |                                          |                |                 |
|                                          |                                          |                |                 |
| Sharing a file, type a pattern that matches with a regular group | The group that matches with this pattern is shown in the dropdown | :construction: |                 |
| Sharing a file, type a pattern that does not match with any regular group | A warning message about no results found is shown in the dropdown | :construction: |                 |
| Share a file with a group. After that, type a pattern that matches with some regular groups, including the previous one | The groupnames that match with this pattern are shown in the dropdown except the one that had been already shared | :construction: |                 |
| Restrict users to only share with users in their groups option active in oC Server; type a pattern that matches with the group of the logged in user | The group that matches with this pattern is shown in the dropdown | :construction: |                 |
| Restrict users to only share with users in their groups option active in oC Server; type a pattern that does NOT match with the group of the logged in user | The group that matches with this pattern is NOT shown in the dropdown | :construction: |                 |
| Exclude groups from sharing option active in oC Server and user B group is included; type a pattern that matches with a regular excluded group | The group appears in the dropdown        | :construction: |                 |
| Allow username autocompletion in share dialog option disabled in oC Server; type a pattern that matches exactly with a regular group | The groupname appears in the dropdown    | :construction: |                 |
| **Sharee with LDAP users**               |                                          |                |                 |
|                                          |                                          |                |                 |
| Sharing a file, type a pattern that matches with an LDAP user | The user that matches with this pattern is shown in the dropdown | :construction: |                 |
| Sharing a file, type a pattern that matches with an LDAP user when LDAP is down | The user that matches with this pattern should not be shown in the dropdown | :construction: |                 |
| Sharing a file, type a pattern that matches with an LDAP user when LDAP is down, but there is an active Backup (replica) Host  | The user that matches with this pattern is shown in the dropdown | :construction: | 
| Sharing a file, type a pattern that does not match with any LDAP user | A warning message about no results found is shown in the dropdown | :construction: |                 |
| Share a file with an LDAP user. After that, type a pattern that matches with some LDAP users, including the previous one | The usernames that match with this pattern are shown in the dropdown except the one that had been already shared | :construction: |                 |
| Share a folder with an LDAP user. After that, type a pattern that matches with some LDAP users, including the previous one | The usernames that match with this pattern are shown in the dropdown except the one that had been already shared | :construction: |                 |
| Allow username autocompletion in share dialog option disabled in oC Server; type a pattern that matches with a LDAP user but not completed | The username does NOT appear in the dropdown | :construction: |                 |
| Allow username autocompletion in share dialog option disabled in oC Server; type a pattern that matches exactly with an LDAP user | The username appears in the dropdown     | :construction: |                 |
| Share a file from an AD user to a regular user. LDAP server goes down after the sharing | Check that the share is no longer available and an error is shown if regular user was editing the file and tries to save it | :construction: | 	|
| **Sharee with Active Directory users**   |                                          |                |                 |
|                                          |                                          |                |                 |
| Sharing a file, type a pattern that matches with an AD user | The user that matches with this pattern is shown in the dropdown | :construction: |                 |
| Sharing a file, type a pattern that matches with an AD user when AD is down | The user that matches with this pattern should not be shown in the dropdown | :construction: |
| Sharing a file, type a pattern that matches with an AD user when AD is down, but there is an active Backup (replica) Host  | The user that matches with this pattern is not shown in the dropdown | :construction: |
| Sharing a file, type a pattern that does not match with any AD user | A warning message about no results found is shown in the dropdown | :construction: |                 |
| Share a file with an AD user. After that, type a pattern that matches with some AD users, including the previous one | The usernames that match with this pattern are shown in the dropdown except the one that had been already shared | :construction: |                 |
| Sharing a folder, type a pattern that matches with an AD user when AD is down | The user that matches with this pattern should not be shown in the dropdown | :construction: |
| Sharing a folder, type a pattern that matches with an AD user when AD is down, but there is an active Backup (replica) Host  | The user that matches with this pattern is shown in the dropdown | :construction: |
| Share a folder with an AD user. After that, type a pattern that matches with some AD users, including the previous one | The usernames that match with this pattern are shown in the dropdown except the one that had been already shared | :construction: |                 |
| Allow username autocompletion in share dialog option disabled in oC Server; type a pattern that matches with an AD user but not completed | The username does NOT appear in the dropdown | :construction: |                 |
| Allow username autocompletion in share dialog option disabled in oC Server; type a pattern that matches exactly with an AD user | The username appears in the dropdown     | :construction: |
| Share a file from an AD user to a regular user. LDAP server goes down after the sharing | Check that the share is no longer available and an error is shown if regular user was editing the file and tries to save it | :construction: |                 |
| **Sharee with SHIB users**               |                                          |                |                 |
|                                          |                                          |                |                 |
| Sharing a file, type a pattern that matches with an SHIB user | The user that matches with this pattern is shown in the dropdown | :construction: |                 |
| Sharing a file, type a pattern that does not match with any SHIB user | A warning message about no results found is shown in the dropdown | :construction: |                 |
| Share a file with an SHIB user. After that, type a pattern that matches with some SHIB users, including the previous one | The usernames that match with this pattern are shown in the dropdown except the one that had been already shared | :construction: |                 |
| Share a folder with an SHIB user. After that, type a pattern that matches with some SHIB users, including the previous one | The usernames that match with this pattern are shown in the dropdown except the one that had been already shared | :construction: |                 |
| Allow username autocompletion in share dialog option disabled in oC Server; type a pattern that matches with a SHIB user but not completed | The username does NOT appear in the dropdown | :construction: |                 |
| Allow username autocompletion in share dialog option disabled in oC Server; type a pattern that matches exactly with an SHIB user | The username appears in the dropdown     | :construction: |                 |