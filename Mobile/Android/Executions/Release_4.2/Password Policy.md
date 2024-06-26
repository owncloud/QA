### Password Policy


**Server(s)**: oCIS 5.0-beta.1, oCIS 4.0, oC10.13.4<br>
**Device(s)**: Pixel 2 Android 11, Samsung Tab Android 13<br>
**Execution date**: 17/01/2024<br>
**Tester**: jrecio<br>
**Context**: <br>


Preconditions: 

- Link creation page opened with password enabled
 
| Test Case | Steps | Expected | Result | Related Comment / Defect | 
| :-------- | :---- | :------- | :----: | :----------------------- | 
|**Feature support**||||||
| No password policy | 1. Open the links view in a oC10 server that does not support password policy<br>2. Open the links view in a oCIS server that does not support password policy | 1. Criteria are not displayed and don't block the feature<br>2. Criteria are not displayed and don't block the feature| P m11 |  |
| Parameter to zero | 1. Create a oCIS server adding any variable that sets password policy to `0`, for example: `OCIS_PASSWORD_POLICY_MIN_UPPERCASE_CHARACTERS: "0"`<br>2. Open public link view and type characters<br>3. Repeat with other [variables](https://github.com/owncloud/ocis/tree/master/services/frontend#the-password-policy) | 2. Min uppercase is not listed as criteria<br>3. Criteria with `0` not listed |  P m11 |  |
|**Individual Parameters**||||||
| `min_characters` | 1. Type a number of characters lower than the minimum<br>2. Type a number of characters equal than the minimum<br>3. Type a number of characters greater than the minimum | 1. `At least x characters long` is ticked on red<br>2. `At least x characters long` is ticked on green<br>3. `At least x characters long` is ticked on green|  P m11 |  |
| `uppercase` | 1. Type a number of uppercase characters lower than the minimum<br>2. Type a number of uppercase characters equal than the minimum<br>3. Type a number of uppercase characters greater than the minimum | 1. `At least x uppercase characters ` is ticked on red<br>2. `At least x uppercase characters` is ticked on green<br>3. `At least x uppercase characters` is ticked on green| P m11|  |
| `lowercase` | 1. Type a number of lowercase characters lower than the minimum<br>2. Type a number of lowercase characters equal than the minimum<br>3. Type a number of lowercase characters greater than the minimum | 1. `At least x lowercase characters ` is ticked on red<br>2. `At least x lowercase characters` is ticked on green<br>3. `At least x lowercase characters` is ticked on green| P m11|  |
| `special` | 1. Type a number of special characters lower than the minimum<br>2. Type a number of special characters equal than the minimum<br>3. Type a number of special characters greater than the minimum<br>Special characters: `!#\$%&'()*+,-./:;<=>?@[\]^_\{\|}~` | 1. `At least x special characters ` is ticked on red<br>2. `At least x special characters` is ticked on green<br>3. `At least x special characters` is ticked on green|  P m11 |  |
| No `special` | 1. Type some non-special characters like `+`, `π` | Special characters counter does not take these characters in account | P m11 |  |
| `numbers` | 1. Type a number of number characters lower than the minimum<br>2. Type a number of number characters equal than the minimum<br>3. Type a number of number characters greater than the minimum | 1. `At least x numbers ` is ticked on red<br>2. `At least x numbers` is ticked on green<br>3. `At least x numbers` is ticked on green| P m11|  |
| `max_characters` | 1. Type a number of characters lower than the maximum<br>2. Type a number of characters equal than the maximum<br>3. Type a number of characters greater than the maximum | 1. `At most x characters long` is ticked on green<br>2. `At most x characters long` is ticked on green<br>3. `At most x characters long` is ticked on red| P m11 |  |
| banned list | 1. Type a password that is banned in server but fulfills all syntactic criteria<br>2. Click on `SEND` | Error: `Unfortunately, `<br>`your password in commonly used`  | P m11 |  |
|**Global parameters**||||||
| Not all criteria matched | 1. Type a password that does not match any criteria<br>1. Type a password that match some criteria and not match other criteria  | 1. `SAVE` button locked <br>2. `SAVE` button locked | P m11 |  |
| All criteria matched | 1. Type a password that matchs all criteria | `SAVE` button unlocked  | P m11 |  |
| Changes | 1. Type a password that matchs all criteria<br>2. Remove some characters from password that make some criteria not to match | 1. All criteria in green and `SAVE` unlocked<br>2. Criteria turns to red again and `SAVE` locked<br> | P m11 |  |
|**Edition**||||||
| Password edition | 1. Create a link with correct password<br>2. Open the link to edit the password<br>3. Add another valid password different to the added in step 1.<br>4. Click on `SEND`<br>5. Copy the link and open it in a browser<br>6. Type password from step 3. | Item is displayed in browser | P m11 |  |
