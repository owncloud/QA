## Authentication

##### Number of tests: 13

| Test Case | Assertions | 
| :-------- | :--------- | 
|**URL**|
| Initial View correct | URL field and Continue button displayed |
| Empty URL | Alert "Missing hostname" displayed | 
| Correct URL -  informal issue | Credentials' fields, name and Continue displayed |
| Correct URL issue warning | Issue with Approve and Cancel buttons displayed |
| Correct URL issue warning - Approval | Credentials' fields, name and Continue displayed |
| Correct URL issue warning - Cancel | URL displayed. Credentials and name not displayed |
| Correct URL issue warning Certificate  | Issue type certificate is displayed |
| Correct URL issue error - OK | Error displayed. URL displayed. Credentials and name not displayed |
| Correct URL OAuth2 | Credentials' fields not displayed |
|**Credentials**|
| Basic no error | Bookmark cell created |
| Basic issue warning | Credential's Continue and name displayed. Bookmark cell not displayed |
| Basic issue error - OK | Error displayed. Credential's Continue and name displayed. Bookmark cell not displayed |
| OAuth2 no error | Bookmark cell created |
