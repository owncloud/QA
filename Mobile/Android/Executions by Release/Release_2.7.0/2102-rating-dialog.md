###  Rating Dialog 

#### Pr: https://github.com/owncloud/android/pull/2102

Devices: Nexus 6P v7, Nexus 10 v5

Server: 10.0.7


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :------ |
|**Flag to enable the feature**||||||
| 1 | Enabled | 1. DAYS UNTIL PROMPT=0<br>2. Install the app | Dialog is shown | P m7 t5|  |
| 2 | Disabled | 1. DAYS UNTIL PROMPT=0<br>2. Install the app | Dialog is not shown | P m7 t5|  |
|**Launching**||||||
| 3 | No launches after prompting | 1. DAYS UNTIL PROMPT=0<br>2. LAUNCHES UNTIL PROMPT=0 | Dialog is shown| P m7 t5|  |
| 4 | Launches after prompting | 1. DAYS UNTIL PROMPT=0<br>2. LAUNCHES UNTIL PROMPT=2 | App needs to be launched two times to show the dialog | P m7 t5|  |
| 5 | Launches after prompting several times| 1. DAYS UNTIL PROMPT=0<br>2. LAUNCHES UNTIL PROMPT=5 | App needs to be launched five times to show the dialog | P m7 t5|  |
|**User Actions**||||||
| 6 | Rate now | 1. Select Rate now<br>2. Launch the app several times | 1. Redirection to Play Store<br>2. Rating dialog not displayed anymore | P m7 t5|  |
| 7 | No Thanks | 1. Select No Thanks<br>2. Launch the app several times | Rating dialog not displayed anymore | P m7 t5|  |
| 8 | Later + Rate | 1. DAYS UNTIL NEUTRAL CLICK = 0<br>2. Select Later<br>3. Select Rate now | 2. Each time app is opened, dialog is displayed.<br>3. Redirection to Play Store. Rating dialog not displayed anymore when app is opened | P m7 t5|  |
| 9 | Later + No Thanks | 1. DAYS UNTIL NEUTRAL CLICK = 0<br>2. Select Later<br>3. Select No Thanks | 2. Each time app is opened, dialog is displayed.<br>3. Dialog not displayed anymore| P m7 t5|  |