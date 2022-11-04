###  New Search

**Devices**: iPhoneXR v16<br>
**Server**: 2.0.0beta8<br>

Structure:

Spaces called: Space 1, Space 2, Space 3, Space 4

At least:

- One folder with many files of different types, divided in subfolders inside
- Another folder with many files of other different types as the folder above, divided in subfolders inside
- Files of different sizes (small <10bytes files, ~1MB files..., >10GB files)
- Files with different modification
- Different structures in different spaces

---
 
| Test Case | Description | Expected | Result | Comments |
| :-------- | :---------- | :------- | :----: | :------- |
|**Folder Scope**||
| Empty | Select Type = folder when no folders are available | No matches view | P m16 |  |  |
| Type search by folder | 1. Select Type = folder<br>2. Add some text to search bar | 1. Only folders inside the current folder displayed<br>2. Only folders inside the current folder that match the search string displayed | P m16 |  |  |
| Type search by file | 1. Select Type = file<br>br>2. Add some text to search bar | 1. Only files (no folders) inside the current folder displayed<br>2. Only files inside the current folder that match the search string displayed | F m16 | Results hidden behind soft keyboard |  |
| Type search by document | 1. Select Type = document<br>2. Add some text to search bar | 1. Only Document files inside the current folder displayed<br>2. Only documents inside the current folder that match the search string displayed | P m16 |  |  |
| Type search by spreadsheet | 1. Select Type = spreadsheet<br>2. Add some text to search bar | 1. Only spreadsheet files inside the current folder displayed<br>2. Only spreadsheets inside the current folder that match the search string displayed | P m16 |  |  |
| Type search by presentation | 1. Select Type = presentation<br>2. Add some text to search bar | 1. Only presentations inside the current folder displayed<br>2. Only presentation inside the current folder that match the search string displayed | P m16 |  |  |
| Type search by PDF | 1. Select Type = PDF<br>2. Add some text to search bar | 1. Only PDF files inside the current folder displayed<br>2. Only PDFs inside the current folder that match the search string displayed | P m16 |  |  |
| Type search by image | 1. Select Type = image<br>2. Add some text to search bar | 1. Only image files inside the current folder displayed<br>2. Only images inside the current folder that match the search string displayed | P m16 |  |  |
| Type search by video | 1. Select Type = video<br>2. Add some text to search bar | 1. Only video files inside the current folder displayed<br>2. Only videos inside the current folder that match the search string displayed | P m16 |  |  |
| Type search by audio | 1. Select Type = audio<br>2. Add some text to search bar | 1. Only audio files inside the current folder displayed<br>2. Only audios inside the current folder that match the search string displayed | P m16 |  |  |
| Date search by today | 1. Select Date = Today<br>2. Add some text to search bar | 1. Only items created today displayed<br>2. Only items created today that match the search string displayed |  |  |  |
| Date search by this week | 1. Select Date = This week<br>2. Add some text to search bar | 1. Only items inside the current folder created this week displayed<br>2. Only items inside the current folder created this week that match the search string displayed |  |  |  |
| Date search by this month | 1. Select Date = This month<br>2. Add some text to search bar | 1. Only items inside the current folder created this month displayed<br>2. Only items inside the current folder created this month that match the search string displayed |  |  |  |
| Date search by this year | 1. Select Date = This month<br>2. Add some text to search bar | 1. Only items inside the current folder created this year displayed<br>2. Only items inside the current folder created this year that match the search string displayed |  |  |  |
| Size search by <10MB| 1. Select Size <10MB<br>2. Add some text to search bar | 1. Only items inside the current folder which size is <10MB displayed<br>2. Only items inside the current folder which size is <10MB that match the search string displayed |P m16  |  |  |
| Size search by >10MB| 1. Select Size >10MB<br>2. Add some text to search bar | 1. Only items inside the current folder which size is >10MB displayed<br>2. Only items inside the current folder which size is >10MB that match the search string displayed | P m16 |  |  |
| Size search by <100MB| 1. Select Size <100MB<br>2. Add some text to search bar | 1. Only items inside the current folder which size is <100MB displayed<br>2. Only items inside the current folder which size is <100MB that match the search string displayed | P m16 |  |  |
| Size search by >100MB| 1. Select Size >100MB<br>2. Add some text to search bar | 1. Only items inside the current folder which size is >100MB displayed<br>2. Only items inside the current folder which size is >100MB that match the search string displayed |P m16  |  |  |
| Size search by <500MB| 1. Select Size <500MB<br>2. Add some text to search bar | 1. Only items inside the current folder which size is <500MB displayed<br>2. Only items inside the current folder which size is <500MB that match the search string displayed |P m16  |  |  |
| Size search by >500MB| 1. Select Size >500MB<br>2. Add some text to search bar | 1. Only items inside the current folder which size is >500MB displayed<br>2. Only items inside the current folder which size is >500MB that match the search string displayed | P m16 |  |  |
| Size search by <1GB| 1. Select Size <1GB<br>2. Add some text to search bar | 1. Only items inside the current folder which size is <1GB displayed<br>2. Only items inside the current folder which size is <1GB that match the search string displayed |P m16  |  |  |
| Size search by >1GB| 1. Select Size >1GB<br>2. Add some text to search bar | 1. Only items inside the current folder which size is >1GB displayed<br>2. Only items inside the current folder which size is >1GB that match the search string displayed | P m16 |  |  |
|**Tree Scope**||
| Empty | Select Type = folder when no folders are available in tree | No matches view | F m16 | Different results in Folder scope |  |
| Type search by folder | 1. Select Type = folder<br>2. Add some text to search bar | 1. Only folders inside the tree displayed<br>2. Only folders inside the tree that match the search string displayed | F m16 | Parent folder in results |  |
| Type search by file | 1. Select Type = file<br>br>2. Add some text to search bar | 1. Only files (no folders) inside the tree displayed<br>2. Only files inside the tree that match the search string displayed | P m16 |  |  |
| Type search by document | 1. Select Type = document<br>2. Add some text to search bar | 1. Only Document files inside the tree displayed<br>2. Only documents inside the tree that match the search string displayed | P m16 |  |  |
| Type search by spreadsheet | 1. Select Type = spreadsheet<br>2. Add some text to search bar | 1. Only spreadsheet files inside the tree displayed<br>2. Only spreadsheets inside the tree that match the search string displayed | P m16 |  |  |
| Type search by presentation | 1. Select Type = presentation<br>2. Add some text to search bar | 1. Only presentations inside the tree displayed<br>2. Only presentation inside the tree that match the search string displayed | P m16 |  |  |
| Type search by PDF | 1. Select Type = PDF<br>2. Add some text to search bar | 1. Only PDF files inside the tree displayed<br>2. Only PDFs inside the tree that match the search string displayed | P m16 |  |  |
| Type search by image | 1. Select Type = image<br>2. Add some text to search bar | 1. Only image files inside the tree displayed<br>2. Only images inside the tree that match the search string displayed | P m16 |  |  |
| Type search by video | 1. Select Type = video<br>2. Add some text to search bar | 1. Only video files inside the tree displayed<br>2. Only videos inside the tree that match the search string displayed | P m16 |  |  |
| Date search by today | 1. Select Date = Today<br>2. Add some text to search bar | 1. Only items inside the tree created today displayed<br>2. Only items inside the tree created today that match the search string displayed | P m16 |  |  |
| Date search by this week | 1. Select Date = This week<br>2. Add some text to search bar | 1. Only items inside the tree created this week displayed<br>2. Only items inside the tree created this week that match the search string displayed |  |  |  |
| Date search by this month | 1. Select Date = This month<br>2. Add some text to search bar | 1. Only items inside the tree created this month displayed<br>2. Only items inside the tree created this month that match the search string displayed |  |  |  |
| Date search by this year | 1. Select Date = This month<br>2. Add some text to search bar | 1. Only items inside the tree created this year displayed<br>2. Only items inside the tree created this year that match the search string displayed |  |  |  |
| Size search by <10MB| 1. Select Size <10MB<br>2. Add some text to search bar | 1. Only items inside the tree which size is <10MB displayed<br>2. Only items inside the tree which size is <10MB that match the search string displayed | P m16 |  |  |
| Size search by >10MB| 1. Select Size >10MB<br>2. Add some text to search bar | 1. Only items inside the tree which size is >10MB displayed<br>2. Only items inside the tree which size is >10MB that match the search string displayed | P m16  |  |  |
| Size search by <100MB| 1. Select Size <100MB<br>2. Add some text to search bar | 1. Only items inside the tree which size is <100MB displayed<br>2. Only items inside the tree which size is <100MB that match the search string displayed | P m16  |  |  |
| Size search by >100MB| 1. Select Size >100MB<br>2. Add some text to search bar | 1. Only items inside the tree which size is >100MB displayed<br>2. Only items inside the tree which size is >100MB that match the search string displayed | P m16  |  |  |
| Size search by <500MB| 1. Select Size <500MB<br>2. Add some text to search bar | 1. Only items inside the tree which size is <500MB displayed<br>2. Only items inside the tree which size is <500MB that match the search string displayed | P m16  |  |  |
| Size search by >500MB| 1. Select Size >500MB<br>2. Add some text to search bar | 1. Only items inside the tree which size is >500MB displayed<br>2. Only items inside the tree which size is >500MB that match the search string displayed | P m16  |  |  |
| Size search by <1GB| 1. Select Size <1GB<br>2. Add some text to search bar | 1. Only items inside the tree which size is <1GB displayed<br>2. Only items inside the tree which size is <1GB that match the search string displayed | P m16  |  |  |
| Size search by >1GB| 1. Select Size >1GB<br>2. Add some text to search bar | 1. Only items inside the tree which size is >1GB displayed<br>2. Only items inside the tree which size is >1GB that match the search string displayed | P m16  |  |  |
|**Space Scope**||
| Empty | Select Type = folder when no folders are available in space | No matches view | F m16 | Different results in Folder scope |  |
| Type search by folder | 1. Select Type = folder<br>2. Add some text to search bar | 1. Only folders inside the space displayed<br>2. Only folders inside the space that match the search string displayed | P m16  |  |  |
| Type search by file | 1. Select Type = file<br>br>2. Add some text to search bar | 1. Only files (no folders) inside the space displayed<br>2. Only files inside the space that match the search string displayed | P m16 |  |  |
| Type search by document | 1. Select Type = document<br>2. Add some text to search bar | 1. Only Document files inside the space displayed<br>2. Only documents inside the space that match the search string displayed | P m16 |  |  |
| Type search by spreadsheet | 1. Select Type = spreadsheet<br>2. Add some text to search bar | 1. Only spreadsheet files inside the space displayed<br>2. Only spreadsheets inside the space that match the search string displayed |  P m16|  |  |
| Type search by presentation | 1. Select Type = presentation<br>2. Add some text to search bar | 1. Only presentations inside the space displayed<br>2. Only presentation inside the space that match the search string displayed | P m16 |  |  |
| Type search by PDF | 1. Select Type = PDF<br>2. Add some text to search bar | 1. Only PDF files inside the space displayed<br>2. Only PDFs inside the space that match the search string displayed |  P m16|  |  |
| Type search by image | 1. Select Type = image<br>2. Add some text to search bar | 1. Only image files inside the space displayed<br>2. Only images inside the space that match the search string displayed | P m16 |  |  |
| Type search by video | 1. Select Type = video<br>2. Add some text to search bar | 1. Only video files inside the space displayed<br>2. Only videos inside the space that match the search string displayed | P m16 |  |  |
| Date search by today | 1. Select Date = Today<br>2. Add some text to search bar | 1. Only items inside the space created today displayed<br>2. Only items inside the tree created today that match the search string displayed |  |  |  |
| Date search by this week | 1. Select Date = This week<br>2. Add some text to search bar | 1. Only items inside the space created this week displayed<br>2. Only items inside the space created this week that match the search string displayed |  |  |  |
| Date search by this month | 1. Select Date = This month<br>2. Add some text to search bar | 1. Only items inside the space created this month displayed<br>2. Only items inside the space created this month that match the search string displayed |  |  |  |
| Date search by this year | 1. Select Date = This month<br>2. Add some text to search bar | 1. Only items inside the space created this year displayed<br>2. Only items inside the space created this year that match the search string displayed |  |  |  |
| Size search by <10MB| 1. Select Size <10MB<br>2. Add some text to search bar | 1. Only items inside the tree which size is <10MB displayed<br>2. Only items inside the tree which size is <10MB that match the search string displayed |  |  |  |
| Size search by >10MB| 1. Select Size >10MB<br>2. Add some text to search bar | 1. Only items inside the space which size is >10MB displayed<br>2. Only items inside the space which size is >10MB that match the search string displayed | P m16 |  |  |
| Size search by <100MB| 1. Select Size <100MB<br>2. Add some text to search bar | 1. Only items inside the space which size is <100MB displayed<br>2. Only items inside the space which size is <100MB that match the search string displayed | P m16 |  |  |
| Size search by >100MB| 1. Select Size >100MB<br>2. Add some text to search bar | 1. Only items inside the space which size is >100MB displayed<br>2. Only items inside the space which size is >100MB that match the search string displayed | P m16 |  |  |
| Size search by <500MB| 1. Select Size <500MB<br>2. Add some text to search bar | 1. Only items inside the space which size is <500MB displayed<br>2. Only items inside the space which size is <500MB that match the search string displayed | P m16 |  |  |
| Size search by >500MB| 1. Select Size >500MB<br>2. Add some text to search bar | 1. Only items inside the space which size is >500MB displayed<br>2. Only items inside the space which size is >500MB that match the search string displayed | P m16 |  |  |
| Size search by <1GB| 1. Select Size <1GB<br>2. Add some text to search bar | 1. Only items inside the space which size is <1GB displayed<br>2. Only items inside the space which size is <1GB that match the search string displayed | P m16 |  |  |
| Size search by >1GB| 1. Select Size >1GB<br>2. Add some text to search bar | 1. Only items inside the space which size is >1GB displayed<br>2. Only items inside the space which size is >1GB that match the search string displayed | P m16 |  |  |
|**Account Scope**||
| Empty | Select Type = folder when no folders are available in account | No matches view | P m16 |  |  |
| Type search by folder | 1. Select Type = folder<br>2. Add some text to search bar | 1. Only folders inside the account displayed<br>2. Only folders inside the account that match the search string displayed | F m16 | Results in incorrect space after jumping |  |
| Type search by file | 1. Select Type = file<br>br>2. Add some text to search bar | 1. Only files (no folders) inside the account displayed<br>2. Only files inside the account that match the search string displayed | P m16 |  |  |
| Type search by document | 1. Select Type = document<br>2. Add some text to search bar | 1. Only Document files inside the account displayed<br>2. Only documents inside the account that match the search string displayed | P m16 |  |  |
| Type search by spreadsheet | 1. Select Type = spreadsheet<br>2. Add some text to search bar | 1. Only spreadsheet files inside the account displayed<br>2. Only spreadsheets inside the account that match the search string displayed | P m16 |  |  |
| Type search by presentation | 1. Select Type = presentation<br>2. Add some text to search bar | 1. Only presentations inside the account displayed<br>2. Only presentation inside the account that match the search string displayed | P m16 |  |  |
| Type search by PDF | 1. Select Type = PDF<br>2. Add some text to search bar | 1. Only PDF files inside the account displayed<br>2. Only PDFs inside the account that match the search string displayed | P m16 |  |  |
| Type search by image | 1. Select Type = image<br>2. Add some text to search bar | 1. Only image files inside the account displayed<br>2. Only images inside the account that match the search string displayed | P m16 |  |  |
| Type search by video | 1. Select Type = video<br>2. Add some text to search bar | 1. Only video files inside the account displayed<br>2. Only videos inside the account that match the search string displayed |P m16  |  |  |
| Date search by today | 1. Select Date = Today<br>2. Add some text to search bar | 1. Only items inside the account created today displayed<br>2. Only items inside the account created today that match the search string displayed |  |  |  |
| Date search by this week | 1. Select Date = This week<br>2. Add some text to search bar | 1. Only items inside the account created this week displayed<br>2. Only items inside the account created this week that match the search string displayed |  |  |  |
| Date search by this month | 1. Select Date = This month<br>2. Add some text to search bar | 1. Only items inside the account created this month displayed<br>2. Only items inside the account created this month that match the search string displayed |  |  |  |
| Date search by this year | 1. Select Date = This month<br>2. Add some text to search bar | 1. Only items inside the account created this year displayed<br>2. Only items inside the account created this year that match the search string displayed |  |  |  |
| Size search by <10MB| 1. Select Size <10MB<br>2. Add some text to search bar | 1. Only items inside the account which size is <10MB displayed<br>2. Only items inside the account which size is <10MB that match the search string displayed | P m16 |  |  |
| Size search by >10MB| 1. Select Size >10MB<br>2. Add some text to search bar | 1. Only items inside the account which size is >10MB displayed<br>2. Only items inside the account which size is >10MB that match the search string displayed |  P m16 |  |  |
| Size search by <100MB| 1. Select Size <100MB<br>2. Add some text to search bar | 1. Only items inside the account which size is <100MB displayed<br>2. Only items inside the account which size is <100MB that match the search string displayed |  P m16 |  |  |
| Size search by >100MB| 1. Select Size >100MB<br>2. Add some text to search bar | 1. Only items inside the account which size is >100MB displayed<br>2. Only items inside the account which size is >100MB that match the search string displayed |  P m16 |  |  |
| Size search by <500MB| 1. Select Size <500MB<br>2. Add some text to search bar | 1. Only items inside the account which size is <500MB displayed<br>2. Only items inside the account which size is <500MB that match the search string displayed |  P m16 |  |  |
| Size search by >500MB| 1. Select Size >500MB<br>2. Add some text to search bar | 1. Only items inside the account which size is >500MB displayed<br>2. Only items inside the account which size is >500MB that match the search string displayed |  P m16 |  |  |
| Size search by <1GB| 1. Select Size <1GB<br>2. Add some text to search bar | 1. Only items inside the account which size is <1GB displayed<br>2. Only items inside the account which size is <1GB that match the search string displayed |  P m16 |  |  |
| Size search by >1GB| 1. Select Size >1GB<br>2. Add some text to search bar | 1. Only items inside the account which size is >1GB displayed<br>2. Only items inside the account which size is >1GB that match the search string displayed |  P m16 |  |  |
|**Combinations**||
| Folder + 2 subcriteria | 1. Select Folder scope<br>2. Select by Type and Date<br>3. Select by Type and Size<br>4. Select by Date and Size | 2. Only items inside the folder that matches type and date criteria displayed<br>3. Only items inside the folder that matches type and size criteria displayed<br>4. Only items inside the folder that matches date and size criteria displayed | P m16 | | |
| Folder + 3 subcriteria | 1. Select Folder scope<br>2. Select by Type, Date and Size| 2. Only items inside the folder that matches all criteria displayed |P m16 | | |
| Tree + 2 subcriteria | 1. Select Tree scope<br>2. Select by Type and Date<br>3. Select by Type and Size<br>4. Select by Date and Size | 2. Only items inside the tree that matches type and date criteria displayed<br>3. Only items inside the tree that matches type and size criteria displayed<br>4. Only items inside the tree that matches date and size criteria displayed | P m16| | |
| Tree + 3 subcriteria | 1. Select Tree scope<br>2. Select by Type, Date and Size| 2. Only items inside the tree that matches all criteria displayed | P m16| | |
| Space + 2 subcriteria | 1. Select Space scope<br>2. Select by Type and Date<br>3. Select by Type and Size<br>4. Select by Date and Size | 2. Only items inside the space that matches type and date criteria displayed<br>3. Only items inside the space that matches type and size criteria displayed<br>4. Only items inside the space that matches date and size criteria displayed | P m16| | |
| Space + 3 subcriteria | 1. Select Soace scope<br>2. Select by Type, Date and Size| 2. Only items inside the space that matches all criteria displayed | P m16| | |
| Account + 2 subcriteria | 1. Select Account scope<br>2. Select by Type and Date<br>3. Select by Type and Size<br>4. Select by Date and Size | 2. Only items inside the account that matches type and date criteria displayed<br>3. Only items inside the account that matches type and size criteria displayed<br>4. Only items inside the account that matches date and size criteria displayed | P m16 | | |
| Account + 3 subcriteria | 1. Select Account scope<br>2. Select by Type, Date and Size| 2. Only items inside the account that matches all criteria displayed | P m16 | | |
|**Saved searchs**||
| Create search template no element | 1. With empty search, create new template search | Set "Search template" as name| P m16 | | |
| Create search template one element | 1. Search by type = file<br>2. Create new serch template with name for that search<br>3. Close search and open it again<br>4. Apply search template | 3. Search Template displayed<br>4. Same result as step 1.| P m16 | | |
| Create Search Template more elements | 1. Search by type = file and date=today<br>2. Create new Search Template with name for that search<br>3. Close search and open it again<br>4. Apply Search Template | 3. Search Template displayed<br>4. Same result as step 1.| P m16  | | |
| Apply Search Template to other space | 1. Create any Search Template<br>2. Switch to other space<br>3. Apply the Search Template | Search Template applied with correct results to the new space | P m16 | | |
| Apply Search Template to other account | 1. Create any Search Template<br>2. Switch to other account (any space)<br>3. Apply the Search Template | Search Template applied with correct results to the new account (any space) | NA | Saved searches only for current account| |
| Search view Tree | 1. Search by type = file and date = today with Tree scope in the current folder<br>2. Create new search view with a name for that search<br>3. Move to another folder<br>4. Apply Search View | Same result as step 1, applied to the original folder| P m16 | | |
| Search view Space | 1. Search by size <100MB and date = this week with scope space<br>2. Create new search view with a name for that search<br>3. Move to another space<br>4. Apply search view created before | Same result as step 1, applied to the original space| P m16 | | |
| Search view Account | 1. Search by type = PDF and size < 100MB with scope account<br>2. Create new search view with a name for that search<br>3. Move to another account<br>4. Apply smart search created before | Same result as step 1, applied to the original account|NA |Saved searches only for current account | |
| Many Search Template + Search view | Create many templates and smart search (10 each) | Correctly displayed | P m16 | | |
| Remove Search Template | 1. Long press on a existing template<br>2. Delete<br>3. Reopen search | Template no longer available | P m16  | | |
| Remove Search view | 1. Long press on a existing smart search<br>2. Delete<br>3. Reopen search | Smart search no longer available | P m16 | | |