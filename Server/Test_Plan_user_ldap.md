## User_Ldap Test Plan

Template: https://github.com/owncloud/QA/blob/master/Server/Test_Plan_user_ldap.md

### Setup

<details><summary>Setup details (click to view)</summary>

* vi tasks/user_ldap.sh -> ldap_server=95.217.210.161 (small server from below)
* `bash ./make_oc10_apps.sh user_ldap=0.15.3-rc4 windows_network_drive`


#### external storages:
 - windows_network_drive
 - SFTP


#### OpenLDAP:

Prepare two LDAP backends for testing:
1. big server
   - 1200 users, 50 groups via releases/oc10/apps/ldap/genusers.py
   - three base DNs (we initially configure only one to owncloud)
   - nested groups

2. small ldap server
  - less than 1000 users, less than 40 groups
  - two base DNs (we initially configure only one to owncloud)

(outdated: https://github.com/owncloud/docker-servers/tree/owncloud-openldap)
</details>

## Testing functionality

### ldap:test-config

- [ ] Run occ command ```ldap:test-config``` with a valid configID
   - [ ] Access fine, The configuration is valid and the connection could be established!
- [ ] Run occ command ```ldap:test-config``` with a wrong host
   - [ ] (the host changed from a valid configuration) | Lost connection to LDAP server
- [ ] Run occ command ```ldap:test-config``` with empty password
   - [ ] The configuration is invalid. Please have a look at the logs for further details
- [ ] Run occ command ```ldap:test-config``` with invalid configID
   - [ ] ERROR: Invalid configID

### ldap:show-config

- [ ] Run occ command ```ldap:show-config``` with no parameters
   - [ ]  Show all configurations available | https://github.com/owncloud/user_ldap/issues/89
- [ ] Run occ command ```ldap:show-config``` with valid configID
   - [ ]  Show only the specified configuration
- [ ] Run occ command ```ldap:show-config``` with invalid configID
   - [ ]  ERROR: Invalid configID
- [ ] Run occ command ```ldap:show-config``` with show-password flag
   - [ ]  ldapAgentPassword shows the password in the result
- [ ] Run occ command ```ldap:show-config``` without show-password flag
   - [ ]  ldapAgentPassword hides the password in the result (uses “****”)

### ldap:set-config
- [ ] Run occ command ```ldap:set-config``` with invalid configID
   - [ ] ERROR: Invalid configID
- [ ] Run occ command ```ldap:set-config``` with valid configID
   - [ ] The config is set

### ldap:search

- [ ] Run occ command ```ldap:search``` with valid configuration and longer limit
   - [ ] Show results
- [ ] Run occ command ```ldap:search``` with offset multiple of limit (both positive)
   - [ ] Show results
- [ ] Run occ command ```ldap:search```  name (default configuration)
   - [ ] Show filtered results
- [ ] Run occ command ```ldap:search``` name (fixed configuration – added “displayName” and/or other attributes in the User Search Attributes field in the wizard)
   - [ ] Show filtered results
- [ ] Run occ command ```ldap:search``` group (fixed configuration – added “displayName” and/or other attributes in the Group Search Attributes field in the wizard)
   - [ ]  Show filtered results
- [ ] Run occ command Group without search `occ ldap:search --group` -> #641
   - [ ] Show groups (currently 15 or less)

### ldap:check-user
- [ ] Run occ command ```ldap:check-user``` with a good oC user id (the lengthy guuid string)
   - [ ] Show success message
- [ ] Run occ command ```ldap:check-user``` with a wrong oC user id
   - [ ] ERROR: ldap user not recognized
- [ ] Run occ command ```ldap:check-user``` with a good oC user id + disabled "Configuration Active" in Advanced->Connection settings
   - [ ] ERROR: Cannot check user existence, because disabled LDAP configurations are present.
- [ ] Run occ command ```ldap:check-user``` Good oc user id + 1 disabled configuration (another one active) + force option
   - [ ] uccess message
- [ ] Run occ command ```ldap:check-user``` Good oc user id + all disabled configuration + force option; then enable the configuration and recheck
   - [ ] Success message

### ldap:create-empty-config
- [ ] Run occ command ```ldap:create-empty-config```
   - [ ] Creates an empty LDAP configuration

### ldap:delete-config
- [ ] Run occ command ```ldap:delete-config```
   - [ ] Deletes an existing LDAP configuration

### user:sync
- [ ] Run occ command ```sudo -u www-data ./occ user:sync "OCA\User_LDAP\User_Proxy"```
   - [ ] This command syncs users stored in LDAP external backend service

### ldap:update-group
- [ ] ~Run occ command ```ldap:update-group```~ XXX Command no longer exists. obsoleted by user:sync
   - [ ] Update the specified group membership information stored locally



### LDAP quota
#### If both LDAP quota field and default LDAP quota are set
- [ ] The user has a value for the LDAP quota attribute
   - [ ] Use that value as quota
- [ ] The user doesn't have a value for the LDAP quota attribute or the value can't be parsed correctly,
   - [ ] use the default LDAP quota
- [ ] the user doesn't have a value for the LDAP quota attribute or the value can't be parsed correctly, and the default LDAP quota can't be parsed correctly
   - [ ] use the ownCloud's default quota.
#### The LDAP quota field is empty and the default LDAP quota is set
- [ ] If default LDAP quota can be parsed correctly
   - [ ] Use the default LDAP quota
- [ ] If default LDAP quota can't be parsed correctly
   - [ ] Use the ownCloud's default quota
#### If the LDAP quota field isn't empty and the LDAP default quota isn't set
- [ ] The user has a value for the attribute
   - [ ] Use that value as quota
- [ ] The user hasn't a value for the attribute
   - [ ] ownCloud's default quota will be used. If the user's quota has a previous value, that value will be kept
#### If neither the LDAP quota field nor the default LDAP quota is set
- [ ] If neither the LDAP quota field nor the default LDAP quota is set
   - [ ] Keep the current quota.


### Several LDAP servers
- [ ] Setup and configure 2 LDAP servers correctly
   - [ ] Users from both servers are visible and can login
- [ ] Setup and configure 2 LDAP servers correctly, shutdown / disconnect one of them
   - [ ] Users from one server (the one that is up) are visible and can login
- [ ] Setup and configure 2 LDAP servers correctly, making sure that at least one user is “shared” in both servers (uid and display name are the same, with different password)
   - [ ] Both users can login in their respective accounts
- [ ] Setup and configure 2 LDAP servers correctly, making sure that at least one user is “shared” in both servers (uid and display name are the same, with different password), and change in the LDAP wizard Expert tab the internal username to “uid” (to force a collision)
   - [ ] Only the password of the first user works.
- [ ] Setup a Backup (Replica) Host, a Backup (Replica) Port and Disable/Shutdown the Main Server
   - [ ] The replica should be used instead of the main server


### Test LDAP properties
- [ ] **email** Set a field as mail in advanced tab
   - [ ] check that the mails are set with the right backend information in personal page for LDAP users
- [ ] **avatar** Login with a user with an avatar field set in LDAP backend
   - [ ] The avatar is shown instead of the username
- [ ] **nested group** In advanced tab , check nested groups checkbox
   - [ ]  In users page the nested group should appear with all the users of the subgroup
- [ ] **internalUserAttribute** In expert tab , set an attribute as Internal Username
   - [ ] The attribute is now used as internal Username

### LDAP Scenarios integrated with external Storage
- [ ] **External Storage General** Mount an external storage using login credentials save in session
   - [ ] The mount is configured properly and we can access it
- [ ] **External Storage Personal** Mount an external storage using login credentials save in session
   - [ ] The mount is configured properly and we can access it
- [ ] **WND Mount Point General** Mount a WND mountpoint using a user from an Active Directory
   - [ ] The mount is configured properly and we can access it
- [ ] **WND Mount Point Personal** Mount a WND mountpoint using a user from an Active Directory
   - [ ] The mount is configured properly and we can access it


### User account table integration
- [ ] Run ```occ user:sync -l```
   - [ ]  list all known backend classes
- [ ] Run ```occ user:sync "OCA\User_LDAP\User_Proxy"```
   - [ ]  synchronize LDAP users from a given backend to the accounts table
- [ ] Make changes in oC backend and ReRun ```occ user:sync "OCA\User_LDAP\User_Proxy"``` choosing disabling accounts option
   - [ ]  Synchronize LDAP users from a given backend updated to the accounts table and disable the previous accounts
- [ ] Make changes in oC backend and ReRun ```occ user:sync "OCA\User_LDAP\User_Proxy"``` choosing deleting accounts option
   - [ ]  Synchronize LDAP users from a given backend updated to the accounts table and delete the previous accounts


### Wizard General
- [ ] default configuration: host + port + admin + pass+ base DN + default filters
   - [ ]  configuration ok, users are loaded, groups might be empty
- [ ] configuration: port with string (rest as defaults)
   - [ ]  ERROR: Configuration incomplete
- [ ] configuration: wrong credentials
   - [ ]  ERROR: Configuration incorrect
- [ ] configuration: from valid config, change to a wrong url and change back to the good ones
   - [ ]  configuration is shown as ok
- [ ] user filter: choose one of the “only those object” select
   - [ ]  Filter is correctly applied in the users page
- [ ] user filter: choose one of the “only those object” select
   - [ ]  user count below is correctly updated
- [ ] user filter: edit raw filter (tested with (|(&(objectclass=inetOrgPerson)(sn=a\*))))
   - [ ]  Filter is correctly applied in the users page
- [ ] user filter: edit raw filter (tested with (|(&(objectclass=inetOrgPerson)(sn=a\*))))
   - [ ]  user count below is correctly updated
- [ ] login filter: checked with LDAP username (uid)
   - [ ]  users can login with uid
- [ ] login filter: checked with LDAP username (uid) and raw filter based on the user filter (tested with (|(&(objectclass=inetOrgPerson)(givenname=Th\*))))
   - [ ] `occ user:sync "OCA\User_LDAP\User_Proxy" -m disable -r` updates enabled/disabled users
   - [ ]  only some users can login (based on the filter)
- [ ] login filter: checked with LDAP username (uid) and with LDAP email
   - [ ]  users can login with both uid and email fields

### Wizard Configuration Server
- [ ] 1. Have the host and port configured correctly <br> 2. Click “Detect Base DN”
   - [ ]  1. If possible (anonymous bind allowed, domain provided, domain resembles LDAP structure) <br> 2. Base DN is found and appears in the corresponding text area
- [ ] 1. Have the host, port, user dn and password configured correctly <br> 2. Click “Detect Base DN”
   - [ ]  1. If possible ((domain given and domain resembles LDAP structure) or full user dn provided) <br> 2. Base DN is found and appears in the corresponding text area
- [ ] 1. Have a valid Base DN (and Host, Port, User, Password) <br> 2. Click “Test Base DN”
   - [ ]  1. If base DN is entered, “Click Test DN” is enabled <br> 2. Message “More then 1.000 directory entries available.” is shown. If total entries are less than 1k, the actual amount is shown
- [ ] 1. Have Basic tab completed correctly <br> 2. “Manually enter LDAP filters” is disabled <br> 3. Move to Users tab
   - [ ]  1. Detection for Obect Classes and Groups is running <br> 2. If the server does not support memberof, the group field is disabled and a message appears. <br> If it does and with more than 40 groups available, a different group selection tool is presented <br> 3. A filter is created and shown next to “LDAP Filter:” (read only)
- [ ] 1. Have Basic tab completed correctly <br> 2. “Manually enter LDAP filters” is enabled <br> 3. Move to Users tab
   - [ ]  1. A raw input field for the LDAP filter is presented. <br> 2. The multi select box elements are disabled <br> 3. i.e. Neither object classes nor groups are being detected


### Wizard Configuration Users
- [ ] 1. “Manually enter LDAP filters” is enabled <br> 2. The input field for manually writing LDAP filter is shown
(“raw mode”) <br> 3. Click on “Edit LDAP Query”
   - [ ]  1. A Configuration Dialog is shown <br> 2. Subsqeuent action is coherent with button click (either switch or stay)
- [ ] 1a. “Manually enter LDAP filters” is enabled and assisted mode is active <br> 1b. or “Manually enter LDAP filters” is disabled <br> 3. Click on “Edit LDAP Query”
   - [ ]  1. Mode is toggled directly <br> 2. If assisted mode is activated for the first time, object class and groups detection is run once
- [ ] 1. In Assisted Mode, click the “edit LDAP query” having selected an object class <br> 2. Click again in the “edit LDAP query” <br> 3. Select another object class keeping the old class
   - [ ]  Both object classes are taken into account
- [ ] 1. Be in Assisted Mode <br> 2. Open object class multiselect <br> 3. Change values up to your choice and close it
   - [ ]  1. After closing, the LDAP filter is being updated (shown next to “LDAP Filter:”) <br> 2. The filter contains exactly all selected object classes
- [ ] 1. Be in Assisted Mode, LDAP server supports memberof,Less than 40 groups available <br> 2. Open group multiselect <br> 3. Change values up to your choice and close it
   - [ ]  1. After closing, the LDAP filter is being updated (shown next to “LDAP Filter:”) <br> 2. The filter contains exactly all selected groups. If primary groups are supported (AD only) for every group there is also a primaryGroupID= part
- [ ] 1. Be in Assisted Mode, LDAP server supports memberof, At least 40 groups available
   - [ ]  1. A different group selector is visible, consisting of a search text input, two lists with available and selected groups And two buttons to move groups
- [ ] 1. Have the extended group selector <br> 2. Perform search with the search input field
   - [ ]  1. According to the value entered groups are filtered correspondingly in both fields
- [ ] 1. Have the extended group selector <br> 2. Select one or more groups in the “available groups” list <br> 3. Click the “>” button
   - [ ]  1. The selected groups are added to the selected groups list <br> 2. The selected groups are removed from the available groups list
- [ ] 1. Have the extended group selector <br> 2. Select one or more groups in the “available groups” list <br> 3. Click the “<” button
   - [ ]  1. The selected groups are removed from the selected groups list <br> 2. The selected groups are added to the available groups list
- [ ] 1. Have a properly set up filter <br> 2. Click on “Verify settings and count users”
   - [ ]  1. A count is done, indicated by a spinner next to the button <br> 2. When done, a label appears saying “xx users found”, if more then 1000 users are available “> 1000 users found“ is shown
- [ ] 1. Have a filter set up that does not return users <br> 2. Click on “Verify settings and count users”
   - [ ]  1. A count is done, indicated by a spinner next to the button <br> 2. When done, a label appears saying “0 users found”

### Wizard Configuration login
- [ ] 1. Have Basic and Users tab completed correctly <br> 2. “Manually enter LDAP filters” is disabled <br> 3. Move to Login Attributes tab
   - [ ]  1. Detection for Attributes is running <br> 2. A filter is created and shown next to “LDAP Filter:” (read only)
- [ ] 1. Have Basic and Users tab completed correctly <br> 2. “Manually enter LDAP filters” is enabled <br> 3. Move to Login Attributes tab
   - [ ]  1. A raw input field for the LDAP filter is presented. <br> 2. The multi select box element for attribute is disabled <br> 3. i.e. Attributes are not detected
- [ ] 1. “Manually enter LDAP filters” is enabled <br> 2. The input field for manually writing LDAP filter is shown (“raw mode”) <br> 3. Click on “Edit LDAP Query”
   - [ ]  1. A Configuration Dialog is shown <br> 2. Subsqeuent action is coherent with button click (either switch or stay)
- [ ] 1a. “Manually enter LDAP filters” is enabled and assisted mode is active <br> 1b. or “Manually enter LDAP filters” is disabled <br> 3. Click on “Edit LDAP Query”
   - [ ]  1. Mode is toggled directly <br> 2. If assisted mode is activated for the first time, object class and groups detection is run once
- [ ] 1. In Assisted Mode, click the “edit LDAP query” having selected an attribute <br> 2. Click again in the “edit LDAP query” <br> 3. Select another attribute keeping the old attribute
   - [ ]  Both attributes are taken into account
- [ ] 1. Be in Assisted Mode <br> 2. Open other attributes multiselect <br> 3. Change values up to your choice and close it
   - [ ]  1. After closing, the LDAP filter is being updated (shown next to “LDAP Filter:”) <br> 2. The filter contains all selected attributes (and maybe more if checkboxes above are selected)
- [ ] 1. Be in Assisted Mode <br> 2. (Un)check LDAP / AD Username
   - [ ]  1. The LDAP filter is updated accordingly and contains uid or samaccountname attributes (depends on LDAP server)
- [ ] 1. Be in Assisted Mode <br> 2. (Un)check LDAP / AD Email address
   - [ ]  1. The LDAP filter is updated accordingly and contains mailPrimaryAddress and mail attributes
- [ ] 1. Have a properly set up filter <br> 2. Enter a valid “Test Loginname” <br> 3. Click on “Verify settings”
   - [ ]  1. A spinner indicates the verification is going on <br> 2. A message shows the positive result: “User found and settings verified.”
- [ ] 1. Have a properly set up filter <br> 2. Enter an invalid “Test Loginname” <br> 3. Click on “Verify settings”
   - [ ]  1. A spinner indicates the verification is going on <br> 2. A failure message is shown containing the effective filter for manual testing: “User not found. Please check your login attributes and username. Effective filter (to copy-and-paste for command line validation): $FILTER“

### Wizard Configuration groups
- [ ] 1. Have other tabs completed correctly <br> 2. “Manually enter LDAP filters” is disabled <br> 3. Move to Groups tab
   - [ ]  1. Detection for Obect Classes and Groups is running <br> 2.If more than 40 groups available, a different group selection tool is presented (not the known multiselect) <br> 3. No filter is created initially, no text next to “LDAP Filter:”
- [ ] 1. Have other tabs completed correctly <br> 2. “Manually enter LDAP filters” is enabled <br> 3. Move to Groups tab
   - [ ]  1. A raw input field for the LDAP filter is presented. <br> 2. The multi select box elements are disabled <br> 3. i.e. Neither object classes nor groups are being detected
- [ ] 1. “Manually enter LDAP filters” is enabled <br> 2. The input field for manually writing LDAP filter is shown
(“raw mode”) <br> 3. Click on “Edit LDAP Query”
   - [ ]  1. A Configuration Dialog is shown <br> 2. Subsequent action is coherent with button click (either switch or stay)
- [ ] 1a. “Manually enter LDAP filters” is enabled and assisted mode is active <br> 1b. or “Manually enter LDAP filters” is disabled <br> 3. Click on “Edit LDAP Query”
   - [ ]  1. Mode is toggled directly <br> 2. If assisted mode is activated for the first time, object class and groups detection is run once
- [ ] 1. Be in Assisted Mode <br> 2. Open object class multiselect <br> 3. Change values up to your choice and close it
   - [ ]  1. After closing, the LDAP filter is being updated (shown next to “LDAP Filter:”) <br> 2. The filter contains exactly all selected object classes
- [ ] 1. Be in Assisted Mode, Less than 40 groups available <br> 2. Open group multiselect <br> 3. Change values up to your choice and close it
   - [ ]  1. After closing, the LDAP filter is being updated (shown next to “LDAP Filter:”)  <br> 2. The filter contains exactly all selected groups.
- [ ] 1. Be in Assisted Mode, at least 40 groups available.
   - [ ]  1. A different group selector is visible, consisting of a search text input, two lists with available and selected groups and two buttons to move groups
- [ ] 1. Have the extended group selector. <br> 2. Perform search with the search input field
   - [ ]  1. According to the value entered groups are filtered correspondingly in both fields
- [ ] 1. Have the extended group selector 2. Select one or more groups in the “available groups” list 3. Click the “>” button
   - [ ]  1. The selected groups are added to the selected groups list 2. The selected groups are removed from the available groups list
- [ ] 1. Have the extended group selector <br> 2. Select one or more groups in the “selected groups” list <br> 3. Click the “<” button
   - [ ]  1. The selected groups are removed from the selected groups list 2. The selected groups are added to the available groups list
- [ ] 1. Have a properly set up filter <br> 2. Click on “Verify settings and count groups”
   - [ ]  1. A count is done, indicated by a spinner next to the button <br> 2. When done, a label appears saying “xx groups found”, if more then 1000 groups are available “> 1000 groups found“ is shown
- [ ] 1. Have a filter set up that does not return groups <br> 2. Click on “Verify settings and count groups”
   - [ ]  1. A count is done, indicated by a spinner next to the button <br> 2. When done, a label appears saying “0 groups found”


### Wizard Configuration Advanced
- [ ] 1. Have other tabs completed correctly <br> 2. Go to Advanced Tab <br> 3. Be in Connection Settings
   - [ ]  1. See that configuration is active
- [ ] 1. Have other tabs completed correctly <br> 2. Go to Advanced Tab <br> 3. Open Directory Settings
   - [ ]  1. User Display Name field should be not displayName, but displayname (lowercase) or cn (due to auto-detection in the background) <br> 2. Group-Member-Associtation should be correct (depends on OpenLDAP, AD typically has “member (AD)”)
- [ ] 1. Have other tabs completed correctly <br> 2. Go to Advanced Tab <br> 3. Open Special Attributes
   - [ ]  1. “Email field” should be filled in (given that at least one user has mail or mailPrimaryAddress set, So that auto-detection can do its job)
- [ ] 1. Change anything in advanced tab
   - [ ] Click on background triggers autosave (show saving/saved)
   - [ ] Reload. The value is as changed. Auto-save works everywhere now.
- [ ] 1. Click on “Test configuration”
   - [ ]  1. A message will appear with the result of the Test
- [ ] 1. Click button to clear user mappings
   - [ ] 1. A success message should appear <br> 2. The database table ldap_user_mapping is emptied (needs to be filled before of course, e.g. by going to Users page)
- [ ] 1. Click button to clear group mappings
   - [ ]  1. A success message should appear <br> 2. The database table ldap_group_mapping is emptied (needs to be filled before of course, e.g. by going to Users page)


### Wizard Configuration Chooser
- [ ] 1. Click on “+” Button
   - [ ]  1. A new, empty configuration was created
- [ ] 1. Click on Clone Button
   - [ ]  1. A new configuration was created and pre-filled with the settings of the last active configuration
- [ ] 1. Click on Delete Button
   - [ ]  1. A confirmation dialog appears <br> 2a) Click on No: deletion was cancelled <br> 2b) Click on Yes: configuration was deleted and switched to first configuration
- [ ] 1. Select a different configuration from the drop down
   - [ ]  1. The selected configuration is loaded <br> 2. The status is updated accordingly
