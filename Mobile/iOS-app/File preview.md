#### File preview (but PDF)

#### Pr: https://github.com/owncloud/ios-app/pull/114 

Device/s: iPhone6SPlus v11, iPadAir v12 <br>
Server: 10.0.10

Number of tests: 24<br>
Number of automated tests: <br>
Coverage: <br>

---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | Automated |
| :-------- | :---- | :------- | :----: | :------------------------- | :-------: |
| HTML | Open a basic html file | File is correctly displayed in both orientations | P m11 t12 | |
| XLS | Open a XLS file | File is correctly displayed in both orientations. Check tabs | P m11  t12 |  |
| XLSX | Open a XLSX file | File is correctly displayed in both orientations. Check tabs | P m11  t12 | |
| DOC | Open a DOC file | File is correctly displayed in both orientations | P m11 t12 | |
| DOCX | Open a DOCX file | File is correctly displayed in both orientations | P m11 t12 | |
| RTF | Open a RTF file | File is correctly displayed in both orientations | P m11 t12 | |
| XML | Open a XML file | File is correctly displayed in both orientations | F m11 t12 | |
| PPT | Open a PPT file | File is correctly displayed in both orientations | P m11 t12 | |
| PPTX | Open a PPTX file | File is correctly displayed in both orientations | P m11 t12 | |
| TXT | Open a TXT file | File is correctly displayed in both orientations | P m11 t12 | |
| TEX | Open a TEX file | File is correctly displayed in both orientations | F m11 t12 | |
| ODT | Open a ODT file | File is correctly displayed in both orientations | F m11 t12 | |
| JPG | Open a JPG file | File is correctly displayed in both orientations | P m11 t12 | improvable |
| GIF | Open a GIF file | File is correctly displayed in both orientations | P m11 t12 | improvable |
| MOV | Open a MOV file | File is correctly displayed in both orientations | P m11 t12 | |
| MP4 | Open a MP4 file | File is correctly displayed in both orientations | P m11 t12 | |
| AVI | Open a AVI file | File is correctly displayed in both orientations | F m11 t12 | |
| FLV | Open a FLV file | File is correctly displayed in both orientations | F m11 t12 | |
| WMV | Open a WMV file | File is correctly displayed in both orientations | F m11 t12 | |
| OGV | Open a OGV file | File is correctly displayed in both orientations | F m11 t12 | |
| MP3 | Open a MP3 file | File is correctly displayed in both orientations | P m11 t12 | |
| Non-openable file | Open a non-openable file | Placehoder shown | P m11 t12 | |
| Cancel download | Open a file<br>Cancel download | Correct view.<br>Option to open again | F m11 t12  | Button open file enabled|
| Connection lost | Open a file<br>Switch connection off during download| Correct view.<br>Option to open again | F m11 t12  | Button open file enabled |
