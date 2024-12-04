### No personal space

**Server(s)**: oCIS 7.0.0<br>
**Device(s)**: Xiaomi Redmi Android 14<br>
**Execution date**: 28/11/2024<br>
**Tester**:  jrecio<br>
**Context**: <br>

--

Server with no personal:

- oCIS user light

| Title | Steps     | Expected Result | Result | Comments |
| :---- | :-------- | :-------------- | :----: | :------- |
|**App features**|
| After Login | Login with a user light (oCIS)  | `Personal` shows an empty view<br>No option to sort or change the type of view (grid, list)<br>No refresh available | P m14 t14 | |
| Bottom bar | Login with a user light (oCIS) | `Shares` displayed<br>`Spaces` displayed and showing list of available spaces<br>`Uploads` displayed<br>`Offline` available with no refresh| P m14 t14|
| Automatic uploads | 1. Login with a user light (oCIS)<br>2. Login with a regular user account<br>3. Remove account attached in step | 1. Automatic uploads not enabled because unavailability for users light<br>2. Automatic uploads available and just the new account available as target<br>3. Automatic uploads become unavailable again  | P m14 t14 | FIXED: [Some message to add?](https://github.com/owncloud/android/pull/4518#issuecomment-2505949167). [Regression](https://github.com/owncloud/android/pull/4518#issuecomment-2517138844) |
| Copy | Copy a file to a space | Spaces picker shows the available spaces without `Personal` | P m14 t14 |  FIXED: [Crash](https://github.com/owncloud/android/pull/4518#issuecomment-2506005142). [Improvement](https://github.com/owncloud/android/issues/4522) | 
| Copy error | Copy a file to a space that is removed before submitting the operation| `An error ocurred in`<br>`the destination folder` | P m14 t14 |  FIXED: [Crash](https://github.com/owncloud/android/pull/4518#issuecomment-2506005142)  |  
|**Share from 3rd party app**|
| One single account with no spaces | 1. Login with a light user (oCIS) with no spaces to access<br>2. Share some content from a 3rd party app like `Gallery`| Not posible to share because no spaces are available in the list | P m14 t14|  |
| One single account with spaces | 1. Login with a light user (oCIS) with spaces to access<br>2. Share some content from a 3rd party app like `Gallery` | It's posible to share into the available spaces | P m14 t14|  |
| Multiaccount | 1. Login with a user light (oCIS) with spaces to access, and another regular user<br>2. Share some content from a 3rd party app like `Gallery`<br>3. Switch between accounts in the dialog | Every change, the info related to the proper space list is shown | P m14 t14|  |
|**Quota**|
| Quota | 1. Login in a oCIS account with user light<br>2. Open `Manage accounts`| Message: `No storage usage`<br>`information available` | P m14 t14|  |
