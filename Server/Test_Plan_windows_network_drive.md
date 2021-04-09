## Previous requirements

Have a WND mountPoint configured


## Testing functionality


| Test Case                                | Expected Result                          | Result | Related Comment |
| ---------------------------------------- | ---------------------------------------- | ------ | --------------- |
| Run WND:listen command against a WND mountpoint with Log-in Credentials, save in session | The command should run OK and start listening | ✅          |                 |
| Run WND:listen command against a WND mountpoint with Log-in Credentials, save in database | The command should run OK and start listening | ✅     |                 |
| Run WND:listen command against a WND mountpoint with user entered, store in database | The command should run OK and start listening | ✅     |                 |
| Run WND:listen command against a WND mountpoint with Global Credentials | The command should run OK and start listening | ✅       |                 |
| Run WND:listen command against a WND mountpoint with username and password credentials | The command should run OK and start listening | ✅      |                 |
| Run wnd:process-queue command against a WND mountpoint with Log-in Credentials, save in session | An error should be thrown.              | 🚧     |                 |
| Run wnd:process-queue command against a WND mountpoint with Log-in Credentials, save in database | The command should run OK and start processing the queue | ✅     |                 |
| Run wnd:process-queue command against a WND mountpoint with user entered, store in database | The command should run OK and start processing the queue | 🚧      |                 |
| Run wnd:process-queue command against a WND mountpoint with Global Credentials | The command should run OK and start start processing the queue | ✅      |                 |
| Run wnd:process-queue command against a WND mountpoint with username and password credentials | The command should run OK and start processing the queue | ✅       |                 |
| Upload a file from the Desktop Client to a WND mountpoint | The file should not be downloaded again  | ✅      |                 |
| Modify a file/folder in the WND backend  | The file should change in ownCloud and in the Desktop Client folder | ✅      |                 |
| Rename a file/folder in the WND backend  | The file should change in ownCloud and in the Desktop Client folder | ✅      |                 |
| Delete a file/folder in the WND backend  | The file should change in ownCloud and in the Desktop Client folder | ✅      |                 |
| Change the permissions of a file in the WND backend | The file should change in ownCloud and in the Desktop Client folder | ✅      |                 |
| Move a file in the WND backend           | The file should change in ownCloud and in the Desktop Client folder | ✅      |                 |
| 2 Desktop Clients configured. One of the clients make changes | The file should not be downloaded again in the client that makes the changes, but it should be modified in the other client and in oC and WND backend | 🚧    |                 |
| Different users accessing the same storage, create a file from one users account | The file should be available for all the users | 🚧      |                 |
| Test with related storages, same backend with different credentials | Changes should be propagated accordingly. | ✅      |                 |
| Test with related storages, same backend with different mounts | Changes should be propagated accordingly. | ✅       |                 |
| Run the command with -h option           | Check that the help for the command provides enough information | ✅       |                 |
| Change credentials of a mount that is already being listened, run wnd:process-queue | Storage not available, perhaps outdated credentials message is shown | ✅     |                 |
| Run WND:listen command against a WND mountpoint with Global Credentials, "available for" set to a specific user | The command should run OK and start listening | ✅       |                 |
| Run WND:listen command against a Personal WND mountpoint with username and password credentials | The command should run OK and start listening | ✅       |                 |
| Having wnd:listen running, upload a bunch of files to a specific location. Delete those files. Run wnd:process-queue command against a WND mountpoint using  --chunk-size=1 and increasing verbosity. | The command should run OK and start processing the queue 1 by 1. We should see 2 notifications per file uploaded (add and modify notifications are expected if the file is new), plus another notification per file deleted. This is something approximated because it depends on the number of notifications the server sends, which is something we might not control. | ✅      |                 |
| Having wnd:listen running, upload a bunch of files (<100 files) to a specific location. Delete those files. Run wnd:process-queue command against a WND mountpoint using  --chunk-size=500 and increasing verbosity. | The command should run OK and start processing the queue 500 by 500.  We should see 1 notification. Having in mind we didn't have more than 500 notifications stored. | ✅     |                 |
| Having wnd:listen running, upload a bunch of files to a specific location. Delete those files. Run wnd:process-queue command against a WND mountpoint using  --chunk-size=0 and increasing verbosity. | The command should run OK and start processing the queue. We should see one change in the FS targeting the parent folder of those files. | ✅     |                 |
| Having wnd:listen running, upload a bunch of files to a specific location. Delete those files. Run wnd:process-queue command against a WND mountpoint using  --chunk-size=-2 and increasing verbosity. | The command should fail showing an error about bad value. | ✅      |                 |
| Having several wnd mounted points run wnd:process-queue --serializer-type=file --serializer-param=/tmp/somefile.json not existing that file | The command should run OK and start processing the queue and save configuration of mounted points in a file. | 🚧     |                 |
| Having several wnd mounted points included in a file called /tmp/somefile.json, previously saved using process-queue command, run wnd:process-queue --serializer-type=file --serializer-param file=/tmp/somefile.json | The command should run OK, mount the wnd mounted points stored in the file and start processing the queue. | 🚧      |                 |


