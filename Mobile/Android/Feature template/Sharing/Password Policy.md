### Password Policy


**Server(s)**: <br>
**Device(s)**: <br>
**Execution date**: <br>
**Tester**: <br>
**Context**: <br>


Preconditions: 

- Link creation page opened with password enabled
 
| Test Case | Steps | Expected | Result | Related Comment / Defect | 
| :-------- | :---- | :------- | :----: | :----------------------- | 
|**Feature support**||||||
| No password policy | 1. Open the links view in a oC10 server that does not support password policy<br>2. Open the links view in a oCIS server that does not support password policy | 1. Criteria are not displayed and don't block the feature<br>2. Criteria are not displayed and don't block the feature| |  |
| Parameter to zero | 1. Create a oCIS server adding any variable that sets password policy to `0`, for example: `OCIS_PASSWORD_POLICY_MIN`<br>`_UPPERCASE_CHARACTERS: "0"`<br>2. Open public link view and type characters<br>3. Repeat with other [variables](https://github.com/owncloud/ocis/tree/master/services/frontend#the-password-policy) | 2. Min uppercase is not listed as criteria<br>3. Criteria with `0` not listed |   |  |
|**Individual Parameters**||||||
| `min_characters` | 1. Type a number of characters lower than the minimum<br>2. Type a number of characters equal than the minimum<br>3. Type a number of characters greater than the minimum | 1. `At least x characters long` is ticked on red<br>2. `At least x characters long` is ticked on green<br>3. `At least x characters long` is ticked on green| |  |
| `uppercase` | 1. Type a number of uppercase characters lower than the minimum<br>2. Type a number of uppercase characters equal than the minimum<br>3. Type a number of uppercase characters greater than the minimum | 1. `At least x uppercase characters ` is ticked on red<br>2. `At least x uppercase characters` is ticked on green<br>3. `At least x uppercase characters` is ticked on green| |  |
| `lowercase` | 1. Type a number of lowercase characters lower than the minimum<br>2. Type a number of lowercase characters equal than the minimum<br>3. Type a number of lowercase characters greater than the minimum | 1. `At least x lowercase characters ` is ticked on red<br>2. `At least x lowercase characters` is ticked on green<br>3. `At least x lowercase characters` is ticked on green| |  |
| `special` | 1. Type a number of special characters lower than the minimum<br>2. Type a number of special characters equal than the minimum<br>3. Type a number of special characters greater than the minimum<br>Special characters: `!#\$%&'()*+,-./:;<=>?@[\]^_\{\|}~`  | 1. `At least x special characters ` is ticked on red<br>2. `At least x special characters` is ticked on green<br>3. `At least x special characters` is ticked on green| |  |
| No `special` | 1. Type some non-special characters like `+`, `π` | Special characters counter does not take these characters in account | |  |
| `numbers` | 1. Type a number of number characters lower than the minimum<br>2. Type a number of number characters equal than the minimum<br>3. Type a number of number characters greater than the minimum | 1. `At least x numbers ` is ticked on red<br>2. `At least x numbers` is ticked on green<br>3. `At least x numbers` is ticked on green| |  |
| `max_characters` | 1. Type a number of characters lower than the maximum<br>2. Type a number of characters equal than the maximum<br>3. Type a number of characters greater than the maximum | 1. `At most x characters long` is ticked on green<br>2. `At most x characters long` is ticked on green<br>3. `At most x characters long` is ticked on red| |  |
| banned list | 1. Type a password that is banned in server but fulfills all syntactic criteria<br>2. Click on `SAVE` | Error: `Unfortunately, `<br>`your password in commonly used`  |  |  |
|**Global parameters**||||||
| Not all criteria matched | 1. Type a password that does not match any criteria<br>1. Type a password that match some criteria and not match other criteria  | 1. `SAVE` and `COPY` buttons locked <br>2. `SAVE` and `COPY` buttons locked |  |  |
| All criteria matched | 1. Type a password that matchs all criteria | `SAVE` and `COPY` buttons unlocked  |  |  |
| Changes | 1. Type a password that matchs all criteria<br>2. Remove some characters from password that make some criteria not to match | 1. All criteria in green, `SAVE` and `COPY` unlocked<br>2. Criteria turns to red again, `SAVE` and `COPY` locked<br> |  |  |
|**Password generator**| Uses the server policies|||||
| `min characters` | 1. Set 12 as a minimum number of characters in server<br>2. Click on `generate`| Generated password contains at least 12 characters | |  |
| `max characters` | 1. Set 100 as a max number of characters in server<br>2. Click on `generate`| Generated password contains minus than 100 characters | |  |
| `uppercase` | 1. Set 3 as a minimum number of uppercase characters in server<br>2. Click on `generate`| Generated password contains at least 3 uppercase characters | |  |
| `lowercase` | 1. Set 3 as a minimum number of lowercase characters in server<br>2. Click on `generate`| Generated password contains at least 3 lowercase characters| |  |
| `special` | 1. Set 3 as a minimum number of special characters in server<br>2. Click on `generate`| Generated password contains at least 3 special characters| |  |
| `numbers` | 1. Set 3 as a minimum number of numbers in server<br>2. Click on `generate`| Generated password contains at least 3 numbers| |  |
| All together | 1. Set 3 as a minimum number of lowercase, uppercase, special chars and numbers in server, with 12 minimum and 100 maximum<br>2. Click on `generate`| Generated password contains at least 3 lowercase, 3 uppercase, 3 special characters and 3 numbers, is longer that 12 chars and shorter than 100| |  |
| Copy | 1. Click on `generate`<br>2. Click on `Copy`|  1. Copy button is enabled<br>2. Generated password is copied to the clipboard and can be pasted | |  |
|**Edition**||||||
| Password edition | 1. Create a link with correct password<br>2. Open the link in the app to edit the password<br>3. Add another valid password different to the added in step 1.<br>4. Click on `SAVE`<br>5. Copy the link and open it in a browser<br>6. Type password from step 3. | Item is displayed in browser |  |  |
