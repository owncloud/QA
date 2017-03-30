###  Upload plain text 

#### Pr: https://github.com/owncloud/android/pull/1926 


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :------ |
| 1 | Upload txt | 1. Share txt with oC<br>2. Set a correct file name| File is correctly uploaded (check in uploads view) |  |  |
| 2 | Empty name | 1. Share txt with oC<br>2. Set an empty name| File is not uploaded (check uploads view) |  |  |
| 3 | No extension | 1. Share txt with oC<br>2. Set an file name with no extension| Extension is added when the txt is uploaded |  |  |
