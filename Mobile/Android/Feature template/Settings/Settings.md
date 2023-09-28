#### Settings

#### PR: 

Server(s): <br>
Device(s): <br>
Execution date: <br>
Tester:  <br>
Context: <br>


| Test Case | Steps | Expected Result | Result | Related Comment |
| :-------- | :---- | :-------------- | :----: | :-------------- |
|**Manage notifications**||||
| Older than v8  | In a device with Android 7 or older, open `Settings` | `Manage notifications` is not listed there |  | 
| v8 or newer | 1. In a device with Android 8 or newer, open `Settings`<br>2. Click on `Manage Notifications`<br> | 1. `Manage notifications` is listed there<br>2. Device settings open in ownCloud notifications view |  | 
|**Logging**||||
| Debug build  | 1. Build the app in debug mode<br>2. Open `Settings` > `Logging` | `Enable logging` is on |  |  |
| Release build  | 1. Build the app in debug mode<br>2. Open `Settings` > `Logging` | `Enable logging` is off |  |  |
| Enable logging | 1. Open `Settings` > `Logging`<br>2. Enable logging<br>3. In account, perform some operations<br>3. Click on `Log files` |  Check that a new file with today's date exists and its size grows after performing operations |  |
| Disable logging | 1. Open `Settings` > `Logging`<br>2. Disable logging<br>3. In account, perform some operations<br>3. Click on `Log files` |  Check that a file with today's date exists and its size does not grow after performing operations |  |
| Log HTTP requests and responses | 1. Open `Settings` > `Logging`<br>2. Enable logging and `Log HTTP requests and responses`<br>3. In account, perform some operations that involves network requests (download, upload, rename...)<br>4. Click on `Log files` and open today's file | Check that every request contains request-id, and all headers in request/response. Compare this with any proxy's response |  |
| Log files | 1. Enable logging<br>2. Disable logging | 1. `Log files` is enabled and browsable<br>2. `Log files` is enabled and browsable |  |
| List log files | 1. In device, perform some operations to fill logs<br>2. In device settings, change date to tomorrow's date<br>3. Kill oC app and reopen<br>4. In device, perform more operations to fill logs | There are two log files: one for today, another one for tomorrow |  |
| Share log files | 1. Open `Settings` > `Logging` > `Log files`<br>2. Click on the name of any log file| Bottom sheet displayed with available apps to open and read the file in the device|  |  |
| Send log files | 1. Open `Settings` > `Logging` > `Log files`<br>2. Click on the share icon of any log file | Bottom sheet displayed with available apps to share the file in the device |  |  |
| Remove log files | 1. Open `Settings` > `Logging` > `Log files`<br>2. Click on trashbin icon of any log file<br>3. Click on all available trashbin icons | 2. Log file removed from list<br>3. All files removed from list |  |  |
| Background remove | 1. Create 14 log files, one for day<br>2. Wait 7 days | Every 7 days, log files older than 7 days are removed |  |  |
|**Advanced**||||
| Show hidden files | 1. In web, upload a file which name starts with "."<br>2. Open `Settings` > `Advanced`<br>3. Enable `Show hidden files` and open list of files<br>4. Disable `Show hidden files` and open list of files | 3. File is listed in its container folder<br>4. File is not listed in its container folder |  |  
|**More**||||
| List of options | 1. Open `Settings` > `Logging` > `More` | Available options: <br>- Help<br>- Sync contacts, calendars, tasks<br>- Access document provider<br>- Send feedback<br>- Recommend to a friend<br>Not available options:<br>- Imprint|  |  |
| Help | Click on `Help` | Moved to [Android app doc](https://doc.owncloud.com/android/) in web browser |  |  |
| Sync contacts | Click on `Access document provider` | Moved to "Files" in Google Play |  |  |
| Access document provider | Click on `Sync contacts, calendars, tasks` | Moved to DAVx5 in Google Play |  |  |
| Send feedback| Click on `Send feedback` | Open mail app to create a new mail to send to `android-app@owncloud.com` |  |  |
| Recommend | Click on `Recommend to a friend` | Open mail app to create a new mail with subject `Try ownCloud on your smartphone!` and a link in the payload to ownCloud's Google Play download URL |  |  |
|**More (branding)**||||
| Help - true | 1. In `setup.xml` file, set `help_enabled` to true<br>2. Build the app<br>3. Open `Settings` > `More` |  `Help` is visible |  |  |
| Help - false | 1. In `setup.xml` file, set `help_enabled` to false<br>2. Build the app<br>3. Open `Settings` > `More` |  `Help` is not visible |  |  |
| Help - URL | 1. In `setup.xml` file, set `help_enabled` to true<br>2. In `setup.xml` file, set `url_help` with a valid URL<br>3. Build the app<br>4. Open `Settings` > `More`<br>5. Click on `Help` | URL in step 2. is open in browser |  |  |
| Sync contacts - true | 1. In `setup.xml` file, set `sync_calendar_contacts_enabled` to true<br>2. Build the app<br>3. Open `Settings` > `More` |  `Sync your contacts, calendars and tasks` is visible |  |  |
| Sync contacts - false | 1. In `setup.xml` file, set `sync_calendar_contacts_enabled` to false<br>2. Build the app<br>3. Open `Settings` > `More` |  `Sync your contacts, calendars and tasks` is not visible |  |  |
| Sync contacts - URL | 1. In `setup.xml` file, set `sync_calendar_contacts_enabled` to true<br>2. In `setup.xml` file, set `url_sync_calendar_contacts` with a correct URL<br>3. Build the app<br>4. Open `Settings` > `More`<br>5. Click on `Sync your contacts, calendars and tasks` |  URL in step 2. is opened |  |  |
| Access doc. provider - true | 1. In `setup.xml` file, set `access_document_provider_app_enabled` to true<br>2. Build the app<br>3. Open `Settings` > `More` | `Access document provider` is visible |  |  |
| Access doc. provider - false | 1. In `setup.xml` file, set `access_document_provider_app_enabled` to false<br>2. Build the app<br>3. Open `Settings` > `More` | `Access document provider` is not visible |  |  |
| Access doc. provider - URL | 1. In `setup.xml` file, set `access_document_provider_app_enabled` to true<br>2. In `setup.xml` file, set `url_document_provider_app` with a correct URL<br>3. Build the app<br>4. Open `Settings` > `More`<br>5. Click on `Access document provider` | URL in step 2. is opened | | |
| Send feedback - true | 1. In `setup.xml` file, set `feedback_enabled` to true<br>2. Build the app<br>3. Open `Settings` > `More` |  `Send feedback` is visible |  |  |
| Send feedback - false | 1. In `setup.xml` file, set `feedback_enabled` to false<br>2. Build the app<br>3. Open `Settings` > `More` |  `Send feedback` is not visible |  |  |
| Send feedback - URL | 1. In `setup.xml` file, set `feedback_enabled` to true<br>2. In `setup.xml` file, set `mail_feedback` with a correct mail address starting by `mailto:`<br>3. Build the app<br>4. Open `Settings` > `More`<br>5. Click on `Send feedback` | Mail template with the correct recipient address | | |
| Recommend - true | 1. In `setup.xml` file, set `recommend_enabled` to true<br>2. Build the app<br>3. Open `Settings` > `More` |  `Recommend to a friend` is visible |  |  |
| Recommend - false | 1. In `setup.xml` file, set `recommend_enabled` to false<br>2. Build the app<br>3. Open `Settings` > `More` |  `Recommend to a friend` is not visible |  |  |
| Recommend - URL | 1. In `setup.xml` file, set `recommend_enabled` to true<br>2. In `setup.xml` file, set `url_app_download` with a correct URL<br>3. Build the app<br>4. Open `Settings` > `More`<br>5. Click on `Recommend to a friend` | Mail template opened. In payload appears the URL set in step 2. |  |  |
| Imprint - true | 1. In `setup.xml` file, set `imprint_enabled` to true<br>2. Build the app<br>3. Open `Settings` > `More` |  `Imprint` is visible |  |  |
| Imprint - false | 1. In `setup.xml` file, set `imprint_enabled` to false<br>2. Build the app<br>3. Open `Settings` > `More` |  `Imprint` is not visible |  |  |
| Imprint - URL | 1. In `setup.xml` file, set `imprint_enabled` to true<br>2. In `setup.xml` file, set `url_imprint` with a correct URL<br>3. Build the app<br>4. Open `Settings` > `More`<br>5. Click on `Imprint` | URL in step 2. is opened |  |  |
| All - false | 1. In `setup.xml` file, set `help_enabled`, `sync_calendar_contacts_enabled`, `recommend_enabled`, `access_document_provider_app_enabled`, `feedback_enabled`, `recommend_enabled` and `imprint_enabled`  to false<br>2. Build the app<br>3. Open `Settings`  |  `More` is not visible |  |  |
|**Privacy policy**||||
| Privacy policy | Click on `Privacy policy` | Moved to [Android app Privacy Policy](https://owncloud.com/android-app-privacy-policy) in inline browser |  |  |
| Branded - true | 1. In `setup.xml` file, set `privacy_policy_enabled` to true<br>2. Build the app<br>3. Open `Settings` | `Privacy policy` is visible |  |  |
| Branded - false | 1. In `setup.xml` file, set `privacy_policy_enabled` to false<br>2. Build the app<br>3. Open `Settings` | `Privacy policy` is not visible |  |  |
| Branded - URL | 1. In `setup.xml` file, set `privacy_policy_enabled` to true<br>2. In `setup.xml`, set `url_privacy_policy` with a correct URL<br>3. Build the app<br>4. Open `Settings`<br>4. Click on `Privacy policy` | URL in step 2. is opened |  |  |
|**What's new**||||
| Latest news | Click on `What's new in the latest version` | Title: `New in ownCloud`<br>List of improvements<br>`Proceed` button to close  |  |  |
| Branded - true | 1. In `setup.xml` file, set `release_notes_enabled` to true<br>2. Build the app<br>3. Open `Settings` | `What's new in the latest version` is visible |  |  |
| Branded - false | 1. In `setup.xml` file, set `release_notes_enabled` to false<br>2. Build the app<br>3. Open `Settings` | `What's new in the latest version` is not visible |  |  |
|**App version**||||
| App version |  | Displayed: <br>- Kind of build (debug/release)<br>- Version name<br>- Commit hash  |  |  |
| Clipboard | 1. Click on the App version cell<br>2. Paste in a notebook app | 1. Message `Copied to clipboard`<br>2. App version info pasted correctly |  |  |