### Branding

#### Pr: https://github.com/owncloud/ios-app/pull/637

Devices: iPhoneXR v13.4<br>
Server: 10.4.1

---

In the comments, the number of report added in the PR


**Root fields**
 
| Property  | Value | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- | 
| organizationName | Organization name | - In the bottom of Settings view together with the commits.<br> - In the top of list of accounts (no profiles).<br> - In the welcome (no profiles) | Passed | Must be mandatory in oB |
| organizationName | empty | No name nowhere | Passed | This should be prevented in oB|
| Can Add account | NO | Not posible to add more than one account | Passed |  |
| Can Add account | YES | Posible to add more than one account | Failed | More improvements -> add button to add new account<br>With no profiles, it does not work |
| Feedback mail | mail@mail.com | Feedback section in `Settings` points to the email | Passed |  |
| Feedback mail | empty| Feedback section in `Settings` is hidden | Passed |  |
| Logo | Set an image in the path `Theming/Branding-logo.png` | Image is set as the logo | Passed | 2048x2048 to fit correctly. Should be required in oB |
| Background | Set an image in the path `Theming/Branding-background.png` | Image is set as the login background image | Passed | 1080x1920 to fit correctly. Should be required in oB  |


**Profiles**

| Property  | Value | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- | 
| identifier | Internal name |  | | Should be prevented to have profiles with same id |
| name | whatever the name | Displayed to create a new account. Only when one profile exists in `Branding.plist` | Passed | Improvement: Skip to add a second account<br>Should be prevented to have profiles with same id |
| welcome | Any message string | Message is set in the login view as welcome | Failed | Missed in OAuth2  |
| welcome | empty | No welcome message | Passed | |
| promptForPasswordAuth | Any message. Works together with `allowedAuthenticationMethods`. Such field must have `com.owncloud.basicauth` as preferred | Set as tip to enter credentials, above credentials fields | Passed |  |
| promptForPasswordAuth | Empty. Works together with `allowedAuthenticationMethods`. Such field must have `com.owncloud.basicauth` as preferred | Empty message above credentials fields | Passed | It should be prevented in oB |
| promptForTokenAuth | Any message with OAuth2. Works together with `allowedAuthenticationMethods`. Such field must have `com.owncloud.oauth2` as preferred | Set as tip to enter credentials, above `Continue` button to start the OAuth2 authentication flow | Passed |  |
| promptForTokenAuth | Empty. Works together with `allowedAuthenticationMethods`. Such field must have `com.owncloud.oauth2` as preferred | Empty message above `Continue` button to start the OAuth2 authentication flow | Passed | It should be prevented in oB |
| bookmarkName | any name | Set as account name after login | Passed | To improve: Always the same for same account |
| bookmarkName | empty | Empty account name after login | Passed | Should be prevented in oB |
| url | correct url | Connection stablixhed with the URL, showing issues if they happen | Passed | |
| url | empty | No connection | Failed | App crashes |
| allowedAuthenticationMethods | com.owncloud.basicauth | Credentials are asked in the app | Passed |  |
| allowedAuthenticationMethods | com.owncloud.oauth2 | Redirected to OAuth2 | Passed |  |
| allowedAuthenticationMethods | com.owncloud.basicauth - com.owncloud.oauth2 | Credentials are asked in the app | Failed | Prompted to oauth2 |
| allowedAuthenticationMethods | com.owncloud.oauth2 - com.owncloud.basicauth| Redirected to OAuth2 | Passed |  |
| allowedAuthenticationMethods | empty | Gets Oauth2 if available. Otherwise, basic auth. | Passed | |


**URLs**

| Property  | Value | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- | 
| Help | URL of help web | Web open | Passed | |
| Help | empty | Field hidden in `Settings`| Failed | App crashes |
| Privacy Policy | URL of privacy policy web | Web open | Passed  | |
| Privacy Policy  | empty | Field hidden in `Settings`| Failed | App crashes |

**Generic**

