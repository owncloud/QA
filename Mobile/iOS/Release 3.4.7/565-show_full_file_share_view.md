###  Show full file/folder name in share view 

#### Pr: https://github.com/owncloud/ios/pull/565 

Devices:

Server:

---

 
TestID | Test Case | Steps | Expected Result | Result | Related Comment
:------: | :------------- | :------------- | :-------------- | :----- | :------
| 1 | Share file - portrait  | 1. Set the device on portrait<br> 2. Swipe to share a file which name is too long<br>|  The name is fully shown |
| 2 | Share file - landscape  | 1. Set the device on landscape<br> 2. Swipe to share a file which name is too long<br>|  The name is fully shown |
| 3 | Share folder - portrait  | 1. Set the device on portrait<br> 2. Swipe to share a folder which name is too long<br>|  The name is fully shown |
| 4 | Share folder - landscape  | 1. Set the device on landscape<br> 2. Swipe to share a folder which name is too long<br>|  The name is fully shown |
| 5 | Change orientation  | 1. Swipe to share a file which name is too long <br> 2. Change the device orientation several times|  The name is fully shown in all cases
| 6 | Special characters  | 1. Swipe to share a file which name is too long adn contains special characters <br> |The name is fully shown