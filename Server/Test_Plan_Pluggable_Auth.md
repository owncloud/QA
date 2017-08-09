## Pluggable Auth Test Plan


## Setup enviroments

1. Create 2 groups.
2. Create 4 users.
3. Configure a LDAP
4. Configure an Active Directory
5. Configure a SHIB
6. Add 2 users to each group.
7. Upload files with all of them.
8. Create some folders for each user.
9. Linux environment: Ubuntu 14.04  mysql and apache with ssl activated


## Testing functionality



| Test Case                                | Expected Result                          | Result         | Related Comment |
| ---------------------------------------- | ---------------------------------------- | -------------- | --------------- |
| **Sessions list in Personal Page**           |                                          |                |                 |
| Using Chrome as browser, log into a oC server | A row showing the user-agent of the session is shown in the Sessions list | :construction: |                 |
| Using Safari as browser, log into a oC server | A row showing the user-agent of the session is shown in the Sessions list | :construction: |                 |
| Using Edge as browser, log into a oC server | A row showing the user-agent of the session is shown in the Sessions list | :construction: |                 |
| Using Firefox as browser, log into a oC server | A row showing the user-agent of the session is shown in the Sessions list | :construction: |                 |
| Using a oC client as browser, log into a oC server | A row showing the user-agent of the session is shown in the Sessions list | :construction: |                 |
| Delete a Session of the sessions list | The session disappears from the session list and it is no longer available | :construction: |                 |
| Try to delete the current Session of the sessions list | A warning about cannot delete the current session should be shown and the session should be kept available | :construction: |                 |
| **Devices List in Personal**          |                                          |                |                 |
|                                          |                                          |                |                 |
| Using a oC regular user, create a new device password and use it to log into a oC client | The user logs into the oC client | :construction: |                 |
| Using a oC LDAP user, create a new device password and use it to log into a oC client | The user logs into the oC client | :construction: |                 |
| Using a oC AD user, create a new device password and use it to log into a oC client | The user logs into the oC client | :construction: |                 |
| Using a oC Shibboleth user autoprovisioned, create a new device password and use it to log into a oC client | The user logs into the oC client | :construction: |                 |
| Using a oC Shibboleth user via SSO, create a new device password and use it to log into a oC client | The user logs into the oC client | :construction: |                 |
| Log into a oC client via user/password method. With the same oC regular user, create a new device password and use it to log into the same oC client with another account| The user can log into the oC client with the device password. Check that the previous account via user/password is no longer available | :construction: |                 |
| **token auth enforced parameter set to true**          |                                          |                |                 |
|                                          |                                          |                |                 |
| Using a oC regular user, create a new device password and use it to log into a oC client | The user logs into the oC client | :construction: |                 |
| Using a oC LDAP user, create a new device password and use it to log into a oC client | The user logs into the oC client | :construction: |                 |
| Using a oC AD user, create a new device password and use it to log into a oC client | The user logs into the oC client | :construction: |                 |
| Using a oC Shibboleth user autoprovisioned, create a new device password and use it to log into a oC client | The user logs into the oC client | :construction: |                 |
| Using a oC Shibboleth user via SSO, create a new device password and use it to log into a oC client | The user logs into the oC client | :construction: |                 |
| Using a oC regular user, try to log in using the regular password instead of the device password | The user cannot log into the oC client | :construction: |                 |
