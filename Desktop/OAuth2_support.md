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
- A web browser installed in the system the client is running on

### Test Scope Variability

As pointed out in the preconditions, there has to be a browser installed in the underlying OS, as it's a critical piece for the auth. Additionally to the multiplatform tests, we will consider the mainstream browsers to check all the testcases: **versions TBD**

- Mozilla Firefox
- Google Chrome
- Safari
- Internet Explorer
- Edge

Each TC is considered to be independent, it's required both the session in the browser and the account created (if any) on the client are to be removed prior to next test cases.

## Authentication

Since the entrypoint is the same as in the rest of authentication methods (**the login form**) there are also some protocol-agnostic test-cases that are inherited from the appropriate testplan(s). e.g. account log-out, redirections, http/s alternatives... that should be checked for the full picture. In this document we're just going to focus on **pure OAuth2 implementation-related test-cases**. For that, we have to differentiate between 2 scenarios:

1. [Account Setup: Wizard](#account-setup)
2. [Login into existing accounts](#existing-accounts)

> First of all, it's important to understand the steps required to authenticate a user in the OAuth2 protocol implemented by ownCloud: https://github.com/owncloud/oauth2/#protocol-flow
>         _Authentication Request -> Access Token Request ---Token Expiration---> Token Refresh_

### Account Setup

Login from scratch, creating a new account.

#### Successful Scenarios

| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|      1 | Login on a clean browser | 1. Input the server URL on the account wizard, click next <br> 2. Input valid account credentials on the login form in the browser opened <br> 3. Authorize the "Desktop client" application <br> 4. Use the default folder sync config | The account is created and syncing with the default config | :construction: ||
|    1.1 | Authentication Request | When performing TC's s.1 | Verify: <ul> <li> The header `WWW-Authenticate: Bearer realm="ownCloud"` is included in the server's reply </li> <li> The query parameters `response_type=<code>`, `redirect_uri=`, `client_id=` are present **and** match the values described in [Preconditions](#preconditions) on the opened URL</li></ul> | :construction: ||
|    1.2 | Access Token Request | After TC's s.3 (app authorization) | Verify the Access Token request contains the right values and is successful | :construction: | See Access Token Request below |
|      2 | Login (authorize) on an already open session in the browser | 1. Open the server URL on the browser and login with valid credentials <br> 2. Use the same server URL on the client's new account wizard, click next <br> 3. Authorize the "Desktop client" application on the page opened | Same as **TC1** | :construction: ||

<details>
<summary>Access Token Request:</summary>

**Request:**

```
curl [...] \ 
-H 'Content-Type:application/x-www-form-urlencoded' \
-X POST 'https://<server>/index.php/apps/oauth2/api/v1/token' \
--data-binary 'grant_type=authorization_code&code=<code>&redirect_uri=http://localhost:<random_port>'
```

**Reply:**

```
{
    "access_token": "<access_token>",
    "expires_in": 3600,
    "message_url": "[...]/index.php/apps/oauth2/authorization-successful",
    "refresh_token": "<refresh_token>",
    "token_type": "Bearer",
    "user_id": "demo"
}
```

</details>

#### Unauthorized/Alternative Paths

| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|      3 | Close the browser without authorizing the app | 1. Close the browser auth on TC1 s.2/3 | The wizard allows restarting the auth. process by opening a new browser | :construction: ||
|      4 | Wait for more than 5 minutes without authorizing the application | 1. Wait for more than 5 minutes without completing TC1's s.2/3 | The wizard displays an error to state it's no longer waiting for the authorization but allows restarting the operation by launching a new browser | :construction: ||
|      5 | Use the wrong password when trying to login | 1. Use the wrong username/password combination on TC1 s.2 | The client keeps waiting until a successful authorization is made / times out (TC4) and offers the option to restart the auth. process | :construction: | Being able to recover gracefully from this error depends on: https://github.com/owncloud/core/issues/28129 |
|      6 | Go back on wizard's page 2 ("Login in your browser") | 1. Input the server URL on the account wizard, click next <br> 2. Click back | A new server URL can be used in the wizard; if used, the client will no longer listen for the redirection on the original `<random_port>` but on a different one | :construction: ||
|      7 | Close wizard in any step | 1. Use the window controls to close the wizard in any of the steps | No effect in the client: no account is included if any of the steps was not completed | :construction: ||

<details>
<summary>References:</summary>

**Request:**

- Wrong Password: https://github.com/owncloud/oauth2/issues/47 
- Recovery options: https://github.com/owncloud/client/issues/5811
    - Closing the browser
    - From a timeout
- Wizard navigation: https://github.com/owncloud/client/issues/5813

</details>

### Existing Accounts

| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|      8 | Change a logged-in user password | 1. From the webUI, change the password of a user with a current, active, OAuth session on the Desktop Client | The session is terminated in the Desktop Client and will be offline until the user logs in with the new password. | :construction: | _protocol-independent_ TC |
|      9 | Delete a logged-in user | 1. As administrator user, remove the account of a user with a current, active, OAuth session on the Desktop Client | Same as **TC9** (Any attempt to login should be Unauthorized though) | :construction: | _protocol-independent_ TC |

Also, it's important to consider the cases either when upgrading a working client to support OAuth2 authentication or when [an account was already setup](#account-setup) but the `AccountState` is not "Connected" for any reason.

#### Upgrade path 

Coming from an old version of the client (< 2.4.0) will require to re-login into the account since the client will consider the old credentials/sessions non-valid in virtue of the new auth. method.

| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|     10 | Basic-auth account with OAuth2 support from the server | 1. Create an account with basic auth on a client without OAuth2 support <br> 2. Update the client to a version >= 2.4 <br> 3. Relaunch the client | The user is prompted with OAuth login for that account. The client migrates seamlessly all the account details and preferences | :construction: | See [Account Migrations](#account-migrations) below for technical checks |
|     11 | Any other credential type (dummy, SAML) | 1. Create a SAML/Dummy (testing) account on a client without OAuth2 support <br> 2. Update the client to a version >= 2.4 <br> 3. Relaunch the client | The accounts are still logged-in and no preference lost | :construction: | See the notes in [SAML accounts](#saml-accounts) |

##### Account Migrations 

Some extra verifications after upgrading the client:

- [Account Configuration](https://doc.owncloud.com/desktop/next/advanced_usage/configuration_file.html):
    - [ ] Include the `i\http_oauth=[bool]` on every account (`i`) in the config file. `[bool]` it's based in the server's support for OAuth2. 
- Session Cookie:
    - [ ] The session cookies are replaced by empty ones 
- Keychain/Credentials Store entries -> refresh token after login
    - [ ] Credentials stored on the OS' secret store are replaced with the refresh token after login

#### Expired authorization token 

_When tokens' hit their expiration date come to an end_ the OAuth2 refresh token logic of the protocol is used.

| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|     12 | Token expiration & renovation | 1. Modify the expiration date of the access token in the server DB to match current <br> 2. Monitor the client network requests with a proxy | Verify the client gets reauthenticated transparently using the refresh token and the first unauthenticated operation gets retriggered | :construction: ||
|   12.1 | Token Refresh Request | Open request from TC12 s.2 | Verify the Access Token request contains the right values and is successful | Same AC as **TC1.2** with new access/secret tokens | :construction: ||

#### Revoked token on the server / Logged out account

Even though the OAuth2 app does not support token revocation just yet, we can anticipate a scenario where this will be implemented (as it happens with sessions/application passwords). This result can be artificially achieved either by _erasing the access & refresh token from the server DB or tampering with the one stored in the keychain_. This scenario only differs from the one in [Expired token](#expired-token) in that the refresh token is no longer valid/non-existent as grant_type and re-authorization will be required from the webUI.

| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|     13 | Edit/Remove the refresh token from the server DB/client keychain | 1. Remove the refresh token from the server DB | Same as **TC8** | :construction: ||
|     14 | Client restart w/ logged out account | 1. Log out from an OAuth account in the client <br> 2. Restart the client <br> 3. Complete the login process | Refresh token is erased from the keychain after s.1 <br> Account is logged back in after s.3 | :construction: ||
|     15 | Any of the previous TC: 13, 14 logging in the WebUI as a different user | 1. Input a different, valid account on the login form | Verify an additional `user` query parameter with the expected user is included in the Authentication Request (see TC1.1) <br> The authorization page gets explicit about the accounts mismatch and offers the chance to log out and log back in as the expected user | :construction: | See https://github.com/owncloud/client/pull/5907. <br> Also depends on https://github.com/owncloud/core/issues/28129 |

### Orthogonal Scenarios 

These are not semantically different scenarios to the ones described already in previous sections but variations that have to meet many of the same acceptance criteria and some additional ones.

#### Branding

Some branding options alter the normal wizard flow, skipping pages or auto-filling some fields. These have to be considered when using OAuth as authentication method at account-creation time. (ref. https://github.com/owncloud/client/issues/5914)

- Authentication method: `Theme::forceConfigAuthType()` -> force a different auth method (normally OAuth has priority)
    - **TBD** if additional "force X auth" branding configuration would be required. ref. https://github.com/owncloud/client/issues/5914#issuecomment-316641336 
- Server URL: `Theme::overrideServerUrl()` -> disable "Back" button on "Login in your browser" wizard's page.

| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|     16 | `Theme::forceConfigAuthType()` not set to `http` | 1. Use a client with a branded, forced auth. method <br> 2. Create a new account | The branded method is used by default regardless of the headers sent by the server | :construction: ||
|     17 | `Theme::overrideServerUrl()` set | 1. Use a client with branded server URL (w/ OAuth) <br> 2. Create a new account | Disable "Back" button on "Login in your browser" wizard's page | :construction: ||

#### Multi-account support

Some considerations have to be taken into account to solve the issue of the desktop client not being able to open independent and clean WebViews (as the mobile clients use) https://github.com/owncloud/client/issues/5895: this means server supporting ways to wrap the workflow nicely.

**Creating** a new account in the client in a server with a current valid and different session in the browser: **is currently not supported**. This would require input of the username beforehand on the client's end to use it for the first `authorize` call.

- Specify the user name in the `authorize` call: https://github.com/owncloud/oauth2/issues/48 - This allows requesting a specific user to login in to the browser. If a different session is open, it offers the switch.
- :warning: Do the logins in an ordered fashion. 

| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|     18 | Have multiple accounts logged out and restart the client | 1. The client will open as many browser windows as accounts <br> 2. Login into each one independently | All the accounts are logged back in in the client | :construction: ||

#### SAML accounts 

**TBD** when the support for Shibboleth authentication wrapping is announced.

#### Same account on multiple, identical clients

**Currently not supported**; reference: https://github.com/owncloud/oauth2/issues/64
    - Will be supported after https://github.com/owncloud/oauth2/pull/65 

| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|     19 | Login to the same account in multiple clients sharing id/secret simultaneously | 1. Repeat TC1 in more than one client | Verify that all the clients can run in parallel and they're getting different (and valid) access/refresh tokens from the server | :construction: ||

### Preconditions Not Met

It is important to also consider what does happen when one or more of the preconditions is not met. In this order:

- Protocol "downgrade"/application uninstall: reverse migration path - fallback options discussion: _What to do if the OAuth2 application fails/is disabled?_ -> https://github.com/owncloud/client/issues/5848
- Desktop Client Configuration not correctly set up on the server: either wrong client_id, client_secret or both. These can even be deleted using the "User Authentication" panel on the settings.
- Apache headers/rewrite modules not enabled on the target server https://github.com/owncloud/oauth2/issues/49 - this causes a false positive "authorization successful" message.

| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|     20 | Application uninstall/disabling | 1. Perform TC1 <br> 2. Disable OAuth2 app from the app settings pane in the WebUI | Client detects the switch and migrates back the accounts to basic-auth and request re-login | :construction: ||
|     21 | Erroneous/missing Client ID/Secret | 1. Remove the client ID/secret from the OAuth2 settings pane <br> 2. Perform TC1 | The WebUI displays an error message indicating the issue: non-authorized clientID/secret + the client is notified | :construction: ||
|     22 | Apache removing the 'Authorization: Bearer' header in the requests | 1. Verify headers and rewrite modules are not enabled in Apache (`apache2ctl -M`) <br> 2. Perform TC1 | The WebUI displays an error message linking to docs about recommended Apache config. + the client is notified | :construction: | Discussion going on in https://github.com/owncloud/oauth2/issues/49 |
