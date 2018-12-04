###  Sort Sharing View

#### Pr: https://github.com/owncloud/android/pull/2307

Devices: Google Pixel 2 v9, Nexus9 v7<br>
Server: 10.0.10

---

 
| Num | Test Case | Steps | Expected Result | Result | Related Comment |
:------: | :------------- | :------------- | :-------------- | :-----: | :------
|**Option**||||||
| 1 | Portrait | Open Menu | Sort descending option is correctly displayed | P m9 t7 |  |
| 2 | Landscape | Open Menu | Sort descending option is correctly displayed | P m9 t7 |  |
|**Actions**||||||
| 3 | Sort by name descending | Select the option A-Z with descending enabled<br> | List of files correctly sorted<br> | P m9 t7 |  |
| 4 | Sort by name ascending | Select the option A-Z with descending disabled<br> | List of files correctly sorted<br> | P m9 t7 |  |
| 5 | Sort by age descending | Select the option oldest-newest with descending enabled<br> | List of files correctly sorted<br> | P m9 t7 |  |
| 6 | Sort by age ascending | Select the option oldest-newest with descending disabled<br> | List of files correctly sorted<br> | P m9 t7 |  |
| 7 | Sort by size descending | Select the option smallest-largest with descending enabled<br> | List of files correctly sorted<br> | P m9 t7 |  |
| 8 | Sort by size ascending | Select the option smallest-largest with descending disabled<br> | List of files correctly sorted<br> | P m9 t7 | |
| 9 | Sort in subfolder | Select any option to sort<br>Browse into a subfolder | List of files  into subfolder correctly sorted<br> | P m9 t7 |  |
| 10 | Multiaccount| Select any option to sort<br>Switch account | List of files correctly sorted with the same sorting method<br> | P m9 t7 |  |
