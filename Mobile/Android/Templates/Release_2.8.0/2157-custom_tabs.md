#### Custom tabs 

#### Pr: https://github.com/owncloud/android/pull/2157 


---

 
| Test Case | Steps | Expected Result | Result | Related Comment
:------: | :------------- | :------------- | :-------------- | :-----: | :------
|**Create OAuth2 session**||||||
| 1 | Chrome | Enter en OAuth2 server URL | Chrome is shown and authentication is correct. Check that the cookies in auth process are not present in app during session|  |  |
| 2 | Firefox | Enter en OAuth2 server URL | Firefox is shown and authentication is correct. Check that the cookies in auth process are not present in app during session|  |  |
| 3 | Opera | Enter en OAuth2 server URL | Opera is shown and authentication is correct. Check that the cookies in auth process are not present in app during session|  |  |
| 4 | No browser | Enter en OAuth2 server URL | Safari is shown and authentication is correct. Check that the cookies in auth process are not present in app during session|  |  |