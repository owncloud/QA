###  Security Enforced II

#### Pr: https://github.com/owncloud/android/pull/3544

Devices: Nexus 6P v7, Pixel2 v11

Server: 

---

 
| Test Case | Steps | Expected Result | Result | Related Comment |
| :-------- | :---- | :-------------- | :----: | :-------------- |
|**Fresh install**|||||||
| lock = `0`  | 1. Set `lock_enforced == 0`<br>2. Open the app | Not enforced, passcode/pattern not asked |  |
| lock = `1`  | 1. Set `lock_enforced == 1`<br>2. Open the app |Dialog asking which locking method to set |  |
| lock = `2`  | 1. Set `lock_enforced == 2`<br>2. Open the app | Passcode asked and enforced |  |
| lock = `3`  | 1. Set `lock_enforced == 3`<br>2. Open the app | Pattern asked and enforced |  |
|**Upgrade with app unlocked**|||||||
| lock = `0`  | 1. Set `lock_enforced == 0`<br>2. Open the app | Not enforced, passcode/pattern not asked |  |
| lock = `1`  | 1. Set `lock_enforced == 1`<br>2. Open the app |Dialog asking which locking method to set |  |
| lock = `2`  | 1. Set `lock_enforced == 2`<br>2. Open the app | Passcode asked and enforced |  |
| lock = `3`  | 1. Set `lock_enforced == 3`<br>2. Open the app | Pattern asked and enforced |  |
|**Upgrade with app locked with passcode**|||||||
| lock = `0`  | 1. Set `lock_enforced == 0`<br>2. Upgrade app | Nothing happens in the start. Option visible in settings (not enforced anymore) |  |
| lock = `1`  | 1. Set `lock_enforced == 1`<br>2. Upgrade app | Nothing happens in the app start. Option hidden in settings (enforced, not switchable) |  |
| lock = `2`  | 1. Set `lock_enforced == 2`<br>2. Upgrade app | Nothing happens in the app start. Option hidden in settings (enforced, not switchable) |  |
| lock = `3`  | 1. Set `lock_enforced == 3`<br>2. Upgrade app | After unlocking the app with the existing passcode, a pattern is asked in a mandatory way (not skippable).<br>From now on, only pattern will be used to unlock.<br>Biometrical will be also reset, but asked to be enabled after entering the correct pattern<br>Option hidden in settings (enforced, not switchable) |  |
|**Upgrade with app locked with pattern**|||||||
| lock = `0`  | 1. Set `lock_enforced == 0`<br>2. Upgrade app | Nothing happens in the start. Option visible in settings (not enforced anymore) |  |
| lock = `1`  | 1. Set `lock_enforced == 1`<br>2. Upgrade app | Nothing happens in the app start. Option hidden in settings (enforced, not switchable) |  |
| lock = `2`  | 1. Set `lock_enforced == 2`<br>2. Upgrade app | Nothing happens in the app start. · After unlocking the app with the existing pattern, a passcode is asked in a mandatory way (not skippable). From now on, only passcode will be used to unlock.<br>Biometrical will be also reset, but asked to be enabled after entering the correct passcode<br>Option hidden in settings (enforced, not switchable)|  |
| lock = `3`  | 1. Set `lock_enforced == 3`<br>2. Upgrade app | Nothing happens in the app start. Option hidden in settings (enforced, not switchable) |  |
