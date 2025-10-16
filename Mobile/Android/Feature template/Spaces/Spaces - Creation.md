###  Spaces - Creation

**Server(s)**: <br>
**Device(s)**: <br>
**Execution date**: <br>
**Tester**: <br>
**Context**: <br>

---
 
| Test Case | Description | Expected | Result | Comments |
| :-------- | :---------- | :------- | :----: | :------- |
|**Spaces list**| **Admin or Space admin user**|
| Create new space with only title |  1. Click on `Spaces` on the bottom bar<br>2. Click on FAB<br>3. Add title, and let subtitle empty<br>4. Create | Space is created with correct title and without subtitle (check in server) | |  |  |
| Create new space with title and subtitle| 1. Click on `Spaces` on the bottom bar<br>2. Click on FAB<br>3. Add title and subtitle<br>4. Create | Space is created with correct title and subtitle (check in server) | |  |  |
| Create new space with subtitle and quota 1GB |  1. Click on `Spaces` on the bottom bar<br>2. Click on FAB<br>3. Add title, subtitle and enable quota with value 1 GB <br>4. Create | Space is created with correct title and quota 1 GB (check in server) | | |  |
| Create new space with subtitle and quota 2GB |  1. Click on `Spaces` on the bottom bar<br>2. Click on FAB<br>3. Add title, subtitle and enable quota with value 2 GB <br>4. Create | Space is created with correct title and quota 2 GB (check in server) | | |  |
| Create new space with subtitle and quota 100GB |  1. Click on `Spaces` on the bottom bar<br>2. Click on FAB<br>3. Add title, subtitle and enable quota with value 100 GB <br>4. Create | Space is created with correct title and quota 100 GB (check in server) | | |  |
| Create new space with subtitle and quota 1000000GB |  1. Click on `Spaces` on the bottom bar<br>2. Click on FAB<br>3. Add title, subtitle and quota 1000000 GB (1PB) <br>4. Create | Space is created with correct title and quota 1000000 GB (check in server) | | |  |
| Create new space with subtitle and quota less than 1GB |  1. Click on `Spaces` on the bottom bar<br>2. Click on FAB<br>3. Add title, subtitle and quota 0,3 GB <br>4. Create | Space is created with correct title and quota 0,3GB (check in server) | | |  |
| Create new space with subtitle and very small quota |  1. Click on `Spaces` on the bottom bar<br>2. Click on FAB<br>3. Add title, subtitle and quota 0,00001 GB <br>4. Create | Space is created with correct title and quota 0,00001GB (check in server) | | |  |
| Create new space with subtitle and quota not exact |  1. Click on `Spaces` on the bottom bar<br>2. Click on FAB<br>3. Add title, subtitle and quota 14677,23456 GB <br>4. Create | Space is created with correct title and quota 14677,23456 GB (check in server) | | |  |
| Create new space with subtitle and quota without restriction |  1. Click on `Spaces` on the bottom bar<br>2. Click on FAB<br>3. Add title, subtitle and quota with no restriction <br>4. Create | Space is created with correct title and quota with no restriction (check in server) | | |  |
| No title | 1. Click on `Spaces` on the bottom bar<br>2. Click on FAB<br> | `Create`is disabled because no name was typed. `Space name must`<br>` not be empty` | |  | 
| Long title | 1. Click on `Spaces` on the bottom bar<br>2. Click on FAB<br>3. Add a title longer than 255 chats | `Create` is disabled because title overflows. `Space name must not be `<br>`longer than 255 characters` | |  |
| No quota | 1. Click on `Spaces` on the bottom bar<br>2. Click on FAB<br>3. Add title, subtitle and enable quota with empty value | `Create`is disabled because no quota was typed. `Space quota must`<br>` not be empty` | |  | 
| Quota 0 | 1. Click on `Spaces` on the bottom bar<br>2. Click on FAB<br>3. Add title, subtitle and enable quota with quota `0` | `Create`is disabled because quota can not be 0 when it is enabled. `Space quota must`<br>` be greater than zero` | |  | 
| Negative quota | 1. Click on `Spaces` on the bottom bar<br>2. Click on FAB<br>3. Add title, subtitle and enable quota with negative value | Not possible to enter negative values | |  | 
| Quota exceeded |  1. Click on `Spaces` on the bottom bar<br>2. Click on FAB<br>3. Add title, subtitle and quota 1000001 GB <br>4. Create | `Create`is disabled because quota exceeded maximum (1PB). `Space quota cannot exceed 1 PB` | | |  | 
| Forbidden characters | 1. Click on `Spaces` on the bottom bar<br>2. Click on FAB<br>3. Add a title that includes any of the following characters: `/ \ . : ? * " > < \|'` | `Create` is disabled because forbidden characters.<br>`Forbidden characters`  | |  |
|**Spaces list**| **Regular user**|
| Create new space  |  Click on `Spaces` on the bottom bar| FAB hidden, not allowed to create spaces  | |  |  |
|**Role change**| |
| Add permission  | 1. Open `Spaces` of regular user<br>2. In admin account, grant admin permissions to the user<br>3. Reopen the app and Open `Spaces`| 1. No FAB displayed <br>3. FAB displayed | |  |  |
| Remove permission  | 1. Open `Spaces` of admin user<br>2. In admin account, revoke admin permissions to the<br>3. Reopen the app and Open `Spaces`| 1. FAB displayed <br>3. No FAB displayed | |  |  |
|**Errors**|  |
| No connection  | 1. Remove connection from device<br>2. Click on `Spaces` on the bottom bar| FAB hidden, not posible to check whether the user still has permissions  | |  |  |
|**Accesibility**|  |
| Talkback | 1. Enable Talkback in device<br>2. Navigate through the `Create Space` dialog | Every field in the dialog is correctly spelt  | |  |  |
| Keyboard | 1. Attach physical keyboard to device via BT<br>2. Navigate through the `Create Space` dialog | Every field in the dialog is selected and no dead paths in navigation  |  |  |  |