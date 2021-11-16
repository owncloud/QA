###  Access Document Provider via Settings

#### Pr: https://github.com/owncloud/android/pull/3384

Devices: Nexus 6P v7, Pixel2 v11

Server: 10.8

---

 
| Test Case | Steps | Expected Result | Result | Related Comment |
| :-------- | :---- | :-------------- | :----: | :-------------- |
|**View**|||||||
| Portrait | Open Settings View | "Access from Document Provider" option is correctly displayed | P m11 m7 |  |
| Landscape | Open Settings View | "Access from Document Provider" option is correctly displayed | P m11 m7|  |
| Warning | 1. Open Settings View and enable passcode/pattern<br>2. Enable "Access from Document Provider"  | Warning is correctly displayed in both orientations, letting user know that the use of the feature is under its own responsibility | P m11 m7|  |
|**Status**|||||||
| Initial | 1. Open Settings view after installing from scratch  |  "Access Document Provider"  is locked and disabled | P m11 m7 |  |
| Enable Passcode | 1. Open Settings view<br>2. Enable passcode  |  "Access Document Provider"  is unlocked and disabled | P m11 m7 |  |
| Enable Pattern | 1. Open Settings view<br>2. Enable pattern  |  "Access Document Provider"  is unlocked and disabled | P m11 m7 |  |
| Enable Biometrical | 1. Open Settings view<br>2. Enable biometrical  |  "Access Document Provider"  is unlocked and disabled | P m11 m7 |  |
| Disable Passcode | 1. Open Settings view with passcode enabled and "Access Document Provider" enabled<br>2. Disable passcode  |  "Access Document Provider"  is locked and disabled | P m11 m7 |  |
| Disable Pattern | 1. Open Settings view with pattern enabled and "Access Document Provider" enabled<br>2. Disable pattern  |  "Access Document Provider"  is locked and disabled | P m11 m7 |  |
| Disable Biometrical | 1. Open Settings view with biometrical enabled and "Access Document Provider" enabled<br>2. Disable biometrical  |  "Access Document Provider"  is unlocked and enabled | P m11 m7 |  |
|**Actions**|||||||
| Enabled | 1. Add account<br>2. Open Settings and enable pattern<br>3. Enable "Access Document Provider", accepting the warning<br>4. Open app that supports Document Provider<br>5. Try to browse through the account  | It is posible to check every folder's content | P m11 m7 |  |
| Disabled | 1. Add account<br>2. Open Settings and enable passcode<br>3. Keep "Access Document Provider" disabled<br>4. Open app that supports Document Provider<br>5. Try to browse through the account  | Locked. Not posible | P m11 m7 |  |
| Enabled -> Disabled | 1. Add account<br>2. Open Settings and enable pattern<br>3. Enable "Access Document Provider", accepting the warning<br>4. Open app that supports Document Provider<br>5. Try to browse through the account in Document Provider<br>6. Disable "Access Document Provider"<br>7.  Try to browse through the account in Document Provider | 5. It is posible to check every folder's content<br>7. Locked. Not posible | P m11 m7 |  |
| Disabled -> Enabled | 1. Add account<br>2. Open Settings and enable pattern<br>3. Keep "Access Document Provider" disabled<br>4. Open app that supports Document Provider<br>5. Try to browse through the account in Document Provider<br>6. Enable "Access Document Provider"<br>7. Try to browse through the account in Document Provider | 5. Locked. Not posible<br>7. It is posible to check every folder's content<br> | P m11 m7 |  |
| Unlocked | 1. Add account<br>2. Open Settings and disable all locking method<br>3. Open app that supports Document Provider<br>5. Try to browse through the account  | It is posible to check every folder's content | P m11 m7 |  |