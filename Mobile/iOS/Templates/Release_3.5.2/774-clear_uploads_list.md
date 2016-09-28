###  Clear upload list 

#### Pr: https://github.com/owncloud/ios/pull/774


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :------ |
|**View**|||||||
| 1 | Clear option - portrait | 1. Open uploads view<br>2. Three-dot-menu displays the option "Clear successful" |  Option is correctly displayed  |  |  |
| 2 | Clear option - landscape | 1. Open uploads view<br>2. Three-dot-menu displays the option "Clear successful"|  Option is correctly displayed  |  |  |
|**Actions**|||||||
| 3 | Clear empty| 1. Clear an empty uploads list | Nothing happens |  |  |
| 4 | Clear non-empty| 1. Upload some files<br>2. Clear list | 1. Files are successfully uploaded<br>2. List is cleared|  |  |
| 5 | Clear while upload | 1. Upload some files<br>2. While the files are being uploaded, clear list | Only the successful are cleared |  |  |
| 6 | Clear with pending | 1. Upload some files<br>2. While the files are being uploaded, switch device connection off<br>3. Clear list | Only the successful are cleared |  |  |
| 7 | Clear with errors | 1. Upload some files causing errors (credentials or conflicts)<br>2. Clear list | Only the successful are cleared |  |  |
| 8 | Cancel | Cancel option | Menu is collapsed |  |  |