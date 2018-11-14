#### Login branded

#### PRs: 

Device/s: <br>
Server: 

Number of tests: <br>
Number of automated tests:   <br>
Coverage: <br>


---

 
| Test Case | Steps | Expected Result | Result | Related Comment
|:---------:| :---- | :-------------- | :----- | :------------: |
|**URL**||||||
| Default URL | Set a default URL in customization file | URL correct in app | P m12 |  |
| Non-Editable URL | Set the URL as non-editable | URL can not be changed | P m12 |  |
| Hidden URL | Set the URL as hidden | URL not visible | F m12 | Missing hostname |
| Button with hidden URL | Set the URL as hidden and open the app| Button with Connect instead of Continue | NA |  |
|**Server name**||||||
| Default Name | Set a default Name in customization file | Name correct in app | P m12 |  |
| Non-Editable Name | Set the Name as non-editable | Name can not be changed | P m12 |  |
| Hidden Name | Set the Name as hidden | Name not visible | P m12 |  |
|**OAuth2**||||||
| Correct parameters | Set correct clientID, secretID and client name in customization file | Correct connection in app | NA | SDK involvement |
| Incorrect parameters | Set incorrect clientID, secretID and client name in customization file | Connection fails | NA | SDK involvement |
|**Multiaccount**||||||
| Multiaccount disabled | Add an account | In server list, the '+' does not appear, no more accounts to be added |  |  |
|**Colors**||||||
| Font color | Set a different color in customization file for the bookmarks view | Correct color |  |  |
| Button background color | Set a different color in customization file for the buttons | Correct color |  |  |
| Cell background color | Set a different color in customization file for the cells | Correct color |  |  |