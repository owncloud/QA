# [OAuth2](https://github.com/owncloud/oauth2/) support on the Desktop Client

### Preconditions:
- ownCloud server starting version 10.0.2
- OAuth2 ownCloud app starting version 0.1.2 
- Additional Apache2 modules: https://github.com/owncloud/oauth2/issues/49
- A web browser installed in the system the client is running on
- Valid Desktop Client configuration on the application:
    - Values preloaded in https://github.com/owncloud/oauth2/pull/38
    - Available for reference in [`src/libsync/theme.cpp`](https://github.com/owncloud/client/blob/63c40b45e4153980599aa412c090f671158eeca8/src/libsync/theme.cpp#L506-L514)
        - client_id: `xdXOt13JKxym1B1QcEncf2XDkLAexMBFwiT9j6EfhhHFJhs2KM9jbjTmf8JBXE69`
        - client_secret: `UBntmLjC2yYCeHwsyj73Uwo9TAaecAetRwMw0xYcvNL9yRdLSUi0hUAHfvCHFeFh`
    - Redirection URL: `http://localhost:*`

### Test Scope Variability

As pointed out in the preconditions, there has to be a browser installed in the underlying OS. As it's a critical piece for the auth. additionally to the multiplatform tests, we will consider the mainstream broswers to check all the testcases: **versions TBD**

- Mozilla Firefox
- Google Chrome
- Safari
- Internet Explorer

## Authentication

Since the entrypoint is the same than in the rest of authentication methods (**the login form**) there's also some protocol-agnostic test-cases that are inherited from the appropriate testplan(s). e.g. redirections, http/s alternatives... that should be checked for the full picture. In this document we're just gonna focus on **pure OAuth2 implementation-related test-cases**. For that, we have to differentiate between 2 scenarios:

1. [Account Setup: Wizard](#account-setup)
2. [Login into existing accounts](#existing-accounts)

> First of all, it's important to understand the steps required to authenticate a user in the OAuth2 protocol implemented by ownCloud: https://github.com/owncloud/oauth2/#protocol-flow
>         _Authentication Request -> Access Token Request ---Token Expiration---> Token Refresh_

### Account Setup

Login from scratch, creating a new account.

#### Successful Scenarios

| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|      1 | Login on a clean browser |||||
|    1.1 | Authentication Request |||||
|    1.2 | Access Token Request |||||
|      2 | Login (authorize) on an already open session in the browser |||||

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
|      9 | Change a logged in account password |||||
|     10 | Delete a logged in user |||||

### Existing Accounts

Cases to consider either when upgrading a working client that supports OAuth2 authentication or when the previous step was completed successfully but the AccountState is not "Connected" for any reason.

#### Upgrade path 

Coming from an old version of the client (< 2.4.0) will require to re-login into the account since the client will consider the old credentials/sessions non-valid in virtue of the new auth. method.

| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|     11 | Logged-in http-auth account with OAuth support from the server | ||| See [Account Migrations](#account-migrations) below for technical checks |
|     12 | Logged-out http-auth account with OAuth support from the server |||| See [Account Migrations](#account-migrations) below for technical checks |
|     13 | Any other credential type (dummy, SAML) |||| See the notes in [SAML accounts](#saml-accounts) |

##### Account Migrations: 

- [Account Configuration](https://doc.owncloud.org/desktop/2.3/advancedusage.html#configuration-file):
    - [ ] Include the `i\http_oauth=[bool]` on every account (`i`) in the config file. `[bool]` it's based in the server's support for OAuth2. 
- Session Cookie
    - [ ] The session cookies are replaced by empty ones 
- Keychain/Credentials Store entries -> refresh token
    - [ ] Credentials stored on the OS' secret store are replaced with the refresh token

#### Expired authorization token 

_When tokens' hit their expiration date come to an end_ the OAuth2 refresh token logic of the protocol is used.

| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|     14 | Token expiration & renovation |||||
|   14.1 | Token Refresh Request |||||

<details>
<summary>Access Token Response:</summary>

```
{
    "access_token": "<new_access_token>",
    "expires_in": 3600,
    "message_url": "[...]/index.php/apps/oauth2/authorization-successful",
    "refresh_token": "<new_refresh_token>",
    "token_type": "Bearer",
    "user_id": "demo"
}
```

</details>

#### Revoked token on the server / Logged out account

Even though the OAuth2 app does not support token revocation just yet, we can anticipate an scenario where this will be implemented (as it happens with sessions/application passwords). This result can be artificially achieved either by _erasing the access & refresh token from the server DB or tampering with the one stored in the keychain_. This scenario only differs from the one in [Expired token](#expired-token) in terms of that the refresh token is no longer valid/non-existent as grant_type and re-authorization will be required from the webUI.

| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|     15 | Edit/Remove the refresh token from the server DB/client keychain|||||
|     16 | Client restart w/ logged out account |||||
|     17 | Any of the prior TC login as a different user |||||

### Orthogonal Scenarios 

These are not semantically different scenarios to the ones described already in previous sections but variations that have to meet many of the same acceptance criteria and some additional ones.

#### Branding

Some branding options alter the normal wizard flow, skipping pages or auto-filling some fields. These have to be considered when using OAuth as authentication method on account-creation time. (ref. https://github.com/owncloud/client/issues/5914)

- Authentication method: `Theme::forceConfigAuthType()` -> force a different auth method (normally OAuth has priority)
    - **TBD** if additional "force X auth" branding configuration would be required. ref. https://github.com/owncloud/client/issues/5914#issuecomment-316641336 
- Server URL: `Theme::overrideServerUrl()` -> disable "Back" button on "Login in your browser" wizard's page.

| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|     18 | `Theme::forceConfigAuthType()` not set to `http` |||||
|     19 | `Theme::overrideServerUrl()` set |||||

#### Multi-account support

Some considerations have to be taken into account to solve the issue of the desktop client not being able to open independent, clean WebViews (as the mobile clients have) https://github.com/owncloud/client/issues/5895: this means server supporting ways to wrap nicely the workflow.

- Specify the user name in the `authorize` call: https://github.com/owncloud/oauth2/issues/48 - This allows to request a specific user to login in the browser, if a different session is open, it offers the switch.
- Do the logins in an ordered fashion. 

| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|     20 | Have multiple accounts logged out |||||

**Create** a new account for a server with a current valid and different session in the browser: **is currently not supported**. This would require to input the username beforehand on the client's end to use it for the first `authorize` call.

#### SAML accounts 

**TBD** when the support for Shibboleth authentication wrapping is anounced.

#### Same account on multiple, identical clients

**Currently not supported**; reference: https://github.com/owncloud/oauth2/issues/64
    - Will be supported after https://github.com/owncloud/oauth2/pull/65 

| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|     21 | Login to the same account in multiple clients sharing id/secret simultaneously |||||

### Preconditions Not Met

It is important to also consider what does happen when one or more of the preconditions is not met. In this order:

- Protocol "downgrade"/application uninstall: reverse migration path - fallback options discussion: _What to do if the OAuth2 application fails/is disabled?_ -> https://github.com/owncloud/client/issues/5848
- Desktop Client Configuration not correctly set up on the server: either wrong client_id, client_secret or both. These can even be deleted using the "User Authentication" panel on the settings.
- Apache headers/rewrite modules not enabled on the target server https://github.com/owncloud/oauth2/issues/49 - this causes a false positive "authorization sucessful" message.


| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|     22 | Client upgrade (to >2.4) without OAuth support from the server |  ||||
|     23 | Application uninstall/disabling |||||
|     24 | Erroneous/missing Client ID/Secret |||||
|     25 | Apache removing the 'Authorization: Bearer' header in the requests |||||
