###  Document Scanner

Devices: <br>
Server: 

---

 
| Test Case | Steps | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- | 
|**One document**|||||||
| Correct scan PDF root | 1. In root folder, click on "+" and select `Scan document`<br>2. Scan a document (1 page)<br>Set a correct name and PDF as format | Correct scan as PDF and saved in root folder with the typed name |   |  |  |
| Correct scan JPEG non-root|  1. In non-root folder, click on "+" and select `Scan document`<br>2. Scan a document (1 page)<br>Set a correct name and JPEG as format| Correct scan as JPEG and saved in non-root folder with the typed name |   |  |  |
| Correct scan PNG non-root|  1. In non-root folder, click on "+" and select `Scan document`<br>2. Scan a document (1 page)<br>Set a correct name and PNG as format| Correct scan as PNG and saved in non-root folder with the typed name |   |  |  |
|**Multiple documents**|||||||
| Correct scan PDF -  1 files | 1. Open "+" and select `Scan document`<br>2. Scan several documents and `Save`<br>3. Type a correct name and PDF as format<br>4. Disable "`Create one file per page` | Correct scanned format as PDF. All scanned documents in the same PDF file |   |  |  
| Correct scan PDF - several files | 1. Open "+" and select `Scan document`<br>2. Scan several documents and `Save`<br>3. Type a correct name and PDF as format<br>4. Enable `Create one file per page` | Correct scanned format as PDF<br>One file for every scanned documents  | |  |  |
| Correct scan JPEG  | 1. Open "+" and select `Scan document`<br>2. Scan several documents and `Save`<br>3. Type a correct name and JPEG as format | Correct scanned format as JPEG<br>Every document in a different file<br>No option available to set in the same file |   |  |  |
| Correct scan PNG  | 1. Open "+" and select `Scan document`<br>2. Scan several documents and `Save`<br>3. Type a correct name and PNG as format | Correct scanned format as PNG<br>Every document in a different file, no option available to set in the same file |  |  |  |
| Scan additional  | 1. Open "+" and select `Scan document`<br>2. Scan one document and `Save`<br>3. Select `Scan additional`<br>4. Scan other document and repeat (no matter the format) | Both documents scanned and saved |   |  |  |
|**Name**|||||||
| Default name | 1. Open "+" and select `Scan document`<br>2. Scan a document and `Save`<br>Let the default name | Scanned document saved with default name |   |  |  |
| New name | 1. Open "+" and select `Scan document`<br>2. Scan a document and `Save`<br>3. Type another name | File saved with typed name |  |  |  |
| Existing name | 1. Open "+" and select `Scan document`<br>2. Scan a document and `Save`<br>3. Set another existing name in the current folder | File saved with the typed name adding a sequential number |  |  |  |
| Empty name | 1. Open "+" and select `Scan document`<br>2. Scan a document and `Save`<br>Set an empty name | Not posible |   |  |  |