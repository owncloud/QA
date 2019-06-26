###  Private Sharing: Show, search, create 

#### Pr: https://github.com/owncloud/android/pull/2584


---

 
| Test Case | Expected | Result | Related Comment / Bug link | 
| :-------- | :------- | :----: | :------------------------- | 
|**Show**||||||
| Header | Correct header |  |  |  |  |
| No shares | Correct message |  |  |  |  |
| Some sharees(users) | Number of lines = number of sharees |  |  |  |  |
| Some sharees(groups) | Sharee is marked as group (icon and text) |  |  |  |  |
| Correct options | Options for deleting and editing displayed |  |  |  |  |
|**Search**||||||
| Hint | Correct hint on the bar |  |  |  |  |
| Input 2 characters | Nothing is shown |  |  |  |  |
| No matches | Input an incorrect pattern, no matches |  |  |  |  |
| One match | Input an correct pattern and one match is retrieved |  |  |  |  |
| Several matches | Input an correct pattern and several matches are retrieved |  |  |  |  |
| Federated | Input an correct pattern with '@' and "remote" share is displayed |  |  |  |  |
|**Create**||||||
| First share created | The selected sharee is shown in the list |  |  |  |  |
| Second share created | The selected sharee is shown in the list together with the first |  |  |  |  |
| Share yourself | Selecting yourself, shows an error |  |  |  |  |
| Already shared | Selecting a user already shared, shows an error |  |  |  |  |
|**Capabilities**||||||
| Federated disabled| Input an correct pattern with '@' and "remote" share is not displayed |  |  |  |  |
| Extra field = mail | Input an correct pattern and matches will show the email |  |  |  |  |
| Extra field = User ID | Input an correct pattern and matches will show the Username |  |  |  |  |