### Authentication

Server(s): <br>
Device(s): <br>
Execution date: <br>
Tester:  <br>
Context: <br>

---

 
| Test Case | Steps | Expected | Result | Related Comment / Defect  | 
| :-------- | :---- | :------- | :----: | :------------------------ | 
|**Login view UI**||||||
| Portrait | Open login view in portrait orientation | Visible: <br>- ownCloud icon<br>- Server address text field<br>- Right arrow to validate<br>- "New to owncloud?" section<br>- Settings link |  |  |
| Landscape | Open login view in landscape orientation | Visible: <br>- ownCloud icon<br>- Server address text field<br>- Right arrow to validate<br>- "New to owncloud?" section<br>- Settings link |  |  |
| New to ownCloud | Tap on the link `New to ownCloud` | Link works, pointing to [owncloud.com/doc-guides](owncloud.com/doc-guides)|  |  |
| Settings | Tap on the link `Settings` | `Settings` view open |  |  |
|**URL validation**||||||
| Empty URL | 1. Let empty URL<br>2. Click on right arrow | Error: "Cannot authenticate to this server". |  |  |
| Prefix http | 1. Enter correct http URL with protocol prefix "http://"<br>2. Click on right arrow | "Connection established" displayed |  |  |
| Prefix https | 1. Enter correct https URL with protocol prefix "https://"<br>2. Click on right arrow | "Connection established" displayed |  |  |
| No prefix http | 1. Enter correct http URL without protocol prefix "http://"<br>2. Click on right arrow| Error: "SSL initialization failed" |  |  |
| No prefix https | 1. Enter correct https URL without protocol prefix "https://"<br>2. Click on right arrow | Accepted, "https://" prefix added to the URL |  |  |
| Icon check | 1. Enter correct URL<br>2. Tap on ownCloud icon| URL checked in the same way as the right arrow |  |  |
| Server not reachable | 1. Enter an URL that points nowhere<br>2. Click on right arrow| Error: "Server could not be reached" |  |  |
| Wrong format | 1. Enter as URL an invalid string like "hello, i'm here"<br>2. Click on right arrow| Error: "Wrong server address format" |  |  |
| No server connection | 1. Switch server off<br>2. Enter URL<br>3. Click on right arrow | Error: "An error occured while connecting to the server." |  |  |
| Server not supported | 1. Enter URL of non supported server (older than 10.x)<br>2. Click on right arrow | Error: "Your server version is lower than 10, so it is not supported" |  |  |
| Maintenance mode | 1. Enable maintenance mode in server<br>2. Enter URL<br>3. Click on right arrow | Error: "System in maintenance mode." |  |  |
|**Review Connection**||||||
| Open certificate | 1. Enter non-secured server URL (https self signed certificate, or adding mitm f.ex.)<br>2. Click on "Details" | 1. Alert about non secure certificate is displayed: "The identity of the server could not be verified"<br>2. Certificate properties listed |  |  |  |
| Approve certificate | 1. Enter non-secured server URL (https self signed certificate, or adding mitm f.ex.)<br>2. Click on "YES" to approve it | 1. Alert about non secure certificate is displayed: "The identity of the server could not be verified"<br>2. "Secure connection established"<br>2. Moved forward to credentials | |  |  |
| Cancel certificate | 1. Enter non-secured server URL (https self signed certificate, or adding mitm f.ex.)<br>2. Click on "NO" to deny it | Correct error: "Server certificate is not trusted" | |  |  |
|**Basic auth**||||||
| Empty credentials | 1. Enter correct URL of server with basic auth<br>2. Click on right arrow | "Log in" button hidden  |  |  | 
| Empty username | 1. Enter correct URL of server with basic auth<br>2. Click on right arrow<br>3. Let empty username and type a password | "Log in" button hidden |  |  |
| Empty password | 1. Enter correct URL of server with basic auth<br>2. Click on right arrow<br>3. Let empty password and and type an username | "Log in" button hidden |  |  |
| Correct credentials | 1. Enter correct URL of server with basic auth<br>2. Click on right arrow<br>3. Enter correct username and password<br>4. Click on "Log in" | List of files displayed |  |  | 
| Special characters | 1. Enter correct URL of server with basic auth<br>2. Click on right arrow<br>3. Enter correct username that contains special characters like "+_.@-'" (created in advace in server) and correct password<br>4. Click on "Log in" | List of files displayed |  |  | 
| Username with blanks | 1. Enter correct URL of server with basic auth<br>2. Click on right arrow<br>3. Enter correct username that contains blank characters (created in advace in server) and correct password<br>4. Click on "Log in"| List of files displayed |  |  |
| Password eye | 1. Enter correct URL of server with basic auth<br>2. Click on right arrow<br>3. Enter a password<br>4. Click on eye button, right to the password | Password is revealed |  |  |
| Wrong credentials | 1. Enter correct URL of server with basic auth<br>2. Click on right arrow<br>3. Enter correct username and incorrect password<br>4. Click on "Log in" | Error: "Wrong username or password" |  |  | 
| Existing account | 1. Enter correct URL of server with basic auth<br>2. Click on right arrow<br>3. Enter correct username and password<br>4. Repeat all steps to add again same account | Error: "An account for the same user and server already exists in the device" |  |  
| URL of server older than 10 | Add correct URL of a 9.x server | Server can not be connected |
|**OAuth2**||||||
| Correct credentials | 1. Enter correct URL of server with OAuth2<br>2. Set correct credentials in OAuth2 view (browser) | Callback to the app and list of files displayed |  |  | 
| Cancel OAuth2 Login | 1. Enter correct URL of server with OAuth2<br>2. Cancel authentication process in browser| Moved to Login view |  |  |
| Cancel OAuth2 Authorizaton | 1. Enter correct URL of server with OAuth2<br>2. Enter correct credentials in browser<br>3. Cancel process in authorization view | Moved to Login view |  |  |
| Renewal OAuth2 token | 1. Enter correct URL of server with OAuth2 (check how to tweak it to set a shorter expiration time as defaults' 1h)<br>2. Enter correct credentials in browser and authorize<br>3. Wait till token expires<br>4. Perform any operations in the list of files | 2. List of files displayed<br>4. Operation is completed with no authentication/authorization errors. Check with mitmproxy or any other tool that the token endpoint was called|
| Revoke OAuth2 token | 1. Enter correct URL of server with OAuth2<br>2. Enter correct credentials in browser and authorize<br>3. In server dashboard, revoke the Android token<br>4. Perform any operation in list of files<br>5. Click on "Sign In" and enter correct credentals | 4. Error in list of files: "The access token has expired or become invalid. Sign again to gain access"<br>5. List of files displayed again. |  |  |
| Logout  | 1. Complete authentication/authorization process in a OAuth2 server<br>2. Logout in the idP | Session logged out. Needed credentials again to enter the account | NA | Not done yet. |
| Existing account | 1. Enter correct URL of server with OAuth2<br>2. Click on right arrow<br>3. Enter correct username and password in browser, and authorize<br>4. Repeat all steps to add again same account | Error: "An account for the same user and server already exists in the device" |  |  
|**OIDC**||||||
| Correct credentials | 1. Enter correct URL of server with OIDC<br>2. Set correct credentials in OAuth2 view (browser)<br>3. Authorize | Callback to the app and list of files displayed |  |  | 
| Refresh token | 1. Create a new OAuth2 session<br>2. Wait until token expires<br>3. Perform some actions | Token is refreshed (check in BD or proxy) and user keeps on using the app | | |
| Cancel OIDC Login | 1. Enter correct URL of server with OIDC<br>2. Cancel authentication process in browser| Moved to Login view |  |  |
| Cancel OIDC Authorizaton | 1. Enter correct URL of server with OIDC<br>2. Enter correct credentials in browser<br>3. Cancel process in authorization view | Moved to Login view |  |  |
| Logout  | 1. Complete authentication/authorization process in a OIDC server<br>2. Logout in the idP | Session logged out. Needed credentials again to enter the account | NA | Not done yet. |
| Existing account | 1. Enter correct URL of server with OIDC<br>2. Click on right arrow<br>3. Enter correct username and password in browser, and authorize<br>4. Repeat all steps to add again same account | Error: "An account for the same user and server already exists in the device" |  |
|**Redirections**||||||
| 301 | 1. Enter an URL with a 301 redirection<br>2. Connect | Redirection followed to the new location. New Location displayed in Login view  |  |  |  |
|**Edit account**||||||
| Password (basic auth) | 1. In server admin dashboard, change the password of any attached account that uses basic auth<br>2. Reopen the app | An snackbar indicates `Authentication failed` with the option to sign in again to enter the correct password in login view |  |  |
| OAuth2/OIDC | 1. In server, remove active token of the account<br>2. Try to execute any action  | An snackbar indicates `Token expired` with the option to sign in again to get a new one in login view |  |  |
|**Brandable options**||||||
| Default URL | 1. Set a URL in `server_url` field of [setup.xml branding file](https://github.com/owncloud/android/blob/master/owncloudApp/src/main/res/values/setup.xml)<br>2. Build app using Android Studio/gradle scripts | URL set in Login View |  |  |  |
| Hide URL | 1. Set `show_server_url_input` to false in [setup.xml branding file](https://github.com/owncloud/android/blob/master/owncloudApp/src/main/res/values/setup.xml)<br>2. Build app using Android Studio/gradle script | URL hidden in Login View |  |  |  |
| Hide "New to ownCloud" | 1. Set `show_welcome_link` to false in [setup.xml branding file](https://github.com/owncloud/android/blob/master/owncloudApp/src/main/res/values/setup.xml) | "New to ownCloud" link hidden in Login View |  |  |  |
| Show "New to ownCloud" with link | 1. Set `show_welcome_link` to true in [setup.xml branding file](https://github.com/owncloud/android/blob/master/owncloudApp/src/main/res/values/setup.xml)<br>2. Set a valid URL in `welcome_link_url` in setup.xml branding file<br>3. Build app using Android Studio/gradle script | "New to ownCloud" link shown in Login View, pointing to the set up URL |  |  |  |
| Set "Login Welcome Text" | 1. Set `show_welcome_link` with a string in [setup.xml branding file](https://github.com/owncloud/android/blob/master/owncloudApp/src/main/res/values/setup.xml)<br>2. Build app using Android Studio/gradle script | Welcome string displayed insted of the "New to ownCloud" link |  |  |  |