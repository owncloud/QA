### Password Policy


**Server(s)**: oCIS 5.0<br>
**Device(s)**: iPhoneXR iOS17.4.1<br>
**Execution date**: 26/03/2024<br>
**Tester**: jrecio<br>
**Context**: <br>


Preconditions: 

- Link creation page opened with password enabled
 
| Test Case | Steps | Expected | Result | Related Comment / Defect | 
| :-------- | :---- | :------- | :----: | :----------------------- | 
|**Feature support**||||||
| No password policy | 1. Open the links view in a oC10 server that does not support password policy<br>2. Open the links view in a oCIS server that does not support password policy | 1. Criteria are not displayed and don't block the feature<br>2. Criteria are not displayed and don't block the feature| P m17 | `Generate` button to be removed |
| Parameter to zero | 1. Create a oCIS server adding any variable that sets password policy to `0`, for example: `OCIS_PASSWORD_POLICY_MIN_UPPERCASE_CHARACTERS: "0"`<br>2. Open public link view and type characters<br>3. Repeat with other [variables](https://github.com/owncloud/ocis/tree/master/services/frontend#the-password-policy) | 2. Min uppercase is not listed as criteria<br>3. Criteria with `0` not listed |   |  |
|**Individual Parameters**||||||
| `min_characters` | 1. Type a number of characters lower than the minimum<br>2. Type a number of characters equal than the minimum<br>3. Type a number of characters greater than the minimum | 1. `At least x characters long` is ticked on red<br>2. `At least x characters long` is ticked on green<br>3. `At least x characters long` is ticked on green| P m17|  |
| `uppercase` | 1. Type a number of uppercase characters lower than the minimum<br>2. Type a number of uppercase characters equal than the minimum<br>3. Type a number of uppercase characters greater than the minimum | 1. `At least x uppercase characters ` is ticked on red<br>2. `At least x uppercase characters` is ticked on green<br>3. `At least x uppercase characters` is ticked on green| P m17 |  |
| `lowercase` | 1. Type a number of lowercase characters lower than the minimum<br>2. Type a number of lowercase characters equal than the minimum<br>3. Type a number of lowercase characters greater than the minimum | 1. `At least x lowercase characters ` is ticked on red<br>2. `At least x lowercase characters` is ticked on green<br>3. `At least x lowercase characters` is ticked on green| P m17 |  |
| `special` | 1. Type a number of special characters lower than the minimum<br>2. Type a number of special characters equal than the minimum<br>3. Type a number of special characters greater than the minimum<br>Special characters: `!#\$%&'()*+,-./:;<=>?@[\]^_\{\|}~`  | 1. `At least x special characters ` is ticked on red<br>2. `At least x special characters` is ticked on green<br>3. `At least x special characters` is ticked on green| P m17 |  |
| No `special` | 1. Type some non-special characters like  `π` | Special characters counter does not take these characters in account | P m17 |  |
| `numbers` | 1. Type a number of number characters lower than the minimum<br>2. Type a number of number characters equal than the minimum<br>3. Type a number of number characters greater than the minimum | 1. `At least x numbers ` is ticked on red<br>2. `At least x numbers` is ticked on green<br>3. `At least x numbers` is ticked on green| P m17 |  |
| `max_characters` | 1. Type a number of characters lower than the maximum<br>2. Type a number of characters equal than the maximum<br>3. Type a number of characters greater than the maximum | 1. `At most x characters long` is ticked on green<br>2. `At most x characters long` is ticked on green<br>3. `At most x characters long` is ticked on red| P m17 |  |
| banned list | 1. Type a password that is banned in server but fulfills all syntactic criteria<br>2. Click on `SEND` | Error: `Unfortunately, `<br>`your password in commonly used`  | P m17 |  |
| Generate - Share | 1. Click on the `Generate` button<br>2. Click on `SHARE`<br>3. Select `Mail` |  2. Share sheet open<br>3. Check in the mail body that the password is attache to the link| P m17 |  |
| Generate - Create | 1. Click on the `Generate` button<br>2. Click on `CREATE` | Link is saved with password (check in web) | P m17 |  |
|**Global parameters**||||||
| Not all criteria matched | 1. Type a password that does not match any criteria<br>2. Type a password that match some criteria and not match other criteria  | 1. `Set` button locked <br>2. `Set` button locked | P m17 | |
| All criteria matched | 1. Type a password that matchs all criteria | `Set` button unlocked  | P m17 |  |
| Changes | 1. Type a password that matchs all criteria<br>2. Remove some characters from password that make some criteria not to match | 1. All criteria in green and `Set` unlocked<br>2. Criteria turns to red again and `Set` locked<br> | P m17 |  |
|**Edition**||||||
| Password edition | 1. Create a link with correct password<br>2. Open the link in the app to edit the password<br>3. Add another valid password different to the added in step 1.<br>4. Click on `Set` and `Save changes`<br>5. Copy the link and open it in a browser<br>6. Type password from step 3. | Item is displayed in browser | F m11 | Generation after removing existing makes the password not recoverable |
