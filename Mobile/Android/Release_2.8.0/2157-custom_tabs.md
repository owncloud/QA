#### Custom tabs 

#### Pr: https://github.com/owncloud/android/pull/2157 

Device: Nexus 6P v7.1.2
Server: 10.0.7

---

| Num | Test Case | Steps | Expected Result | Result | Related Comment
| :-: | :-------: | :---- | :-------------- | :----: | :-----:
|**Create OAuth2 session**||||||
| 1 | Chrome | Enter an OAuth2 server URL | Chrome is shown and authentication is correct. Check that the cookies in auth process are not present in app during session| P m7 t6 |  |
| 2 | Firefox | Enter en OAuth2 server URL | Firefox is shown and authentication is correct. Check that the cookies in auth process are not present in app during session| P m7 t6 |  |
| 3 | Opera | Enter en OAuth2 server URL | Opera is shown and authentication is correct. Check that the cookies in auth process are not present in app during session| P m7 t6 |  |
| 4 | No browser | Enter en OAuth2 server URL | Safari is shown and authentication is correct. Check that the cookies in auth process are not present in app during session| P m7 t6 |  |
|**Edit OAuth2 session**||||||
| 5 | Chrome | Edit an OAuth2 connection | Chrome is shown and authentication is correct. Check that the cookies in auth process are not present in app during session| P m7 t6 | authorized. needs review on server |
| 6 | Firefox | Edit an OAuth2 connection | Firefox is shown and authentication is correct. Check that the cookies in auth process are not present in app during session| P m7 t6| authorized. needs review on server |
| 7 | Opera | Edit an OAuth2 connection | Opera is shown and authentication is correct. Check that the cookies in auth process are not present in app during session| P m7 t6| authorized. needs review on server |
| 8 | No browser | Edit an OAuth2 connection | Safari is shown and authentication is correct. Check that the cookies in auth process are not present in app during session| P m7 t6 |  |