###  Spaces - Creation

**Server(s)**: 7.2.0<br>
**Device(s)**: Xiaomi Redmi Note 13, Galaxy Tab A8<br>
**Execution date**: 22/09/2025<br>
**Tester**: jrecio<br>
**Context**: <br>

---
 
| Test Case | Description | Expected | Result | Comments |
| :-------- | :---------- | :------- | :----: | :------- |
|**Spaces list**| **Admin or Space admin user**|
| Create new space with only title |  1. Click on `Spaces` on the bottom bar<br>2. Click on FAB<br>3. Add title, and let subtitle empty<br>4. Create | Space is created with correct title and without subtitle (check in server) | P m15 t15 | FIXED: [BUG](https://github.com/owncloud/android/pull/4683#issuecomment-3317229210) |  |
| Create new space with title and subtitle| 1. Click on `Spaces` on the bottom bar<br>2. Click on FAB<br>3. Add title and subtitle<br>4. Create | Space is created with correct title and subtitle (check in server) | P m15 t15 |  |  |
| Create new space with subtitle and quota 1GB |  1. Click on `Spaces` on the bottom bar<br>2. Click on FAB<br>3. Add title, subtitle and quota 1 GB <br>4. Create | Space is created with correct title and quota 1 GB (check in server) | P m15 t15| |  |
| Create new space with subtitle and quota 2GB |  1. Click on `Spaces` on the bottom bar<br>2. Click on FAB<br>3. Add title, subtitle and quota 2 GB <br>4. Create | Space is created with correct title and quota 2 GB (check in server) | P m15 t15| |  |
| Create new space with subtitle and quota 5GB |  1. Click on `Spaces` on the bottom bar<br>2. Click on FAB<br>3. Add title, subtitle and quota 5 GB <br>4. Create | Space is created with correct title and quota 5 GB (check in server) | P m15 t15| |  |
| Create new space with subtitle and quota 10GB |  1. Click on `Spaces` on the bottom bar<br>2. Click on FAB<br>3. Add title, subtitle and quota 10 GB <br>4. Create | Space is created with correct title and quota 10 GB (check in server) |P m15 t15| |  |
| Create new space with subtitle and quota 50GB |  1. Click on `Spaces` on the bottom bar<br>2. Click on FAB<br>3. Add title, subtitle and quota 50 GB <br>4. Create | Space is created with correct title and quota 50 GB (check in server) |P m15 t15 | |  |
| Create new space with subtitle and quota 100GB |  1. Click on `Spaces` on the bottom bar<br>2. Click on FAB<br>3. Add title, subtitle and quota 100 GB <br>4. Create | Space is created with correct title and quota 100 GB (check in server) |P m15 t15 | |  |
| Create new space with subtitle and quota without restriction |  1. Click on `Spaces` on the bottom bar<br>2. Click on FAB<br>3. Add title, subtitle and quota with no restriction <br>4. Create | Space is created with correct title and quota with no restriction (check in server) |P m15 t15 | |  |
| No title | 1. Click on `Spaces` on the bottom bar<br>2. Click on FAB<br> | `Create`is disabled because no name was typed. `Space name must`<br>` not be empty` | P m15 |  | 
| Long title | 1. Click on `Spaces` on the bottom bar<br>2. Click on FAB<br>3. Add a title longer than 255 chats | `Create` is disabled because title overflows. `Space name must not be `<br>`longer than 255 characters` | P m15 t15|  | 
| Forbidden characters | 1. Click on `Spaces` on the bottom bar<br>2. Click on FAB<br>3. Add a title that includes any of the following characters: `/ \ . : ? * " > < \|'` |  `Create` is disabled because forbidden characters.<br>`Forbidden characters`  | P m15 t15 |  |
|**Spaces list**| **Regular user**|
| Create new space  |  Click on `Spaces` on the bottom bar| FAB hidden, not allowed to create spaces  | P m15 t15 |  |  |
|**Role change**| |
| Add permission  | 1. Open `Spaces` of regular user<br>2. In admin account, grant admin permissions to the user<br>3. Reopen the app and Open `Spaces`| 1. No FAB displayed <br>3. FAB displayed | P m15 t15 |  |  |
| Remove permission  | 1. Open `Spaces` of admin user<br>2. In admin account, revoke admin permissions to the<br>3. Reopen the app and Open `Spaces`| 1. FAB displayed <br>3. No FAB displayed | P m15 t15 | FIXED: [CRASH](https://github.com/owncloud/android/pull/4683#issuecomment-3317304275) |  |
|**Errors**|  |
| No connection  | 1. Remove connection from device<br>2. Click on `Spaces` on the bottom bar| FAB hidden, not posible to check whether the user still has permissions  |P m15  t15 | FIXED: [CRASH](https://github.com/owncloud/android/pull/4683#issuecomment-3317319179) |  |
|**Accesibility**| One device  |
| Talkback | 1. Enable Talkback in device<br>2. Navigate through the `Create Space` dialog | Every field in the dialog is correctly spelt  | P m15 |  |  |
| Keyboard | 1. Attach physical keyboard to device via BT<br>2. Navigate through the `Create Space` dialog | Every field in the dialog is selected and no dead paths in navigation  | P m15 |  |  |