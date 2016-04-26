### Internal Share Enhancement


Server version: 9.1.0 Alpha <br> 
Client Version: 2.2.0

<br>
 
Test Case ID | Test case     | Steps   | Expected behavior | Result | Related Comments
|:----:|:------------- |:-------------------|:-------------|:-------------:|:----------
1 | Internal Share Enhancement - "can share" hierarchy | 1.- As user1 share a file with a user2 granting "can share"<br>2.- As user2 right-click on shared file <br> 3.- Select "Share with ownCloud" option <br> 4.- Fill user field with user3 and select <br> | "can share" checkbox is available | 
2 | Internal Share Enhancement - "can share" and "can edit" hierarchy | 1.- As user1 share a file with a user2 granting "can share" and "can edit" <br> 2.- As user2 right-click on shared file <br> 3.- Select "Share with ownCloud" option <br> 4.- Fill user field with user3 and select <br> | "can share" and "can edit" checkbox is available |
3 | Internal Share Enhancement - "can edit" hierarchy | 1.- As user1 share a file with a user2 granting "can edit" <br> 2.- As user2 right-click on shared file <br> 3.- Select "Share with ownCloud" option <br> 4.- Fill user field with user3 and select <br> | An error message appears because you are not able to reshare the file | 
4 | Internal Share Enhancement - "can share" Link hierarchy | 1.- As user1 share a file with a user2 granting "can share"<br> 2.- As user2 right-click on shared file <br> 3.- Select "Share with ownCloud" option <br> 4.- Fill user field with user3 and select <br> 5.- Enable "Share Link" | Link, Password Protect and Set expiration date checkbox is shown |
5 | Internal Share Enhancement - "can Share" and "can edit" > "change" hierarchy | 1.- As user1 share a folder with a user2 granting "can edit" > Change <br> 2.- As user2 right-click on shared folder <br> 3.- Select "Share with ownCloud" option <br> 4.- Fill user field with user3 and select <br> | "can edit" > "change" checkbox is available |
6 | Internal Share Enhancement - "can share" and "can edit" > "create" hierarchy | 1.- As user1 share a folder with a user2 granting "can edit" > Create <br> 2.- As user2 right-click on shared folder <br> 3.- Select "Share with ownCloud" option <br> 4.- Fill user field with user3 and select <br> | "can edit" > "create" checkbox is available |  
7 | Internal Share Enhancement - "can share" and "can edit" > "delete" hierarchy | 1.- As user1 share a folder with a user2 granting "can edit" > Delete <br> 2.- As user2 right-click on shared folder <br> 3.- Select "Share with ownCloud" option <br> 4.- Fill user field with user3 and select <br> | "can edit" > "delete" checkbox is available |  
 
