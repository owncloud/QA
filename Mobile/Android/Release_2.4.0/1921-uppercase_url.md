###  Uppercase URL 

#### Pr: https://github.com/owncloud/android/pull/1921 

Devices: Huawei 6P v7, Nexus 10 v5

Server: 9.1, 10.0


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :------ |
| 1 | Uppercase in protocol  |  Type some uppercase in protocol | URL accepted  | P m7 t5 |  |
| 2 | Uppercase in domain  |  Type an uppercase in domain | URL accepted  | P m7 t5|  |
| 3 | URL in uppercase  |  Type the whole URL in uppercase | URL accepted  | P m7 t5|  |
| 4 | URL with uppercase hardcoded  | Hardcode the URL with uppercase| URL accepted  | P m7 t5|  |
| 5 | URL in lowercase  |  Type the whole URL in lowercase | URL accepted  | P m7 t5|  |