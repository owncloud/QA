### Content Protection


**Server(s)**: <br>
**Device(s)**: <br>
**Execution date**: <br>
**Tester**: <br>
**Context**: <br>



| Test Case | Steps | Expected | Result | Related Comment / Defect | 
| :-------- | :---- | :------- | :----: | :----------------------- | 
|**Screenshot protected**| `confidential.allow-`<br>`screenshots` false|||||
| Login | 1. Open the Login view and take an screenshot<br>2. Set `Dark` theme in `Settings`> `Themes` and take another screenshot | 1. Screenshot white<br>2. Screenshot dark |  |  |
| List of files | 1. Open the list of files and take an screenshot<br>2. Set `Dark` theme in `Settings`> `Themes` and take another screenshot | 1. Screenshot empty<br>2. Screenshot empty |  |  |
| Settings | 1. Open the Settings and take an screenshot<br>2. Set `Dark` theme in `Settings`> `Themes` and take another screenshot | 1. Screenshot white<br>2. Screenshot dark |  |  |
| Image file | Open an image file and take an screenshot | Screenshot empty|  |  |
| Video file | Open a video file and take an screenshot | Screenshot empty|  |  |
| Audio file with coverart | Open an audio file with coverart and take an screenshot | Screenshot empty|  |  |
| Audio file without coverart | Open an audio file without coverart and take an screenshot | Screenshot empty|  |  |
| PDF file | Open a PDF file and take an screenshot | Screenshot empty|  |  |
| Txt file | Open a txt file and take an screenshot | Screenshot empty|  |  | 
| Spaces list | Open the spaces list and take a screenshot | Screenshot empty|  |  |
| Search view | Open the search view and take a screenshot | Screenshot empty|  |  |
| Recents view | Open the recents view and take a screenshot | Screenshot empty|  |  |
| Av. offline view | Open the av. offline view and take a screenshot | Screenshot empty| |  |
| Status view | Open the status view and take a screenshot | Screenshot empty|  |  |
| List of operations | Click on 3-dot-button of any file on the list and take an screenshot | Screenshot does not show file info|  |  |
| Screen recording | Record a video with the screenshot | Video empty|  |  |
| Share sheet from 3rd party| 1. Open a 3rd party app and share content with ownCloud<br>2. Take a screenshot from the folder picker  | Screenshot empty|  |  |
| File provider | 1. The parameter `allow-overwrite-confidential` is not in `Branding.plist`<br>2. Open the Files app | Not posible to access, just posible with the app to avoid getting screeshots there |  |  |
| Copy | Click on 3-dot-button of any file or folder on the list | `Copy` not available |  | |
| Open in | Click on 3-dot-button of any file on the list | `Open In` not available |  | |
| Share with me | 1. Other user shares content with me<br>2. Open the sidebar menu > `Shares` and select `Shared with me`<br>3. Take screenshot  | Screenshot empty |  | |
| Share by me | 1. Share content with other user<br>2. Open the sidebar menu > `Shares` and select `Shared by me`<br>3. Take screenshot  | Screenshot empty | | |
| Share by link | 1. Create a link over any item<br>2. Open the sidebar menu > `Shares` and select `Shared by link`<br>3. Take screenshot  | Screenshot empty | | |
| `confidential.allow`<br>`-overwrite-confidential`<br>`-mdm-settings` true | 1. Set `confidential.`<br>`allow-overwrite-`<br>`confidential`<br>`-mdm-settings` to `true` in  `Branding.plist` file<br>2. Open `Files` app | Access to files provider is granted, `Copy`, `Open In` and `Markup`available in operations card|  |  |
| `confidential.allow-`<br>`overwrite-confidential`<br>`-mdm-settings` false | 1. Set `confidential.allow-`<br>`overwrite-confidential`<br>`-mdm-settings` to `false` in  `Branding.plist` file<br>2. Open `Files` app | Access to files provider is not allowed, `Copy`, `Open In` and `Markup` are not available in operations card|  |  |
| Shortcuts | 1. Enable shorcuts IAP feature<br>2. Try to create a shortcut with `Shortcuts` app | Shortcuts disabled for ownCloud | |  |
| Markup | 1. Open `Markup` over a pdf or image file<br>2. Take screenshot | Screenshot empty | NA | In iPhone, not displayed, in iPad displayed but not banned. [Check](https://github.com/owncloud/ios-app/pull/1430#issuecomment-2607819318). Disabled |
| Image metadata | 1. Open `Image metadata` over a image file<br>2. Take screenshot | Screenshot with header empty |  |  |
| Open in new Window (iPad)| 1. Over any file, select `Open in new window`<br>2. Take screenshot | Screenshot empty |  |  |
|**Screenshot not protected**||||||
| `confidential.allow-`<br>`screenshots` true | 1. Set `confidential.allow`<br>`-screenshots` to `true` in  `Branding.plist` file<br>2. Open the app and take an screenshot |  Screenshot taken and saved in album |  |  |
| No `confidential.allow-`<br>`screenshots` | 1. Remove `confidential.allow-`<br>`screenshots` from  `Branding.plist` file<br>2. Open the app and take an screenshot| Screenshot taken and saved in album|  |  |
|**Confidential protected**| `confidential.mark-`<br>`confidential-views` true|||||
| List of files | 1. Open the list of files<br>2. Set `Dark` theme in `Settings`> `Themes` and take another screenshot | 1. Watermark visible<br>2. Watermark visible |  |  |
| Image file | Open an image file | Watermark visible |  |  |
| Video file | Open a video file | Watermark visible | |  |
| Video file audio | Open a video file | No audio reproducible, just subtitles | NA | just a PoC, out of scope |
| Audio file with coverart | Open an audio file with coverart |Watermark visible |  |  |
| Audio file without coverart | Open an audio file without coverart  | Watermark visible |  |  |
| PDF file | Open a PDF file and  | Watermark visible |  |  |
| Txt file | Open a txt file and  | Watermark visible |  |  |
| Shortcut file | 1. Click on `+` and select `Create Shortcut`<br>2. Click on `Pick file or folder`<br>3. Click on `Personal` | Watermark visible |  |  |
| Spaces list | Open the spaces list  | Watermark visible in every card |  |  |
| Search view | 1. Open the search view<br>2. Perform a search that returns results | Watermark visible |   |  |
| Recents view | Open the recents view  | Watermark visible |  |  |
| Av. offline view | 1. Set some items as av. offline<br>2. Open the av. offline view  | Watermark visible |  |  |
| Status view | 1. Upload some files<br>2. Open the status view  | Watermark visible  |  |
| List of operations | 1. Click on 3-dot-button of any file on the list<br>2. Click on 3-dot-button on the top-right corner | Watermark visible in the header |  |  |
| File provider | Open the Files app | Not posible to access, just posible with the app | |  |
| Share sheet from 3rd party| 1. Open a 3rd party app and share content with ownCloud | Watermark visible in the folder picker|  |  |
| Share with me | 1. Other user shares content with me<br>2. Open the sidebar menu > `Shares` and select `Shared with me`  | Watermark over the shared content |  | |
| Share by me | 1. Share content with other user<br>2. Open the sidebar menu > `Shares` and select `Shared by me` | Watermark over the shared content |  | |
| Share by link | 1. Create a link over any item<br>2. Open the sidebar menu > `Shares` and select `Shared by link` | Watermark over the shared content  |  | |
| File names redacted | 1. Open spaces view<br>2. Try to delete a file or folder<br>3. Share a file or folder<br>4. Create a link over a file or folder<br>5. Open the invite view to share with a new member | 1. Space name is redacted in all places<br>2. The delete dialog shows the name redacted<br>3. The sharing dialog shows the name redacted<br>4. The create link dialog shows the name redacted<br>5. The invite view shows the file or folder name redacted | |  |
| Breadcrumbs | 1. Browse in a A/B/C/D structure<br>2. Open breadcrumbs by clicking on the upper chevron | Names of folders are redacted<br>Names of folders are redacted in the bottom side's breadcrumbs | P m18 t17 | |
| `confidential.allow`<br>`-overwrite-confidential`<br>`-mdm-settings` true | 1. Set `confidential.allow`<br>`-overwrite-confidential`<br>`-mdm-settings` to `true` in  `Branding.plist` file<br>2. Open `Files` app | Access to files provider is granted |  |  |
| `confidential.allow-`<br>`overwrite-confidential`<br>`-mdm-settings` false | 1. Set `confidential.allow-`<br>`overwrite-confidential`<br>`-mdm-settings` to `false` in  `Branding.plist` file<br>2. Open `Files` app | Access to files provider is not allowed |  | "Content unavailable" as a FP's crash |
| Markup | 1. Open `Markup` over a pdf or image file | Watermark visible. Name of file redacted | NA | Name not redacted on the top [Check](https://github.com/owncloud/ios-app/pull/1430#issuecomment-2607819318) - Disabled |
| Image metadata | 1. Open `Image metadata` over a image file|  Watermark visible. Name redacted. |  |  |
| Open in new Window (iPad)| 1. Over any file, select `Open in new window` |Watermark visible |  |  |
_______

### Combination of features:

1. screenshot prevention `confidential.allow-screenshots`
2. confidential view marking `confidential.mark-confidential-views`

|| 1. and 2. true | 1. true and 2. false | 1. false and 2. true | 1. and 2. false | 
| :-: |  :-: | :-: | :-: | :-: |
| FP access |   |  |   |    |
| Shortcut intents  |   |  |   |    |
| System sharing actions  |   |  |   |    |
| Copy |  |   |  |   |    |
| Test recognition  |   |  |   |    |
| Markup |   |  |   |    |

- 3rd column is the one where both features are enabled  
- 2nd column is the one where both features are disabled 
- 1st and 4th column, one feature enabled and the other disabled, that means, features to be disabled 

