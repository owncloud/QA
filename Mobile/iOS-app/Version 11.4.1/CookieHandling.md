### Cookie handling

#### PR: [https://github.com/owncloud/ios-app/pull/797](https://github.com/owncloud/ios-app/pull/797)

Devices: iPhone XR v13.7<br>
Server: 10.5.0

---

 
| Test Case | Steps | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- | 
|**core.cookie-support-enabled=YES**|
| Basic auth - Login request | Set URL and credentials  |  Cookies not sent. Cookies received in response |  P m13 |   |
| Basic auth - Propfind list of files | After login, propfind request to get the list of files (and other request like get shares or get user) | Propfind includes cookies, response does not include cookies |   P m13 |   |
| Basic auth - Upload (put) | put request to upload a file | Put includes cookies, response does not include cookies |   P m13 |   |
| Basic auth - Shares (post) | post request to share a file | post includes cookies, response does not include cookies |   P m13 |   |
| OAuth2 - Login request | Set URL and credentials  |  Cookies not sent. Cookies received in response |   P m13 |   |
| OAuth2 - Propfind list of files | After login, propfind request to get the list of files (and other request like get shares or get user) | Propfind includes cookies, response does not include cookies |  P m13  |   |
| OAuth2 - Upload (put) | put request to upload a file | Put includes cookies, response does not include cookies |  P m13  |   |
| OAuth2 - Shares (post) | post request to share a file | post includes cookies, response does not include cookies |   P m13 |   |
| OIDC - Login request | Set URL and credentials  |  Cookies not sent. Cookies received in response | NA  |   |
| OIDC - Propfind list of files | After login, propfind request to get the list of files (and other request like get shares or get user) | Propfind includes cookies, response does not include cookies | NA  |   |
| OIDC - Upload (put) | put request to upload a file | Put includes cookies, response does not include cookies | NA  |   |
| OIDC - Shares (post) | post request to share a file | post includes cookies, response does not include cookies | NA  |   |
|**core.cookie-support-enabled=NO**|
| Basic auth - Login request | Set URL and credentials  |  Cookies not sent. Cookies received in response | P m13  |   |
| Basic auth - Propfind list of files | After login, propfind request to get the list of files (and other request like get shares or get user) | Cookies not sent. Cookies received in response | P m13  |   |
| Basic auth - Upload (put) | put request to upload a file | Cookies not sent. Cookies received in response | P m13  |   |
| Basic auth - Shares (post) | post request to share a file | Cookies not sent. Cookies received in response |  P m13 |   |
| OAuth2 - Login request | Set URL and credentials  |  Cookies not sent. Cookies received in response |  P m13 |   |
| OAuth2 - Propfind list of files | After login, propfind request to get the list of files (and other request like get shares or get user) | Propfind includes cookies, response does not include cookies | P m13  |   |
| OAuth2 - Upload (put) | put request to upload a file | Put includes cookies, response does not include cookies |  P m13 |   |
| OAuth2 - Shares (post) | post request to share a file | post includes cookies, response does not include cookies |  P m13 |   |
| OIDC - Login request | Set URL and credentials  |  Cookies not sent. Cookies received in response | NA  |   |
| OIDC - Propfind list of files | After login, propfind request to get the list of files (and other request like get shares or get user) | Propfind includes cookies, response does not include cookies |  NA |   |
| OIDC - Upload (put) | put request to upload a file | Put includes cookies, response does not include cookies | NA  |   |
| OIDC - Shares (post) | post request to share a file | post includes cookies, response does not incluue cookies |  NA |   |
|**Miltiaccount with core.cookie-support-enabled=YES**|
| Basic + OAuth2| Add a basic auth account<br>Add an OAuth2 account<br>Switch from one to the other one checking the request flow | Every time account is switched, new cookie is asked and used during the session |  P m13 |   |