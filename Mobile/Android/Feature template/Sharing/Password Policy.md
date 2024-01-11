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
|**Individual Parameters**||||||
| `min_characters` | 1. Type a number of characters lower than the minimum<br>2. Type a number of characters equal than the minimum<br>3. Type a number of characters greater than the minimum | 1. `At least x characters long` is ticked on red<br>2. `At least x characters long` is ticked on green<br>3. `At least x characters long` is ticked on green| |  |
| `uppercase` | 1. Type a number of uppercase characters lower than the minimum<br>2. Type a number of uppercase characters equal than the minimum<br>3. Type a number of uppercase characters greater than the minimum | 1. `At least x uppercase characters ` is ticked on red<br>2. `At least x uppercase characters` is ticked on green<br>3. `At least x uppercase characters` is ticked on green| |  |
| `lowercase` | 1. Type a number of lowercase characters lower than the minimum<br>2. Type a number of lowercase characters equal than the minimum<br>3. Type a number of lowercase characters greater than the minimum | 1. `At least x lowercase characters ` is ticked on red<br>2. `At least x lowercase characters` is ticked on green<br>3. `At least x lowercase characters` is ticked on green| |  |
| `special` | 1. Type a number of special characters lower than the minimum<br>2. Type a number of special characters equal than the minimum<br>3. Type a number of special characters greater than the minimum | 1. `At least x special characters ` is ticked on red<br>2. `At least x special characters` is ticked on green<br>3. `At least x special characters` is ticked on green| |  |
| `numbers` | 1. Type a number of number characters lower than the minimum<br>2. Type a number of number characters equal than the minimum<br>3. Type a number of number characters greater than the minimum | 1. `At least x numbers ` is ticked on red<br>2. `At least x numbers` is ticked on green<br>3. `At least x numbers` is ticked on green| |  |
| `max_characters` | 1. Type a number of characters lower than the maximum<br>2. Type a number of characters equal than the maximum<br>3. Type a number of characters greater than the maximum | 1. `At most x characters long` is ticked on green<br>2. `At most x characters long` is ticked on green<br>3. `At most x characters long` is ticked on red| |  |
|**Global parameters**||||||
| Not all criteria matched | 1. Type a password that does not match any criteria<br>1. Type a password that match some criteria and not match other criteria  | 1. `SAVE` button locked <br>2. `SAVE` button locked | |  |
| All criteria matched | 1. Type a password that matchs all criteria | `SAVE` button unlocked  | |  |
| Changes | 1. Type a password that matchs all criteria<br>2. Remove some characters from password that make some criteria not to match | 1. All criteria in green and `SAVE` unlocked<br>2. Criteria turns to red again and `SAVE` locked<br> | |  |
