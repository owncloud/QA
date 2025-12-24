# Activity

## 1. Sync Protocol

### Precondition

1.  Open Desktop Client
2.  Go to Activity tab
3.  Within Activity tab there is Sync protocol tab

| ID | Test Case                                   | Steps to reproduce                                                                                                                                                                                                              | Expected Result                                                                                                                                | Result | Related Comment |
|----|---------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1  | Verify Local sync protocol has all required columns | Verify Local sync protocal has the below columns: Time, File, Folder, Action, Size | All columns are available | | | 
| 2  | Verify all synced files are present in the protocol | Verify all files are present | Files are present and data are correct | | | 
| 3  | Verify data can be sorted by all columns | Verify user can sort by all columns | Data can be sorted by all columns | | | 
| 4  | Verify protocol data can be copied to clipboard | Verify protocol can be copied | Protocol has been copied | | | 

## 2. Not Synced

### Precondition

1.  Open the desktop client
2.  Go to Activity tab
3.  Switch to Not Synced tab

| ID | Test Case                                   | Steps to reproduce                                                                                                                                                                                                              | Expected Result                                                                                                                                | Result | Related Comment |
|----|---------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1  | Verify 'Not Synced' tab has all required columns | Verify the below columns are available: Time, File, Folder, Issue | All columns are present | | | 
| 2  | Verify rows in 'Not Synced' tab can be sorted | Verify rows can be sorted by all columns | Rows can be sorted by all columns | | | 
| 3  | Verify data shown in 'Not Synced' tab is correct | Verify correctness of data | Data are correct | | | 
| 4  | Verify issues from 'Not Synced' tab can be copied | Verify isses can be copied | Issues have been copied | | | 
| 5  | Verify warnings are shown when filter is checked | Verify warning are shown when 'Show warnings' is checked (e.g., a conflict) | Warning are shown when 'Show warnings' is checked | | | 
| 6  | Verify ignored files are shown when filter is checked | Verify ignored files are shown when 'Show ignored files' is checked | Ignored files are shown when 'Show ignored files' is checked | | | 
| 7  | Verify Account filter appears for multi-account setup | Verify if more than one account is added, Account filter is shown | Account filter is available in case of multiaccount | | | 
| 8  | Verify Account filter works | Verify user can filter based on the account | user can filter based on the account | | | 

## 3. Server Activity

### Precondition

1.  Install Activity app on the server from Marketplace
2.  Open desktop client
3.  Go to Activity tab
4.  Go to Server activity tab

| ID | Test Case                                   | Steps to reproduce                                                                                                                                                                                                              | Expected Result                                                                                                                                | Result | Related Comment |
|----|---------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1  | Verify Server Activity tab is hidden when Activity app is not installed | Verify that the Server activity tab is not present when the Activity app has not been installed | Server activity tab is missing | | | 
| 2  | Verify message appears when Activity app is disabled | 1.  Install Activity app <br/> 2.  Disable it in server Settings -> App | 'Account $USER does not activities enabled' message shown in Server Activity tab | | | 
| 3  | Verify server-side delete action appears in activity tab | 1.  Enable Activity app <br/> 2.  Delete a file on the server | '$USER deleted $FILE' message shown in Server Activity tab | | | 
| 4  | Verify server-side add action appears with correct user format | Add a file on the server | Name: cloud.domain.com (User Name) | | | 
| 5  | Verify server-side update action appears with correct user format | Update for Activity | Name: cloud.domain.com (User Name) | | | 

## 4. Activity tab - basic

| ID | Test Case                                   | Steps to reproduce                                                                                                                                                                                                              | Expected Result                                                                                                                                | Result | Related Comment |
|----|---------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1  | Verify Activity tab contains all main sub-tabs | Verify Activity tab includes the below tabs: Server activity, Sync protocol, Not Synced | Activity tab contains all the necessary information | | | 
| 2  | Verify sub-tabs in Activity tab contain content | Verify there is some content in these tabs | There is some content in these tabs | | | 

## 5. Filter

| ID | Test Case                                   | Steps to reproduce                                                                                                                                                                                                              | Expected Result                                                                                                                                | Result | Related Comment |
|----|---------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1  | Verify filter functionality in Activity tabs | Filter is available in Activity tabs | Filter button shows the number of filters applied. Filter persist also after restarting (not the Account filter) | | | 