| Property  | Value | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- | 
| Corporate -> Color | Color of top and bottom bar | Color correct | Passed | |
| Action -> Primary | ? | Color correct | | |
| Action -> Inverse | ? | Color correct | | |
| Action -> Secondary | ? | Color correct | | |
| Text -> Primary | Main color for the text in the app. It is set in:<br>Welcome message<br>Credentials prompt<br>Credentials typed<br>Accounts title<br>Accounts list<br>Items in file list<br>Name of the file in the card<br>Actions label in the card<br>Quick access<br>Sharees<br>List of permissions<br>Public links | Color correct | Passed | |
| Text -> Inverse | This color should be inverse of corporate color.<br> It is used in the text printed in the up and bottom bars | Color correct | Passed | Icons in bottom bar (browse, quick and status) are not tinted in this color |
| Text -> Secondary | In hints and submenus:<br>Hints in credentials<br>Size, date in list and card<br>Three dot button in card  | Color correct | Passed | |
| Text -> InverseLight | Options in top bar:<br>Back<br>`+` button<br>three dot button<br>Multiselection<br>Sorting menu | Color correct | Passed | |
| Text -> Disabled | ? | Color correct | | |
| Background -> Standard | Background color:<br>Credentials fields<br>List of files<br>Card | Color correct | Passed | Public and private link background do not get this color |
| Background -> Light | ? |Color correct |  |
| Background -> InputForm | Used only in the background of search bar | Color correct | Passed |
| Background -> Selected | Color | ? |  |
| Background -> Tooltip | Color | ?|  |
| System -> Success | Color | ?|  |
| System -> Success background | Color | ? |  |
| System -> Warning | Color | ?|  |
| System -> Warning background | Color | ?|  |
| System -> Danger | Color | ?|  |
| System -> Danger background | Color | ?|  | 
| Status -> Progress Indicator | To use in the progress transfers | Passed |  |
| Status -> Progress Background | To use in the progress transfers | Passed |  |
| Icon -> System | Color | ?| |
| Icon -> SystemLight | Color | ?|  |
| Icon -> FileType normal | Color for folders and many file types thumbnails. In File List and also in quick access | ?|  |
| Icon -> Disabled | Color | ?| |
| Tab -> Active | Bottom bar options. Color of the selected | Color correct| Passed |
| Tab -> Inactive | Bottom bar options. Color of the non selected | Color correct| Passed |

**Theme**

