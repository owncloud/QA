###  Enable biometrical after passcode

#### Pr: https://github.com/owncloud/android/pull/3539

Devices: Nexus 6P v7, Pixel2 v11

Server: 10.9.1

---

 
| Test Case | Steps | Expected Result | Result | Related Comment |
| :-------- | :---- | :-------------- | :----: | :-------------- |
|**View**|||||||
| Enable passcode portrait | Enable "Passcode" and enter correct value | Correct dialog asking enabling biometric |  |  |
| Enable passcode landscape | Enable "Passcode" and enter correct value | Correct dialog asking enabling biometric |  |  |
| Enable pattern portrait | Enable "Pattern" and enter correct value | Correct dialog asking enabling biometric |  |  |
| Enable pattern landscape | Enable "Pattern" and enter correct value | Correct dialog asking enabling biometric |  |  |
| Enforced Passcode | 1. Enable `lock_enforced` in Settings<br>2. Open App<br>3. Select Passcode<br>4. Enter correct passcode | 2. Type of lock asked<br>4. Correct dialog asking enabling biometric
| Enforced Pattern | 1. Enable `lock_enforced` in Settings<br>2. Open App<br>3. Select Pattern<br>4. Enter correct pattern | 2. Type of lock asked<br>4. Correct dialog asking enabling biometric
|**Actions**|||||||
| Passcode - Enable | 1. Enable "Passcode" and enter correct value<br>2. Choose "Enable" in dialog<br>3. Close and reopen the app | 2. Biometric enabled in Settings.<br>3. Biometric asked  |  |  |
| Passcode - Disable | 1. Enable "Passcode" and enter pattern <br>2. Choose "Disable" in dialog | 2. Biometric disabled in Settings.<br>3. Passcode asked  |  |  |
| Pattern - Enable | 1. Enable "Pattern" and enter pattern<br>2. Choose "Enable" in dialog<br>3. Close and reopen the app | 2. Biometric enabled in Settings.<br>3. Biometric asked  |  |  |
| Pattern - Disable | 1. Enable "Pattern" and enter correct value<br>2. Choose "Disable" in dialog | 2. Biometric disabled in Settings.<br>3. Pattern asked  |  