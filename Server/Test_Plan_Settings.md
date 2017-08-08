Previous requirements: Create a regular user, 'user1' belonging to a group, 'group1', enable default encryption app and external storage app.



| Test Case                                | Expected Result                          | Result Firefox | Result Safari  | Result Edge    | Result IE 11   | Result Chrome | Related Comment |
| ---------------------------------------- | ---------------------------------------- | -------------- | -------------- | -------------- | -------------- | ------------- | --------------- |
| As regular user input personal values, including avatar uploaded and from files. | All values are added without problems.   | :construction: | :construction: | :construction: | 🚧             | 🚧            |                 |
| As admin user input personal values, including avatar uploaded and from files. | All values are added without problems.   | 🚧             | :construction: | :construction: | :construction: | 🚧            |                 |
| As regular user change account password. | Password is changed correctly.           | 🚧             | 🚧             | 🚧             | 🚧             | 🚧            |                 |
| Change language                          | Language is changed correctly.           | 🚧             | 🚧             | 🚧             | 🚧             | 🚧            |                 |
| Share your federated ID using a social network | It can be shared without problems.       | 🚧             | 🚧             | 🚧             | 🚧             | 🚧            |                 |
| Check that buttons to download clients are available. |                                          | 🚧             | 🚧             | 🚧             | 🚧             | 🚧            |                 |
| Check that owncloud version appears correctly |                                          | 🚧             | 🚧             | 🚧             | 🚧             | 🚧            |                 |
| Check that there aren't empty sections with errors. |                                          | 🚧             | 🚧             | 🚧             | 🚧             | 🚧            |                 |
| Check that 'Security and setup warnings' appear in admin/general and it's links are correct. |                                          | 🚧             | 🚧             | 🚧             | 🚧             | 🚧            |                 |
| Set up email server and send a test email. | Email is received.                       | 🚧             | 🚧             | 🚧             | 🚧             | 🚧            |                 |
| Modify maximum upload size to 2 MB, upload a bigger than 2 MB file. | File cannot be uploaded.                 | 🚧             | 🚧             | 🚧             | 🚧             | 🚧            |                 |
| As admin allow users to mount their own external storage | A personal section appears for external storage. | 🚧             | 🚧             | 🚧             | 🚧             | 🚧            |                 |
| Mount an external storage as admin user (globally) | Every option appears and can be configured | 🚧             | 🚧             | 🚧             | 🚧             | 🚧            |                 |
| Mount an external storage as regular user (personal) | Every option appears and can be configured | 🚧             | 🚧             | 🚧             | 🚧             | 🚧            |                 |
| Check that updater section appears in CE and can change the channel. (admin/general) |                                          | 🚧             | 🚧             | 🚧             | 🚧             | 🚧            |                 |
| Check that cron choices are available and can be chosen. |                                          | 🚧             | 🚧             | 🚧             | 🚧             | 🚧            |                 |
| Change log level and download log file.  | No errors in the process.                | 🚧             | 🚧             | 🚧             | 🚧             | 🚧            |                 |
| Check that tips and tricks section appears in admin/general and has clickable links. |                                          | 🚧             | 🚧             | 🚧             | 🚧             | 🚧            |                 |
| Check that sharing options work. Exclude a group 'group1' from sharing. Try to share using 'user1' member of 'group1' | 'user1' cannot share.                    | 🚧             | 🚧             | 🚧             | 🚧             | 🚧            |                 |
| Add a second server to the trusted owncloud servers. | It appears in the list correctly.        | 🚧             | 🚧             | 🚧             | 🚧             | 🚧            |                 |
| Uncheck 'Allow users on this server to send shares to other servers'. | Try to federate share a file with another server. | 🚧             | 🚧             | 🚧             | 🚧             | 🚧            |                 |
| Enable encryption.                       | no problems while activating it.         | 🚧             | 🚧             | 🚧             | 🚧             | 🚧            |                 |
| Enable recovery key. Use it to change a user password. | recovery key is correctly set and works. | 🚧             | 🚧             | 🚧             | 🚧             | 🚧            |                 |
| Enable apps.                             | Works without problems.                  | 🚧             | 🚧             | 🚧             | 🚧             | 🚧            |                 |
| Disable apps.                            | Works without problems.                  | 🚧             | 🚧             | 🚧             | 🚧             | 🚧            |                 |
| Check that admin/additional doesn't return a forbidden answer. |                                          | 🚧             | 🚧             | 🚧             | 🚧             | 🚧            |                 |
| Enable apps included in the enterprise tarball. | Those sections appear and admin user can use them. | 🚧             | 🚧             | 🚧             | 🚧             | 🚧            |                 |