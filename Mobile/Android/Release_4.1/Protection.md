## Device protection in app or device

**Device**: Pixel 2 Android 11<br>
**Server**: oCIS 3.0


#### Lock NOT enforced in the app

 
|    | Device with protection | Device without protection |
| :-- | :-------: | :---------: | 
| **App with protection** | Passcode set :white_check_mark: | Passcode set :white_check_mark: Removable :x: |
| **App without protection** | Passcode not set and not asked :white_check_mark:| Passcode asked to set :x: not asked |

#### Lock enforced in the app


|    | Device with protection | Device without protection |
| :-- | :-------: | :---------: | 
| **App with protection** | Passcode to set  |Passcode set   |
| **App without protection** | Passcode not set :x:| Passcode set :x: |


## Status changes

| Test Case | Steps | Expected Result | Result | Related Comment
| :-------- | :---- | :-------------- | :----: | :------------- |
| Set device protection I | 1. App not protected<br>2. Device not protected<br>3. Add protection to device<br>4. Open app| App does not ask to create new passcode.<br>Passcode is not removable from `Settings` | P m16|
| Set device protection II | 1. App protected<br>2. Device not protected<br>3. Add protection to device<br>4. Open app| App does not ask to create new passcode.<br>Passcode is removable from `Settings` | P m16|
| Unset device protection I |1. App not protected<br>2. Device protected<br>3. Remove  protection from device<br>4. Open app| App asks to create new passcode.<br>Passcode is not removable from `Settings` | P m16| 
| Unset device protection II |1. App protected<br>2. Device protected<br>3. Remove  protection from device<br>4. Open app| App does not ask to create new passcode.<br>Passcode is not removable from `Settings` | P m16|||
| Set app protection I | 1. App not protected<br>2. Device not protected<br>3 Open app| App asks to create new passcode.<br>Passcode is  not removable from `Settings` | P m16|
| Set app protection II | 1. App not protected<br>2. Device protected<br>3. Add protection to app<br>4. Open app| App does not ask to create new passcode.<br>Passcode is removable from `Settings` | P m16|
| Unset app protection I |1. App protected<br>2. Device protected<br>3. Remove protection from app<br>4. Open app| App does not ask to create new passcode. | P m16|
| Unset app protection II |1. App protected<br>2. Device not protected<br>3. Remove protection from app| Passcode is not removable from `Settings` | P m16|

Related: https://github.com/owncloud/ios-app/issues/532