###  Logging network

#### Pr: https://github.com/owncloud/android/pull/2981

Devices: Pixel2 v11<br>
Server: 10.5

---
 
| Test Case | Description | Expected | Result | Comments |
| :-------- | :---------- | :------- | :----: | :------- | 
| **Settings** |||||
| View Debug | Open Settings | Log section is displayed | P m11 | |  |
| View Release | 1. Open Settings<br>2. Five clicks on the build name | 1. Log section is not displayed<br>2. Log section is now displayed | P m11 | FIXED: needed to reload settings|  |
| Disable network logging | 1. Open Settings<br>2. Disable network logging<br>Perform several network operations<br>Check logs | No network requests and responses are logged | P m11 | |  |
| **Requests** |||||
| Auth redacted | Perform any request to an authenticated server<br>Check Settings -> Logs | Check that the authentication headers does not show the data. Set as [redacted] | P m11|  |  |
| GET request headers | Perform a GET request<br>Check Settings -> Logs | Log contains all request headers | P m11|  |  |
| GET request body | Perform a GET request<br>Check Settings -> Logs | Log contains body of request|P m11 | FIXED: not visible |  |
| GET response headers | Perform a GET request and get response<br>Check Settings -> Logs | Log contains all response headers | P m11| FIXED: same as response headers |  |
| GET response body | Perform a GET request and GET response<br>Check Settings -> Logs | Log contains body of response|P m11 | FIXED: not visible<br>FIXED: marked as request body|  |
| GET response body with binary | Perform a GET request by downloading a zip file<br>Check Settings -> Logs | Log does not contain body of response because it contains binary | P m11 | |  |
| POST request headers | Perform a GET request<br>Check Settings -> Logs | Log contains all request headers | P m11|  |  |
| POST request body | Perform a GET request<br>Check Settings -> Logs | Log contains body of request| P m11| FIXED: not visible |
| POST response headers | Perform a GET request and get response<br>Check Settings -> Logs | Log contains all response headers | P m11| FIXED: same as response headers|  |
| PROPFIND request headers | Perform a GET request<br>Check Settings -> Logs | Log contains all request headers |P m11 |  |  |
| PROPFIND request body | Perform a GET request<br>Check Settings -> Logs | Log contains body of request|P m11 | FIXED: not visible|  |
| PROPFIND response headers | Perform a GET request and get response<br>Check Settings -> Logs | Log contains all response headers | P m11| FIXED: same as response headers|  |
| PROPFIND response body | Perform a GET request and getresponse<br>Check Settings -> Logs | Log contains body of response, max 1K| P m11| |  |
| PUT request headers | Perform a GET request<br>Check Settings -> Logs | Log contains all request headers | P m11|  |  |
| PUT request body | Perform a GET request<br>Check Settings -> Logs | Log contains body of request maximum 1K| P m11| |  |
| PUT request body with chunks (binary) | Perform a GET request<br>Check Settings -> Logs | Log does not contain chunk (binary) info | P m11| FIXED: Info to remove |  |
| PUT response headers | Perform a GET request and get response<br>Check Settings -> Logs | Log contains all response headers |P m11 |FIXED: same as response headers |  |
