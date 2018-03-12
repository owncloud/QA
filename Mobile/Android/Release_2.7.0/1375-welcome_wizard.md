###  Welcome wizard

#### Pr: https://github.com/owncloud/android/pull/1375

Server: 10.0

Devices: Nexus 6P v7, Nexus10 v5, Nexus 5X v8

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :------ |
|**Customization**|||||
| 1 | Option enabled | Enable option | Welcome wizard shown  | P m7 t10 |  |
| 2 | Option disabled | Disable option | Welcome wizard not shown  | P m7 t10 |  |
|**Welcome wizard**|||||
| 3 | Portrait | Pass all slides until the last one | slides correctly shown in portrait  | P m7 t10 |  |
| 4 | Landscape | Pass all slides until the last one | slides correctly shown in landscape  | P m7 t10 |  |
| 5 | Skip I | Skip welcome wizard in the 1. slide| Login view appears | P m7 t10 |  |
| 6 | Skip II | Skip welcome wizard in the 2. slide| Login view appears | P m7 t10|  |
| 7 | Skip III | Skip welcome wizard in the 3. slide| Login view appears | P m7 t10|  |
| 8 | Skip IV | Skip welcome wizard in the 4. slide| Login view appears | P m7 t10|  |
| 9 | Skip V | Skip welcome wizard in the 5. slide| Login view appears | P m7 t10|  |
|**Upgrade**|||||
| 10 | Release | 1. Install previous version<br>2. Install current version| Welcome wizard does not appear | P m7 t10 |  |
| 11 | Beta | 1. Install previous version<br>2. Install current version| Welcome wizard does not appear | P m8 t5 |  |
| 12 | New upgrade after the first | 1. Install the current version<br>2. Install other version| Welcome wizard does not appear | P m7 t10 |  |

