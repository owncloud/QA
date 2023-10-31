###  Document Scanner

#### Pr: https://github.com/owncloud/ios-app/pull/494

Devices: iPhoneX v13.1, iPadPro v13.1 <br>
Server: 10.3

---

 
| Test Case | Steps | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- | 
|**One page**|||||||
| Correct scan PDF | Open "+" and select scan document<br>Scan a document<br>Set a correct name and PDF as format | Correct scanned as pdf | P m13 t13|  |  |
| Correct scan JPEG | Open "+" and select scan document<br>Scan a document<br>Set a correct name and JPEG as format | Correct scanned as jpeg | P m13 t13 |  |  |
| Correct scan PNG | Open "+" and select scan document<br>Scan a document<br>Set a correct name and PNG as format | Correct scanned as png | P m13 t13  |  |  |
|**Multiple pages**|||||||
| Correct scan PDF - 1 doc | Open "+" and select scan document<br>Scan several documents<br>Set a correct name and PDF as format<br>Disable "Create one file per page" | Correct scanned as pdf, and everything in the same pdf file | P m13 t13 |  |  
| Correct scan PDF - several doc | Open "+" and select scan document<br>Scan several documents<br>Set a correct name and PDF as format<br>Enable "Create one file per page" | Correct scanned as pdf<br>One file for every scanned document is created  | P m13 t13 |  |  |
| Correct scan JPEG  | Open "+" and select scan document<br>Scan several documents<br>Set a correct name and PNG as format | Correct scanned as jpeg<br>Every document in a different file, no option available to set in the same file | P m13 t13 |  |  |
| Correct scan PNG  | Open "+" and select scan document<br>Scan several documents<br>Set a correct name and PNG as format | Correct scanned as png<br>Every document in a different file, no option available to set in the same file | P m13 t13 |  |  |
| Scan addtitional  | Open "+" and select scan document<br>Scan one document<br>Select "Scan additional"<br>Scan other document | Both documents scanned, as same as they were taken before saving | P m13 t13|  |  |
|**Name**|||||||
| Default name | Open "+" and select scan document<br>Scan a document<br>Let the default name | File saved with such name | P m13 t13 |  |  |
| New name | Open "+" and select scan document<br>Scan a document<br>Set another name | File saved with such name | P m13 t13 |  |  |
| Existing name | Open "+" and select scan document<br>Scan a document<br>Set another existing name in the current folder | File saved with such name adding a sequential number | P m13 t13 |  |  |
| Empty name | Open "+" and select scan document<br>Scan a document<br>Set an empty name | Not posible | P m13 t13 | FIXED: Saved as (1) |  |