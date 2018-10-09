# Smoke test

## Previous requirements

Prepare two servers with ssl activated and trusted certificates.

Enable LDAP and external storage apps.

Have a LDAP server ready to be used with owncloud.

Have ready two external storages of your choice SMB, SFTP, Dropbox, Google Drive, FTP, S3, ownCloud, local.

Scenarios to consider:
- [ ] OAuth2 and sync + mobile clients ( can be deployed remotely )
- [ ] LDAP 
- [ ] Shibboleth ( + LDAP )
- [ ] Windows Network Drive (also use it as sync target ) 
- [ ] Guests
- [ ] Impersonate
- [ ] Login with App Token Login
- [ ] TOTP

## Testing setup


TestID | Test Case | Expected Result | Result | Related Comment
------------ | ------------- | -------------- | ----- | ------
1 | Enable encryption app and encryption default module | Encryption is enabled correctly | :construction: |
2 | Populate owncloud server with users and groups | Users and groups are correctly created | :construction: |
3 | Share a folder remotely using federated sharing with admin user of the other server. | folder can be opened in recipient server without problems | :construction: |
4 | Set up LDAP, as admin check users. log in with a LDAP user, if possible one with an avatar. | Users are loaded. LDAP user logs in without problems. Avatar is shown if it exists.  | :construction: |
5 | Set up two external storages different, disable encryption in one of them.| No errors in this process | :construction: |

##Testing functionality

TestID | Test Case | Expected Result | Result | Related Comment
------------ | ------------- | -------------- | ----- | ------
1 | Share a file using federated sharing from an external unencrypted external storage in server #1 using a LDAP user to the admin user in server #2. | Admin user in server #2 can see the file. | :construction: |
2 | Open internet explorer or edge and upload a new avatar for a regular user not LDAP | Interface can be used, avatar is uploaded, check that personal page has a scroll bar and scrolls fine. | :construction: |
3 | Upload several files and folders inside external storages, open some. | No problems uploading, files can be downloaded and opened. | :construction: |
4 | Delete files inside both external storages. Recover some after from the trashbin. |  Files are correctly deleted and restored. | :construction: |
5 | Using webdav upload a 100MiB file.| No errors in this process | :construction: |


Pyocclient status:

- Travis stable8		![stable8 pyocclient] (https://travis-ci.org/owncloud/pyocclient.svg?branch=stable8)
- Travis stable8.1 	![stable8.1 pyocclient] (https://travis-ci.org/owncloud/pyocclient.svg?branch=stable8.1)
- Travis stable8.2 	![stable8.2 pyocclient] (https://travis-ci.org/owncloud/pyocclient.svg?branch=stable8.2)
- Travis master 		![master pyocclient] (https://travis-ci.org/owncloud/pyocclient.svg?branch=master)


Smashbox status:

Git master: [![Build Status](https://ci.owncloud.org/job/smashbox-on-docker-daily-master/badge/icon)](https://ci.owncloud.org/job/smashbox-on-docker-daily-master/)
