###  Summary 

#### Pr: https://github.com/owncloud/ios/pull/531


---

 
Test ID| Test case     | Steps           | Expected result | Result | Comments
|:----|:------------- |:---------------|:-------------|:-------------:|:------------
|1|  Document provider upload with conflict|  1. A user1 shares a folder without permissions (share, edit) with user2. There is at least a text file in the folder <br>2. Login with user2 and edit the text file using the document provider<br> 3. Open again oC<br> 4. Resolve the conflict by choosing another folder | 3. The file appears with yellow arrow, and a premission conflict is shown in uploads view<br> 4. The original file is marked with green arrow and has not changed. The modified file is saved in the correct location. The conflict disappears from uploads view    | 
|2|  Cancel| 1. Modify again the same file as in previous test case using document provider<br> 2. When the conflict is shown, resolve it with \"cancel\" | 2. The original file keeps on with yellow arrow    | 
|3|  Without connection|  1. Switch off the device network <br>2. Modify again the same file as in previous test cases using document provider<br> 3. Switch on the device network <br>4. Resolve the conflict by choosing another location  | 2. The file appears with yellow arrow<br> 3. A permission conflict is shown in uploads view and the original file stays with yellow arrow.<br> 4. The original file is marked with green arrow. The modified file is saved in the correct location. The conflict disappears from uploads view    | 
|4| Upload twice + overwrite + cancel | 1. Upload a file to a folder <br> 2. Set this file as favourite <br>3. Upload the same file to the same folder <br>4. Resolve the conflict with "overwriten"<br> 5. Cancel the upload before it ends| 3. In uploads view there is a conflict. The file is shown with grey star<br> 4. and 5. The file has yellow star 
|5| Upload twice + rename + cancel| 1. Make the same first 3 steps as test id 4<br> 2. Resolve the conflict with "rename" <br> 3. Cancel the upload| 1. The file is marked with grey star until the conflict is resolved<br> 3. The original file has yellow star, the second is not uploaded 
|6| Upload twice + no connection + cancel| 1. Make the same first 4 steps as test id 4 <br>2. Switch the network device off before the upload ends<br> 3. Cancel the upload<br>| 1. The file is marked with grey star until the conflict is resolved<br> 3. The file has yellow star