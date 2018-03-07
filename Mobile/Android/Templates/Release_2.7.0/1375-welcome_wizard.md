###  Welcome wizard

#### Pr: https://github.com/owncloud/android/pull/1375

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :------ |
|**Customization**|||||
| 1 | Option enabled | Enable option | Welcome wizard shown  |  |  |
| 2 | Option disabled | Disable option | Welcome wizard not shown  |  |  |
|**Welcome wizard**|||||
| 3 | Portrait | Pass all slides until the last one | slides correctly shown in portrait  |  |  |
| 4 | Landscape | Pass all slides until the last one | slides correctly shown in landscape  |  |  |
| 5 | Skip I | Skip welcome wizard in the 1. slide| Login view appears |  |  |
| 6 | Skip II | Skip welcome wizard in the 2. slide| Login view appears |  |  |
| 7 | Skip III | Skip welcome wizard in the 3. slide| Login view appears |  |  |
| 8 | Skip IV | Skip welcome wizard in the 4. slide| Login view appears |  |  |
| 9 | Skip V | Skip welcome wizard in the 5. slide| Login view appears |  |  |
|**Upgrade**|||||
| 10 | Release | 1. Install previous version<br>2. Install current version| Welcome wizard does not appear |  |  |
| 11 | Beta | 1. Install previous version<br>2. Install current version| Welcome wizard does not appear |  |  |
| 12 | New upgrade after the first | 1. Install the current version<br>2. Install other version| Welcome wizard does not appear |  |  |

