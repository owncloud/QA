###  QLPreview

#### Pr: https://github.com/owncloud/ios-app/pull/493

Devices: iPhone 6SPlus v13.1<br>
Server: 10.2.1

---

 
| Test Case | Steps | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- | 
|**Previews docs**|||||||
| pdf | Preview a pdf document | Correct preview | P m13 |  |
| txt | Preview a txt document | Correct preview | F m13 | Landscape mode, not centered |
| doc | Preview a doc document | Correct preview | F m13 | Landscape mode, not centered |
| docx | Preview a docx document | Correct preview | P m13 |  |
| xls | Preview a xls document | Correct preview | P m13 |  |
| xlsx | Preview a xlsx document | Correct preview | P m13 |  |
| xsl | Preview a xsl document | Correct preview | F m13 | Blank |
| ppt | Preview a ppt document | Correct preview | P m13 |  |
| pptx | Preview a pptx document | Correct preview | P m13 |  |
| html | Preview a html document | Correct preview | P m13 |  |
| rtf | Preview a rtf document | Correct preview | P m13 |  |
| xml | Preview a xml document (as non-downloadable format) | Correct preview | P m13 | FIXED: Info missed |
|**Previews media**|||||||
| jpg | Preview a jpg document | Correct preview | F m13 | Bad landscape.Not previewed |
| png | Preview a png document | Correct preview | P m13 |  |
| svg | Preview a svg document | Correct preview | NA |  |
| tiff | Preview a tiff document | Correct preview | P m13 |  |
| heic | Preview a heic document | Correct preview | P m13 |  |
| heiv | Preview a heiv document | Correct preview | P m13 |  |
| mp4 | Preview a mp4 document | Correct preview | P m13  |  |
| avi | Preview a avi document | Correct preview | P m13 |  |
| gif | Preview a gif document | Correct preview | F m13 | FIXED: Not animated |
| mp3 | Preview a mp3 document | Correct preview | P m13 |  |
|**Previews thumbnails**|||||||
| jpg | List a folder with jpg file | Correct preview of the thumbnail | P m13 |  |
| png | List a folder with jpg file | Correct preview of the thumbnail | P m13 |  |