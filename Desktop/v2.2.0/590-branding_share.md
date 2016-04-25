### Sharing branding option

#### Pr: 

Server version: 9.0.1 <br> 
Client Version: 2.2.0

<br>
 
Test Case ID | Test case     | Steps   | Expected behavior | Result | Related Comments
|:----:|:------------- |:-------------------|:-------------|:-------------:|:----------
***Branding variable API ENABLE***|
1 | Disable share completely | 1.- Right click on a file at Shared sync folder | Share it is not shown | 
2 | Disable internal sharing - Share with users and groups | 1.- Right click on a file at Shared sync folder <br> 2.- Select "share with ownCloud" option | Just share by link is shown |  | 
3 | Disable internal sharing - Share link | 1.- Right click on a file at Shared sync folder. <br> 2.- Select "share with ownCloud" option | Just share with users and groups is shown |  | 
4 | Disable internal sharing - Default values | 1.- Remove variables from config file that set Disable share behaviour <br> 2.- Right click on a file at Shared sync folder. <br> 3.- Select "share with ownCloud" option | Share with users and groups and  share by link is shown |  | 





