#### Settings with Andorid X

**PR**: https://github.com/owncloud/android/pull/3143

**Devices**: 
**Server**: 


---

 
| Test Case | Steps | Expected | Result | Related Comment  | 
| :-------- | :---- | :------- | :----: | :--------------- | 
|**Settings View**||||||
| Portrait | Enter in the Settings view, setting portrait orientation | Different sections available: Security, Logging, Auto uploads pictures, Auto uploads videos, More and App version. They include the tip |  | 
| Landscape | Enter in the Settings view, setting portrait orientation | Different sections available: Security, Logging, Auto uploads pictures, Auto uploads videos, More and App version |  | 
|**Security**||||||
| View Portrait | Enter in the Security section | Different sections available: Passcode Lock, Pattern Lock, Biometric Lock (disabled by default, if device supports i), and Touches with other windows (including a tip) |  | 
| View Landscape | Enter in the Security section | Different sections available: Passcode Lock, Pattern Lock, Biometric Lock (disabled by default), and Touches with other windows (including a tip) |  | 
| Passcode enabled |1. Enable passcode entering it twice correctly<br>2. Kill the app and open it again | 1. Correctly stored, no feedback message<br>2. Passcode asked |
| Passcode enable cancel | 1. Enable passcode<br>2. Cancel before entering the second time<br>3. Enter the app | Passcode not asked |
| Passcode enable kill app | 1. Enable passcode<br>2. Kill the app before entering the second time<br>3. Enter the app | Passcode not asked |
| Passcode bad 2nd attempt | 1. Enable passcode<br>2. Enter passcode<br>3. Second time, enter a different one | Correct error message |
| Disable passcode | 1. Select to disable passcode<br>2. When it's asked to enter the current passcode, enter it<br>3. Leave the app<br>4. Open the app<br> | Passcode is not asked anymore |
| Disable passcode cancel | 1. Select to disable passcode<br>2. When asked to enter the current passcode, cancel before entering<br>3. Reopen the app again<br>| Passcode is asked |
| Disable passcode killing | 1. Select to disable passcode<br>2. When asked to enter the current passcode, kill the before entering<br>3. Reopen the app again<br>| Passcode is asked |
| Passcode security | 1. With passcode enabled, go to device settings and clear data<br>2. Open the app<br>| Passcode is asked |
| Pattern enabled | 1. Enable pattern entering it twice correctly<br>2. Kill the app and open it again | 1. Correctly stored, no feedback message<br>2. Pattern asked |
| Pattern enable cancel | 1. Enable pattern<br>2. Cancel before entering the second time<br>3. Enter the app | Pattern not asked |
| Pattern bad 2nd attempt | 1. Enable patterb<br>2. Enter pattern<br>3. Second time, enter a different one | Correct error message |
| Disable pattern | 1. Select to disable patterb<br>2. When it's asked to enter the current pattern, enter it<br>3. Leave the app<br>4. Open the app<br> | Pattern is not asked anymore |
| Disable pattern cancel | 1. Select to disable patterb<br>2. When asked to enter the current passcode, cancel before entering<br>3. Reopen the app again<br>| Pattern is asked |
| Disable pattern killing | 1. Select to disable pattern<br>2. When asked to enter the current pattern, kill the before entering<br>3. Reopen the app again<br>| Pattern is asked |
| Pattern security | 1. With pattern enabled, go to device settings and clear data<br>2. Open the app<br>| Pattern is asked |
| Both at the same time | Try to enable pattern and passcode lock at the same time | Not posible, correct error |
| Biometrical not supported | Install the app and open Settings in a device that does not support biometrical | Option is not visible in `Settings`  |
| Biometrical handling| 1. Enable pattern<br>2.Disable pattern and enable passcode<br>3. Disable both pattern and passcode| 1. Biometrical enabled<br>2. Biometrical enabled<br>3. Biometrical disabled|
| Biometrical unlock | 1. Register a finger<br>2. Enable pattern/passcode + biometrical<br>3. Leave the app and enter again<br>4. Repeat the process and cancel the biometrical when it is asked| 3. Biometrical asked<br>4. Passcode/Pattern asked |
| Biometrical disabled | 1. Disable biometrical<br>2. Leave the app and enter again | Passcode/Pattern asked |
| Upload file from camera with security | With a security method enabled (pattern/passcode/biometrical), upload from camera | Security not asked |
| Upload file from external app with security | With a security method enabled (pattern/passcode/biometrical), upload from external app | Security not asked |
| Touches enabled | 1. Enable the option `Touches woth other visible windows`<br>2. Install Twilight app and enable it | It is posible to touch the oC app |
| Touches disabled | 1. Disable the option `Touches woth other visible windows`<br>2. Install Twilight app and enable it | It is not posible to touch the oC app |
|**Logging**||||||
| View Portrait | Enter in the Logging section | Different sections available: Enable Logging, Log HTTP requests and responses (disabled by default), Open Logs view |  | 
| View Landscape | Enter in the Logging section | Different sections available: Enable Logging, Log HTTP requests and responses (disabled by default), Open Logs view |  | 
| Enable Logging | In Logging section, enable Logging | Log HTTP requests and responses and Open Logs view turn enabled | | |
| Test Logging | 1. Perform several actions in the account<br>2. In Settings, open Logginf and logs view | Logcat and Logfiles are generated. Filters work properly. Content can be cleared and shared |
| Logging HTTP on | 1. In Settings, enable `Logging HTTP requests`<br>2. Perform several actions in the account with network requests | Requests are logged including headers and body|
| Logging HTTP off | 1. In Settings, disable `Logging HTTP requests`<br>2. Perform several actions in the account with network requests | Requests are not logged |
| Disable Logging | In Logging section, disable Logging | Log HTTP requests and responses and Open Logs view turn disabled and unchecked| | |
|**Auto uploads**||||||
| Pictures Portrait | Enter in the Auto upload pictures section | Different sections available: Picture uploads, Picture upload path, Only wifi, Camera folder, Original file will be |  | 
| Pictures Landscape | Enter in the Auto upload pictures section | Different sections available: Picture uploads, Picture upload path, Only wifi, Camera folder, Original file will be |  | 
| Pictures uploads | 1. Enable auto upload pictures and close the app<br>2. Take three pictures | Check in web or another client (app closed) that the pictures were uploaded in maximum 15 minutes |
| Pictures path| 1. Enable auto uploads of pictures and set a target folder to upload<br>2. Take some pictures<br>3. Change the path, setting a different one | 2. Pictures are queued, but not uploaded. No error is notified<br>3. Pictures are upload after 15 mins maximum |
| Pictures only wifi| 1. Enable auto uploads of pictures with only wifi<br>2. Using 3G/4G, take a picture<br>3. Then wifi is back, take another picture | 2. The picture is queued, but not uploaded. No error is notified<br>3. The picture is upload after 15 mins maximum |
| Pictures camera folder| 1. Enable auto uploads of pictures<br>2. Set a different camera folder, by installing another camera app (like opencamera or camera mx)<br>3. Take some pictures with default camera app<br>4. Take some pictures with the installed camera app| 3. Nothing uploaded<br>4. Pictures uploaded|
| Pictures Move| 1. Enable auto uploads of pictures<br>2. Set "move" as option for the original file<br>3. Take some pictures| Pictures uploaded and removed from original path|
| Videos Portrait | Enter in the Auto upload videos section | Different sections available: Picture uploads, Video upload path, Only wifi, Camera folder, Original file will be |  | 
| Videos Landscape | Enter in the Auto upload videos section | Different sections available: Video uploads, Video upload path, Only wifi, Camera folder, Original file will be |  | 
| Videos uploads | 1. Enable auto upload pictures and close the app<br>2. Take three pictures | Check in web or another client (app closed) that the pictures were uploaded in maximum 15 minutes |
| Videos path| 1. Enable auto uploads of videos and set a target folder to upload<br>2. Take some videos<br>3. Change the path, setting a different one | 2. Videos are queued, but not uploaded. No error is notified<br>3. Videos are uploaded after 15 mins maximum |
| Videos only wifi| 1. Enable auto uploads of videos with only wifi<br>2. Using 3G/4G, take a video<br>3. Then wifi is back, take another video| 2. The video is queued, but not uploaded. No error is notified<br>3. The video is upload after 15 mins maximum |
| Videos camera folder| 1. Enable auto uploads of videos<br>2. Set a different camera folder, by installing another camera app (like opencamera or camera mx)<br>3. Take some videos with default camera app<br>4. Take some videos with the installed camera app| 3. Nothing uploaded<br>4. Videos uploaded|
| Videos Move| 1. Enable auto uploads of videos<br>2. Set "move" as option for the original file<br>3. Take some videos | Videos uploaded and removed from original path|
| Both at time | 1. Enable auto uploads of videos and pictures<br>2. Set different paths for videos and pictures<br>3. Set Copy for videos, and Move for pictures<br>4. Set only wifi for pictures<br>5. Take three photos and videos under 3G<br>6. Enable device wifi | 5. Pictures: queued. Videos uploaded to the right folder. Videos in the original location as well<br>6. Pictures uploaded to the right path and removed from original location|
| Videos on, Pictures off | 1. Enable auto uploads of videos and disable for pictures<br>2. Take videos and pictures | Videos uploaded, pictures not uploaded|
| Videos off, Pictures on | 1. Enable auto uploads of pictures and disable for videos<br>2. Take videos and pictures | Videos not uploaded, pictures uploaded|
| Everything disabled | 1. Disable auto uploads of pictures and videos<br>2. Take videos and pictures<br>3. Enable both videos and pictures<br>4. Wait max 15 minutes| 2. Nothing uploaded<br>4. Nothing uploaded|
|**More**||||||
| View Portrait | Enter in the More section | Different sections available: Help, Sync your Contacts (with tip), Send Feedback, Recommend to a friend, Privacy Policy, Imprint (hidden by default) |  | 
| View Landscape | Enter in the More section | Different sections available: Help, Sync your Contacts (with tip), Send Feedback, Recommend to a friend, Privacy Policy |  | 
| Help | Open the Help section | Redirected to the help web |  | 
| Davx5 | Open the Sync your Contacts section | Redirected to the Davx5 Google Play site |  | 
| Send Feedback | Open the Send Feedback section | Redirected to the mail app |  |
| Recommend | Open the Recommend section | Redirected to the mail app with the default issue and body mail |  |  
| Privacy Policy | Open the Privacy Policy section | Redirected to the Privacy Policy web |  | 
| Imprint | | Imprint section is disabled by default |  |  
| Imprint enabled | 1. In `setup.xml` file, enable imprint and add URL<br>2. Reinstall| Imprint section is enabled and prompts to the correct URL|  | 
|**App version**||||||
| Info Debug | Install the app with a debug variant | Correct info, pointing to debug|  | 
| Info Release | Install the app with a release variant | Correct info, pointing to release|  | 
| Commit | Checkout to a different commit (or create a new "empty" one | Correct info, showing  the correct commit|  | 
| App name | In file `setup.xml`, change the app name in the field "app_name" and reinstall | Correct info, showing the new name|  | 
| Clipboard | 1. Click on the App version<br>1. Paste in a text editor | App version info is pasted in the text editor|  | 
|**Migration**||||||
| Migration | 1. Install previous version<br>2. Enable all settings (everything checked and enabled)<br>3. Upgrade to the current one| All settings in the same shape|  | 
