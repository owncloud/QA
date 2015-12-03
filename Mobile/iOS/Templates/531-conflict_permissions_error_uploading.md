###  Summary 

#### Pr: https://github.com/owncloud/ios/pull/XXX 


---

 
| Test case     | Steps           | Expected behavior | Passed / failed | Comments
|:------------- |:---------------|:-------------|-------------:|-------------:
| **Case 1**
|  Document provider upload with conflict|  1. A user1 shares a folder without permissions (share, edit) with user2. There is at least a text file in the folder <br>2. Login with user2 and edit the text file using the document provider<br> 3. Open again oC<br> 4. Resolve the conflict by choosing another folder | 3. The file appears with yellow arrow, and a premission conflict is shown in uploads view<br> 4. The original file is marked with green arrow and has not changed. The modified file is saved in the correct location. The conflict disappears from uploads view    | 
|  Cancel| 1. Modify again the same file as in previous test case using document provider<br> 2. When the conflict is shown, resolve it with \"cancel\" | 2. The original file keeps on with yellow arrow    | 
|  Without connection|  1. Switch off the device network <br>2. Modify again the same file as in previous test cases using document provider<br> 3. Switch on the device network <br>4. Resolve the conflict by choosing another location  | 2. The file appears with yellow arrow<br> 3. A permission conflict is shown in uploads view and the original file stays with yellow arrow.<br> 4. The original file is marked with green arrow. The modified file is saved in the correct location. The conflict disappears from uploads view    | 

