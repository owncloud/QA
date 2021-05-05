### Settings in Login View

**PR**: https://github.com/owncloud/android/pull/3218

**Devices**: Pixel2 v11<br>
**Server**: 10.7


---

 
| Test Case | Steps | Expected | Result | Related Comment  | 
| :-------- | :---- | :------- | :----: | :--------------- | 
|**Login View**||||||
| Portrait | Open the login view in portrait | Link to `Settings` correctly placed in the bottom right corner| P m11 m7| 
| Landscape | Open the login view in landscape | Link to `Settings` correctly placed in the bottom right corner| P m11 m7| 
| Color | 1. Set the key `login_text_color` with a different color in `setup.xml`|  Link to `Settings` displayed in that color| P m11 m7| 
|**Auto Uploads**||||||
| Scratch | 1. Install the app from scratch<br>2. Click on `Settings` | `Auto Upload` sections are hidden | P m11 m7| 
| After removing | 1. Install the app from scratch<br>2. Add an account<br>3. Open `Settings` and enable auto uploads<br>4. Remove account<br>5. Click on `Settings` on the login view<br>6. Add another account<br>7. Open `Settings` | 5. Auto upload sections are hidden <br>7. Auto upload sections are visible and everything is disabled | NA | WONT FIX: Everything keeps enabled
| Photo/Video + removing | 1. Install the app from scratch<br>2. Add an account<br>3. Open `Settings` and enable auto uploads<br>4. Take a Picture/Video<br>5. Remove account (before Photo/Video is uploaded)<br>6. Wait max 15mins | Nothing happens | NA | Will be tested in account handling 
| Photo/Video + removing + Add new | 1. Install the app from scratch<br>2. Add an account<br>3. Open `Settings` and enable auto uploads<br>4. Take a Picture/Video<br>5. Remove account (before Photo/Video is uploaded)<br>6. Add a new account<br>7. Wait max 15mins | Photo/Video is not uploaded | NA | Will be tested in account handling 
|**Logs**||||||
| Permission accepted | 1. In device, remove the folder `sdcard/owncloud` if exists<br>2. Install the app from scratch<br>3. Open `Settings`, `Logging` section<br>4. Accept permission | `sdcard/owncloud` is created again and logs start to be written there |P m11 m7 | 
| Permission denied | 1. In device, remove the folder `sdcard/owncloud` if exists<br>2. Install the app from scratch<br>3. Open `Settings`, `Logging` section<br>4. Deny permission | `sdcard/owncloud` is not created | P m11 m7 | 