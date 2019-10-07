###  Dark Mode

#### Pr: https://github.com/owncloud/ios-app/pull/489

Devices: iPhone 6S Plus v13<br>
Server: 10.2.1

---

 
| Test Case | Steps | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- | 
|**Light mode device**|||||||
| Light in app | Set light mode in app | Mode correctly set in the app | P m13 |  |  |
| Classic in app | Set classic mode in app | Mode correctly set in the app | P m13 |  |  |
| Dark in app | Set dark mode in app | Mode correctly set in the app | P m13 | FIXED: Some items not very visible |  |
|**Dark mode device**|||||||
| Light in app | Set light mode in app | Mode correctly set in the app | P m13 | FIXED: Some items not very visible |  |  |
| Classic in app | Set classic mode in app | Mode correctly set in the app | P m13 |  |  |
| Dark in app | Set dark mode in app | Mode correctly set in the app | P m13  |  |  |
|**Follow system**|||||||
| Enabled | Enable "Follow system" | Themes in the app are hidden and device theme is used  | P m13 | |  |
| Disabled | Disable "Follow system" | Themes in the app are displayed and can be chosen |P m13  |  |  |
|**Upgrade**|||||||
| From Dark | 1. In app 1.1.0, set dark mode<br>2. In device iOS13, set light mode<br>3. Upgrade to the version | Theme stays and new option is disabled | F m13  |Options enabled by default  |  |
|**Regression**|||||||
| iOS12 | Open Themes | Option to follow system does not appear | P m12 |  |  |