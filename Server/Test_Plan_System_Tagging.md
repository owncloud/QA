Previous requirements: use https and enable encryption.

Hints for webdav testing:

Save this as propfind_tags.txt

``` xml
<?xml version="1.0"?>
<a:propfind xmlns:a="DAV:" xmlns:oc="http://owncloud.org/ns">
       <a:prop><oc:display-name/>
       <oc:user-visible/>
       <oc:user-assignable/>
       <oc:id/></a:prop>
</a:propfind>
```

Use curl to get answers.

Create new tag:

curl -D - -X POST -H "Content-Type: application/json" -d '{"name":"new tag", "userVisible": true, "userAssignable": true}' http://USER:PASSWORD@HOST/remote.php/dav/systemtags

Get all tags:

curl -X PROPFIND -H "Content-Type: text/xml" --data-binary "@propfind_tags.txt" http://USER:PASSWORD@HOST/remote.php/dav/systemtags | xmllint --format -

Assign tag to a file:

curl -X PUT  http://USER:PASSWORD@HOST/remote.php/dav/systemtags/remote.php/dav/systemtags-relations/files/$fileID/$tagID

You can get the fileid in the tr field inspecting the file in the files view using chrome. Or do a PROPFIND on remote.php/webdav/path/to/file and request the property "oc:id" or "oc:fileid".

Unassign tag to a file:

curl -X DELETE  http://USER:PASSWORD@HOST/remote.php/dav/systemtags/remote.php/dav/systemtags-relations/files/$fileID/$tagID





| Test Case                                | Expected Result                          | Result | Related Comment |
| ---------------------------------------- | ---------------------------------------- | ------ | --------------- |
| Using admin share a file 'File.txt' with user1, with user1 share it with user2. As admin assign a tag on 'File.txt'. Edit the tag with user1 and with user2. | User1 and user2 can edit the tag and the changes affect all users. |        |                 |
| Assign a few tags on a file when there are several tags previously assigned. Remove some as well. | A list of possible tags appear on the sidebar when clicking on the textfield. They can be assigned and unassigned using checkboxes. |        |                 |
| Assign a tag to a folder with files and folders inside. | Tag is not propagated across files and subfolders inside folder. |        |                 |
| Having several files and folders tagged with same tag, rename a tag using a regular user. | Tag is not removed in any file, but renamed. Other users can see it as well. |        |                 |
| Assign a tag to a file shared with another user, move it to another folder using owner of the file. | Tag is still assigned. Sharer and sharee can see it. |        |                 |
| Assign a tag to a folder shared with another user, move the folder inside another folder. | Sharee and sharer can still see the tag on the folder. |        |                 |
| Assign three tags to a file. Delete the file. Restore it. | Tags are kept.                           |        |                 |
| Create a tag using special characters. Assign it to a file and a folder. | No problems found in the process.        |        |                 |
| Using webdav, move a file which has a tag assigned to a folder into a deep nested structure. | Tag is still there.                      |        |                 |
| Using LDAP users, ldap_user1 share a file 'File.txt' with ldap_user2, using ldap_user2 share it with ldap_user3. As admin assign a tag on 'File.txt'. Edit the tag with ldap_user2 and with ldap_user3. | ldap_user1, 2 and 3 users can edit the tag and the changes affect all users. |        |                 |
| Using AD users, ad_user1 share a file 'File.txt' with ad_user2, using ad_user2 share it with ad_user3. As admin assign a tag on 'File.txt'. Edit the tag with ad_user2 and with ad_user3. | ad_user1, 2 and 3 users can edit the tag and the changes affect all users. |        |                 |
| Mount an external storage, create a folder inside, upload a file, share it with another user, tag it with three tags. | Receiver can see and edit the tags.      |        |                 |
| Using Chrome, check that tags can be edited, list appear, checkboxes are clickable and tags are shown. |                                          |        |                 |
| Using Edge, check that tags can be edited, list appear, checkboxes are clickable and tags are shown. |                                          |        |                 |
| Using Firefox, check that tags can be edited, list appear, checkboxes are clickable and tags are shown. |                                          |        |                 |
| Using Safari, check that tags can be edited, list appear, checkboxes are clickable and tags are shown. |                                          |        |                 |
| Using two different browsers, one with user1 logged in and another with user2 logged in. User1 shares a file with user2, having both windows opened try to create same tag. | Second user in creating tag doesn't see any error. Just the tag created. |        |                 |
| Using two different browsers, one with user1 logged in and another with user2 logged in. User1 shares a file with user2, having both windows opened try to assign same tag. | Tag is assigned. Users doesn't detect any conflicts. |        |                 |
| Using two different browsers, one with user1 logged in and another with user2 logged in. User1 shares a file with user2, having both windows opened try to unassign same tag. | Tag is unassigned. Users doesn't detect any conflicts. |        |                 |
| Using webdav endpoint, assign a tag to a file. | Tag can be seen in the web ui.           |        |                 |
| Using webdav endpoint, assign a tag to a folder. | Tag can be seen in the web ui.           |        |                 |
| Using webdav endpoint, unassign a tag to a file. | Tag disappears in the web ui as well.    |        |                 |
| Using webdav endpoint, unassign a tag to a folder. | Tag disappears in the web ui as well.    |        |                 |