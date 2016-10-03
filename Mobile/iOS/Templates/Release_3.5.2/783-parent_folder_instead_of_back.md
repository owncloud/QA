###  Show parent folder instead of "Back" in detail view 

#### Pr: https://github.com/owncloud/ios/pull/783 


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
| 1 | Detail view| Open a file | Parent folder is shown |  |  |
| 2 | Long folder name | Open a file in a folder with long name| "Back" is shown  |  |  |
| 3 | Long folder name and file name | Open a file with long name in a folder with long name| "Back" is shown if there is room  |  |  |
| 4 | Change orientation | 1. Open a file in a folder with long name in portrait.<br>2. Change orientation| In portrait is shown "Back", and in Landscape is shown the parent folder |  |  |
