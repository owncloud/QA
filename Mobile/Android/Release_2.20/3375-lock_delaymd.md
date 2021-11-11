###  Lock delay

#### Pr: https://github.com/owncloud/android/pull/3375

Devices: Nexus 6P v7, Pixel2 v11

Server: 10.8

---

 
| Test Case | Steps | Expected Result | Result | Related Comment |
| :-------- | :---- | :-------------- | :----: | :-------------- |
|**View**|||||||
| Portrait | Open Settings View | Lock option is correctly displayed | P m11 m7 |  |
| Landscape | Open Settings View | Lock option is correctly displayed | P m11 m7|  |
|**Pattern**|||||||
| Immediately | 1. Enable pattern lock<br>2. Set `Immediately` as lock value<br>3. Open the app and enter the correct pattern<br>4. Repeat opening the app | Pattern lock is asked | P m11 m7 |  |
| 1 minute | 1. Enable pattern lock<br>2. Set `1 minute` as lock value<br>3. Open the app and enter the correct pattern<br>4. Repeat opening the app<br>5. Wait 1 minute and reopen the app | 4. Pattern lock is not asked<br>5. Pattern lock is asked  | P m11 m7 |  |
| 5 minutes | 1. Enable pattern lock<br>2. Set `5 minutes` as lock value<br>3. Open the app and enter the correct pattern<br>4. Repeat opening the app<br>5. Wait 5 minutes and reopen the app | 4. Pattern lock is not asked<br>5. Pattern lock is asked  | P m11 m7 |  |
| 30 minutes | 1. Enable pattern lock<br>2. Set `30 minutes` as lock value<br>3. Open the app and enter the correct pattern<br>4. Repeat opening the app<br>5. Wait 7 minutes and reopen the app | 4. Pattern lock is not asked<br>5. Pattern lock is not asked  | P m11 m7 |  |
|**Passcode**|||||||
| Immediately | 1. Enable passcode<br>2. Set `Immediately` as lock value<br>3. Open the app and enter the correct passcode <br>4. Repeat opening the app | Passcode is asked | P m11 m7 |  |
| 1 minute | 1. Enable passcode<br>2. Set `1 minute` as lock value<br>3. Open the app and enter the correct passcode <br>4. Repeat opening the app<br>5. Wait 1 minute and reopen the app | 4. Passcode is not asked<br>5. Passcode is asked  | P m11 m7 |  |
| 5 minutes | 1. Enable passcode<br>2. Set `5 minutes` as lock value<br>3. Open the app and enter the correct passcode<br>4. Repeat opening the app<br>5. Wait 5 minutes and reopen the app | 4. Passcode is not asked<br>5. Passcode lock is asked  | P m11 m7 |  |
| 30 minutes | 1. Enable passcode<br>2. Set `30 minutes` as lock value<br>3. Open the app and enter the correct passcode<br>4. Repeat opening the app<br>5. Wait 7 minutes and reopen the app | 4. Passcode is not asked<br>5. Passcode is not asked  | P m11 m7 |  |
|**Biometrical**|||||||
| Immediately | 1. Enable biometrical<br>2. Set `Immediately` as lock value<br>3. Open the app and enter the correct biometrical <br>4. Repeat opening the app | Biometrical is asked | P m11 m7  |  |
| 1 minute | 1. Enable biometrical <br>2. Set `1 minute` as lock value<br>3. Open the app and enter the correct biometrical <br>4. Repeat opening the app<br>5. Wait 1 minute and reopen the app | 4. Biometrical is not asked<br>5. Biometrical is asked  | P m11 m7 |  |
| 5 minutes | 1. Enable biometrical <br>2. Set `5 minutes` as lock value<br>3. Open the app and enter the correct biometrical <br>4. Repeat opening the app<br>5. Wait 5 minutes and reopen the app | 4. Biometrical is not asked<br>5. Biometrical lock is asked  | P m11 m7 |  |
| 30 minutes | 1. Enable biometrical <br>2. Set `30 minutes` as lock value<br>3. Open the app and enter the correct biometrical <br>4. Repeat opening the app<br>5. Wait 7 minutes and reopen the app | 4. Biometrical is not asked<br>5. Biometrical is not asked  | P m11 m7 |  |