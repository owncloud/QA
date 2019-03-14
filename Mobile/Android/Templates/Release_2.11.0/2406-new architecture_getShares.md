#### New Architecture: Get Private Shares

#### Pr: https://github.com/owncloud/android/pull/2406



---

 
| Test | Test Case | Steps | Expected Result | Result | Related Comment
| :----: | :-------- | :---- | :-------------- | :-----: | :------
| **Share by link** | |  |
| One share file | Create a public share from a file in web UI | Public share is visible in the app |  |
| One share folder | Create a public share from a folder in web UI | Public share is visible in the app |  |
| Several share file | Create several public shares from a file in web UI | Public shares are visible in the app |  |
| Several share folder | Create several public shares from a folder in web UI | Public shares are visible in the app |  |
| Share name | Create several public shares with different names, including special characters | Names are correctly displayed in the app |  |
| Get Link | Get and open the link of a public share  | Link is open correctly in the browser |  |
| Get Permissions | Create three public shares over an item with the 3 differet type of permissions | Every share has the correct permission in the app |  |
| Get Password | In web UI create a share with password lock  | Password is enabled in the app |  |
| Get Expiration Date | In web UI create a share with expiration date  | Expiration date is enabled in the app |  |
