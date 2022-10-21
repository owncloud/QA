###  App provider (oCIS)

**Server**: 2.0.0beta8<br>
**Devices**: iPhoneXR v16, iPadAir v15

---
 
| Test Case | Description | Expected | Result | Comments |
| :-------- | :---------- | :------- | :----: | :------- |
|**No Availabiliy**||
| oC10 server | Authenticate in a oC10 server | No files or folders with the "Open in Web" option available | P m16 t15|  |  |
| oCIS server | Authenticate in a oCIS server with `app_providers` capability set to `false` | No files or folders with the "Open in Web" option available | P m16 t15|  |  |
|**oCIS - Menu**| |
| Folder | Open the action card for any folder  | Open in web option not available | P m16 t15|  |  |
| Not supported | 1. Check the list endpoint to isolate a mime type that does not fit any supported one (f.ex, video)<br>2. Open the action list for a video (or the not supported mime type)  | Open in web option not available | P m16 t15|  |  |
| Default | 1. Check the list endpoint to isolate a mime type that has a `default_application` to open with | Open in web option for that application is available in the list for any file with that mime type.<br>Thumbnail matches the provider retrieved one  | P m16 t15 |  |  |
| No Default | 1. Check the list endpoint to isolate a mime type that does not have any `default_application` to open with | Open in web option for that application is available with the correct app providers.<br>Thumbnail matches the provider retrieved one | P m16 t15 |  |  |
|**Open file**| |
| Open inline | Select available option to open file in web (check with different app providers) | Inline web browser displayed with the content | P m16 t15 |  |  |
| Open external browser | Select available option to open file in web (check with different app providers) | Sarafi web browser displayed with the content | P m16 t15 |  |  |
| Edit inline | 1. Select available option to open file in web, using the inline browser (via branding)<br>2. Edit file<br>3. Close app provider | File edited<br>Back to the app after closing | P m16 t15 |  |  |
| Edit external browser | 1. Select available option to open file in web, using the safari browser (via branding)<br>2. Edit file<br>3. Close app provider | File edited<br>Back to the app after closing | P m16 t15 | |  |
| Cancel | 1. Select available option to open file in web<br>2. Cancel with no changes | File not edited<br>Back to the app after closing | P m16 t15 | FIXED: Close not visible in datk theme |  |
| No connection | 1. Remove device connection<br>2. Select available option to open file in web (check with different app providers) | No posible to download, error displayed | P m16 t15  | FIXED: Nothing happens. Lack of feedback |  |
|**New file**| |
| Create | 1. Create new document using the "+" button<br>2. Set a correct name | Empty file created in the list | P m16 t15 |  |  |
| Empty name | 1. Create new document using the "+" button<br>2. Set an empty name | Creation not allowed | P m16 t15 |  |  |
| Existing name | 1. Create new document using the "+" button<br>2. Set an existing name | Creation not allowed | P m16 t15 |  |  |
| No connection | 1. Remove device connection<br>2. Create new document using the "+" button<br>2. Set a correct name | Empty file created in the list | P m16 t15 | FIXED: Not created |  |