| Property  | Value | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- | 
| Name | Name of the theme | If profiles are available, it is not visible.<br>If no profiles are available, in the `Themes` Section of `Settings` | Passed | |
| Identifer | Identifier of the theme | Not present in the app, only to indentify | NA |  |
| ThemeStyle | Dark | Headers in `Settings`<br>Divider lines in file list | Passed | | 
| ThemeStyle | Light |  |  | Difference with contrast? | 
| ThemeStyle | Contrast | By default. |  | | 
| DarkBrandColor | Color | ? |  | | 
| LightBrandColor | Color | `Cancel` buttons in login flow |  |  | 
| tintColor | Color | ? |  |  | 
| Label -> InformativeColor | Color | ? |  | It is empty by default | 
| Label -> SuccessColor | Color | ? |  |  | 
| Label -> WarningColor | Color | ? |  |  | 
| Label -> ErrorColor | Color | ? |  |  | 
| Fill -> Approval colors -> normal | Colors in background and foreground | Login button | Passed |  | 
| Fill -> Approval colors -> highlighted | Colors in background and foreground | ? |  |  | 
| Fill -> Approval colors -> disabled | Colors in background and foreground | ? |  |  | 
| Fill -> Neutral colors -> normal | Colors in background and foreground | ? |  |  | 
| Fill -> Neutral colors -> highlighted | Colors in background and foreground | ? |  |  | 
| Fill -> Neutral colors -> disabled | Colors in background and foreground | ? |  |  | 
| Fill -> Destructive colors -> normal | Colors in background and foreground | ? |  |  | 
| Fill -> Destructive colors -> highlighted | Colors in background and foreground | ? |  |  | 
| Fill -> Destructive colors -> disabled | Colors in background and foreground | ? |  |  | 
| Favorite -> enabled | Color  | Favorite star enabled? | Failed |  | 
| Favorite -> disabled | Color  | Favorite star disabled? | Failed |  |
| Table -> tableBackgroundColor | Color | Color of the table behind the list of files and in the top of the card, and the sharing cards. Also, in the rename, create folders edit text background | Passed |  |
| Table -> tableGroupBackgroundColor | Color | Color of the table behind the sharing cards, and in Actions label in file card | Passed |  |
| Table -> tableSeparatorColor | Color | Color of the item separator in lists | Passed |  |
| Table -> tableRowBorderColor | Color | ? |  |  |
| Table -> tableRowColors -> backgroundColor | Color | ? |  |  |
| Table -> tableRowColors -> labelColor | Color | ? |  |  |
| Table -> tableRowColors -> secondaryLabelColor | Color | ? |  |  |
| Table -> tableRowColors -> symbolColor | Color | ? |  |  |
| Table -> tableRowColors -> tintColor | Color | ? |  |  |
| Table -> filledColorPairC -> normal |Colors in back and foregorund  | Background: <br>Foreground: | ? |  |   |  
| Table -> filledColorPairC -> highlighted |Colors in back and foregorund  | Background: <br>Foreground:  | ? |  |  
| Table -> filledColorPairC -> disabled |Colors in back and foregorund  | Background: <br>Foreground:  | ? |  |  
| Icon -> folderFillColor | Color  | Color of the folder icon in login view | Passed |  | 
| Icon -> fileFillColor | Color  | Color of some file icons: text, images, videos, audio. Check in `Quick Access` | Passed |  |  
| Icon -> logoFillColor | Color  | ? | |  |    
| Icon -> iconFillColor | Color  | ? | |  |    
| Icon -> symbolFillColor | Color  | ? |  |  |  
| Progress -> foreground | Color  | Color of the progress circle in transfers | Failed | Bad default value: it is Status.Progress-Indicator |  
| Progress -> background | Color  | Color of the progress background in transfers | Failed | Bad default value: it is Status.Progress-Indicator |  
| Toolbar -> backgroundColor | Color  | Color of the bottom bar | ? |  |  
| Toolbar -> labelColor | Color  | Color of the status message in bottom bar | Passed |  | 
| Toolbar -> tintColor | Color  | Color of the top edge of status message | ? |  |   
| Toolbar -> secondaryLabelColor | Color  | ? |  |  |  
| Toolbar -> symbolColor | Color  | ? |  |  |  
| Toolbar -> filledColorPairC -> normal |Colors in back and foregorund  | Background: <br>Foreground: Color of the selected tab in bottom bar | Incomplete |  |  
| Toolbar -> filledColorPairC -> highlighted |Colors in back and foregorund  | Background: <br>Foreground: Color of the selected tab in bottom bar | ? |  |  
| Toolbar -> filledColorPairC -> disabled |Colors in back and foregorund  | Background: Color of the unselected tabs in bottom bar<br>Foreground:  | Incomplete |  |  
| Searchbar -> backgroundColor | Color | Background color of the SearchBar | Passed |
| Searchbar -> labelColor | Color | Color of the hint in SearchBar | Passed |
| Searchbar -> secondaryLabelColor | Color | ? |  |
| Searchbar -> symbolColor | Color | ? |  |
| Searchbar -> tintColor | Color | Cursor in search bar. Cancel button | ? |
| Searchbar -> filledColorPairC -> normal | Colors in back and foreground  | Background: <br>Foreground:   | Failed | Foreground in color of selected tab of bottom bar. PROBABLY THIS SECTIONS MAKES NO SENSE |  
| Searchbar -> filledColorPairC -> highlighted |Colors in back and foreground  | Background: <br>Foreground:  |  |  |  
| Searchbar -> filledColorPairC -> disabled |Colors in back and foregorund  |  Background: <br>Foreground:   | Failed | Foreground in color of unselected tab of bottom bar | 
| NavigationBar -> backgroundColor | Color | Background color of the Toolbar | Passed |
| NavigationBar -> labelColor | Color | Color of the organization name on the top | Passed |
| NavigationBar -> secondaryLabelColor | Color | ? | |
| NavigationBar -> symbolColor | Color | ? | |
| NavigationBar -> tintColor | Color | Back Navigation<br>`+`  button<br>Three-dot-button<br>Sorting<br>Multiselection| Passed |
| NavigationBar -> filledColorPairC -> normal |Colors in back and foregorund  | Background: <br>Foreground: Color of the selected tab in bottom bar | ? | Foreground in color of selected tab of bottom bar. PROBABLY THIS SECTIONS MAKES NO SENSE |   |  
| NavigationBar -> filledColorPairC -> highlighted |Colors in back and foregorund  | Background: <br>Foreground: Color of the selected tab in bottom bar | ? |  |  
| NavigationBar -> filledColorPairC -> disabled |Colors in back and foregorund  | Background: Color of the unselected tabs in bottom bar<br>Foreground:  | ? |  |  
| darkBrandColors -> backgroundColor | Color | ? |  |
| darkBrandColors -> labelColor | Color | ? |  |
| darkBrandColors -> secondaryLabelColor | Color | ? | |
| darkBrandColors -> symbolColor | Color | ? | |
| darkBrandColors -> tintColor | Color | ? | |
| darkBrandColors -> filledColorPairC -> normal |Colors in back and foregorund  | Background: <br>Foreground: Color of the selected tab in bottom bar | ? | Foreground in color of selected tab of bottom bar. PROBABLY THIS SECTIONS MAKES NO SENSE |   |  
| darkBrandColors -> filledColorPairC -> highlighted |Colors in back and foregorund  | Background: <br>Foreground: Color of the selected tab in bottom bar | ? |  |  
| darkBrandColors -> filledColorPairC -> disabled |Colors in back and foregorund  | Background: Color of the unselected tabs in bottom bar<br>Foreground:  | ? |  |  
| lightBrandColors -> backgroundColor | Color | ? |  |
| lightBrandColors -> labelColor | Color | ? |  |
| lightBrandColors -> secondaryLabelColor | Color | ? | |
| lightBrandColors -> symbolColor | Color | ? | |
| lightBrandColors -> tintColor | Color | ? | |
| lightBrandColors -> filledColorPairC -> normal |Colors in back and foregorund  | Background: <br>Foreground: Color of the selected tab in bottom bar | ? | Foreground in color of selected tab of bottom bar. PROBABLY THIS SECTIONS MAKES NO SENSE |   |  
| lightBrandColors -> filledColorPairC -> highlighted |Colors in back and foregorund  | Background: <br>Foreground: Color of the selected tab in bottom bar | ? |  |  
| lightBrandColors -> filledColorPairC -> disabled |Colors in back and foregorund  | Background: Color of the unselected tabs in bottom bar<br>Foreground:  | ? |  |  
| Styles -> statusBarStyle | | | |
| Styles -> barStyle | | | |
| Styles -> activityIndicatorViewStyle | | | |
| Styles -> searchBarActivityIndicatorViewStyle | | | |
| Styles -> InterfaceStyle | | | |
| Styles -> keyboardAppearance | | | |

