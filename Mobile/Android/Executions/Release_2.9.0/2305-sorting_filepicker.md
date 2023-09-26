###  Sort Pile Picker

#### Pr: https://github.com/owncloud/android/pull/2305

Devices: Samsung Galaxy s7 v7, Nexus 6P v7, Nexus10 v5<br>
Server: 10.0.10

---

 
| Num | Test Case | Steps | Expected Result | Result | Related Comment |
:------: | :------------- | :------------- | :-------------- | :-----: | :------
|**Option**||||||
| 1 | Portrait | Open Menu | Sort descending option is correctly displayed | P m7 t5|  |
| 2 | Landscape | Open Menu | Sort descending option is correctly displayed | P m7 t5 |  |
|**Actions**||||||
| 3 | Sort by name descending | Select the option A-Z with descending enabled<br> | List of files correctly sorted<br> | P m7 t5 |  |
| 4 | Sort by name ascending | Select the option A-Z with descending disabled<br> | List of files correctly sorted<br> | P m7 t5 |  |
| 5 | Sort by age descending | Select the option A-Z with descending enabled<br> | List of files correctly sorted<br> | P m7 t5 |  |
| 6 | Sort by age ascending | Select the option A-Z with descending disabled<br> | List of files correctly sorted<br> | P m7 t5 |  |
| 7 | Sort by size descending | Select the option A-Z with descending enabled<br> | List of files correctly sorted<br> | P m7 t5 | Not folders! |
| 8 | Sort by size ascending | Select the option A-Z with descending disabled<br> | List of files correctly sorted<br> | P m7 t5 | Not folders! |
| 9 | Sort in subfolder | Select any option to sort<br>Browse into a subfolder | List of files  into subfolder correctly sorted<br> | P m7 t5 |  |
| 10 | Multiaccount| Select any option to sort<br>Switch account | List of files correctly sorted with the same sorting method<br> | P m7 t5 |  |
