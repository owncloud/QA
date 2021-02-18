#### Dynamic Client Registration

**PR**: https://github.com/owncloud/android/pull/3073

**Devices**: Pixel 2 Android 11, Nexus 6P v7<br>
**Server**: 10.6


---

 
| Test Case | Steps | Expected | Result | Related Comment  | 
| :-------- | :---- | :------- | :----: | :--------------- | 
|**OIDC with register**||||||
| Register endpoint | Input OIDC server URL | Check that register endpoint is checked after well-known | P m11 |  |
| Token endpoint | Entering credentials in custom tabs | New token is requested with client id and secret id granted in register endpoint | P m11 |  |
| Token renewal | Wait till token expires | New token is granted using the correct client\_id and secret\_id | P m11 |  |
| Client/secret renewal | Wait till client_id expires | New client_id is granted. Following token renewal will use new client\_id/secret\_id | NA | Not available |
|**Regression**||||||
| Basic auth | Input correct basic auth URL and correct credentials | Correct authentication | P m11  |
| Basic auth wrong | Input correct basic auth URL and incorrect credentials | Wrong authentication |  P m11 |
| OAuth2 | Input correct OAuth2 URL and correct credentials | Correct authentication | P m11  |
| OAuth2 wrong | Input correct OAuth2 URL and incorrect credentials | Wrong authentication |   P m11|
| OAuth2 renewal | Input correct OAuth2 URL and correct credentials<br>Wait till token expires | Token is correctly renewed | P m11  |
| OIDC with no DCR | Input correct OIDC URL and correct credentials | Correct authentication | NA  | No server without
| OIDC with no DCR Renewal | Input correct OIDC URL and correct credentials<br>Wait till token expires | Token is correctly renewed| NA  | No server without