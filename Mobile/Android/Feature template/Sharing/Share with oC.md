### Share with oC


Server(s): <br>
Device(s): <br>
Execution date: <br>
Tester:  <br>
Context: <br>


 
| Test Case | Steps | Expected | Result | Related Comment / Defect | 
| :-------- | :---- | :------- | :----: | :------------------------- | 
|**Share file**||||||
| One file - One account | 1. Open a 3rd party app (like "Photos") and select one item<br>2. Share with oC<br>3. Upload in root folder<br>4. Open "Uploads" in the bottom bar | 2. Root folder listed<br>3. File upload to root<br>4. Upload visible as "UPLOADED" |  |  |
| One file - Multiaccount | 1. Add two accounts to the app<br>2. Open a 3rd party app (like "Photos") and select one item<br>3. Share with oC<br>4. Choose one account and upload to root folder<br>5. Open "Uploads" in the bottom bar | 3. Dialog to select account is displayed<br>4. File upload to root<br>5. Upload visible as "UPLOADED" |  |  |
| Several files - One account | 1. Open a 3rd party app (like "Photos") and select several items<br>2. Share with oC<br>3. Upload in non-root folder<br>4. Open "Uploads" in the bottom bar | 2. Root folder listed<br>3. Files upload to non-root<br>4. Uploads visible as "UPLOADED" |  |  |
| Several files - Multiaccount | 1. Add two accounts to the app<br>2. Open a 3rd party app (like "Photos") and select one item<br>3. Share with oC<br>4. Choose one account and upload to non-root folder<br>5. Open "Uploads" in the bottom bar | 3. Dialog to select account is displayed<br>4. Files upload to non-root<br>5. Uploads visible as "UPLOADED" |  |  |
|**Share text**||||||
| Share text root - One account | 1. Open a 3rd party app with text(web Browser)<br>2. Select text and share with oC<br>3. Upload in root folder<br>4. Enter a name for the txt file<br>5. Open "Uploads" in the bottom bar | 2. Root folder listed<br>4. File upload to root with the given name<br>5. Upload visible as "UPLOADED" |  |  |
| Share text non-root - Multiaccount | 1. Add two accounts to the app<br>2. Open a 3rd party app with text(web Browser)<br>3. Select text and share with oC<br>4. Choose one of the accounts and upload in non-root folder<br>5. Enter a name for the txt file<br>6. Open "Uploads" in the bottom bar | 4. Root folder listed<br>5. File upload to root with the given name<br>5. Upload visible as "UPLOADED" |  |  |
| Forbidden characters | 1. Open a 3rd party app with text(web Browser)<br>2. Select text and share with oC<br>3. Upload in root folder<br>4. Enter a name for the txt file including forbidden characters like "/" or "\\" | Error: `Forbidden characters: / \`<br>Upload button locked |  |  |
| Log txt name | 1. Open a 3rd party app with text(web Browser)<br>2. Select text and share with oC<br>3. Upload in root folder<br>4. Enter a very long name for the txt file (longer than 223) | Error: `Filename must not be longer than`<br>`223 characters`<br>Upload button locked |  |  |
