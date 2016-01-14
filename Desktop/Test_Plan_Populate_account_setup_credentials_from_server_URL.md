# Test Plan Populate account setup credentials from server URL

## Previous requirements

Have a Desktop Client v2.1.0 ready to be used with owncloud

Have a LDAP server ready to be used with owncloud

Have a Redirected server ready to be used with owncloud


## Testing functionality

TestID | Test Case | Expected Result | Result | Related Comment
------------ | ------------- | -------------- | ----- | ------
1 | Enter a server URL (https://user:pass@example.com/)  |  1.- Introduce this URL (https://user:pass@example.com/)  2.- Click on NEXT  3.- You don't need introduce the user and the password again 4.- Click on Next 5.- You can finish setting up the account| |
2 | Enter a server URL (http://user:pass@example.com/)  |  1.- Introduce this URL (http://user:pass@example.com/)  2.- Click on NEXT  3.- You don't need introduce the user and the password again 4.- Click on Next 5.- You can finish setting up the account| |
3 | Enter a server URL (https://user:pass@example.com/) with wrong user |  1.- Introduce this URL (https://user:pass@example.com/), but with wrong user  2.- Click on NEXT  3.- You don't need introduce the user and the password again 4.- Click on Next 5.- You can see this error "Access forbbiden by server. To verify......" |  |
4 | Enter a server URL (https://user:pass@example.com/) with wrong password |  1.- Introduce this URL (https://user:pass@example.com/), but with wrong password  2.- Click on NEXT  3.- You don't need introduce the user and the password again 4.- Click on Next 5.- You can see this error "Access forbbiden by server. To verify......" | |
5 | Enter a server URL (http://user:pass@example.com/) with a Redirected Server  |  1.- Introduce this URL (http://user:pass@example.com/)  2.- Click on NEXT 3.- Accept thecertificate 4.- You don't need introduce the user and the password again 4.- Click on Next 5.- You can finish setting up the account|  | |
6 | Enter a server URL (http://user:pass@example.com/) with a Redirected server with wrong user|  1.- Introduce this URL (http://user:pass@example.com/), but with wrong user  2.- Click on NEXT  3.- You don't need introduce the user and the password again 4.- Click on Next 5.- You can see this error "Access forbbiden by server. To verify......" |  |  |
7 | Enter a server URL (https://user:pass@example.com/) with wrong password  |  1.- Introduce this URL (https://user:pass@example.com/), but with wrong password  2.- Click on NEXT  3.- You don't need introduce the user and the password again 4.- Click on Next 5.- You can see this error "Access forbbiden by server. To verify......" |  | |
8 | Enter a server URL (https://user:pass@example.com/) with a LDAP Server |  1.- Introduce this URL (https://user:pass@example.com/)  2.- Click on NEXT  3.- You don't need introduce the user and the password again 4.- Click on Next 5.- You can finish setting up the account|  |
9 | Enter a server URL (http://user:pass@example.com/) with a LDAP Server |  1.- Introduce this URL (http://user:pass@example.com/)  2.- Click on NEXT  3.- You don't need introduce the user and the password again 4.- Click on Next 5.- You can finish setting up the account|  |
10 | Enter a server URL (https://user:pass@example.com/) with a LDAP Server, with wrong user  |  1.- Introduce this URL (https://user:pass@example.com/), but with wrong user)  2.- Click on NEXT  3.- You don't need introduce the user and the password again 4.- Click on Next 5.- You can see this error "Access forbbiden by server. To verify......" |  |
11 | Enter a server URL (https://user:pass@example.com/) with a LDAP server, with wrong password |  1.- Introduce this URL (https://user:pass@example.com/), but with wrong password)  2.- Click on NEXT  3.- You don't need introduce the user and the password again 4.- Click on Next 5.- You can see this error "Access forbbiden by server. To verify......" |  |
12 | Enter a server URL (https://user:pass@example.com/) with a S3 |  1.- Introduce this URL (https://user:pass@example.com/)  2.- Click on NEXT  3.- You don't need introduce the user and the password again 4.- Click on Next 5.- You can finish setting up the account|  |
13 | Enter a server URL (https://user:pass@example.com/) with a S3 Server, with wrong user  |  1.- Introduce this URL (https://user:pass@example.com/), but with wrong user)  2.- Click on NEXT  3.- You don't need introduce the user and the password again 4.- Click on Next 5.- You can see this error "Access forbbiden by server. To verify......" |  |
14 | Enter a server URL (https://user:pass@example.com/) with a S3 server, with wrong password |  1.- Introduce this URL (https://user:pass@example.com/), but with wrong password)  2.- Click on NEXT  3.- You don't need introduce the user and the password again 4.- Click on Next 5.- You can see this error "Access forbbiden by server. To verify......" |  |





