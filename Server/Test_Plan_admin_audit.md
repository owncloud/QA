## 'Admin_Audit' Test Plan

TBD: Nothing useful found in https://github.com/owncloud/QA/tree/master/Server

## Setup

<details><summary>Setup details (click to view)</summary>

* [ ] deploy via make_oc10_apps.sh with ftp, wnd storage, admin_audit
     
</details>

## Testing functionality

Test Case | Expected Result | Result | Related Comment
------------- | -------------- | ----- | ------
Improve testplan | More tests | :construction: | TBD

----
* [ ] TODO: REview last last report 
----
## Regression Test items

* [ ] audit log
   * [ ] configure according to https://github.com/owncloud/admin_audit/blob/master/README.md#configuration
* [ ] web (or client triggered) events
   * [ ] log line format conforms to https://github.com/owncloud/admin_audit/blob/master/README.md#output
   * [ ] actions are distinguished: file_create file_update
   * [ ] actions are distinguised: file_trash_restore file_version_restore
   * [ ] actions seen: group_member_added
   * [ ] action seen when user changes his email address: user_update_user_preference_value changeMail
   * [ ] action seen when admin changes a users quota: user_feature_changed
* [ ] cli triggered events
   * [ ] config_set actions are logged for e.g. `occ config:system:set foo --value bar`
   * [ ] config_set actions are logged for  `occ config:app:set core backgroundjobs_mode --value web` with `"created":false`
   * [ ] config_set actions are logged for bogus `occ config:app:set fish chips --value pommes` with  `"created": true`
   * [ ] command_executed actions are logged for e.g. `occ app:list admin_audit`
 * [ ] login events
   * [ ] user_login actions distinguish failed and succeeded user login
   * [ ] desktop client login
 * [ ] public links on external storage with admin_audit enabled
   * [ ] access a public link of a file on external SFTP storage, file can be downloaded.
   * [ ] access a public link of a folder on external WND storage, contents can be up/downloaded.
