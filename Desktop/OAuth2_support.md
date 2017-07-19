# [OAuth2](https://github.com/owncloud/oauth2/) support on the Desktop Client

### Preconditions:
- ownCloud server starting version 10.0.2
- OAuth2 ownCloud app starting version 0.1.2 
- Additional Apache2 modules: https://github.com/owncloud/oauth2/issues/49
- Valid Desktop Client configuration on the application:
    - Values preloaded in https://github.com/owncloud/oauth2/pull/38
    - Available for reference in [`src/libsync/theme.cpp`](https://github.com/owncloud/client/blob/63c40b45e4153980599aa412c090f671158eeca8/src/libsync/theme.cpp#L506-L514)
        - client_id: `xdXOt13JKxym1B1QcEncf2XDkLAexMBFwiT9j6EfhhHFJhs2KM9jbjTmf8JBXE69`
        - client_secret: `UBntmLjC2yYCeHwsyj73Uwo9TAaecAetRwMw0xYcvNL9yRdLSUi0hUAHfvCHFeFh`
    - Redirection URL: `http://localhost:*`

## Authentication

Since the entrypoint is the same (wizard's URL)

More protocol-agnostic test cases are inherited from generic auth. testplans

### From Scratch (Account Setup: Wizard)

#### Successful Scenarios

| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|      1 | Login on a clean browser |||||
|      2 | Login on an already open session in the browser |||||

#### Unauthorized/Alternative Paths

- Cancel: https://github.com/owncloud/oauth2/issues/46
- Wrong Password: https://github.com/owncloud/oauth2/issues/47
- Recovery options: https://github.com/owncloud/client/issues/5811
    - Closing the browser
    - From a timeout
- Wizard navigation: https://github.com/owncloud/client/issues/5813

| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|      3 | Use the wrong password when trying to login |||||
|      4 | Cancel in the app's auth request |||||
|      5 | Close the browser without authorizing the app |||||
|      6 | Wait for more than 5 minutes without authorizing the application |||||
|      7 | Go back on wizard's page 2 ("Login in your browser") |||||
|      8 | Close wizard in any step |||||

### Existing Accounts

Cases to consider either when upgrading a working client that supports OAuth2 authentication or when the previous step was completed successfully but the AccountState is not "Connected" for some reason.

#### Upgrade path 

Coming from an old version of the client (< 2.4.0) will require to re-login in the account since the client will consider the old credentials/sessions non-valid in virtue of the new auth. method.

| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|      9 | Logged-in http-auth account |||||
|     10 | Logged-out http-auth account |||||
|     11 | Any other credential type (dummy, SAML) |||||

##### Account Migrations: 

- [Account Configuration](https://doc.owncloud.org/desktop/2.3/advancedusage.html#configuration-file):
- Session Cookie -> access token
- Keychain/Credentials Store entries -> refresh token

#### Expired token

_When secrets' life come to an end_ the OAuth2 refresh token part of the protocol comes into focus.

| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|     12 | Logged-out http-auth account |||||

#### Logged out account

Get a new authorization/refresh tokens combination.

| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|     13 ||||||

#### Revoked token on the server

Even though the app does not support token revocation just yet, we can anticipate an scenario where this will be implemented (as it happens with sessions/application passwords). This result can be artificially achieved by _erasing the access token from the DB_.

| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|     14 ||||||

### Orthogonal Scenarios 

These are not radically different scenarios to the ones described already in the previous sections but variations that have to meet many of the same acceptance criteria.

#### Branding

Some branding options alter the normal wizard flow, skipping some pages or auto-filling some fields. These have to be considered when using OAuth as authentication method.

- Authentication method: `Theme::forceConfigAuthType()` -> force http on OAuth2 server (normally is the opposite)
- Server URL: `Theme::overrideServerUrl()` -> disable "Back" button on "Login in your browser" wizard's page.
- User: `Theme::customUserID()` -> send the branding-defined username on the auth. requests (ref. https://github.com/owncloud/oauth2/issues/48).

#### Multi-account support

Some considerations have to be taken into account to solve the issue of the desktop client not being able to open independent, clean WebViews (as the mobile clients have) https://github.com/owncloud/client/issues/5895: this means server supporting ways to wrap nicely the workflow.

- Specify the user name in the `authorize` call: https://github.com/owncloud/oauth2/issues/48 - This allows to request a specific user to login in the browser, if a different session is open, it offers the switch.
- Do the logins in an ordered fashion. 

Create an account on a server with a current valid session in the browser: **currently not supported**. This would require to input the username beforehand on the client's end by using it for the first `authorize` call.

#### SAML accounts 

**TBD** when the support for Shibboleth authentication wrapping is anounced.

#### Same account on multiple, identical clients

**Currently not supported**; reference: https://github.com/owncloud/oauth2/issues/64

### Preconditions Not Met

It is important to also consider what does happen when one or more of the preconditions is not met. In this order:

- Application "downgrade"/uninstall: reverse migration path - fallback options discussion. -> https://github.com/owncloud/client/issues/5848
- Desktop Client Configuration not correctly set up on the server: either wrong client_id, client_secret or both.
- Apache headers/rewrite modules not enabled on the target server https://github.com/owncloud/oauth2/issues/49

