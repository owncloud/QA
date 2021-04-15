###  Local search 

#### PR: https://github.com/owncloud/ios-app/pull/933

Devices: iPhoneXR v14.24, iPadAir v13.4<br>
Server: 10.7

---

 
| Test Case | Description | Expected | Result | Comment |
| :-------- | :---------- | :------- | :-----: | :------
| **View** |   |  |
| Portrait | Open file list and type in the search bar  | Items in screen: filter account/folder and aroow for every match | P m14  | |
| Landscape | Open file list and type in the search bar  | Items in screen: filter account/folder and aroow for every match | P m14  | |
| No matches | Open file list and type in the search bar a pattern that does not match with any item in the list | No matches view correctly displayed|  F m14 | Lens not alligned |
| **Search by name** |   |  |
| One match| Enter a pattern that match only one file| One file in the results | P m14 |  |
| One match negative | Enter a pattern that matches only one file, with "-" prefix | All files displayed bit the matching one  | P m14 |  |
| More than 100 matches | Enter a pattern that matches with more than 100 files in the folder or in the account| First 100 matches are displayed and then, the "Show more results" that will display the next 100  | P m14 |  |
| With Blank | 1. Add a file called "aaa bbb"<br>2. Enter `aaa`<br>3. Enter `bbb`<br>4. Enter `aaa bbb`<br>5. Enter `bbb aaa`<br>6. Enter `"bbb "aaa` | File is always displayed | F m14 | Failed the last |
| With Blank negative | 1. Add a file called "aaa bbb"<br>2. Enter `-aaa`<br>3. Enter `-bbb`<br>4. Enter `-aaa bbb`<br>5. Enter `-bbb aaa`<br>6. Enter `-"bbb "aaa` | File is never displayed | F m14 | Failed the last |
| Many matches | In a folder with 20 files, enter a pattern that matches only with a set of them | Those files displayed as the results | P m14|  |
| Many matches negative | In a folder with 20 files, enter a pattern that matches only with a set of them, with "-" prefix | Files displayed are the ones that don't match the pattern | |  Recheck with hoge ampunt to check the "Show more" |
| **Search by type** |   |  |
| PDF | Enter `type:pdf` in a folder with many kind of files | Only pdfs in the results | F m14 | Fails for folder, OK for accounts |
| PDF negative | Enter `-type:pdf` in a folder with many kind of files | Everything but pdfs in the results | F m14 | Shows pdf |
| PDF & JPG | Enter `type:pdf,jpg` in a folder with many kind of files | Only pdfs and jpgs in the results | F m14 | Empty list |
| PDF & JPG negative | Enter `-type:pdf` in a folder with many kind of files | Everything but pdfs and jpgs in the results | F m14 | pdf and jpg in the list |
| File| Enter `:file` inside a folder with many kind of files and folders | Only files in the results | P m14 |  |
| File negative | Enter `-:file` inside a folder with many kind of files and folders | Everything but files in the results |P m14 |  |
| Folder| Enter `:folder` inside a folder with many kind of files and folders | Only folders in the results | P m14|  |
| Folder negative | Enter `-:folder` inside a folder with many kind of files and folders | Everything but folder in the results | P m14 |  |
| Image| Enter `:image` inside a folder with many kind of files and folders | Only images in the results | P m14|  |
| Image negative | Enter `-:image` inside a folder with many kind of files and folders | Everything but images in the results |P m14 |  |
| Video| Enter `:video` inside a folder with many kind of files and folders | Only videos in the results | P m14 |  |
| Video negative | Enter `-:video` inside a folder with many kind of files and folders | Everything but videos in the results | P m14 |  |
| **Search by date** |   |  |
| After year | Enter `after:2020` in a folder with many files with different modification dates | Only files modified after 2020 are displayed | P m14 |  |
| After year negative | Enter `-after:2020` in a folder with many files with different modification dates | Only files modified before 2020 are displayed | P m14 |  |
| Before year | Enter `before:2020` in a folder with many files with different modification dates | Only files modified before 2020 are displayed |  P m14 |  |
| Before year negative | Enter `-before:2020` in a folder with many files with different modification dates | Only files modified after 2020 are displayed |  P m14 |  |
| After month | Enter `after:2020-06 `in a folder with many files with different modification dates | Only files modified after June 2020 are displayed |  P m14 |  |
| After month negative | Enter `-after:2020-06` in a folder with many files with different modification dates | Only files modified before June 2020 are displayed |  P m14|  |
| Before month | Enter `before:2020-06` in a folder with many files with different modification dates | Only files modified before June 2020 are displayed |  P m14|  |
| Before month negative | Enter `-before:2020-06` in a folder with many files with different modification dates | Only files modified after June 2020 are displayed | P m14 |  |
| After day | Enter `after:2020-06-15` in a folder with many files with different modification dates | Only files modified after 15 June 2020 are displayed |  P m14|  |
| After day negative | Enter `-after:2020-06-15` in a folder with many files with different modification dates | Only files modified before 15 June 2020 are displayed | P m14 |  |
| Before day | Enter `before:2020-06-15` in a folder with many files with different modification dates | Only files modified before 15 June 2020 are displayed |  P m14|  |
| Before day negative | Enter `-before:2020-06-15` in a folder with many files with different modification dates | Only files modified after 15 June 2020 are displayed |  P m14|  |
| On day | Enter `on:2020-06-15` (or any other date) in a folder with many files with different modification dates | Only files modified on 15 June 2020 are displayed |  P m14|  |
| On day negative| Enter `-on:2020-06-15` (or any other date) in a folder with many files with different modification dates | Files not modified on 15 June 2020 are displayed |  P m14|  |
| On several days| Enter `on:2020-06-15,2020-06-19` (or any other date) in a folder with many files with different modification dates | Only files modified on 15 June 2020 or 19 June 2020 are displayed  | P m14 |  |
| On several days negative| Enter `-on:2020-06-15,2020-06-19` (or any other date) in a folder with many files with different modification dates | Files not modified on 15 June 2020 or 19 June 2020 are displayed  | P m14 |  |
| Current year | Enter `:year` and `:y` in a folder with many files with different modification dates form different years | Files modified the current year are displayed  |  P m14|  |
| Current year negative | Enter `-:year` and `-:y` in a folder with many files with different modification dates form different years | Files not modified the current year are displayed  |  P m14|  |
| Current month | Enter `:month` and `:m` in a folder with many files with different modification dates from different months | Files modified the current month are displayed  |  P m14|  |
| Current month negative | Enter `-:month` and `-:m` in a folder with many files with different modification dates from different months | Files not modified the current month are displayed  |   P m14|  |
| Current week | Enter `:week` in a folder with many files with different modification dates from different weeks | Files modified the current week are displayed  |  P m14|  |
| Current week negative | Enter `-:week` in a folder with many files with different modification dates from different weeks | Files not modified the current week are displayed  | P m14 |  |
| Current day | Enter `:day` in a folder with many files with different modification dates from different days | Files modified today are displayed  | F m14 | Not working |
| Current week negative | Enter `-:day` in a folder with many files with different modification dates from different days | Files not modified today are displayed  | F m14 | Not working |
| Last 2 months | Enter `:2m` in a folder with many files with different modification dates  | Files modified last 2 months displayed  | P m14 |    |
| Last 2 months negative | Enter `:2m` in a folder with many files with different modification dates  | Files modified last 2 months displayed  | P m14 |   |
| Last 2 weeks | Enter `:2w` in a folder with many files with different modification dates  | Files modified last 2 weeks displayed  | P m14 |  |
| Last 2 weeks negative | Enter `:2w` in a folder with many files with different modification dates  | Files modified last 2 weeks displayed  | P m14 |  |
| Last 2 days | Enter `:2d` in a folder with many files with different modification dates  | Files modified last 2 days displayed  | P m14 |  |
| Last 2 days negative | Enter `:2d` in a folder with many files with different modification dates  | Files modified last 2 days displayed  |P m14 |  |
| **Check results** |   |  |
| File | 1. Enter anything searching criteria that returns file in the results2. Click the blue arrow on a file from the results  | File is highlighted inside its containing folder  |P m14 |  |
| Folder | 1. Enter anything searching criteria that returns a folder in the results<br>2. Click the blue arrow on a folder from the results  | Folder is highlighted inside its containing folder  |P m14 |  |