### Quota

#### PR: 

Server(s): <br>
Device(s): <br>
Execution date: <br>
Tester:  <br>
Context: <br>


| Test Case | Steps | Expected Result | Result | Related Comment |
| :-------- | :---- | :-------------- | :----: | :-------------- |
| **View** |   |  |
| View | 1. Open sidebar menu | Quota is diplayed in the bottom side, in both orientations |  | |
| **Values with enough qouta (oCIS)** |   |  |
| 1GB | 1. In web, set the user quota to 1GB<br>2. In app, open sidebar | Quota is displayed in format \<used\> of 1GB (%) | | |
| 2GB | 1. In web, set the user quota to 2GB<br>2. In app, open sidebar | Quota is displayed in format \<used\> of 2GB (%) | | |
| 5GB | 1. In web, set the user quota to 5GB<br>2. In app, open sidebar | Quota is displayed in format \<used\> of 5GB (%) | | |
| 10GB | 1. In web, set the user quota to 10GB<br>2. In app, open sidebar | Quota is displayed in format \<used\> of 10GB (%) | | |
| 50GB | 1. In web, set the user quota to 50GB<br>2. In app, open sidebar | Quota is displayed in format \<used\> of 50GB (%) | | |
| 100GB | 1. In web, set the user quota to 100GB<br>2. In app, open sidebar | Quota is displayed in format \<used\> of 100GB (%) | | |
| No restriction | 1. In web, set the user quota to "No restriction"<br>2. In app, open sidebar | Quota is displayed in format \<used\> | | |
| **Values overflowing quota (oCIS)** |   |  |
| 1GB | 1. In web, set the user quota to 1GB<br>2. In app, open sidebar | Quota is displayed in format \<used\> of 1GB (%) | | |
| **Values change (oCIS)** |   |  |
| 1GB -> 5GB | 1. In web, set the user quota to 1GB<br>2. In app, open sidebar<br>3.  In web, set the user quota to 5GB<br>4. In app, open sidebar| 2. Quota is displayed in format \<used\> of 1GB (%)<br>4. Quota is displayed in format \<used\> of 5GB (%)  | | |
| 1GB -> No restriction | 1. In web, set the user quota to 1GB<br>2. In app, open sidebar<br>3. In web, set the user quota to "No restriction"<br>4. In app, open sidebar| 2. Quota is displayed in format \<used\> of 1GB (%)<br>4. Quota is displayed in format \<used\> | | |
| No restriction -> 1GB| 1. In web, set the user quota to "No restriction"<br>2. In app, open sidebar<br>3. In web, set the user quota to 1GB<br>4. In app, open sidebar| 2. Quota is displayed in format \<used\><br>4. Quota is displayed in format \<used\> of 1GB | | |
| Account change | 1. Add two accounts with different quota values<br>2. In app, switch from one account to another and open sidebar menu | After switching, the proper quota of every server is displayed |  | |
| **Regression (oC10)** | | |
| Default | 1. In web, set the user quota to Default<br>2. In app, open sidebar | Quota is displayed in format \<used\> | | |
| Unlimited | 1. In web, set the user quota to Unlimited<br>2. In app, open sidebar | Quota is displayed in format \<used\> | | |
| 1GB | 1. In web, set the user quota to 1GB<br>2. In app, open sidebar | Quota is displayed in format \<used\> of 1GB (%) | | |
| 5GB | 1. In web, set the user quota to 5GB<br>2. In app, open sidebar | Quota is displayed in format \<used\> of 5GB (%) | | |
| 10GB | 1. In web, set the user quota to 10GB<br>2. In app, open sidebar | Quota is displayed in format \<used\> of 10GB (%) | | |
| Other | 1. In web, set the user quota to Other (f. ex 500MB)<br>2. In app, open sidebar | Quota is displayed in format \<used\> of 500MB (%) | | |
