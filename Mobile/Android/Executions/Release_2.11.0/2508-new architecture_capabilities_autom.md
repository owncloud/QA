#### New Architecture: Capabilities (UI tests)

#### Pr: https://github.com/owncloud/android/pull/2508

Devices: Nexus 5X v8

---

 
| Capability | Value | Steps | Expected Result | Result | Dev
| :----: | :-------- | :---- | :-------------- | :-----: | :------
|**public**|||||
| "enabled" | true  | Create several public shares | Public shares are visible in the app | P m8 |
| "enabled" | false | Create public shares | Public shares are not visible in the app | P m8 |
| "multiple" | true  | Create one public share | Another one can be created | P m8 |
| "multiple" | false | Create one public share | No more links to be created | P m8 |
| "version_string" | > 10.0.0  | Create one public share | Another one can be created | P m8 |
| "version_string" | < 10.0.0 | Create one public share | No more links to be created | P m8 |
| "upload" | true  | Create one public share (folder) | Options for upload permissions are  displayed | P m8 |
| "upload" | false | Create one public share (folder) | Options for upload permissions are not  displayed | P m8 |
| "expire\_date"."enabled" | true  | Create one public share | Expiration date is enabled | NA |
| "expire\_date"."enabled" | false  | Create one public share | Expiration date is disabled | NA |
| "expire\_date"."enforced" | true  | Create one public share | Expiration date is enabled and enforced | P m8 |
| "expire\_date"."enforced" | false  | Create one public share | Expiration date is enabled and not enforced | P m8 |
| "expire\_date"."days" | 2 | Create one public share | Expiration date is enabled with a value two days in the future | P m8 |
|**password**|||||
| "enforced" | true | Create one public share (file) | Password is set as enforced | P m8 |
| "enforced" | false | Create one public share (file) | Password is not set as enforced | P m8 |
| "enforced_for"."read\_only" | true | Create one public share (folder) with "Download/View" option | Password is not set as enforced | P m8 |
| "enforced_for"."read\_only" | false | Create one public share (folder) with "Download/View" option | Password is set as enforced | P m8 |
| "enforced_for"."read\_write" | true | Create one public share (folder) with "Download/View/Upload" option | Password is not set as enforced | P m8 |
| "enforced_for"."read\_write" | false | Create one public share (folder) with "Download/View/Upload" option | Password is set as enforced | P m8 |
| "enforced_for"."upload\_only" | true | Create one public share (folder)with "Upload only" option | Password is not set as enforced | P m8 |
| "enforced_for"."upload\_only" | false | Create one public share (folder)with "Upload only" option | Password is set as enforced | P m8 |
