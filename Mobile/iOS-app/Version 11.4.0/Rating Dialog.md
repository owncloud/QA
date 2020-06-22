### Rating Dialog in App Store

#### Pr: https://github.com/owncloud/ios-app/pull/728

Devices: iPhone XR v13.4, iPadAir2 v13.4<br>
Server: 10.4.1

---

The way to test this is turning days on seconds by changing in the file `AppStatistics.swift` the `extension TimeInterval`. The regular code is:

```
extension TimeInterval {
	public var days: Int {
		 eturn Int(self / (3600.0 * 24.0))
	}
}
```

and the code should be replaced for:

```
extension TimeInterval {
	public var days: Int {
		return Int(self)
	}
}
```

with this change, instead of waiting 14 days for the dialog to appear, you will have to wait 14 seconds etc... 
 
| Test Case | Steps | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- | 
|**View**|
| Dialog | Force the dialog to be displayed (check code instructions above to tweak the code) | Dialog correctly displayed in both orientations | P m13 t13 |  |
| Release Notes | 1. Upgrade the app from a previous version, or use XCode to increment build number and reinstall<br>2. In the Release notes, click below on the App Store review message| Dialog to rate the app | P m13 t13 |  |
|**Enabled**|
| No accounts | With no accounts attached in the device, switch to Settings view | No dialog, no matter the ellapsed time | P m13 t13 | |
| Time before after 1st execution | By default: 14. <br>1. Install from scratch<br>2. Add an account(to skip test case above).<br>3. Before 14, open the app or switch to Settings view| Dialog not shown | P m13 t13 | |
| Passed time after 1st execution | By default: 14. <br>1. Install from scratch<br>2. Add an account(to skip test case above).<br>3. After 14, open the app or switch to Settings view| Dialog shown | P m13 t13 |
| Time before upgrade | By default: 7. <br>1. Using Xcode, install the app<br>2. Before 7, click on play to reinstall (as upgrading)| Dialog not shown | P m13 t13 | |
| Passed time after upgrade | By default: 7. <br>1. Using Xcode, install the app<br>2. After 7, click on play to reinstall (as upgrading)| Dialog shown | P m13 t13 | |
| Prompted afyer install/upgrade but before X days | By default: 230.<br>1. Install the app and upgrade it (check test cases above).<br>Open the app before 230 | Dialog not shown | P m13 t13 | |
| Prompted after install/upgrade and after X days | By default: 230.<br>1. Install the app and upgrade it (check test cases above).<br>Open the app after 230 | Dialog shown | P m13 t13 | |
|**Disabled**|
| No accounts | With no accounts attached in the device, switch to Settings view | Dialog not shown | P m13 t13 | |
| Passed time after 1st execution | By default: 14. <br>1. Install from scratch<br>2. Add an account(to skip test case above).<br>3. After 14, open the app or switch to Settings view| Dialog not shown | P m13 t13 |
| Passed time after upgrade | By default: 7. <br>1. Using Xcode, install the app<br>2. After 7, click on play to reinstall (as upgrading)| Dialog not shown | P m13 t13 | |
| Prompted after install/upgrade and after X days | By default: 230.<br>1. Install the app and upgrade it (check test cases above).<br>Open the app after 230 | Dialog not shown | P m13 t13| |