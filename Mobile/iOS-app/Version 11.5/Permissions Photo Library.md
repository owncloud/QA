### Permissions in Photo Library

#### PR: https://github.com/owncloud/ios-app/pull/853

Devices: iPhoneXR v14.2, iPadAir v13<br>
Server: 10.6

---

Device > Settings > ownCloud > Photos

Every section in the plan for every option 
 
| Test Case | Steps | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- | 
|**All**|||||
| Upload one photo | Open "Upload from your photo library"<br>Select one photo | Photo uploaded | P m14  | |  |
| Upload several photos | Open "Upload from your photo library"<br>Select some photos | Photos uploaded | P m14 | |  |
| Upload one video | Open "Upload from your photo library"<br>Select one video | Video uploaded | P m14 | |  |
| Upload several videos | Open "Upload from your photo library"<br>Select some videos | Videos uploaded | P m14 | |  |
|**Selected**|||||
| Upload selected photo | In Device Settings, select one photo<br>In app, open "Upload from your photo library"<br>Select that photo | Photo uploaded | P m14 | |  |
| Upload selected photos | In Device Settings, select some photos<br>In app, open "Upload from your photo library"<br>Select those photos | Photos uploaded | P m14 | |  |
| Upload non-selected photo | In Device Settings, select one photo<br>In app, open "Upload from your photo library"<br>Select a different photo | Photo not uploaded, permissions error | P m14 | |  |
| Upload mixed photos | In Device Settings, select several photos<br>In app, open "Upload from your photo library"<br>Select photos that are selected and non-selected | Photos not uploaded, permissions error | P m14 | |  |
| Upload selected video | In Device Settings, select one video <br>In app, open "Upload from your photo library"<br>Select that video | Video uploaded | P m14 | |  |
| Upload selected videos | In Device Settings, select some videos<br>In app, open "Upload from your photo library"<br>Select those videos | Videos uploaded | P m14 | |  |
| Upload non-selected video | In Device Settings, select one video <br>In app, open "Upload from your video library"<br>Select a different video | Video not uploaded, permissions error | P m14 | |  |
| Upload mixed videos | In Device Settings, select several video <br>In app, open "Upload from your video library"<br>Select photos that are selected and non-selected | Selected videos uploaded<br> Non-selected videos not uploaded, permissions error | P m14 | |  |
|**None**|||||
| Upload one photo | Open "Upload from your photo library" | Permissions error | P m14 | |  |
| Upload several photos | Open "Upload from your photo library" | Permissions error  | P m14 | |  |
| Upload one video | Open "Upload from your photo library" | Permissions error  | P m14 | |  |
| Upload several videos | Open "Upload from your photo library" | Permissions error  | P m14 | |  |
|**iOS13**|||||
| Upload one photo | Open "Upload from your photo library"<br>Select one photo | Photo uploaded | P t13 | |  |
| Upload several photos | Open "Upload from your photo library"<br>Select some photos | Photos uploaded | P t13 | |  |
| Upload all photos | Open "Upload from your photo library"<br>Select all photos available | Photos uploaded | P t13 | |  |
| Upload one video | Open "Upload from your photo library"<br>Select one video | Video uploaded | P t13 | |  |
| Upload several videos | Open "Upload from your photo library"<br>Select some videos | Videos uploaded | P t13 | |  |
| Upload all videos | Open "Upload from your photo library"<br>Select all videos available | Videos uploaded | P t13 | |  |
