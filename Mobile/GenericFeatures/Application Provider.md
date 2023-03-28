###  App provider (oCIS)


**Devices**: 
**Server**: <br>


---
 
| Test Case | Description | Expected | Result | Comments |
| :-------- | :---------- | :------- | :----: | :------- |
|**No Availabiliy**||
| oC10 server | Authenticate in a oC10 server | No files or folders with the `Open in Web` option available |  |  |  |
| oCIS server | Authenticate in a oCIS server with `app_providers` capability set to `false` | No files or folders with the `Open in Web` option available |  |  |  |
|**oCIS - Menu**| |
| Folder | Open the action card for any folder  | `Open in web` option not available |  |  |  |
| Not supported | 1. Check the server list endpoint to isolate a mime type that does not fit any supported one (f.ex, video)<br>2. Open the action list for a video (or the not supported mime type) | `Open in web` option not available |  |  |  |
| Default | 1. Check the list endpoint to isolate a mime type that has a `default_application` to open with | `Open in web` option for that application is available in the list for any file with that mime type.<br>Thumbnail matches the provider retrieved one  |  |  |  |
| No Default | 1. Check the list endpoint to isolate a mime type that does not have any `default_application` to open with | `Open in web` option for that application is available with the correct app providers.<br>Thumbnail matches the provider retrieved one |   |  |  |
|**Open file**| |
| Open inline | 1. In Xcode, set `open-in-web-app-mode` environment variable to `in-app` and build the app<br>2. Select any available provider to open a file in web (check with different app providers) | Inline web browser displayed with the content |   |  |  |
| Open external browser | 1. In Xcode, set `open-in-web-app-mode` environment variable to `default-browser` and build the app<br>2. Select any available provider to open file in web (check with different app providers) | Safari web browser displayed with the content |  |  |  |
| Edit inline | 1. In Xcode, set `open-in-web-app-mode` environment variable to `in-app` and build the app<br>2. Select any available provider to open file in web, using the inline browser <br>3. Edit file<br>4. Close app provider | File edited<br>Back to the app after closing |   |  |  |
| Edit external browser | 1. In Xcode, set `open-in-web-app-mode` environment variable to `default-browser` and build the app<br>2. Select available option to open file in web, using the Safari browser<br>2. Edit file<br>3. Close app provider | File edited<br>Back to the app after closing |   | |  |
| Cancel | 1. Select any available provider to open file in web<br>2. Cancel with no changes | File not edited<br>Back to the app after closing |   |  Close not visible in dark theme |  |
| No connection | 1. Remove device connection<br>2. Select available provider to open file in web (check with different app providers) | No posible to download, error displayed |    |   |  |
|**New file**| |
| Create | 1. Create new document using the "+" button<br>2. Set a correct name | Empty file created in the list |   |  |  |
| Empty name | 1. Create new document using the "+" button<br>2. Set an empty name | Creation not allowed |  |  |  |
| Existing name | 1. Create new document using the "+" button<br>2. Set an existing name | Creation not allowed |   |  |  |
| No connection | 1. Remove device connection<br>2. Create new document using the "+" button<br>2. Set a correct name | Empty file created in the list |   | |  |

