###  Hidden files

#### Pr: https://github.com/owncloud/android/pull/3624

Devices: Nexus 6P v7, Pixel5 v12

Server: 10.9.1

---

 
| Test Case | Steps | Expected Result | Result | Related Comment |
| :-------- | :---- | :-------------- | :----: | :-------------: | 
|**View**|||||||
| Portrait | 1. Open Settings View<br>2. Open Advanced view | 1. Advanced section is correctly diplayed<br>2. `Show hidden files` option is correctly displayed | P m12 m7 |  |
| Landscape | 1. Open Settings View<br>2. Open Advanced view | 1. Advanced section is correctly diplayed<br>2. `Show hidden files` option is correctly displayed | P m12 m7 |  |
| Default | 1. Install the app from scratch<br>2. Open Settings > Advanced| Option disabled by default | P m12 m7 |  |
|**Actions**|||||||
| Show hidden = true | 1. Enable option `Show hidden files`<br>2. In web, set a file and a folder as hidden (name strting by a .) | File and folder displayed in devices' file list | P m12 m7 |  |
| Show hidden = false | 1. Disable option `Show hidden files`<br>2. In web, set a file and a folder as hidden (name strting by a .) | File and folder not displayed in devices' file list | P m12 m7 |  |
| Empty folder | 1. Disable option `Show hidden files`<br>2. In web, create folder and copy a hidden item inside<br>3. Open the app<br>4. Switch `Show hidden files` on  | 3. Folder is empty<br>4. Hidden item is displayed | P m12 m7 |  |