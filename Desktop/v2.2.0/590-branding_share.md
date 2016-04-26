### Sharing branding option

<br>
 
Test Case ID | Test case     | Steps   | Expected behavior | Result | Related Comments
|:----:|:------------- |:-------------------|:-------------|:-------------:|:----------
***Branding variable API ENABLE***|
1 | Disable share completely | 1.- Right click on a file at Shared sync folder | Share is not shown | :construction:
2 | Disable internal sharing - Share with users and groups | 1.- Right click on a file at Shared sync folder <br> 2.- Select "share with ownCloud" option | Just share by link is shown | :construction: | 
3 | Disable internal sharing - Share link | 1.- Right click on a file at Shared sync folder. <br> 2.- Select "share with ownCloud" option | Just share with users and groups is shown | :construction: | 
4 | Disable internal sharing - Default values | 1.- Remove variables from config file that set Disable share behaviour <br> 2.- Right click on a file at Shared sync folder. <br> 3.- Select "share with ownCloud" option | Share with users and groups and  share by link is shown | :construction: | 
5 | Disable internal sharing - Upgrade client | 1.- Update current install with ownbranded client that includes not available sharing| Update process works and we are not able to share | :construction: |
6 | Enable internal sharing - Upgrade client | 1.- Update current install with ownbranded client that includes available sharing| Update process works and we are able to share | :construction: |




