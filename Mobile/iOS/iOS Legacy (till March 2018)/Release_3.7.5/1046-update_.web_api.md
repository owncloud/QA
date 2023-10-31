#### Update Web API 

#### Pr: https://github.com/owncloud/ios/pull/1046 

Devices: iPhoneX v11.3, iPadAir v11<br>
Server: 10.0.7

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :------ |
|**HTML**||||||
| 1 | HTML | Open a basic html file | File is correctly displayed in both orientations |P m11 t11 m10 | |
| 2 | HTML with form | 1. Open a html file that contains a form<br>2. Try to send data through the form | No request is sent | P m11 t11 m10| |
| 3 | HTML renamed | Rename a HTML file with other extension, for example PDF<br>Open the file | Any request is sent |  P m11 t11 m10| |
| 4 | HTML with JS |  1. Open a html file that contains a form<br>2. Try to send data through the form | No request is sent | P m11 t11 m10 | | |
|**Files Preview (regression)**||||||
| 5 | XLS | Open a XLS file | File is correctly displayed in both orientations | P m11 t11 m10| FIXED: not opened in iPad |
| 6 | XLSX | Open a XLSX file | File is correctly displayed in both orientations | P m11 t11 m10| FIXED: double tap to open in iPhone |
| 7 | DOC | Open a DOC file | File is correctly displayed in both orientations | P m11 t11 m10| |
| 8 | DOCX | Open a DOCX file | File is correctly displayed in both orientations | P m11 t11 m10| |
| 9 | PPT | Open a PPT file | File is correctly displayed in both orientations | P m11 t11 m10| |
| 10 | PPTX | Open a PPTX file | File is correctly displayed in both orientations | P m11 t11 m10| |
| 11 | PDF | Open a PDF file | File is correctly displayed in both orientations | P m11 t11 m10| |
| 12 | TXT | Open a TXT file | File is correctly displayed in both orientations | P m11 t11 m10| |
| 13 | JPG | Open a JPG file | File is correctly displayed in both orientations | P m11 t11 m10| |

