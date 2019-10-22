###  Document Scanner

#### Pr: https://github.com/owncloud/ios-app/pull/494

Devices: <br>
Server: 

---

 
| Test Case | Steps | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- | 
|**One page**|||||||
| Correct scan PDF | Open "+" and select scan document<br>Scan a document<br>Set a correct name and PDF as format | Correct scanned as pdf | P m13 |  |  |
| Correct scan JPEG | Open "+" and select scan document<br>Scan a document<br>Set a correct name and JPEG as format | Correct scanned as jpeg | P m13 |  |  |
| Correct scan PNG | Open "+" and select scan document<br>Scan a document<br>Set a correct name and PNG as format | Correct scanned as png | P m13  |  |  |
|**Multiple pages**|||||||
| Correct scan PDF - 1 doc | Open "+" and select scan document<br>Scan several documents<br>Set a correct name and PDF as format<br>Disable "Create one file per page" | Correct scanned as pdf, and everything in the same pdf file |  |  |  
| Correct scan PDF - several doc | Open "+" and select scan document<br>Scan several documents<br>Set a correct name and PDF as format<br>Enable "Create one file per page" | Correct scanned as pdf<br>One file for every scanned document is created  |  |  |  |
| Correct scan JPEG  | Open "+" and select scan document<br>Scan several documents<br>Set a correct name and PNG as format | Correct scanned as jpeg<br>Every document in a different file, no option available to set in the same file |  |  |  |
| Correct scan PNG  | Open "+" and select scan document<br>Scan several documents<br>Set a correct name and PNG as format | Correct scanned as png<br>Every document in a different file, no option available to set in the same file |  |  |  |
|**Name**|||||||
| Default name | Open "+" and select scan document<br>Scan a document<br>Let the default name | File saved with such name |  |  |  |
| New name | Open "+" and select scan document<br>Scan a document<br>Set another name | File saved with such name |  |  |  |
| Existing name | Open "+" and select scan document<br>Scan a document<br>Set another existing name in the current folder | File saved with such name adding a sequential number |  |  |  |
| Empty name | Open "+" and select scan document<br>Scan a document<br>Set an empty name | Not posible |  |  |  |