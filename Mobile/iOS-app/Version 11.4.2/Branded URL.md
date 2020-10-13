
### Branded URL

#### Pr: https://github.com/owncloud/ios-app/pull/807

Devices: iPhoneXR v13.4, iPadAir v13.4<br>
Server: 10.5


---

**canConfigureURL = YES**

| Property  | Value | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- | 
| View | -  | URL field is visible just after opening the app | Passed |   |
| welcome | Any message string | Message is set in the login view as welcome | Passed |   |
| welcome | empty | No welcome message | Passed | |
| promptForPasswordAuth | Any message. Works together with `allowedAuthenticationMethods`. Such field must have `com.owncloud.basicauth` as preferred | Set as tip to enter credentials, above credentials fields | Passed |  |
| promptForPasswordAuth | Empty. Works together with `allowedAuthenticationMethods`. Such field must have `com.owncloud.basicauth` as preferred | Empty message above credentials fields | Passed |  |
| promptForTokenAuth | Any message with OAuth2. Works together with `allowedAuthenticationMethods`. Such field must have `com.owncloud.oauth2` as preferred | Set as tip to enter credentials, above `Continue` button to start the OAuth2 authentication flow | Passed |  |
| promptForTokenAuth | Empty. Works together with `allowedAuthenticationMethods`. Such field must have `com.owncloud.oauth2` as preferred | Empty message above `Continue` button to start the OAuth2 authentication flow | Passed |   |
| bookmarkName | any name | Set as account name after login | Passed |  |
| bookmarkName | empty | Empty account name after login | Passed | |
| url | correct url | Nothing happens | NA | Only makes sense if `canConfigureURL` = NO |
| url | empty | Error message | Passed |   |
| allowedHosts | no items inside | Any URL will be accepted | Passed |  |
| allowedHosts | enter some items (domains) inside | Only URLS matching such domains will be accepted | Passed |  |
| helpURLStringButton | empty | Button is visible with no label | Passed | Something to prevent in oB |
| helpURLStringButton | any String | Button is visible with the string | Passed |  |
| help URL | empty | Button is hidden | Passed |  |
| help URL | Any correct URL | Button points to the URL | Passed |  |


**canConfigureURL = NO**

| Property  | Value | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- | 
| View | -  | URL field is not visible just after opening the app | Passes |   |
| welcome | Any message string | Message is set in the login view as welcome | Passed |   |
| welcome | empty | No welcome message | Passed | |
| promptForPasswordAuth | Any message. Works together with `allowedAuthenticationMethods`. Such field must have `com.owncloud.basicauth` as preferred | Set as tip to enter credentials, above credentials fields | Passed |  |
| promptForPasswordAuth | Empty. Works together with `allowedAuthenticationMethods`. Such field must have `com.owncloud.basicauth` as preferred | Empty message above credentials fields | Passed |  |
| promptForTokenAuth | Any message with OAuth2. Works together with `allowedAuthenticationMethods`. Such field must have `com.owncloud.oauth2` as preferred | Set as tip to enter credentials, above `Continue` button to start the OAuth2 authentication flow | Passed |  |
| promptForTokenAuth | Empty. Works together with `allowedAuthenticationMethods`. Such field must have `com.owncloud.oauth2` as preferred | Empty message above `Continue` button to start the OAuth2 authentication flow | Passed |   |
| bookmarkName | any name | Set as account name after login | Passed | |
| bookmarkName | empty | Empty account name after login | Passed |  |
| url | correct url | Connection stablished with the URL, showing issues if they happen | Passed | |
| url | empty | Error message | Passed | URL mandatory  |
| allowedHosts | no items inside | No URL will be accepted | NA | Only makes sense if `canConfigureURL` = YES |
| allowedHosts | enter some items (domains) inside | Only URLS matching such domains will be accepted | NA | Only makes sense if `canConfigureURL` = YES |