###  Naming Improvements

#### Pr: https://github.com/owncloud/ios-app/pull/430

Devices: iPhoneX v12, iPadAir v12<br>
Server: 10.2.1

---

 
| Test Case | Steps | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- | 
|**Create folder**|||||
| Existing name | Create a folder called "New Folder"<br>Try to create a new one | New Folder 2 is suggested | P m12 t12|  |  |
| Submit existing name | Create a folder called "New Folder"<br>Try to create a new one with the same name | Correct error | P m12 t12|  |  |
|**Duplicate**|||||
| Duplicate 1 | Duplicate a file called File.txt | Duplicated with name File 2.txt  | P m12 t12|  |  |
| Duplicate 2 | Duplicate a file called File (1).txt | Duplicated with name File (2).txt  | P m12 t12 |  |  |
| Duplicate conflict | Create a file called File 2.txt<br>Duplicate a file called File 1.txt | File 3.txt is created | P m12 t12|  |  |
|**Uploads**|||||
| #377 | Upload a whole album | Everything uploaded with no conflicts | P m12 t12|  |  |
| Existing name | Upload twice the same file | Second file renamed with (2) | P m12 t12|  |  |
| Conflict | Create a file with name File (2)<br>Upload twice a file called "File" | We have File, File (2) and File (3) | P m12 t12|  |  |
|**Extra**|||||
| SDK commit | Open Settings view | At the bottom appears the SDK commit, apart of the app commit  | P m12 t12|  |  |