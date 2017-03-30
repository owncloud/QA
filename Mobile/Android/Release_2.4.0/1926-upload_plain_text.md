###  Upload plain text 

#### Pr: https://github.com/owncloud/android/pull/1926 

Devices: Huawei 6P v7, Galaxy Tab S2 v5

Server: 10.0


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :------ |
| 1 | Upload txt | 1. Share txt with oC<br>2. Set a correct file name| File is correctly uploaded (check in uploads view) | P m7 t5| In phones, the keyboard does not appear |
| 2 | Empty name | 1. Share txt with oC<br>2. Set an empty name| File is not uploaded (check uploads view) | P m7 t5|  |
| 3 | No extension | 1. Share txt with oC<br>2. Set an file name with no extension| Extension is added when the txt is uploaded | F m7 t5| File is uploaded without extension |
| 4 | Multiaccount | 1. Share txt with oC with multiaccount| Account to upload to is requested| P m7 t5|  |
| 5 | Special characters in name | 1. Share txt with oC<br>2. Set a file name with special characters| File is upload | P m7 t5|  |
