### Password Policy - Generator


**Server(s)**: oCIS 5.0, oC10.14.0 <br>
**Device(s)**: Pixel2, Android11. Galaxy Tab A8 <br>
**Execution date**: 27/03/2024<br>
**Tester**: jrecio <br>
**Context**: Extracted the main test cases from [password policy template](https://github.com/owncloud/QA/blob/master/Mobile/Android/Feature%20template/Sharing/Password%20Policy.md), affecting only the password generator <br>


Preconditions: 

- Link creation page opened with password enabled
 
| Test Case | Steps | Expected | Result | Related Comment / Defect | 
| :-------- | :---- | :------- | :----: | :----------------------- | 
|**Feature support**||||||
| No password policy | 1. Open the links view in a oC10 server that does not support password policy<br>2. Open the links view in a oCIS server that does not support password policy | 1. Criteria are not displayed and don't block the feature<br>2. Criteria are not displayed and don't block the feature| P m11 t13| FIXED: `Generate`visible |
| Parameter to zero | 1. Create a oCIS server adding any variable that sets password policy to `0`, for example: `OCIS_PASSWORD_POLICY_MIN`<br>`_UPPERCASE_CHARACTERS: "0"`<br>2. Open public link view and type characters<br>3. Repeat with other [variables](https://github.com/owncloud/ocis/tree/master/services/frontend#the-password-policy) | 2. Min uppercase is not listed as criteria<br>3. Criteria with `0` not listed | P m11 t13 |  |
|**Password generator**| Uses the server policies|||||
| `min characters` | 1. Set 12 as a minimum number of characters in server<br>2. Click on `generate`| Generated password contains at least 12 characters | P m11 t13|  |
| `max characters` | 1. Set 100 as a max number of characters in server<br>2. Click on `generate`| Generated password contains minus than 100 characters | NA |  |
| `uppercase` | 1. Set 3 as a minimum number of uppercase characters in server<br>2. Click on `generate`| Generated password contains at least 3 uppercase characters | P m11 t13|  |
| `lowercase` | 1. Set 3 as a minimum number of lowercase characters in server<br>2. Click on `generate`| Generated password contains at least 3 lowercase characters| P m11 t13|  |
| `special` | 1. Set 3 as a minimum number of special characters in server<br>2. Click on `generate`| Generated password contains at least 3 special characters|P m11 t13 |  |
| `numbers` | 1. Set 3 as a minimum number of numbers in server<br>2. Click on `generate`| Generated password contains at least 3 numbers|P m11 t13 |  |
| All together | 1. Set 3 as a minimum number of lowercase, uppercase, special chars and numbers in server, with 12 minimum and 100 maximum<br>2. Click on `generate`| Generated password contains at least 3 lowercase, 3 uppercase, 3 special characters and 3 numbers, is longer that 12 chars and shorter than 100|P m11 t13 |  |
| Copy | 1. Click on `generate`<br>2. Click on `Copy`|  1. Copy button is enabled<br>2. Generated password is copied to the clipboard and can be pasted | P m11 t13|  |
|**Global parameters**||||||
| Not all criteria matched | 1. Type a password that does not match any criteria<br>1. Type a password that match some criteria and not match other criteria  | 1. `SAVE` and `COPY` buttons locked <br>2. `SAVE` and `COPY` buttons locked | P m11 t13|  |
| All criteria matched | 1. Type a password that matchs all criteria | `SAVE` and `COPY` buttons unlocked  | P m11 t13|  |
| Changes | 1. Type a password that matchs all criteria<br>2. Remove some characters from password that make some criteria not to match | 1. All criteria in green, `SAVE` and `COPY` unlocked<br>2. Criteria turns to red again, `SAVE` and `COPY` locked<br> | P m11 t13|  |
|**Edition**||||||
| Password edition | 1. Create a link with correct password<br>2. Open the link in the app to edit the password<br>3. Add another valid password different to the added in step 1.<br>4. Click on `SAVE`<br>5. Copy the link and open it in a browser<br>6. Type password from step 3. | Item is displayed in browser | P m11 t13|  |
