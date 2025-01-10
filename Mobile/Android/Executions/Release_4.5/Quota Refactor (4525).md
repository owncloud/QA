### Quota refactor

#### PR: 

**Server(s)**: oCIS 7.0.0, oC 10.15.0<br>
**Device(s):** Xiaomi Redmi, Android 14<br>
**Execution date**: 10/01/2025<br>
**Tester**: jrecio<br>
**Context:** Set some listeners to make the feature more efficient. Required a new execution.<br>

**NOTE:**

Android app show results in Kibibits, Mebibits, Gibibits

| Test Case | Steps | Expected Result | Result | Related Comment |
| :-------- | :---- | :-------------- | :----: | :-------------- |
| **View** |   |  |
| Sidebar | Open sidebar menu | Quota is diplayed in the bottom side, in both orientations | P m14 | [Related](https://github.com/owncloud/android/issues/4513)|
| Manage accounts | Open `Manage accounts` by clicking on the avatar | Quota is diplayed for every account. Check in both orientations | P m14 |  |
| **Value format with enough qouta (oCIS)** |   |  |
| 1GB | 1. In web, set the user quota to 1GB<br>2. In app, open sidebar<br>3. In app, open `Manage accounts` | 2. Quota is displayed in format `xxx of 1GB used (%)`<br>3. Quota is displayed in format `Used: xxx of 1GB` with progress bar in the middle | P m14  | |
| 2GB | 1. In web, set the user quota to 2GB<br>2. In app, open sidebar<br>3. In app, open `Manage accounts` | 2. Quota is displayed in format `xxx of 2GB used (%)`<br>3. Quota is displayed in format `Used: xxx of 2GB` with progress bar in the middle | P m14  | |
| 5GB | 1. In web, set the user quota to 5GB<br>2. In app, open sidebar<br>3. In app, open `Manage accounts`  | 2. Quota is displayed in format `xxx of 5GB used (%)`<br>3. Quota is displayed in format `Used: xxx of 5GB` with progress bar in the middle  |P m14   |
| 10GB | 1. In web, set the user quota to 10GB<br>2. In app, open sidebar<br>3. In app, open `Manage accounts`  | 2. Quota is displayed in format `xxx of 10GB used (%)`<br>3. Quota is displayed in format `Used: xxx of 10GB` with progress bar in the middle  |P m14  | |
| 50GB | 1. In web, set the user quota to 50GB<br>2. In app, open sidebar<br>3. In app, open `Manage accounts`  | 2. Quota is displayed in format `xxx of 50GB used (%)`<br>3. Quota is displayed in format `Used: xxx of 50GB` with progress bar in the middle |P m14   | |
| 100GB | 1. In web, set the user quota to 100GB<br>2. In app, open sidebar<br>3. In app, open `Manage accounts`  | 2. Quota is displayed in format `xxx of 100GB used (%)`<br>3. Quota is displayed in format `Used: xxx of 100GB` with progress bar in the middle | P m14  | |
| No restriction | 1. In web, set the user quota to `No restriction`<br>2. In app, open sidebar<br>3. In app, open `Manage accounts` | 2. Quota is displayed with only the used space and no progress bar<br>3. Quota is displayed in format `Used: xxx` with no progress bar  |P m14  | |
| Personalized | 1. In web, set the user quota to a personalized value like 0.8 GB<br>2. In app, open sidebar<br>3. In app, open `Manage accounts`  | 2. Quota is displayed in format `xxx of 800MB used (%)`<br>3. Quota is displayed in format `Used: xxx of 800MB` with progress bar in the middle | P m14 | |
| **Values referencing qouta (oCIS)** |   |  |
| < 75% | 1. In web, set the user quota to 1GB<br>2. Upload to the account less than 750MB<br>3. In app, open sidebar and `Manage accounts` | Quota is displayed in format `xxx of 1GB used (%)` <br> Progress bar in blue color<br>No status message | P m14 | |
| > 75% < 90%| 1. In web, set the user quota to 1GB<br>2. Upload to the account more than 750MB but less that 990MB<br>3. In app, open sidebar and `Manage accounts` | Quota is displayed in format `xxx of 1GB used (%)` <br> Progress bar in red color<br>Status message: `Storage nearly full`| P m14 | FIXED: [Bug](https://github.com/owncloud/android/pull/4525#issuecomment-2580262783) |
| > 90% < 100%| 1. In web, set the user quota to 1GB<br>2. Upload to the account more than 990MB but less that 1GB<br>3. In app, open sidebar and `Manage accounts`| Quota is displayed in format `xxx of 1GB used (%)` <br> Progress bar in red color<br>Status message: `Storage very nearly full`| P m14 |  |
| > 100%| 1. In web, set the user quota to 1GB<br>2. Upload to the account 1GB<br>3. In app, open sidebar and `Manage accounts` | Quota is displayed in format `xxx of 1GB used (%)` <br> Progress bar in red color<br>Status message: `Storage full`| P m14 | |
| **Limit values changing (oCIS)** |   |  |
| 1GB -> 5GB | 1. In web, set the user quota to 1GB<br>2. In app, open sidebar<br>3. In web, set the user quota to 5GB<br>4. In app, open sidebar and `Manage accounts`| 2. Quota is displayed in format `xxx of 1GB used (%)`<br>4. Quota is displayed in format `xxx of 5GB used (%)` | P m14 | |
| 1GB -> No restriction | 1. In web, set the user quota to 1GB<br>2. In app, open sidebar<br>3. In web, set the user quota to `No restriction`<br>4. In app, open sidebar and `Manage accounts`| 2. Quota is displayed in format `xxx of 1GB used (%)`<br>4. Quota is only displaying the used space |P m14  | |
| No restriction -> 1GB| 1. In web, set the user quota to `No restriction`<br>2. In app, open sidebar and `Manage accounts`<br>3. In web, set the user quota to 1GB<br>4. In app, open sidebar| 2. Quota is only displaying the user space<br>4. Quota is displayed in format `xxx of 1GB used (%)` |P m14  | |
| Account change | 1. Add two accounts with different quota values<br>2. In app, switch from one account to another and open sidebar menu and `Manage accounts`| After switching, the proper quota of every account is displayed | P m14 | |
| **Used values changing (oCIS)** |   |  |
| Normal -> Close | 1. In web, set the user quota to 1GB<br>2. Upload less that 750MB<br>3. In app, open sidebar and `Manage accounts`<br>4. Upload more stuff to overpass 750MB but 900MB<br>5. In app, open sidebar| 3. Progress bar in blue color<br>3. No status message<br>5. Progress bar in red color<br>5. Status message `Storage nearly full` | P m14 | |
| Close -> Very close | 1. In web, set the user quota to 1GB<br>2. Upload more than 750MB but less than 900MB<br>3. In app, open sidebar and `Manage accounts`<br>4. Upload more stuff to overpass 900MB but 1GB<br>5. In app, open sidebar| 3. Progress bar in red color<br>3. Status message `Storage nearly full` <br>5. Progress bar in red color<br>5. Status message `Storage very nearly full` | P m14  | |
| Very close -> Full | 1. In web, set the user quota to 1GB<br>2. Upload more than 900MB but less than 1GB<br>3. In app, open sidebar and `Manage accounts`<br>4. Upload more stuff to overpass 1GB<br>5. In app, open sidebar| 3. Progress bar in red color<br>3. Status message `Storage very nearly full` <br>5. Progress bar in red color<br>5. Status message `Storage full` | P m14 | |
| Full -> Close  | 1. In web, set the user quota to 1GB<br>2. Set the account full (1GB)<br>3. In app, open sidebar<br>4. Remove stuff to set more than 750MB but less than 900MB<br>5. In app, open sidebar and `Manage accounts`| 3. Progress bar in red color<br>3. Status message `Storage full` <br>5. Progress bar in red color<br>5. Status message `Storage nearly full` | P m14 | |
| Close -> Normal  | 1. In web, set the user quota to 1GB<br>2. Set the account with more than 750MB but less that 900MB<br>3. In app, open sidebar and `Manage accounts`<br>4. Remove stuff to set less than 750MB<br>5. In app, open sidebar| 3. Progress bar in red color<br>3. Status message `Storage nearly full` <br>5. Progress bar in blue color<br>5. No status message | P m14 | |
| **Operations modifying quota** |   |  |
| Create folder | 1. In app, check current quota value in sidebar and `Manage accounts`<br>2. Create a new folder<br>3. In app, open sidebar and `Manage accounts`| Used value did not change | P m14 | |
| Upload to `Personal` | 1. In app, check current quota value in sidebar and `Manage accounts`<br>2. Upload one or more files to the `Personal` space<br>3. In app, open sidebar and `Manage accounts`| Used value increases in the size of the uploaded files | P m14 | |
| Upload to `Space` | 1. In app, check current quota value in sidebar and `Manage accounts`<br>2. Upload one or more files to any custom space<br>3. In app, open sidebar and `Manage accounts`| Used value does not change | P m14 | |
| Copy to `Personal` | 1. In app, check current quota value in sidebar and `Manage accounts`<br>2. Copy a file to other location inside the `Personal` space <br>3. In app, open sidebar and `Manage accounts`| Used value increases in the size of the copied files | P m14 | |
| Copy to other space | 1. In app, check current quota value in sidebar and `Manage accounts`<br>2. Copy a file to other space <br>3. In app, open sidebar and `Manage accounts`| Used value does not change  | P m14 | |
| Move  | 1. In app, check current quota value in sidebar and `Manage accounts`<br>2. Move a file to other location inside the `Personal` space <br>3. In app, open sidebar and `Manage accounts`| Used value does not change | P m14 | |
| Move with conflict (both) | 1. In app, check current quota value in sidebar and `Manage accounts`<br>2. Move a file to other location which contains another file with the same name<br>3. Fix the conflict with `Keep both`<br>4. In app, open sidebar and `Manage accounts`| 3. Conflict dialog<br>4. Used value does not change| P m14 | |
| Move with conflict (replace) | 1. In app, check current quota value in sidebar and `Manage accounts`<br>2. Move a file to other location which contains another file with the same name<br>3. Fix the conflict with `Keep both`<br>4. In app, open sidebar and `Manage accounts`| 3. Conflict dialog<br>4. Used value decreases the size of the moved files | P m14 | |
| Delete | 1. In app, check current quota value in sidebar and `Manage accounts`<br>2. Delete one or more files from the account<br>3. In app, open sidebar and `Manage accounts`| 3. Used value decreases in the size of the deleted files| P m14 | |
| Remote change (refresh) | 1. In app, check current quota value in sidebar and `Manage accounts`<br>2. In web (or other client), add and delete some files of the account<br>3. In app, refresh<br>4. In app, open sidebar and `Manage accounts`| Used value changes in the size of the added/deleted files| P m14 | |
| **Regression (oC10)** | | |
| Default | 1. In web, set the user quota to Default<br>2. In app, open sidebar and `Manage accounts`| Quota is displaying the used space | P m14 | |
| Unlimited | 1. In web, set the user quota to Unlimited<br>2. In app, open sidebar and `Manage accounts`| Quota is displaying the used space | P m14 | |
| 1GB | 1. In web, set the user quota to 1GB<br>2. In app, open sidebar and `Manage accounts`| Quota is displayed in format `xxx of 1GB used (%)` | P m14 | |
| 5GB | 1. In web, set the user quota to 5GB<br>2. In app, open sidebar and `Manage accounts`| Quota is displayed in format `xxx of 5GB used (%)` | P m14 | |
| 10GB | 1. In web, set the user quota to 10GB<br>2. In app, open sidebar and `Manage accounts`| Quota is displayed in format `xxx of 10GB used (%)` | P m14 | |
| Other | 1. In web, set the user quota to Other (f. ex 500MB)<br>2. In app, open sidebar and `Manage accounts`| Quota is displayed in format `xxx of 500GB used (%)` | P m14 | |

 