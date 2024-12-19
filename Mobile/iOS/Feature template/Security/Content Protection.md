### Content Protection


**Server(s)**: <br>
**Device(s)**: <br>
**Execution date**: <br>
**Tester**: <br>
**Context**: <br>



| Test Case | Steps | Expected | Result | Related Comment / Defect | 
| :-------- | :---- | :------- | :----: | :----------------------- | 
|**Screenshot protected**| `confidential.allow-screenshots` false|||||
| Login | 1. Open the Login view and take an screenshot<br>2. Set `Dark` theme in `Settings`> `Themes` and take another screenshot | 1. Screenshot white<br>2. Screenshot dark | |  |
| List of files | 1. Open the list of files and take an screenshot<br>2. Set `Dark` theme in `Settings`> `Themes` and take another screenshot | 1. Screenshot white<br>2. Screenshot dark | |  |
| Settings | 1. Open the Settings and take an screenshot<br>2. Set `Dark` theme in `Settings`> `Themes` and take another screenshot | 1. Screenshot white<br>2. Screenshot dark | |  |
| Image file | Open an image file and take an screenshot | Screenshot empty| |  |
| Video file | Open a video file and take an screenshot | Screenshot empty| |  |
| Audio file with coverart | Open an audio file with coverart and take an screenshot | Screenshot empty| |  |
| Audio file without coverart | Open an audio file without coverart and take an screenshot | Screenshot empty| |  |
| PDF file | Open a PDF file and take an screenshot | Screenshot empty| |  |
| Txt file | Open a txt file and take an screenshot | Screenshot empty| |  |
| Spaces list | Open the spaces list and take a screenshot | Screenshot empty| |  |
| Search view | Open the search view and take a screenshot | Screenshot empty| |  |
| Recents view | Open the recents view and take a screenshot | Screenshot empty| |  |
| Av. offline view | Open the av. offline view and take a screenshot | Screenshot empty| |  |
| Status view | Open the status view and take a screenshot | Screenshot empty| |  |
| List of operations | Click on 3-dot-button of any file on the list and take an screenshot | Screenshot empty| |  |
| File provider | Open the Files app | Not posible to access, just posible with the app | |  |
| Share sheet from 3rd party| 1. Open a 3rd party app and share content with ownCloud<br>2. Take a screenshot from the folder picker  | Screenshot empty| |  |
| Screen recording | Record a video with the screenshot | Video empty| |  |
| Shortcuts | Try to create a shortcut with `Shortcuts` app | Shortcuts disabled for ownCloud | |  |
|**Screenshot not protected**||||||
| `confidential.allow-screenshots` true | 1. Set `confidential.allow-screenshots` to `true` in  `Branding.plist` file<br>2. Open the app and take an screenshot |  Screenshot taken and saved in album | |  |
| No `confidential.allow-screenshots` | 1. Remove `confidential.allow-screenshots` from  `Branding.plist` file<br>2. Open the app and take an screenshot| Screenshot taken and saved in album| |  |
|**Confidential protected**| `confidential.mark-confidential-views` true|||||
| List of files | 1. Open the list of files<br>2. Set `Dark` theme in `Settings`> `Themes` and take another screenshot | 1. Watermark visible<br>2. Watermark visible | |  |
| Image file | Open an image file | Watermark visible | |  |
| Video file | Open a video file | Watermark visible | |  |
| Audio file with coverart | Open an audio file with coverart |Watermark visible | |  |
| Audio file without coverart | Open an audio file without coverart  | Watermark visible | |  |
| PDF file | Open a PDF file and  | Watermark visible | |  |
| Txt file | Open a txt file and  | Watermark visible | |  |
| Shortcut file | 1. Click on `+` and select `Create Shortcut`<br>2. Click on `Pick file or folder`<br>3. Click on `Personal` | Watermark visible | |  |
| Spaces list | Open the spaces list  | Watermark visible | |  |
| Search view | 1. Open the search view<br>2. Perform a search that returns results | Watermark visible | |  |
| Recents view | Open the recents view  | Watermark visible | |  |
| Av. offline view | 1. Set some items as av. offline<br>2. Open the av. offline view  | Watermark visible | |  |
| Status view | 1. Upload some files<br>2. Open the status view  | Watermark visible  |  |
| List of operations | 1. Click on 3-dot-button of any file on the list<br>2. Click on 3-dot-button on the top-right corner | Watermark visible in the header | |  |
| File provider | Open the Files app | Not posible to access, just posible with the app | |  |
| Share sheet from 3rd party| 1. Open a 3rd party app and share content with ownCloud | Watermark visible in the folder picker| |  |