## Updater Test Plan


## Requirements

* Configure a oC Server with LDAP or AD users backend
* Before the update, share files/folder between LDAP users and regular users.
* Create a file, encrypt the server and create another file after the encryption.


# Testing updates

For testing updates you'll need to deploy a version of the update server https://github.com/owncloud/administration/tree/master/update-server and adjust its configuration to match the one from the update to test.

Make sure the ownCloud directory is writable by the web server.

## Forcing ownCloud to recheck the update server immediately

Run this on the database: `delete from oc_appconfig where configkey='lastupdatedat';`

## Configuring the update server to use

/**
 * URL that ownCloud should use to look for updates
 */
'updater.server.url' => 'https://updates.owncloud.com/server/',

Edit "config.php" in ownCloud and set the value of "update.server.url" to the location of the deployed update server.

## Testing functionality



| Test Case                                | Expected Result                          | Result         | Related Comment |
| ---------------------------------------- | ---------------------------------------- | -------------- | --------------- |
| Update oC server via production channel | The update succeeds and the files are available. Check the server status | :construction: |                 |
| Update oC server via stable channel | The update succeeds and the files are available. Check the server status | :construction: |                 |
| Update oC server via beta channel | The update succeeds and the files are available. Check the server status| :construction: |                 |
| Update oC server via daily channel | The update succeeds and the files are available. Check the server status | :construction: |                 |
| Update oC server via production channel with encryption enabled | The update succeeds and the files are available. Check the server status | :construction: |                 |
| Update oC server via stable channel with encryption enabled | The update succeeds and the files are available. Check the server status | :construction: |                 |
| Update oC server via beta channel with encryption enabled | The update succeeds and the files are available. Check the server status| :construction: |                 |
| Update oC server via daily channel with encryption enabled | The update succeeds and the files are available. Check the server status | :construction: |                 |
