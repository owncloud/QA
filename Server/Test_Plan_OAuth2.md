## Setup

<details>
  <summary>Setup details (click to expand)</summary>
    References:
      * https://github.com/owncloud/oauth2/wiki/OAuth-code-Flow-Sequence-Diagram
    
</details>

## OAuth2 app Test Plan

This aims to be a client-agnostic testplan for the OAuth2 application, centered in the actions available in the webUI and/or `occ` commands and their impact on ownCloud's core behavior. To test the application from a client standpoint see:  

- Desktop Sync client: https://github.com/owncloud/QA/pull/473 
- Mobile client: https://github.com/owncloud/QA/pull/474 

### Testing functionality

| Test Case | Expected Result | Result | Related Comment |
| --------- | --------------- | ------ | --------------- |
| **CLI commands** | | |
| Enable OAuth2 app via CLI using `occ app:enable oauth2` | - The apps gets enabled <br> - Replies from the WebDAV endpoint includes a new `WWW-Authenticate: Bearer...` header | :construction: | |
| Disable OAuth2 app via CLI using `occ app:disable oauth2` | - The apps gets disabled <br> - Previously mentioned header goes away in further requests | :construction: | |
| **Registered Clients** | | |
| Default clients | The default Registered clients are included among the "Settings > Admin > User Authentication" OAuth 2.0: Registered Clients | :construction: | See https://github.com/owncloud/oauth2/pull/38 for the default values |
| Register new Client | 64-character-length `client_id` and `client_secret` are generated together with a (required) Client Name and a (required) Redirection URL | :construction: | |
| Remove a Client | - Confirmation dialog is prompted before removal <br> - All client sessions opened from those clients get removed | :construction: | |
| **Unregistered Clients** | | |
| Authentication flow from an unregistered client | Unsuccessful [Authorization Request] | :gear: | Browser displays the "Request not valid" screen.|
| **Authorized Applications** | | |
| Login with a Registered Client | The Client Name is displayed amongst the "Personal > Security" OAuth 2.0 Authorized Applications | :gear: | |
| Session Revocation (i.e. delete Authorized Application) | All the sessions opened in the clients are revoked and must be re-authorized | :gear: | |
| **User Account Handling** | | |
| Password change | Open sessions are revoked and new credentials must be used in further login attempts | :construction: | |
| **Authorization Flow** | | |
| Successful [Authorization Request] without any session open in the browser | Login form with an additional informative note about the application requesting access to ownCloud is displayed | :gear: | |
| Successful [Authorization Request] with a valid session in the browser | The "Authorize" screen is displayed | :gear: | |
| Successful [Authorization Request] in a browser with a different user logged in | The "Switch User" screen is displayed, allowing to modify the current session | :gear: | See use of the additional `user` parameter in: https://github.com/owncloud/oauth2/pull/67 |
| Failed attempt in the authorization login form | The query parameters for the [Authorization Request] are preserved in next attempts | :gear: | See original issue in: https://github.com/owncloud/core/issues/28129 |
| **Relevant Smoke Tests** | | |
| Unauthenticated Actions: Public File Drop | Files get uploaded normally | :construction: | See https://github.com/owncloud/oauth2/pull/100 |

[Authorization Request]: https://github.com/owncloud/oauth2/#protocol-flow
