### Internal Share Enhancement

<br>
 
 Test case     | Steps   | Expected behavior | Result | Related Comments
|:------------- |:-------------------|:-------------|:-------------:|:----------
Internal Share Enhancement - "can share" hierarchy | 1.- As user1 share a file with a user2 granting "can share"<br>2.- As user2 right-click on shared file <br> 3.- Select "Share with ownCloud" option <br> 4.- Fill user field with user3 and select <br> | "can share" checkbox is available | 
Internal Share Enhancement - "can share" and "can edit" hierarchy | 1.- As user1 share a file with a user2 granting "can share" and "can edit" <br> 2.- As user2 right-click on shared file <br> 3.- Select "Share with ownCloud" option <br> 4.- Fill user field with user3 and select <br> | "can share" and "can edit" checkbox is available |
Internal Share Enhancement - "can edit" hierarchy | 1.- As user1 share a file with a user2 granting "can edit" <br> 2.- As user2 right-click on shared file <br> 3.- Select "Share with ownCloud" option <br> 4.- Fill user field with user3 and select <br> | An error message appears because you are not able to reshare the file | 
Internal Share Enhancement - "can share" Link hierarchy | 1.- As user1 share a file with a user2 granting "can share"<br> 2.- As user2 right-click on shared file <br> 3.- Select "Share with ownCloud" option <br> 4.- Fill user field with user3 and select <br> 5.- Enable "Share Link" | Link, Password Protect and Set expiration date checkbox is shown |
Internal Share Enhancement - "can Share" and "can edit" > "change" hierarchy | 1.- As user1 share a folder with a user2 granting "can edit" > Change <br> 2.- As user2 right-click on shared folder <br> 3.- Select "Share with ownCloud" option <br> 4.- Fill user field with user3 and select <br> | "can edit" > "change" checkbox is available |
Internal Share Enhancement - "can share" and "can edit" > "create" hierarchy | 1.- As user1 share a folder with a user2 granting "can edit" > Create <br> 2.- As user2 right-click on shared folder <br> 3.- Select "Share with ownCloud" option <br> 4.- Fill user field with user3 and select <br> | "can edit" > "create" checkbox is available |  
Internal Share Enhancement - "can share" and "can edit" > "delete" hierarchy | 1.- As user1 share a folder with a user2 granting "can edit" > Delete <br> 2.- As user2 right-click on shared folder <br> 3.- Select "Share with ownCloud" option <br> 4.- Fill user field with user3 and select <br> | "can edit" > "delete" checkbox is available |  
 
