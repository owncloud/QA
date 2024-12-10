### No personal space

**Server(s)**: <br>
**Device(s)**: <br>
**Execution date**: <br>
**Tester**:  <br>
**Context**: <br>

--

Server with no personal:

- oCIS light users

| Title | Steps     | Expected Result | Result | Comments |
| :---- | :-------- | :-------------- | :----: | :------- |
|**App features**|
| After Login | Login with a user light (oCIS)  | `Personal` shows an empty view<br>No option to sort or change the type of view (grid, list)<br>No refresh available | | |
| Bottom bar | Login with a user light (oCIS) | `Shares` displayed<br>`Spaces` displayed and showing list of available spaces<br>`Uploads` displayed<br>`Offline` available with no refresh| |
| Automatic uploads | 1. Login with a user light (oCIS)<br>2. Login with a regular user account<br>3. Remove account attached in step | 1. Automatic uploads not enabled because unavailability for users light<br>2. Automatic uploads available and just the new account available as target<br>3. Automatic uploads become unavailable again  | |  |
| Copy | Copy a file to a space | Spaces picker shows the available spaces without `Personal` | | | 
| Copy error | Copy a file to a space that is removed before submitting the operation| `An error ocurred in`<br>`the destination folder` |  |  |  
|**Share from 3rd party app**|
| One single account with no spaces | 1. Login with a light user (oCIS) with no spaces to access<br>2. Share some content from a 3rd party app like `Gallery`| Not posible to share because no spaces are available in the list | |  |
| One single account with spaces | 1. Login with a light user (oCIS) with spaces to access<br>2. Share some content from a 3rd party app like `Gallery` | It's posible to share into the available spaces | |  |
| Multiaccount | 1. Login with a user light (oCIS) with spaces to access, and another regular user<br>2. Share some content from a 3rd party app like `Gallery`<br>3. Switch between accounts in the dialog | Every change, the info related to the proper space list is shown | |  |
|**Quota**|
| Quota | 1. Login in a oCIS account with user light<br>2. Open `Manage accounts`| Message: `No storage usage`<br>`information available` | |  |
