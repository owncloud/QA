## 'Activity' Test Plan

- Run Testplan with all checked notifications in Activity settings menu and a mail set in our oC server.


To trigger email sending for testing:


    mysql owncloud -e 'update oc_activity_mq set amq_timestamp=0,amq_latest_send=0;'
    mysql owncloud -e 'update oc_jobs set last_run=0,last_checked=0,reserved_at=0;'
    occ system:cron

This will send out the activity email currently in the queue.

    

## Testing functionality

Test Case | Expected Result | Result | Related Comment
------------- | -------------- | ----- | ------
**CLI commands** |  |   |
|  |   |
Enable Activity app via CLI using ```occ app:enable activity``` | The apps gets enabled | :construction:  |
Disable Activity app via CLI using ```occ app:disable activity``` | The apps gets disabled | :construction:  |
**All activities section** |  |   |
|  |   |
Check that all activities done in this Testplan are shown in this section |  | :construction:  |
**Activities by you section** |  |   |
|  |   |
Check that all activities done with my user in this Testplan are shown in this section |  | :construction:  |
**Activities by others section** |  |   |
Check that all activities done dealing with my user by other users in this Testplan are shown in this section |  | :construction:  |
An LDAP user shares a file with my user | Check that LDAP username is shown properly in this section | :construction:  |
An LDAP user edits a file shared with my user | Check that LDAP username is shown properly in this section | :construction:  |
A Shibboleth user shares a file with my user | Check that Shibboleth username is shown properly in this section | :construction:  |
A Shibboleth user edits a file shared with my user | Check that Shibboleth username is shown properly in this section | :construction:  |
**Comments**|  |   |
|  |   |
Make a comment in a file | Check that the notification is shown in activity section and in the sidebar | :construction:  |
Make a comment in a folder | Check that the notification is shown in activity section and in the sidebar | :construction:  |
**Shares section**|  |   |
|  |   |
Share a file/folder | Check that the notification is shown in activity section and in the sidebar| :construction:  |
Share a file/folder with a user of other oC server | Check that the notification is shown in activity section and in the sidebar| :construction:  |
Share a file/folder via link | Check that the notification is shown in activity section and in the sidebar| :construction:  |
Receive a share for another user| Check that the notification is shown in activity section and in the sidebar| :construction:  |
Receive a share for another user of other oC server| Check that the notification is shown in activity section and in the sidebar| :construction:  |
Receive a file/folder via link adding to your owncloud| Check that the notification is shown in activity section and in the sidebar| :construction:  |
**Settings section stream**|  |   |
|  |   |
Uncheck a new file or folder has been created stream notification and create a folder| Notification is not shown | :construction:  |
Uncheck a file or folder has been changed stream notification and change a file| Notification is not shown | :construction:  |
Uncheck limit notifications about creation and changes to your favorite files stream  notification and change favorite file and a regular file| Notification is not shown | :construction:  |
Uncheck a file or folder has been deleted stream  notification and delete a file | Notification is not shown | :construction:  |
Uncheck a file or folder has been restored stream  notification  and restore a file | Notification is not shown | :construction:  |
Uncheck a file or folder has been shared stream  notification  and share a file| Notification is not shown  | :construction:  |
Uncheck a file or folder was shared from another server stream  notification and accept a share | Notification is not shown | :construction:  |
Uncheck a public shared file or folder was downloaded stream  notification and download a file | Notification is not shown | :construction:  |
Try to uncheck comments for files (always listed in stream) stream  notification and make a comment | It should not be possible | :construction:  |
Uncheck System tags for a file have been modified stream  notification and tag a file|  Notification is not shown| :construction:  |
Uncheck list your own file actions in the stream | Notifications are not shown| :construction:  |
**Settings section mail**| https://github.com/owncloud/activity/wiki/Manual-testing  |   |
Uncheck a new file or folder has been created mail notification and create a file|  | :construction:  |
Uncheck a file or folder has been changed mail notification and change a folder|  | :construction:  |
Check limit notifications about creation and changes to your favorite files mail notification and change favorite file and a regular file| Only notifications about favorite files are sent | :construction:  |
Uncheck a file or folder has been deleted mail notification and delete a folder |  | :construction:  |
Uncheck a file or folder has been restored mail notification and restore a file | The notification is not sent to the mail| :construction:  |
Uncheck a file or folder has been shared mail notification and share a file | The notification is not sent to the mail | :construction:  |
Uncheck a file or folder was shared from another server mail notification and accept a share |  The notification is not sent to the mail | :construction:  |
Uncheck a public shared file or folder was downloaded mail notification and download a file  |  The notification is not sent to the mail | :construction:  |
Try to uncheck comments for files mail notification and make a comment | The notification is not sent to the mail| :construction:  |
Uncheck System tags for a file have been modified mail notification and tag a file |  The notification is not sent to the mail | :construction:  |
Uncheck notify about your own actions via email | Notifications are not sent to the mail | :construction:  |
**webUI with several browsers**|  |   |
Check that notifications are shown properly using Safari as browser|  | :construction:  |
Check that notifications are shown properly using Chrome as browser|  | :construction:  |
Check that notifications are shown properly using Firefox as browser|  | :construction:  |
Check that notifications are shown properly using IE 11 as browser|  | :construction:  |
Check that notifications are shown properly using Edge as browser|  | :construction:  |
