###  Sort Descending

#### Pr: https://github.com/owncloud/android/pull/2134

Devices: Nexus 6P v7.1.2, Galaxy Tab S v6<br>
Server: 10.0.7

---

 
| Num | Test Case | Steps | Expected Result | Result | Related Comment |
:------: | :------------- | :------------- | :-------------- | :-----: | :------
|**Option**||||||
| 1 | Portrait | Open Menu | Sort descending option is correctly displayed | P m7 t6 |  |
| 2 | Landscape | Open Menu | Sort descending option is correctly displayed | P m7 t6 |  |
|**Actions**||||||
| 3 | Sort by name descending | 1. Select the option A-Z with descending enabled<br>2. Disable "descending"<br>3. Select the option Grid view | 1. List of files correctly sorted<br>2. List of files correctly sorted<br>3. List of files correctly sorted | P m7 t6 | FIXED: Initial set up not correct. Change of orientation switches the option |
| 4 | Sort by age descending | 1. Select the option newest - oldest with descending enabled<br>2. Disable "descending"<br>3. Select the option Grid view | 1. List of files correctly sorted<br>2. List of files correctly sorted<br>3. List of files correctly sorted | P m7 t6|  |
| 5 | Sort by name descending | 1. Select the option smallest - biggest with descending enabled<br>2. Disable "descending"<br>3. Select the option Grid view | 1. List of files correctly sorted<br>2. List of files correctly sorted<br>3. List of files correctly sorted | P m7 t6 |  |
| 6 | Sort with empty folder | 1. Select to sort descending in an empty folder | Nothing happens | P m7 t6 |  |
