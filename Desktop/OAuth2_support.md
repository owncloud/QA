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

### From Scratch (Account Setup: Wizard)

#### Successfull Scenarios

#### Unauthorized/Alternative Paths

- Cancel: https://github.com/owncloud/oauth2/issues/46
- Wrong Password: https://github.com/owncloud/oauth2/issues/47
- Recoveries
    - Closing the browser tab
    - From a timeout

### Existing Accounts

#### Upgrade path 

Account Migrations:

- [Account Configuration](https://doc.owncloud.org/desktop/2.3/advancedusage.html#configuration-file)
- Session Cookie -> access token
- Keychain/Credentials Store entries -> refresh token

#### Expired token

_When secrets' life come to an end_ the OAuth2 refresh token part of the protocol comes into focus.

#### Logged out account

Get a new authorization/refresh tokens combination.

#### Revoked token on the server

Even though the app does not support token revocation just yet, we can anticipate an scenario where this will be implemented (as it happens with sessions/application passwords). This result can be artificially achieved by _erasing the access token from the DB_.

### Orthogonal Scenarios 

These are not radically different scenarios to the ones described already in the previous sections but variations that have to meet many of the same acceptance criteria.

#### Multi-account support

Some considerations have to be taken into account to solve the issue of the desktop client not being able to open independent, clean WebViews (as the mobile clients have) https://github.com/owncloud/client/issues/5895: this means server supporting ways to wrap nicely the workflow.

- Specify the user name in the `authorize` call: https://github.com/owncloud/oauth2/issues/48 - This allows to request a specific user to login in the browser, if a different session is open, it offers the switch.
- Do the logins in an ordered fashion. 

#### SAML accounts 

**TBD** when the support for Shibboleth authentication wrapping is supported.

#### Same account on multiple, identical clients

Currently not supported; reference: https://github.com/owncloud/oauth2/issues/64

### Preconditions Not Met

It is important to also consider what does happen when one or more of the preconditions is not met. In this order:

- Application "downgrade"/uninstall: reverse migration path - fallback options discussion. 
- Desktop Client Configuration not correctly set up on the server: either wrong client_id, client_secret or both.
- Apache headers/rewrite modules not enabled on the target server https://github.com/owncloud/oauth2/issues/49