# WND2 implementation

Basic expected setup
------------

windows machine
* [x] AD installed      -> fsweb.test
* [x] SMB2 share accessible (SMB should also work)
* [x] Service account -> any user with read access to the whole target SMB share should do. -> serviceuser(ro), serviceadmin(rw)

ownCloud
* [x] user_ldap connected to the windows' AD    -> docker image oc107_wnd220rc1_ldap
* [x] WND2 (collaborative) mount:
  * [x] authentication: "login credentials, saved in DB" or "user entered, saved in DB"
  * [x] configuration: connected to the windows machine. Service account matching the one in the windows machine
  * [x] wnd:listen running with serviceuser
  * [x] read all User0X subfolder, but not write: `smbclient //fsweb.test.owncloud.com/share -U serviceuser`
  * [x] WND(collaborative) "Login Credentials, Saved in DB", 172.16.142.10, share, $user, , serviceuser, ...
         turns green (or yellow when owncloud admin does not exist in windows.)


Things to test
-------------
* [x] User04 and user 05 can read/write files in their shares.
* [ ] 1. `occ wnd:set-service-account` command encrypts the password without disrupting the mount (users can access to the mount normally) -> #336
* [ ] 2. oc_filecache table will only register the storage for the service account independently of the users accessing to it -> #337
* [x] 3. any file access by the users will use their own accounts (based on the authentication method) -> #338
    * [x] 1. if a user doesn't have read permission over a file in the windows machine, that user shouldn't be able to see the file listed
    * [x] 2. if a user who doesn't have read permission over a file see the file listed (could happen due to desync*), the user will receive an error trying to open the file
    * [x] 3. if a user doesn't have write permission over a file, the user will see the file but will get an error when he tries to write it
    * [x] 4. ownCloud's permissions will reflect the windows' file attributes, but not the ACLs for a specific user
* [ ] 4. Password reset feature (when the password changes in windows) must work
    * [ ] 1. for the service account, it must work regardless of the wnd authentication (in the mount config)
    * [ ] 2. for specific auth methods, "login credentials, saved in DB" won't work (not implemented), and "user entered, saved in DB" must work
    * [ ] 3. "username and password" and "global credentials" should also be reset if applicable
    * [ ] 4. password reset feature must work across WND and WND2 storages. This means that if a WND triggers a password reset, WND2 storages will also be affected (if applicable), and viceversa
* [x] 5. wnd listener must work and must update the filecache info without issues
    * [ ] 1. process-queue should also be "affected" by the password reset feature
* [ ] 6. memcache will be used (not tested if it isn't available) using a ttl of 30 minutes by default. It's possible to disable by setting a negative number in the config.php file (config key in the readme file)
    * [ ] 1. we'll cache things by oc storage, which using the basic expected setup would be almost the same as cache per user.

(*) desync could happen because changing permissions in the windows machine won't trigger a change in the mtime, so the change won't be visible to ownCloud


Additional setups
------------

Along with the basic setup:

ownCloud:
* [ ] guests app installed
* [ ] WND2 (collaborative) mount:
  * [ ] authentication: "username and password"
  * [ ] configuration: connected to the windows machine. Service account matching the one in the windows machine
  * [ ] applicable: guests group

This will allow guests users to access to the windows machine using all of them the same account (probably more restricted)
The same expectations explained in the "things to test" are applied in this case.


Notes
-------

* Password reset feature applies only to "user entered, saved in DB", "username and password" and "global credentials", as well as the service account. The rest of the auths won't reset the password
* As said, password reset feature works across WND and WND2 mounts.
* Using any auth for the WND2 implementation should work, although there might not be a real use case for them.
* Permissions:
  * We'll use only the windows' file attributes as ownCloud permissions. This should cause less problems in ownCloud because the ownCloud permissions will be the same for the service account and the user
  * ACLs won't be taken into account. In practice, this means that the user is allowed to upload files and windows will return an error if he hasn't enough permissions to do so.


