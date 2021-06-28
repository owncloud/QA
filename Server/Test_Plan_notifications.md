
## Setup

* User -> Personal Settings -> Sharing: disable automatic accept of shares.
* User -> Personal Settings -> General: Activity checkboxes: enables all sharing related checkboxes.
* Connect desktop client.
* Regularly run `occ system:cron -p`


## Test items

* [ ] Admin shares folder Photos with User.
   * [ ] User receives sharing notifcation in Activity (top left)
   * [ ] User receives sharing notification with Accept/Reject buttons under the bell icon, (top right)
   * [ ] User receives sharing email with absolute link to his "Shared with me" page with Accept/Reject buttons for the pending share.
   * [ ] User receives sharing notification in desktop client tab "Server Activity" with Accept/Reject buttons.


... More test items see also: https://github.com/owncloud/QA/blob/master/Server/Test_Plan_Activity.md

