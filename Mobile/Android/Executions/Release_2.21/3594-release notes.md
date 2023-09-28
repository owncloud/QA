###  Release notes

#### Pr: https://github.com/owncloud/android/pull/3594

Devices: Nexus 6P v7, Pixel5 v12

Server: 10.9.1

---

 
| Test Case | Steps | Expected Result | Result | Related Comment |
| :-------- | :---- | :-------------- | :----: | :-------------: | 
|**View**|||||||
| Portrait | Open Release Notes in portrait | Correctly displayed with option to dismiss | P m12 m7 | FIXED: Fix margins |
| Landscape | Open Release Notes in landscape | Option is correctly with option to dismiss | P m12 m7 |  |
| App name | Change `app_name` in `setup.xml` | New app name is displayed in the Release notes as `New in ...` and in the bottom message| P m12 m7|  |
|**release\_notes\_enabled == true**|||||||
| Install from scratch | Clean installation | Release Notes not displayed | P m12 m7 |  |
| Upgrade with notes | Upgrade app from latest version. Needed an increase in version code and Release build | Release Notes displayed | P m12 m7 |  |
| Upgrade without notes | Upgrade app from latest version. Needed an increase in version code and Release build | Release Notes not displayed  | P m12 m7 |  |
| Bugfix | Upgrade app from latest version, including a Bugfix. Needed an increase in version code and Release build | Release Notes displayed with the bugfix   | P m12 m7 |  |
| Security | Upgrade app from latest version, including a Security. Needed an increase in version code and Release build | Release Notes displayed with the Security fix   | P m12 m7 |  |
| Enhancement | Upgrade app from latest version, including a Enhancement. Needed an increase in version code and Release build | Release Notes displayed with the Enhancement  | P m12 m7|  |
| Change | Upgrade app from latest version, including a Change. Needed an increase in version code and Release build | Release Notes displayed with the Change  | P m12 m7 |  |
| All | Upgrade app from latest version, including a Bugfix, a Security, a Change and a Enhancement. Needed an increase in version code and Release build | Release Notes displayed all the icons correctly|  P m12 m7|  |
| Repeated | Upgrade app from latest version, including two Bugfix, two Security, two Change and two Enhancement | Release Notes displayed all the icons correctly| P m12 m7 |  |
|**release\_notes\_enabled == false**|||||||
| Install from scratch | Clean installation | Release Notes not displayed | P m12 m7|  |
| Upgrade with notes | Upgrade app from latest version | Release Notes not displayed | P m12 m7|  |
| Upgrade without notes | Upgrade app from latest version | Release Notes not displayed  | P m12 m7 |  |