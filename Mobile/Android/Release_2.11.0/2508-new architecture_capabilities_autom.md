#### New Architecture: Capabilities (UI tests)

#### Pr: https://github.com/owncloud/android/pull/2508



---

 
| Capability | Value | Steps | Expected Result | Status | Dev
| :----: | :-------- | :---- | :-------------- | :-----: | :------
|**public**|||||
| "enabled" | true  | Create several public shares | Public shares are visible in the app |  Pending |
| "enabled" | false | Create public shares | Public shares are not visible in the app | Pending  |
| "multiple" | true  | Create one public share | Another one can be created | Pending |
| "multiple" | false | Create one public share | No more links to be created | Pending |
| "upload" | true  | Create one public share (folder) | Options for upload permissions are  displayed | Pending |
| "upload" | false | Create one public share (folder) | Options for upload permissions are not  displayed | Pending |
| "expire\_date"."enabled" | true  | Create one public share | Expiration date is enabled | Pending |
| "expire\_date"."enforced" | true  | Create one public share | Expiration date is enabled and enforced | Pending |
| "expire\_date"."enforced" | false  | Create one public share | Expiration date is enabled and not enforced | Pending |
| "expire\_date"."days" | 2 | Create one public share | Expiration date is enabled with a value two days in the future | Pending |
| "expire\_date"."enabled" | false  | Create one public share | Expiration date is disabled | Pending |
|**password**|||||
| "enforced" | true | Create one public share (file) | Password is set as enforced | Pending |
| "enforced" | false | Create one public share (file) | Password is not set as enforced | Pending |
| "enforced_for"."read\_only" | true | Create one public share (folder) with "Download/View" option | Password is not set as enforced | Pending |
| "enforced_for"."read\_only" | false | Create one public share (folder) with "Download/View" option | Password is set as enforced | Pending |
| "enforced_for"."read\_write" | true | Create one public share (folder) with "Download/View/Upload" option | Password is not set as enforced | Pending |
| "enforced_for"."read\_write" | false | Create one public share (folder) with "Download/View/Upload" option | Password is set as enforced | Pending |
| "enforced_for"."upload\_only" | true | Create one public share (folder)with "Upload only" option | Password is not set as enforced | Pending |
| "enforced_for"."upload\_only" | false | Create one public share (folder)with "Upload only" option | Password is set as enforced | Pending |
