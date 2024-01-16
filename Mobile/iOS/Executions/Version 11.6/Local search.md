###  Local search 

#### PR: https://github.com/owncloud/ios-app/pull/933

Devices: iPhoneXR v14.4, iPadAir v13.4<br>
Server: 10.7

---

 
| Test Case | Description | Expected | Result | Comment |
| :-------- | :---------- | :------- | :-----: | :------
| **View** |   |  |
| Portrait | Open file list and type in the search bar  | Items in screen: filter account/folder and aroow for every match | P m14 t13 | |
| Landscape | Open file list and type in the search bar  | Items in screen: filter account/folder and aroow for every match | P m14 t13 | |
| No matches | Open file list and type in the search bar a pattern that does not match with any item in the list | No matches view correctly displayed|  P m14 t13|  |
| **Search by name** |   |  |
| One match| Enter a pattern that match only one file| One file in the results | P m14 t13 |  |
| One match negative | Enter a pattern that matches only one file, with "-" prefix | All files displayed bit the matching one  | P m14 t13 |  |
| More than 100 matches | Enter a pattern that matches with more than 100 files in the folder or in the account| First 100 matches are displayed and then, the "Show more results" that will display the next 100  | P m14 t13 |  |
| With Blank | 1. Add a file called "aaa bbb"<br>2. Enter `aaa`<br>3. Enter `bbb`<br>4. Enter `aaa bbb`<br>5. Enter `bbb aaa`<br>6. Enter `"bbb "aaa` | File is always displayed | P m14 t13 | FIXED: Failed the last |
| With Blank negative | 1. Add a file called "aaa bbb"<br>2. Enter `-aaa`<br>3. Enter `-bbb`<br>4. Enter `-aaa bbb`<br>5. Enter `-bbb aaa`<br>6. Enter `-"bbb "aaa` | File is never displayed | P m14 t13 | FIXED: Failed the last |
| Many matches | In a folder with 20 files, enter a pattern that matches only with a set of them | Those files displayed as the results | P m14 t13|  |
| Many matches negative | In a folder with 20 files, enter a pattern that matches only with a set of them, with "-" prefix | Files displayed are the ones that don't match the pattern | P m14 t13 |   |
| **Search by type** |   |  |
| PDF | Enter `type:pdf` in a folder with many kind of files | Only pdfs in the results | P m14 t13 | FIXED: Fails for folder, OK for accounts |
| PDF negative | Enter `-type:pdf` in a folder with many kind of files | Everything but pdfs in the results | P m14 t13 | FIXED: Shows pdf |
| PDF & JPG | Enter `type:pdf,jpg` in a folder with many kind of files | Only pdfs and jpgs in the results | P m14 t13 | FIXED: Empty list |
| PDF & JPG negative | Enter `-type:pdf` in a folder with many kind of files | Everything but pdfs and jpgs in the results | P m14 t13 | FIXED: pdf and jpg in the list |
| File| Enter `:file` inside a folder with many kind of files and folders | Only files in the results | P m14 |  |
| File negative | Enter `-:file` inside a folder with many kind of files and folders | Everything but files in the results |P m14  t13|  |
| Folder| Enter `:folder` inside a folder with many kind of files and folders | Only folders in the results | P m14 t13|  |
| Folder negative | Enter `-:folder` inside a folder with many kind of files and folders | Everything but folder in the results | P m14  t13|  |
| Image| Enter `:image` inside a folder with many kind of files and folders | Only images in the results | P m14  t13|  |
| Image negative | Enter `-:image` inside a folder with many kind of files and folders | Everything but images in the results |P m14  t13|  |
| Video| Enter `:video` inside a folder with many kind of files and folders | Only videos in the results | P m14 t13|  |
| Video negative | Enter `-:video` inside a folder with many kind of files and folders | Everything but videos in the results | P m14 t13 |  |
| **Search by date** |   |  |
| After year | Enter `after:2020` in a folder with many files with different modification dates | Only files modified after 2020 are displayed | P m14  t13|  |
| After year negative | Enter `-after:2020` in a folder with many files with different modification dates | Only files modified before 2020 are displayed | P m14 t13 |  |
| Before year | Enter `before:2020` in a folder with many files with different modification dates | Only files modified before 2020 are displayed |  P m14 t13 |  |
| Before year negative | Enter `-before:2020` in a folder with many files with different modification dates | Only files modified after 2020 are displayed |  P m14 t13 |  |
| After month | Enter `after:2020-06 `in a folder with many files with different modification dates | Only files modified after June 2020 are displayed |  P m14 t13 |  |
| After month negative | Enter `-after:2020-06` in a folder with many files with different modification dates | Only files modified before June 2020 are displayed |  P m14 t13|  |
| Before month | Enter `before:2020-06` in a folder with many files with different modification dates | Only files modified before June 2020 are displayed |  P m14 t13|  |
| Before month negative | Enter `-before:2020-06` in a folder with many files with different modification dates | Only files modified after June 2020 are displayed | P m14 t13 |  |
| After day | Enter `after:2020-06-15` in a folder with many files with different modification dates | Only files modified after 15 June 2020 are displayed |  P m14 t13|  |
| After day negative | Enter `-after:2020-06-15` in a folder with many files with different modification dates | Only files modified before 15 June 2020 are displayed | P m14 t13 |  |
| Before day | Enter `before:2020-06-15` in a folder with many files with different modification dates | Only files modified before 15 June 2020 are displayed |  P m14 t13|  |
| Before day negative | Enter `-before:2020-06-15` in a folder with many files with different modification dates | Only files modified after 15 June 2020 are displayed |  P m14 t13|  |
| On day | Enter `on:2020-06-15` (or any other date) in a folder with many files with different modification dates | Only files modified on 15 June 2020 are displayed |  P m14 t13|  |
| On day negative| Enter `-on:2020-06-15` (or any other date) in a folder with many files with different modification dates | Files not modified on 15 June 2020 are displayed |  P m14 t13|  |
| On several days| Enter `on:2020-06-15,2020-06-19` (or any other date) in a folder with many files with different modification dates | Only files modified on 15 June 2020 or 19 June 2020 are displayed  | P m14 t13 |  |
| On several days negative| Enter `-on:2020-06-15,2020-06-19` (or any other date) in a folder with many files with different modification dates | Files not modified on 15 June 2020 or 19 June 2020 are displayed  | P m14 t13 |  |
| Current year | Enter `:year` and `:y` in a folder with many files with different modification dates form different years | Files modified the current year are displayed  |  P m14 t13|  |
| Current year negative | Enter `-:year` and `-:y` in a folder with many files with different modification dates form different years | Files not modified the current year are displayed  |  P m14 t13|  |
| Current month | Enter `:month` and `:m` in a folder with many files with different modification dates from different months | Files modified the current month are displayed  |  P m14 t13|  |
| Current month negative | Enter `-:month` and `-:m` in a folder with many files with different modification dates from different months | Files not modified the current month are displayed  |   P m14 t13|  |
| Current week | Enter `:week` in a folder with many files with different modification dates from different weeks | Files modified the current week are displayed  |  P m14 t13|  |
| Current week negative | Enter `-:week` in a folder with many files with different modification dates from different weeks | Files not modified the current week are displayed  | P m14 t13 |  |
| Current day | Enter `:today` or `:d` in a folder with many files with different modification dates from different days | Files modified today are displayed  | P m14 t13 | FIXED: Not working |
| Current week negative | Enter `-:today` or `-:d` in a folder with many files with different modification dates from different days | Files not modified today are displayed  | P m14 t13 | FIXED: Not working |
| Last 2 months | Enter `:2m` in a folder with many files with different modification dates  | Files modified last 2 months displayed  | P m14 t13 |    |
| Last 2 months negative | Enter `:2m` in a folder with many files with different modification dates  | Files modified last 2 months displayed  | P m14 t13 |   |
| Last 2 weeks | Enter `:2w` in a folder with many files with different modification dates  | Files modified last 2 weeks displayed  | P m14 t13 |  |
| Last 2 weeks negative | Enter `:2w` in a folder with many files with different modification dates  | Files modified last 2 weeks displayed  | P m14 t13 |  |
| Last 2 days | Enter `:2d` in a folder with many files with different modification dates  | Files modified last 2 days displayed  | P m14 t13 |  |
| Last 2 days negative | Enter `:2d` in a folder with many files with different modification dates  | Files modified last 2 days displayed  |P m14 t13 |  |
| **Multiple** |   |  |
| Name + Type | Enter `al type:pdf` in a folder that contains two pdf files and other multiple files of other types. One pdf file contains the substring `al` and the other does not contain `al` | Only one pdf displayed as result: the one containing `al` |P m14 t13 |  |
| Date + Type | Enter `after:2020 type:pdf` in a folder that contains two pdf files and other multiple files of other type. One pdf file created before 2020 and the other before 2020 (take another dates). Both containing `al` in the same | Only one pdf displayed as result: the one created after 2020  |P m14 t13 |  |
| Name + Date | Enter `al after:2020` in a folder that contains two files and other multiple files of other type. One pdf file contains the substring `al` and the other created before 2020  | Only one pdf displayed as result: the one created after 2020 |P m14 t13 |  |
| Name + Date + Type | Enter `al after:2020 type:pdf` in a folder that contains several pdf files and other multiple files of other type. One one pdf file contains the substring `al` and was created or modified after 2020  | Only one pdf displayed as result: the one created after 2020 |P m14 t13 |  |
| **Check results** |   |  |
| File | 1. Enter anything searching criteria that returns file in the results<br>2. Click the blue arrow on a file from the results  | File is highlighted inside its containing folder  |P m14 t13 |  |
| Folder | 1. Enter anything searching criteria that returns a folder in the results<br>2. Click the blue arrow on a folder from the results  | Folder is highlighted inside its containing folder  |P m14 t13 |  |
| **Shortcuts (iPad)** |   |  |
| Select search | 1. Press cmd + F in list of files | Select the search bar  |P t13 |  |
| Select scope | 1. Press cmd + F in list of files<br>2. Press again cmd + F | Swtiched between "Account" And "Folder" scope  |P t13 |  |
| Change sort type order | 1. Press cmd + F in list of files<br>2. Press again mayus + cmd + S | Changed sort type order, over the selected one  |P t13 |  |
| Select search picker| 1. Select to move or copy any item<br>2. In the picker, press cmd + F  | Select the search bar  |P t13 |  |
| Select scope picker| 1. Select to move or copy any item<br>2. Press cmd + F in picker<br>2. Press again cmd + F | Swtiched between "Account" And "Folder" scope  |P t13 |  |
| Change sort type order picker| 1. Select to move or copy any item<br>2. Press cmd + F in list of files<br>3. Press again mayus + cmd + S | Changed sort type order, over the selected one  |P t13 |  |