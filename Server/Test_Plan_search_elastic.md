## 'Full Search' Test Plan

- Run Testplan with encryption disabled and enabled

TODO:
* [ ] Document how to "re-index" -- is this a comination of rebuild, reset, extra SQL commands? https://github.com/owncloud/enterprise/issues/4999
* [ ] Test upgrade?


## Testing functionality

Test Case | Expected Result | Result | Related Comment
------------- | -------------- | ----- | ------
**CLI commands** |  |   |
|  |   |
Enable search_elastic app via CLI using ```occ app:enable search_elastic``` | The apps is enabled | :construction:  |
Disable search_elastic app via CLI using ```occ app:disable search_elastic``` | The apps is disabled | :construction:  |
Create initial Search Index for one user via CLI using ```occ search:index:create``` | The initial Search Index is created | :construction:  |
Rebuild Search Index for one user via CLI using ```occ search:index:rebuild``` | The initial Search Index is created | :construction:  |
Reset Index via CLI using ```occ search:index:reset``` | Reset the index | :construction:  |
Update search Index via CLI using ```occ search:index:update``` | Update the search index | :construction:  |
**WebUI Full Search menu** |  |   |
|  |   |
Set a valid ElasticSearch server address in the textbox and click Reset index button | The green gauge is shown | :construction:  |
Run a couple of searchs and check that statistics related to nodes marked as indexed appears |  | :construction:  |
**Search for content** |  |   |
|  |   |
Skeleton Files. A user searches for content included in the Skeleton files using the searchbox | The skeleton file that contains the word is shown in the files view | :construction:  |
File located in root. A user searches for content included in a file located in root using the searchbox | The file that contains the word is shown in the files view | 🤖  |
File located 5 folders depth. A user searches for content included in a file located in 5 folders depth using the searchbox. User edits the file and change the content. Then user searches for the new content| The file that contains the word is shown in the files view | :construction:  |
File located 5 folders depth. A user searches for content included in a file located in 5 folders depth using the searchbox. User edits the file and change the content. Then user searches for the old content| The file is not shown in the files view when we search for the old content | :construction:  |
File located 5 folders depth. A user searches for content included in a file located in 5 folders depth using the searchbox | The file that contains the word is shown in the files view | :construction:  |
Special Characters फन्नि. File located 5 folders depth. A user searches for content included in a file located in 5 folders depth using the searchbox | The file that contains the फन्नि is shown in the files view | :construction:  |
File shared with me. A user searches for content included in a file shared with the user using the searchbox | The file that contains the word is shown in the files view |🤖  |
File fed. shared with me. A user searches for content included in a file fed. shared with the user using the searchbox | The file that contains the word is shown in the files view | :construction:  |
File hosted in a personal mount. A user searches for content pattern that matches filename and content included in a file hosted in a personal mount using the searchbox | The file that contains the word is shown in the files view and also the the one that matches the filename | :construction:  |
File hosted in a global mount. A user searches for content included in a file hosted in a global mount using the searchbox | The file that contains the word is shown in the files view | :construction:  |
**Search for filename**|  |   |
|  |   |
Skeleton Files. A user searches for a filename  in the Skeleton files using the searchbox | The skeleton file that matches with the filename  is shown in the files view | :construction:  |
File located in root. A user searches for a filename in a file located in root using the searchbox | The file that matches with the filename is shown in the files view | 🤖 |
File located in root renamed. A user searches for a filename in a file renamed located in root using the searchbox | The file should not be shown in the files view | 🤖  |
File located in root renamed (part of the name that was in the original file, but not in the new file). A user searches for a filename in a file renamed (part of the name that was in the original file, but not in the new file) located in root using the searchbox | The file should not be shown in the files view | 🤖  |
File located 5 folders depth. A user for a filename (not full word - only middle part of filename given) in a file located in 5 folders depth using the searchbox | The file that matches with the filename is shown in the files view | :construction:  |
Special Characters फन्नि. File located 5 folders depth. A user searches for a filename in a file located in 5 folders depth using the searchbox | The file that matches with the filename फन्नि is shown in the files view | :construction:  |
File shared with me. A user searches for a filename (not full word - end of filename missing) in a file shared with the user using the searchbox | The file that matches with the filename is shown in the files view | 🤖  |
File shared with me. A user searches for a filename in a file shared with the user using the searchbox | The file that matches with the filename is shown in the files view | 🤖  |
File shared with me via group. A user searches for a filename in a file shared with the uservia group using the searchbox | The file that matches with the filename is shown in the files view | 🤖  |
File fed. shared with me. A user searches for a filename (not full word - start of filename missing) in a file fed. shared with the user using the searchbox | The file that matches with the filename is shown in the files view | :construction:  |
File hosted in a personal mount. A user searches for a filename (just file extension) in a file hosted in a personal mount using the searchbox | The file that matches with the filename is shown in the files view | :construction:  |
File hosted in a global mount. A user searches for a filename (not exact case) in a file hosted in a global mount using the searchbox | The file that matches with the filename is shown in the files view | :construction:  |
**Search for deleted files**|  |   |
|  |   |
Search for filename of a deleted file | The search does not return results | 🤖  |
Search for content of a deleted file | The search does not return results | 🤖  |
**Unshared files**|  |   |
|  |   |
Search for filename of an unshared file | The search does not return results | 🤖:  |
Search for content of an unshared file | The search does not return results | 🤖  |
**Limit search_elastic access to a group**|  |   |
|  |   |
Limit the users that will have access to full text search by setting a group ```config:app:set search_elastic group --value groupname``` | This will cause only members of the admin group to do a full text search | :construction:  |
Limit the users that will have access to full textsearch by setting a guest_app group ```config:app:set search_elastic group --value guest_app``` | This will cause only members of the guest_app group to do a full text search | :construction:  |
**Only index metadata**|  |   |
|  |   |
If you only want to use search_elastic as a more scalable search on filenames you can disable content indexing by setting `nocontent` to `true` (default is `false`): ```config:app:set search_elastic nocontent --value true``` |  | :construction:  |
**Operations with clients**|  |   |
|  |   |
File located inside a folder. A user searches for content included in the file using the searchbox. User edits the file and change the content using a Desktop client. Then user searches for the new content| The file that contains the word is shown in the files view | :construction:  |
File located inside a folder. A user searches for content included in the file using the searchbox. User edits the file and change the content using a Desktop client. Then user searches for the old content| The file is not shown in the files view | :construction:  |
File located inside a folder. A user searches for content included in the file using the searchbox. User edits the file and change the content using a Desktop client. Then user searches for the new content| The file that contains the word is shown in the files view | :construction:  |
File located inside a folder. A user searches for content included in the file using the searchbox. User edits the file  and change the content using a Mobile client. Then user searches for the old content| The file is not shown in the files view | :construction:  |
**Operations with different file formats**|  |   |
|  |   |
Text file located inside a folder. A user searches for content included in the file using the searchbox. User edits the file using files_texteditor app and change the content. Then user searches for the new content| The file that contains the word is shown in the files view | :construction:  |
Text file located inside a folder. A user searches for content included in the file using the searchbox. User edits the file using files_texteditor app and change the content. Then user searches for the old content| The file is not shown in the files view | :construction:  |
Docx file located inside a folder. A user searches for content included in the file using the searchbox. User edits the file and changes the content. Then user searches for the new content| The file that contains the word is shown in the files view | :construction:  |
Docx file located inside a folder. A user searches for content included in the file using the searchbox. User edits the file and changes the content. Then user searches for the old content| The file is not shown in the files view | :construction:  |
XLS file located inside a folder. A user searches for content included in the file using the searchbox. User edits the file and changes the content. Then user searches for the new content| The file that contains the word is shown in the files view | :construction:  |
XLS file located inside a folder. A user searches for content included in the file using the searchbox. User edits the file and changes the content. Then user searches for the old content| The file is not shown in the files view | :construction:  |
**WebUI and browsers**|  |   |
|  |   |
Check that Full Search menu in admin section works fine using FireFox as browser |  | :construction:  |
Check that Full Search menu in admin section works fine using Chrome as browser |  | :construction:  |
Check that Full Search menu in admin section works fine using IE11 as browser |  | :construction:  |
Check that Full Search menu in admin section works fine using Edge as browser |  | :construction:  |
Check that Full Search menu in admin section works fine using Safari as browser |  | :construction:  |
