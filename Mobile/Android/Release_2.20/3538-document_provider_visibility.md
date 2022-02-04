###  Access Document Provider via Settings

#### Pr: https://github.com/owncloud/android/pull/3538

Devices: Nexus 6P v7, Pixel2 v11

Server: 10.9.1

---

 
| Test Case | Steps | Expected Result | Result | Related Comment |
| :-------- | :---- | :-------------- | :----: | :-------------- |
|**View**|||||||
| Portrait | Open Settings View | "Lock access from Document Provider" option is correctly displayed and disabled | P m11 |  |
| Landscape | Open Settings View | "Lock access from Document Provider" option is correctly displayed and disabled | P m11 |  |
|**Enable**|||||||
| Enable with accounts | 1. Add account<br>2. Open Settings<br>3. Enable "Lock access Document Provider"<br>4. Open app that supports Document Provider | It is not posible to check account's content. `Locked` message | P m11 |  |
| Enable without accounts | 1. Open Settings<br>2. Enable "Lock access Document Provider"<br>3. Open app that supports Document Provider | No accounts | F m11 | appears as locked |
|**Disable**| (previously enabled)||||||
| Disable | 1. Open Settings<br>3. Disable "Lock access Document Provider"<br>4. Open app that supports Document Provider | It is posible to check account's content and browse through | P m11 |  |
|**Regression**|||||||
| Enable Passcode with "Lock" disabled | 1. Open Settings view<br>2. Enable passcode  | "Lock Access Document Provider" disabled | P m11 |  |
| Enable Passcode with "Lock" enabled | 1. Open Settings view<br>2. Enable passcode  | "Lock Access Document Provider" enabled | P m11 |  |
| Enable Pattern with "Lock" disabled | 1. Open Settings view<br>2. Enable pattern  | "Lock Access Document Provider" disabled | P m11 |  |
| Enable Pattern with "Lock" enabled | 1. Open Settings view<br>2. Enable pattern  | "Lock Access Document Provider" enabled | P m11 |  |
| Enable Biometrical with "Lock" disabled | 1. Open Settings view<br>2. Enable biometrical  | "Lock Access Document Provider" disabled | P m11 |  |
| Enable Biometrical with "Lock" enabled | 1. Open Settings view<br>2. Enable biometrical  | "Lock Access Document Provider" enabled | P m11 |  |
| Disable Passcode with "Lock" enabled| 1. Open Settings view with passcode enabled and "Lock Access Document Provider" enabled<br>2. Disable passcode  |  "Lock Access Document Provider" is enabled | P m11 |  |
| Disable Passcode with "Lock" disabled| 1. Open Settings view with passcode enabled and "Lock Access Document Provider" disabled<br>2. Disable passcode  |  "Lock Access Document Provider" is disabled | P m11 |  |
| Disable Pattern with "Lock" enabled| 1. Open Settings view with pattern enabled and "Lock Access Document Provider" enabled<br>2. Disable pattern  |  "Lock Access Document Provider" is enabled |P m11  |  |
| Disable Pattern with "Lock" disabled| 1. Open Settings view with pattern enabled and "Lock Access Document Provider" disabled<br>2. Disable pattern  |  "Lock Access Document Provider" is disabled | P m11 |  |
| Disable Biometrical with "Lock" enabled| 1. Open Settings view with biometrical enabled and "Lock Access Document Provider" enabled<br>2. Disable biometrical  |  "Lock Access Document Provider" is enabled | P m11 |  |
| Disable Biometrical with "Lock" disabled| 1. Open Settings view with biometrical enabled and "Lock Access Document Provider" disabled<br>2. Disable biometrical  |  "Lock Access Document Provider" is disabled |  P m11|  |