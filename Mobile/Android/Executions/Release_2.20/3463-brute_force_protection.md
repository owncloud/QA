###  Brute Force Protection

#### Pr: https://github.com/owncloud/android/pull/3463

Devices: Huawei P20 v9, Pixel2 v11

Server: 10.8

---

 
| Test Case | Steps | Expected Result | Result | Related Comment |
| :-------- | :---- | :-------------- | :----: | :-------------- |
|**Attempts**|||||||
| 2 times | 1. Input a correct passcode<br>2. Close app<br>3. Open app and enter incorrect passcode two times  | A new attempt is allowed| P m11 m9|  |
| 3. Time | 1. Input a correct passcode<br>2. Close app<br>3. Open app and enter incorrect passcode three times  | Waiter to a new attempt | P m11 m9|  |
| X. Time | 1. Input a correct passcode<br>2. Close app<br>3. Open app and enter incorrect passcode X times  | Every time is (1.5)^(attempts) seconds| P m11 m9|  |
|**View**| Trying to unlock ||||||
| Seconds| Time to a new attempt is < 1 min | Time correctly displayed | P m11 m9|  |
| Minutes| Time to a new attempt is > 1 min < 1hr| Time correctly displayed | P m11 m9|  |
| Hours| Time to a new attempt is > 1 hr < 1 day| Time correctly displayed | P m11 m9|  |
|**Corner**| To do during the countdown||||||
| App minimized | Minimize app during the countdown and then, reopen it| It continues, app is locked | P m11 m9|  |
| Device turned | Turn device during the countdown and then | Countdown continues, app is locked | P m11 m9|  |
| App killed | Kill app during the countdown and then, reopen it| It continues, app is locked | P m11 m9|  |
| Device rebooted | Reboot device during the countdown and then, reopen the app| It continues, app is locked | P m11 m9| With no accounts, no lock (also in master) |
