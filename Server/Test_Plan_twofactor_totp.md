## Twofactor TOTP Test Plan



| Test Case                                | Expected Result                          | Result         | Related Comment |
| ---------------------------------------- | ---------------------------------------- | -------------- | --------------- |
| Enable the app.                          | No problems found.                       | :construction: |                 |
| Using a non admin user user1, enable totp in the personal settings.<br />Having the app freeotp (android or ios) scan the QR code provided and set it up.<br />Login using user1, get a new code in the freeotp app. Introduce it in the login view. Login. | User1 can login without problems.        | 🚧             |                 |
| Using a non admin user user1, enable totp in the personal settings.<br />Having the app freeotp (android or ios) scan the QR code provided and set it up.<br />Try to login with user1 using his password. When the totp input appears introduce random numbers, emojis, negative numbers and empty string. | User1 cannot login in any of this situations. | 🚧             |                 |
| Using a LDAP user ldap_user, enable totp in the personal settings.<br />Having the app freeotp (android or ios) scan the QR code provided and set it up.<br />Login using ldap_user, get a new code in the freeotp app. Introduce it in the login view. Login. | User_ldap can login without problems.    | 🚧             |                 |
| Using a non admin user user1, enable totp in the personal settings.<br />Having the app google authenticator (android or ios) scan the QR code provided and set it up.<br />Login using user1, get a new code in the google authenticator app. Introduce it in the login view. Login. | User1 can login without problems.        | 🚧             |                 |
| **CLI**                             |                                          |                |                 |
| Test 1/2 Having a user 'user1' with a working enabled two factor authentication, use the CLI command to disable it twofactorauth:disable                           |   'user1' now can login without using 2FA                                       |  🚧              |                 |
| Test 2/2 Use the CLI command twofactorauth:enable to enable again 2FA for 'user1'   |   'user1' has to use 2FA mandatory to login                                       |  🚧              |                 |
| **Browsers**                             |                                          |                |                 |
| Check the login process is possible using chrome |                                          | 🚧             |                 |
| Check the login process is possible using firefox |                                          | 🚧             |                 |
| Check the login process is possible using edge |                                          | 🚧             | <br />          |
| Check the login process is possible using internet explorer 11 |                                          | 🚧             | <br />          |
| Check the login process is possible using safari |                                          | 🚧             |                 |
