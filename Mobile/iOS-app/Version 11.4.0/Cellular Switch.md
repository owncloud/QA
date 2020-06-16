### Cellular switch

#### PR: [https://github.com/owncloud/ios-app/pull/707](https://github.com/owncloud/ios-app/pull/709)

Devices: iPhone XR v13.4, iPadAir v13.4<br>
Server: 10.4.1

---

 
| Test Case | Steps | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- | 
|**View**|
| Portrait | Open `Settings`-> Data usage | Correct Cellular Transfer option with suboptions `Allow Cellular access` and `Available offline` | P m13 |  |
| Landscape | Open `Settings`-> Data usage | Correct Cellular Transfer option with suboptions `Allow Cellular access` and `Available offline` | P m13 |  |
|**`Allow cellular access` enabled**|
| Uploads under WiFi | 1. Under WiFi, upload some content from Albums | Content uploaded | P m13 |  |
| Uploads under Cellular data | 1. Switch WiFi off<br>2. Upload some content from Albums | Content uploaded | P m13 |  |
| Auto Uploads under WiFi | 1. Enable AutoUploads in Settings<br>2. under WiFi, take some content from the camera | Content uploaded | P m13 |  |
| Uploads under Cellular data | 1. Switch WiFi off<br>2. Enable AutoUploads in Settings<br>3. Take some content from the camera | Content uploaded | P m13 |  |
| Downloads under WiFi | 1. Under WiFi, download a file | Content downloaded | P m13 |  |
| Downloads under Cellular data | 1. Switch WiFi off<br>2. Download a file | Content downloaded | P m13 |  |
| Switch WiFi on | 1. Switch WiFi off<br>2. Under cellular connection, upload some files<br>3. Switch Wifi On | Content uploaded| P m13 |  |
| Switch WiFi off | 1. Switch WiFi on<br>2. Upload a big file<br>3. While the upload is being done,  switch Wifi Off | File uploaded| P m13 |  |
|**`Allow cellular access` disabled**|
| Uploads under WiFi | 1. Under WiFi, upload some content from Albums | Content uploaded | P m13 |  |
| Uploads under Cellular data | 1. Switch WiFi off<br>2. Upload some content from Albums | Content NOT uploaded, waiting for WiFi | F m13 | Content queued, but with mintenance mode message |
| Auto Uploads under WiFi | 1. Enable AutoUploads in Settings<br>2. under WiFi, take some content from the camera | Content uploaded | P m13 |  |
| Auto Uploads under Cellular data | 1. Switch WiFi off<br>2. Enable AutoUploads in Settings<br>3. Take some content from the camera | Content NOT uploaded, waiting for WiFi | F m13 | Content queued, but with mintenance mode message |
| Downloads under WiFi | 1. Under WiFi, download some files | Content downloaded | P m13 |  |
| Downloads under Cellular data | 1. Switch WiFi off<br>2.Download some files | Content NOT downloaded, waiting for WiFi | F m13 | Maintenance mode |
| Switch WiFi on | 1. Switch WiFi off<br>2. Under cellular connection, upload some files<br>3. Switch Wifi On | Content uploaded| P m13 |  |
| Switch WiFi off | 1. Switch WiFi on<br>2. Upload a big file<br>3. While the upload is being done,  switch Wifi Off |2. File starts to upload<br>3. Upload stopped | P m13 |  |
| Basic operations | 1. Switch WiFi off (use cellular data)<br>2. Perform basic operations: create folder, copy, move, delete, rename, duplicate | Operations correct, because they are not transfers and can be done even with `Allow Cellular access` disabled | P m13 |  |
|**Switching `Allow cellular access`**|
| WiFi on I | 1. Switch `Allow cellular access` off<br>2. Under WiFi, upload/download some files<br>3. Switch `Allow cellular access` on | Everything finishes | P m13 | Several files, one is missed? |
| WiFi on II | 1. Switch `Allow cellular access` on<br>2. Under WiFi, upload/download some files<br>3. Switch `Allow cellular access` off | Everything finishes | P m13 |  |
| WiFi off I | 1. Switch `Allow cellular access` off<br>2. Upload some files<br>3. Switch `Allow cellular access` on | 2. Content queued<br>3. Content starts to upload | NA | Not implemented yet |
| WiFi off II | 1. Switch `Allow cellular access` on<br>2. Upload/Download some files<br>3. Switch `Allow cellular access` off | 2. Content uploading/downloading<br>3. Content stops to upload/download | NA | Not implemented yet |
|**`Available offline` enabled**|
| Wifi  | Set a folder with many files as av. offline | Content downloaded and set as av. offline | P m13 |  |
| Cellular | Set a folder with many files as av. offline | Content downloaded and set as av. offline | P m13 |  |
|**`Available offline` disabled**|
| Wifi | Set a folder as av. offline | Content downloaded and set as av. offline | P m13 |  |
| Cellular | Set a folder as av. offline | Content set as av. offline but downloaded | P m13 |  |