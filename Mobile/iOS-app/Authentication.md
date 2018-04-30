### Feature name 

#### PR: https://github.com/owncloud/ios-app/pull/27

Device/s: iPhoneX 11.3<br>
Server: 10.0.7

Number of tests:  <br>
Number of automated tests:   <br>
Coverage: <br>


---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | Automated |
| :-------- | :---- | :------- | :----- | :------------------------- | :-------: |
|**URL**||||||
| Empty URL | Let empty URL | Correct issue indicating error | P m11 | Nothing happens ? ||
| Incorrect URL | Set Incorrect URL | Correct issue indicating error | F m11 | Nothing happens ? ||
| No prefix SSL I | Input non-secure-SSL URL with no protocol | Show certificate |  |  |  |
| No prefix SSL II | Input secure-SSL URL with no protocol | Show certificate - passed validation| |||
| No prefix http | Input http URL with no protocol | SSL error ||||
| Prefix SSL I | Input non-secure-SSL URL with protocol | Show certificate |  |  |  |
| Prefix SSL II | Input secure-SSL URL with protocol | Show certificate - passed validation| |||
| Prefix http | Input http URL with no protocol | SSL error ||||
| feature to test   |  1. <br>2. <br> |  2.Expected result after step 2<br> | Passed / Failed |  | :x: |
|**Review Connection**||||||
| Open certificate | Open certificate to check details | Certificate shown |  |  |  |
| Approve certificate | Open certificate to check details and approve it | Moved forward to credentials basic/oauth |  |  |  |
| Cancel certificate | Open certificate to check details and cancel it | Return to Add server |  |  |  |
|**Basic auth**||||||
| Empty credentials |  Try to connect with empty credentials | Error |  |  |  |
| Empty Username |  Try to connect with empty username | Error |  |  |  |
| Empty password |  Try to connect with empty password | Error |  |  |  |
| Special characters |  Try to connect with username that contains special characters | Works |  |  |  |
| Username with blanks |  Try to connect with username that contains blanks | Works |  |  |  |
|**OAuth2**||||||
| Correct credentials |  Set correct credentials in OAuth2 view |  Bookmark created |  |  |  |
|**Name**||||||
| Empty name |  Set correct credentials but let name empty | Bookmark Name = URL |  |  |  |
| Non-Empty name |  Set correct credentialsand name | Bookmark name correct in list of servers |  |  |  |

| feature to test |  1. <br>2. <br> |  2.Expected result after step 2<br> | Passed / Failed |  | :white_check_mark: |