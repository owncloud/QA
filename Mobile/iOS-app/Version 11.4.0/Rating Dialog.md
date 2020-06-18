### Rating Dialog in App Store

#### Pr: https://github.com/owncloud/ios-app/pull/728

Devices: iPhone XR v13.4<br>
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
| Dialog | Force the dialog to be displayed | Dialog correctly displayed in both orientations |  |  |
|**Actions**|
| No accounts | | No dialog, no matter the ellapsed time | | |
| Passed time after 1st execution | | Dialog shown | | |
| Passed time after upgrade | | Dialog shown | | |
| No app open after X days | | Dialog shown | | |