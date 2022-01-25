# Test Plan

- Template: https://github.com/owncloud/QA/blob/master/Server/Test_Plan_Smoke_Test.md

## Setup

Apps included:
 - openidconnect 2.1.0
 - windows_network_drive 2.1.0
 - ldap 0.16.0
 - web 4.9.0

### Test deployments

 - localhost: `docker run --rm -ti -p 8080:8080 owncloud/server:10.9.0-beta1`

 - https://oc1090beta1-primary-s3-113-rc3-20211119.jw-qa.owncloud.works
   via `env OC10_VERSION=10.9.0beta1 OC10_TAR_URL=https://download.owncloud.org/community/testing/owncloud-complete-20211118.tar.bz2 hetzner_deploy/deploy_oc10_apps.sh web files_primary_s3 guests user_ldap impersonate oauth2 twofactor_totp windows_network_drive richdocuments`
 - `env OC10_DNSNAME=update-from-1080-DATE OC10_VERSION=10.8 hetzner_deploy/deploy_oc10_apps.sh user_ldap`

## Requirements

Prepare two servers with ssl activated and trusted certificates.

Enable LDAP and external storage apps.

Have a LDAP server ready to be used with owncloud.

Have ready two external storages of your choice SMB, SFTP, Dropbox, Google Drive, FTP, S3, ownCloud, local.

Scenarios to consider:
- [ ] OAuth2 and sync + mobile clients ( can be deployed remotely )
- [ ] LDAP 
- [ ] Windows Network Drive (also use it as sync target ) 
- [ ] Guests
- [ ] Impersonate
- [ ] Login with App Token Login
- [ ] TOTP
- [ ] Update from previous version

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
5 | Win10 "Connect network drive" using the webdav URL hidden in the owncloud Files UI lower let corner under settings. | Works with checkbox '[x] Connect using differnt Credentials' | :construction: |
6 | Using webdav upload a 100 MB file.| No errors in this process | :construction: |

TODO:
- Compare with [drone CI](https://drone.owncloud.com/owncloud/core) and add/remove items in this template.
- Add regression test items  https://github.com/owncloud/enterprise/issues/4933#issuecomment-1005287788


Pyocclient status:
- TODO: Clarify status. No updates found after 10.0
- https://travis-ci.org/github/owncloud/pyocclient/branches 
- Travis master 		![master pyocclient] (https://travis-ci.org/owncloud/pyocclient.svg?branch=master)


Smashbox status:
- TODO: Clarify status. Dead links 2022-01-17, jw)
- Git master: [![Build Status](https://ci.owncloud.org/job/smashbox-on-docker-daily-master/badge/icon)](https://ci.owncloud.org/job/smashbox-on-docker-daily-master/)


Next: 
 - https://github.com/owncloud/QA/blob/master/Server/Test_Plan_Simplified_Smoke_Test.md
 - Changelog Testing (or better do that before the smoke tests!)

