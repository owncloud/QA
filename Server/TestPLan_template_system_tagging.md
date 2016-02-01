Previous requirements: use https and enable encryption.



| Test Case                                | Expected Result                          | Result | Related Comment |
| ---------------------------------------- | ---------------------------------------- | ------ | --------------- |
| Using admin share a file 'File.txt' with user1, with user1 share it with user2. As admin put a tag on 'File.txt'. Edit the tag with user1 and with user2. | User1 and user2 can edit the tag and the changes affect all users. |        |                 |
| Put a few tags on a file when there are several tags previously assigned. Remove some as well. | A list of possible tags appear on the sidebar when clicking on the textfield. They can be removed and added using checkboxes. |        |                 |
| Tag a folder with files and folders inside. | Tag is not propagated across files and subfolders inside folder. |        |                 |
| Having several files and folders tagged with same tag, rename a tag using a regular user. | Tag is not removed in any file, but renamed. Other users can see it as well. |        |                 |
| Using LDAP users, ldap_user1 share a file 'File.txt' with ldap_user2, using ldap_user2 share it with ldap_user3. As admin put a tag on 'File.txt'. Edit the tag with ldap_user2 and with ldap_user3. | ldap_user1, 2 and 3 users can edit the tag and the changes affect all users. |        |                 |
| Using AD users, ad_user1 share a file 'File.txt' with ad_user2, using ad_user2 share it with ad_user3. As admin put a tag on 'File.txt'. Edit the tag with ad_user2 and with ad_user3. | ad_user1, 2 and 3 users can edit the tag and the changes affect all users. |        |                 |
| Mount an external storage, create a folder inside, upload a file, share it with another user, tag it with three tags. | Receiver can see and edit the tags.      |        |                 |
| Using Chrome, check that tags can be edited, list appear, checkboxes are clickable and tags are shown. |                                          |        |                 |
| Using Edge, check that tags can be edited, list appear, checkboxes are clickable and tags are shown. |                                          |        |                 |
| Using Firefox, check that tags can be edited, list appear, checkboxes are clickable and tags are shown. |                                          |        |                 |
| Using Safari, check that tags can be edited, list appear, checkboxes are clickable and tags are shown. |                                          |        |                 |







