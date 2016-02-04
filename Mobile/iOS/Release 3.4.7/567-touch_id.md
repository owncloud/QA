###  Touch ID 

#### Pr: https://github.com/owncloud/ios/pull/567 

Devices: iPhone6 v9.0.2, iPad Air v8.4

Server: 8.2.2

---

 
| Test Case | Steps | Expected Result | Result | Related Comment
:------: | :------------- | :------------- | :-------------- | :-----: | :------
| Without Having finger touch ID enable on the device | 1.- Enable pincode within the app  | Touch ID option is not shown |
| Having finger touch ID enable on the device | 1.- Enable pincode within the app 2.- Enable pin code 3.- Leave the app 4.- Open again | Touch ID is requested |
| Having finger touch ID enable on the device | 1.- Enable pincode within the app 2.- Enable pin code 3.- Leave the app 4.- Open again 5.- Unblock with non registered finger | Error detected and it´s possible to unlock with the pincode |
| Having finger touch ID enable on the device | 1.- Enable pincode & touch id within the app  2.- Leave the app 3.- Select to upload an image from another app, such as gallery  | Touch ID is requested|
| Having finger touch ID enable on the device and multiaccount| 1.- Enable pincode and touch id within the app having account1 active 2.- change the active account to accoutn 2  3.- Leave the app 4.- Open the app | Touch ID is requested|
| Having finger touch ID enable on the device | 1.- Enable pincode & touch id within the app  2.- Leave the app 3.- Kill the process 4.-
Select to upload an image from another app, such as mail  | Touch ID is requested|
| Having finger touch ID enable on the device | 1.- Enable pincode & touch id within the app  2.- Reboot the device 3.- Open the app  | Touch ID is requested|
| Having finger touch ID enable on the device | 1.- Enable pincode & touch id within the app 2.- Open the app touch ID is asked 3.- Unchecked Touch ID  4.- Close the app| Touch ID is not requested|
| Having finger touch ID enable on the device | 1.- Enable pincode & touch id within the app 2.- Open the app touch ID is asked 3.- Unchecked Passcode  3.- Enable pincode| Touch ID is not enable|
| Having, at least, 2 finger touch ID enable on the device | 1.- Enable pincode & touch id within the app 2.- Open the app touch ID is asked| Both finger touch work|