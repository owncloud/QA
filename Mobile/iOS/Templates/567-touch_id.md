###  Touch ID 

#### Pr: https://github.com/owncloud/ios/pull/567 

Devices: iPhone6 v9.0.2, iPad Air v8.4, iPhone 5 v8.4 (only for last)

Server: 8.2.2

---

 
| Test Case | Steps | Expected Result | Result | Related Comment
:------: | :------------- | :------------- | :-------------- | :-----: | :------
| Without Having finger touch ID enable on the device | 1.- Enable passcode within the app  | Touch ID option is not shown |
| Having finger touch ID enabled on the device | 1.- Enable passcode within the app <br> 2.- Enable Touch ID <br> 3.- Leave the app <br> 4.- Open again | Touch ID is requested |
| Having finger touch ID enabled on the device | 1.- Enable passcode within the app <br> 2.- Enable Touch ID <br> 3.- Leave the app <br> 4.- Open again <br> 5.- Unblock with non registered finger | Error detected and it´s possible to unlock with the passcode, tapping on the 'Enter passcode' option |
| Having finger touch ID enabled on the device | 1.- Enable passcode within the app <br> 2.- Enable Touch ID <br> 3.- Leave the app <br> 4.- Open again <br> 5.- Unblock with non registered finger up to three times | Error detected three times; after the third, the fingerprint dialog is dimissed and unlocking with the passcode is mandatory |
| Having finger touch ID enabled on the device | 1.- Enable passcode & touch id within the app  <br> 2.- Leave the app <br> 3.- Select to upload an image from another app, such as gallery  | Touch ID is requested|
| Having finger touch ID enable on the device and multiaccount| 1.- Enable passcode and touch id within the app having account1 active <br> 2.- change the active account to account 2  <br> 3.- Leave the app <br> 4.- Open the app | Touch ID is requested|
| Having finger touch ID enabled on the device | 1.- Enable passcode & touch id within the app  <br> 2.- Leave the app <br> 3.- Kill the process <br> 4.- Select to upload an image from another app, such as mail  | Touch ID is requested|
| Having finger touch ID enable on the device | 1.- Enable passcode & touch id within the app  <br> 2.- Reboot the device <br> 3.- Open the app  | Touch ID is requested|
| Having finger touch ID enabled on the device | 1.- Enable passcode & touch id within the app <br> 2.- Open the app touch ID is asked <br> 3.- Unchecked Touch ID  <br> 4.- Close the app| Touch ID is not requested|
| Having finger touch ID enabled on the device | 1.- Enable passcode & touch id within the app <br> 2.- Open the app touch ID is asked <br> 3.- Unchecked Passcode  <br> 4.- Enable passcode| Touch ID is not enable|
| Having, at least, 2 finger touch ID enabled on the device | 1.- Enable passcode & touch id within the app <br> 2.- Open the app touch ID is asked| Both finger touch work|
| Device without fingerprint sensor | 1. - Enable passcode | Option for Touch ID is not shown | 
