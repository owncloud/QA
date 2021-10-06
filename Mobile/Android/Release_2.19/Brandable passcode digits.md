### Brandable passcode 


#### PR: https://github.com/owncloud/android/pull/3341

**Devices**: Pixel2 v11, Nexus 6P v7<br>
**Server**: 10.8


| Title | Steps     | Expected Result | Result | Comments |
| :---- | :-------- | :-------------- | :----: | :------- |
|**Setup**||||
| 4 digits | 1. In `setup.xml`set `passcode_digits` with 4<br>2. Open `Settings` and enable passcode | 4 gaps in the screen | P m11 m7 | 
| 6 digits | 1. In `setup.xml`set `passcode_digits` with 6<br>2. Open `Settings` and enable passcode | 6 gaps in the screen | P m11 m7 | 
| 10 digits | 1. In `setup.xml`set `passcode_digits` with 10<br>2. Open `Settings` and enable passcode | 10 gaps in the screen | P m11 m7 |
| 25 digits | 1. In `setup.xml`set `passcode_digits` with 25<br>2. Open `Settings` and enable passcode | 4 gaps in the screen | P m11 m7 |  
| 2 digits | 1. In `setup.xml`set `passcode_digits` with 2<br>2. Open `Settings` and enable passcode | 4 gaps in the screen | P m11 m7 | FIXED: 2 digits
| 0 digits | 1. In `setup.xml`set `passcode_digits` with 0<br>2. Open `Settings` and enable passcode | 4 gaps in the screen | P m11 m7 | FIXED: Crash
| -2 digits | 1. In `setup.xml`set `passcode_digits` with -2<br>2. Open `Settings` and enable passcode | 4 gaps in the screen | P m11 m7 | FIXED: Crash
|**Unblock**||||
| 4 digits | 1. In `setup.xml`set `passcode_digits` with 4<br>2. Open `Settings` and enable passcode<br>3. Close and open app and unlock with the passcode | App unlocked | P m11 m7| 
| 6 digits | 1. In `setup.xml`set `passcode_digits` with 6<br>2. Open `Settings` and enable passcode<br>3. Close and open app and unlock with the passcode | App unlocked | P m11 m7 | 
| 10 digits | 1. In `setup.xml`set `passcode_digits` with 10<br>2. Open `Settings` and enable passcode<br>3. Close and open app and unlock with the passcode | App unlocked | P m11 m7 | 
| 25 digits | 1. In `setup.xml`set `passcode_digits` with 25<br>2. Open `Settings` and enable passcode<br>3. Close and open app and unlock with the passcode | App unlocked | P m11 m7 | 
|**Fallback**|||| 
| 6 digits | 1. In `setup.xml`set `passcode_digits` with 6<br>2. Open `Settings` and enable passcode and biometrical<br>3. Close and open app<br>4. Cancel biometrical | Passcode asked, and app unlocked after enter it | P m11 m7 | 
|**Migration**|||| 
| 4 -> 6 digits | 1. Set a 4 digit passcode in the app<br>2. Upgrade to 6 digits by re-building the app<br>3. Close the app and open it again | 2. Previous passcode asked, and then, new 6-digit passcode asked<br>3. 6-digit passcode asked | P m11 m7 | 
| 6 -> 4 digits | 1. Set a 6 digit passcode in the app<br>2. Upgrade to 4 digits by re-building the app<br>3. Close the app and open it again | 2. Previous passcode asked, and then, new 4-digit passcode asked<br>3. 4-digit passcode asked | NA | Not asked
| 6 -> 10 digits | 1. Set a 6 digit passcode in the app<br>2. Upgrade to 10 digits by re-building the app<br>3. Close the app and open it again | 2. Previous passcode asked, and then, new 10-digit passcode asked<br>3. 10-digit passcode asked | P m11 m7 |  
| 4 -> 4 digits | 1. Set a 4 digit passcode in the app<br>2. Upgrade to 4 digits by re-building the app<br>3. Close the app and open it again | 2. Previous passcode asked, but no new passcode asked since same digits number is setup<br>3. 4-digit passcode asked | P m11 m7 | 
| 6 -> 6 digits | 1. Set a 6 digit passcode in the app<br>2. Upgrade to 6 digits by re-building the app<br>3. Close the app and open it again | 2. Previous passcode asked, but no new passcode asked since same digits number is setup<br>3. 6-digit passcode asked | P m11 m7 | 
| 4 -> 6 digits with biometrical | 1. Set a 4 digit passcode in the app and enable biometrical<br>2. Upgrade to 6 digits by re-building the app<br>3. Close the app and open it again | 2. Biometrical asked and then, new passcode of 6 digits<br>3. 6-digit passcode asked | P m11 m7 | FIXED: Asked only when passcode is asked 
| 4 -> 6 digits cancelling | 1. Set a 4 digit passcode in the app<br>2. Upgrade to 6 digits by re-building the app<br>3. Close the app and open it again | No way to cancel the view till new passcode is fully typed | P m11 m7 | FIXED: View is cancellable 
| 4 -> 6 digits killing | 1. Set a 4 digit passcode in the app<br>2. Upgrade to 6 digits by re-building the app<br>3. Enter old passcode<br>4. Kill the app before entering the new one and open it again | No way to cancel the view till new passcode is fully typed | P m11 m7 | FIXED: Passcode is disabled
|**Other**|||| 
| Clear data | 1. In `setup.xml`set `passcode_digits` with 6<br>2. Open `Settings` and enable passcode<br>3. Go to device Settings -> app -> ownCloud -> storage -> clear data| Passcode asked, and app unlocked to clean after enter it | P m11 m7| 
|Share with oC | 1. In `setup.xml`set `passcode_digits` with 6<br>2. Open `Settings` and enable passcode<br>3. Open another app (like Gallery) and share content with oC | Passcode asked, and app unlocked to share after enter it | P m11 m7 | 


