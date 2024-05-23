### Quota

#### PR: https://github.com/owncloud/android/pull/4401

Server(s): oCIS 5.0.4, oC10.14.0<br>
Device(s): Pixel 2 Android11<br>
Execution date: 21/05/2024 <br>
Tester: jrecio <br>
Context: Getting the Quota from GraphAPI, instead from propfinds<br>


| Test Case | Steps | Expected Result | Result | Related Comment |
| :-------- | :---- | :-------------- | :----: | :-------------- |
| **View** |   |  |
| View | 1. Open sidebar menu | Quota is diplayed in the bottom side, in both orientations | P m11 | |
| **Values with enough qouta (oCIS)** |   |  |
| 1GB | 1. In web, set the user quota to 1GB<br>2. In app, open sidebar | Quota is displayed in format \<used\> of 1GB (%) | P m11 | |
| 2GB | 1. In web, set the user quota to 2GB<br>2. In app, open sidebar | Quota is displayed in format \<used\> of 2GB (%) | P m11 | |
| 5GB | 1. In web, set the user quota to 5GB<br>2. In app, open sidebar | Quota is displayed in format \<used\> of 5GB (%) | P m11 | |
| 10GB | 1. In web, set the user quota to 10GB<br>2. In app, open sidebar | Quota is displayed in format \<used\> of 10GB (%) | P m11 | |
| 50GB | 1. In web, set the user quota to 50GB<br>2. In app, open sidebar | Quota is displayed in format \<used\> of 50GB (%) | P m11 | |
| 100GB | 1. In web, set the user quota to 100GB<br>2. In app, open sidebar | Quota is displayed in format \<used\> of 100GB (%) | P m11 | |
| No restriction | 1. In web, set the user quota to "No restriction"<br>2. In app, open sidebar | Quota is displayed in format \<used\> | P m11 | FIXED: [bug](https://github.com/owncloud/android/pull/4401#issuecomment-2122914804) |
| **Values overflowing quota (oCIS)** |   |  |
| 1GB | 1. In web, set the user quota to 1GB<br>2. In app, open sidebar | Quota is displayed in format \<used\> of 1GB (%) | P m11 | `No storage usage`<br>`information available`. Move to next issue|
| **Values change (oCIS)** |   |  |
| 1GB -> 5GB | 1. In web, set the user quota to 1GB<br>2. In app, open sidebar<br>3.  In web, set the user quota to 5GB<br>4. In app, open sidebar| 2. Quota is displayed in format \<used\> of 1GB (%)<br>4. Quota is displayed in format \<used\> of 5GB (%)  | P m11 | |
| 1GB -> No restriction | 1. In web, set the user quota to 1GB<br>2. In app, open sidebar<br>3. In web, set the user quota to "No restriction"<br>4. In app, open sidebar| 2. Quota is displayed in format \<used\> of 1GB (%)<br>4. Quota is displayed in format \<used\> | P m11 | FIXED:  [bug](https://github.com/owncloud/android/pull/4401#issuecomment-2122914804)| |
| No restriction -> 1GB| 1. In web, set the user quota to "No restriction"<br>2. In app, open sidebar<br>3. In web, set the user quota to 1GB<br>4. In app, open sidebar| 2. Quota is displayed in format \<used\><br>4. Quota is displayed in format \<used\> of 1GB | P m11 | |
| Account change | 1. Add two accounts with different quota values<br>2. In app, switch from one account to another and open sidebar menu | After switching, the proper quota of every server is displayed | P m11 | |
| **Regression (oC10)** | | |
| Default | 1. In web, set the user quota to Default<br>2. In app, open sidebar | Quota is displayed in format \<used\> | P m11 | |
| Unlimited | 1. In web, set the user quota to Unlimited<br>2. In app, open sidebar | Quota is displayed in format \<used\> | P m11 | |
| 1GB | 1. In web, set the user quota to 1GB<br>2. In app, open sidebar | Quota is displayed in format \<used\> of 1GB (%) | P m11 | |
| 5GB | 1. In web, set the user quota to 5GB<br>2. In app, open sidebar | Quota is displayed in format \<used\> of 5GB (%) | P m11 | |
| 10GB | 1. In web, set the user quota to 10GB<br>2. In app, open sidebar | Quota is displayed in format \<used\> of 10GB (%) | P m11 | |
| Other | 1. In web, set the user quota to Other (f. ex 500MB)<br>2. In app, open sidebar | Quota is displayed in format \<used\> of 500MB (%) | P m11| |
