### Branding

#### Pr: https://github.com/owncloud/ios-app/pull/637

Devices: iPhoneXR v13.4, iPadAir v13.4<br>
Server: 10.4.1

For the `Generic` and `Themes` section, please check better [this link](https://github.com/owncloud/ios-app/pull/637#issuecomment-638293334)

---


**Root fields**
 
| Property  | Value | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- | 
| organizationName | Organization name | - In the bottom of Settings view together with the commits.<br> - In the top of list of accounts (no profiles).<br> - In the welcome (no profiles) | Passed | Must be mandatory in oB |
| organizationName | empty | No name nowhere | Passed | This should be prevented in oB|
| Can Add account | NO | Not posible to add more than one account | Passed |  |
| Can Add account | YES | Posible to add more than one account | Passed | Profile is mandatory |
| Feedback mail | mail@mail.com | Feedback section in `Settings` points to the email | Passed |  |
| Feedback mail | empty| Feedback section in `Settings` is hidden | Passed |  |
| Logo | Set an image in the path `Theming/Branding-logo.png` | Image is set as the logo | Passed | 2048x2048 to fit correctly. Should be required in oB |
| Background | Set an image in the path `Theming/Branding-background.png` | Image is set as the login background image | Passed | 1080x1920 to fit correctly. Should be required in oB  |


**Profiles**

| Property  | Value | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- | 
| identifier | Internal name |  | | Should be prevented to have profiles with same id |
| name | whatever the name | Displayed to create a new account. Only when one profile exists in `Branding.plist` | Passed |  |
| welcome | Any message string | Message is set in the login view as welcome | Passed |   |
| welcome | empty | No welcome message | Passed | |
| promptForPasswordAuth | Any message. Works together with `allowedAuthenticationMethods`. Such field must have `com.owncloud.basicauth` as preferred | Set as tip to enter credentials, above credentials fields | Passed |  |
| promptForPasswordAuth | Empty. Works together with `allowedAuthenticationMethods`. Such field must have `com.owncloud.basicauth` as preferred | Empty message above credentials fields | Passed | It should be prevented in oB |
| promptForTokenAuth | Any message with OAuth2. Works together with `allowedAuthenticationMethods`. Such field must have `com.owncloud.oauth2` as preferred | Set as tip to enter credentials, above `Continue` button to start the OAuth2 authentication flow | Passed |  |
| promptForTokenAuth | Empty. Works together with `allowedAuthenticationMethods`. Such field must have `com.owncloud.oauth2` as preferred | Empty message above `Continue` button to start the OAuth2 authentication flow | Passed | It should be prevented in oB |
| bookmarkName | any name | Set as account name after login | Passed | To improve: Always the same for same account |
| bookmarkName | empty | Empty account name after login | Passed | Should be prevented in oB |
| url | correct url | Connection stablished with the URL, showing issues if they happen | Passed | |
| url | empty | Error message | Passed |   |
| allowedAuthenticationMethods | com.owncloud.basicauth | Credentials are asked in the app | Passed |  |
| allowedAuthenticationMethods | com.owncloud.oauth2 | Redirected to OAuth2 | Passed |  |
| allowedAuthenticationMethods | com.owncloud.basicauth - com.owncloud.oauth2 | SDK will decide | Passed | Decision is taken in code depending an array of preferences |
| allowedAuthenticationMethods | com.owncloud.oauth2 - com.owncloud.basicauth| SDK will decide | Passed | Decision is taken in code depending an array of preference  |
| allowedAuthenticationMethods | empty | Gets Oauth2 if available. Otherwise, basic auth. | Passed | |
| allowedAuthenticationMethods | not recognised | Alert error | Passed | |


**URLs**

| Property  | Value | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- | 
| Help | URL of help web | Web open | Passed | |
| Help | empty | Field hidden in `Settings`| Passed |   |
| Privacy Policy | URL of privacy policy web | Web open | Passed  | |
| Privacy Policy  | empty | Field hidden in `Settings`| Passed |  |

**Generic**

| Property  | Value | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- | 
| Corporate -> Color | Color of top and bottom bar | Color correct | Passed | |
| Action -> Primary | ? | Color correct | | |
| Action -> Inverse | ? | Color correct | | Not used |
| Action -> Secondary | ? | Color correct | | Not used |
| Text -> Primary | Main color for the text in the app. It is set in:<br>Welcome message<br>Credentials prompt<br>Credentials typed<br>Accounts title<br>Accounts list<br>Items in file list<br>Name of the file in the card<br>Actions label in the card<br>Quick access<br>Sharees<br>List of permissions<br>Public links | Color correct | Passed |  |
| Text -> Inverse | This color should be inverse of corporate color.<br> It is used in the text printed in the up and bottom bars | Color correct | Passed | Icons in bottom bar (browse, quick and status) are not tinted in this color |
| Text -> Secondary | In hints and submenus:<br>Hints in credentials<br>Size, date in list and card<br>Three dot button in card  | Color correct | Passed |  |
| Text -> InverseLight | Options in top bar:<br>Back<br>`+` button<br>three dot button<br>Multiselection<br>Sorting menu | Color correct | Passed | Not used |
| Text -> Disabled | ? | Color correct | | Not used|
| Background -> Standard | Background color:<br>Credentials fields<br>List of files<br>Card | Color correct | Passed | Public and private link background do not get this color |
| Background -> Light | ? |Color correct |  | Not used
| Background -> InputForm | Used only in the background of search bar | Color correct | Passed |
| Background -> Selected | Color | ? | | Not used |
| Background -> Tooltip | Color | ? | | Not used ||
| System -> Success | Color | ?|  | 
| System -> Success-background | Color | ? |  | Not used
| System -> Warning | Color | ?|  | 
| System -> Warning background | Color | ?|  | Not used
| System -> Danger | Color | ?|  | 
| System -> Danger background | Color | ?|  | Not used
| Status -> Progress Indicator | To use in the progress transfers | Passed |  |
| Status -> Progress Background | To use in the progress transfers | Passed |  |
| Icon -> System | Color | ?| | Not used
| Icon -> SystemLight | Color | ?|  | Not used
| Icon -> FileType normal | Color for folders and many file types thumbnails. In File List and also in quick access | ? | |  | 
| Icon -> Disabled | Color | ?| | Not used
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
| DarkBrandColor | Color | ? |  | It is `Corporate.Color` by default. Where is it?
| LightBrandColor | Color | `Cancel` buttons in login flow |  |  | 
| tintColor | Color |  Items in the file card<br>Color of the cloud icon in list of accounts | Passed | 
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
| Favorite -> enabled | Color  | Favorite star enabled? | | Not tinted | 
| Favorite -> disabled | Color  | Favorite star disabled? | | Not tinted |
| Table -> tableBackgroundColor | Color | Color of the table behind the list of files and in the top of the card, and the sharing cards. Also, in the rename, create folders edit text background | Passed |  |
| Table -> tableGroupBackgroundColor | Color | Color of the table behind the sharing cards, and in Actions label in file card | Passed |  |
| Table -> tableSeparatorColor | Color | Color of the item separator in lists | Passed |  |
| Table -> tableRowBorderColor | Color | ? |  |  |
| Table -> tableRowColors -> backgroundColor | Color | Background color of the cells in a list | Passed |  |
| Table -> tableRowColors -> labelColor | Color | Color of the main text in a cell (file name, account name, share..) | Passed |  |
| Table -> tableRowColors -> secondaryLabelColor | Color | Color of hints and submenus:<br>Hints in credentials<br>Size, date in list and card<br>Three dot button in card<br>Badges (av. offline, share...) | Passed |  |
| Table -> tableRowColors -> symbolColor | Color | | ?  | Action.Primary. Where is it? |
| Table -> tableRowColors -> tintColor | Color |  | ?  |  |
| Table -> tableRowColors -> filledColorPairC -> normal |Colors in back and foregorund  | Background: <br>Foreground: | ? |  |   |  
| Table -> tableRowColors -> filledColorPairC -> highlighted |Colors in back and foregorund  | Background: <br>Foreground:  | ? |  |  
| Table -> tableRowColors -> filledColorPairC -> disabled |Colors in back and foregorund  | Background: <br>Foreground:  | ? |  |  
| Table -> tableRowHighlightColors -> backgroundColor | Color | Color of the cell when it is clicked | Passed |  |
| Table -> tableRowHighlightColors -> labelColor | Color | ? |  |  |
| Table -> tableRowHighlightColors -> secondaryLabelColor | Color | ? |  |  |
| Table -> tableRowHighlightColors -> symbolColor | Color | ? |  |  |
| Table -> tableRowHighlightColors -> tintColor | Color | ? |  |  |
| Table -> tableRowHighlightColors -> filledColorPairC -> normal |Colors in back and foregorund  | Background: <br>Foreground: | ? |  |   |  
| Table -> tableRowHighlightColors -> filledColorPairC -> highlighted |Colors in back and foregorund  | Background: <br>Foreground:  | ? |  |  
| Table -> tableRowHighlightColors -> filledColorPairC -> disabled |Colors in back and foregorund  | Background: <br>Foreground:  | ? |  |  
| Icon -> folderFillColor | Color  | Color of the folder icon in files view | Passed |  | 
| Icon -> fileFillColor | Color  | Color of some file icons: text, images, videos, audio. Check in `Quick Access` | Passed |  |  
| Icon -> logoFillColor | Color  | ? | |  |    
| Icon -> iconFillColor | Color  | ? | |  |    
| Icon -> symbolFillColor | Color  | ? |  |  |  
| Progress -> foreground | Color  | Color of the progress circle in transfers | Passed | WARN: Bad default value: it is Status.Progress-Indicator |  
| Progress -> background | Color  | Color of the progress background in transfers | Passed | WARN: Bad default value: it is Status.Progress-Indicator |  
| Toolbar -> backgroundColor | Color  | Color of the bottom bar | ? | Different color of top bar |  
| Toolbar -> labelColor | Color  | Color of the status message in bottom bar | Passed |  | 
| Toolbar -> tintColor | Color  | Color of the top edge of status message | ? |  |   
| Toolbar -> secondaryLabelColor | Color  | ? |  |  |  
| Toolbar -> symbolColor | Color  | ? |  |  |  
| Toolbar -> filledColorPairC -> normal |Colors in back and foregorund  | Background: <br>Foreground: Color of the selected tab in bottom bar | Passed | Only foreground? |  
| Toolbar -> filledColorPairC -> highlighted |Colors in back and foregorund  | Background: <br>Foreground: Color of the selected tab in bottom bar | ? |  |  
| Toolbar -> filledColorPairC -> disabled |Colors in back and foregorund  | Background: Color of the unselected tabs in bottom bar<br>Foreground:  | Passed | Only background? |  
| Searchbar -> backgroundColor | Color | Background color of the SearchBar | Passed |
| Searchbar -> labelColor | Color | Color of the hint in SearchBar | Passed |
| Searchbar -> secondaryLabelColor | Color | ? |  |
| Searchbar -> symbolColor | Color | ? |  |
| Searchbar -> tintColor | Color | Cursor in search bar. Cancel button | ? |
| Searchbar -> filledColorPairC -> normal | Colors in back and foreground  | Background: <br>Foreground:   | ? |  |  
| Searchbar -> filledColorPairC -> highlighted |Colors in back and foreground  | Background: <br>Foreground:  | ? |  |  
| Searchbar -> filledColorPairC -> disabled |Colors in back and foregorund  |  Background: <br>Foreground:   | ? |  | 
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

**Styles**

| Property  | Value | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- | 
| Styles -> statusBarStyle | lightContent | Battery, hour indicator, on the top. Light.| Passed |
| Styles -> statusBarStyle | darkContent | Battery, hour indicator, on the top. Dark.| Passed |
| Styles -> statusBarStyle | default | Same as Dark | Passed |
| Styles -> barStyle | default |  |  NA| Not used, for the moment
| Styles -> activityIndicatorViewStyle | large | Progress indicator wihen tapping on a server in the list, or searching for a sharee| Passed |
| Styles -> activityIndicatorViewStyle | medium |Progress indicator wihen tapping on a server in the list, or searching for a sharee | Passed |
| Styles -> activityIndicatorViewStyle | whiteLarge |Progress indicator wihen tapping on a server in the list, or searching for a sharee | Passed|
| Styles -> activityIndicatorViewStyle | white | Progress indicator wihen tapping on a server in the list, or searching for a sharee| Passed |
| Styles -> activityIndicatorViewStyle | gray | Progress indicator wihen tapping on a server in the list, or searching for a sharee | Passed |
| Styles -> searchBarActivityIndicatorViewStyle | ||  NA| Not used, for the moment
| Styles -> InterfaceStyle | unspecified | Style of the menu when clicking on '+'. Light  | Passed |
| Styles -> InterfaceStyle | light | Style of the menu when clicking on '+'. Light | Passed|
| Styles -> InterfaceStyle | dark | Style of the menu when clicking on '+'. Dark | Passed |
| Styles -> keyboardAppearance | light | Style of keyboard (rename, create folder, create new account). Light | Passed |
| Styles -> keyboardAppearance | dark | Style of keyboard (rename, create folder, create new account). Dark | Passed |
| Styles -> keyboardAppearance | default | Same as light | Passed|
| Styles -> backgroundBlurEffectStyle | light | Light backgorund effect in create folder and rename  | Passed |
| Styles -> backgroundBlurEffectStyle | dark | Dark backgorund effect in create folder and rename  | Passed |
| Styles -> backgroundBlurEffectStyle | regular | Same as light | Passed  |

