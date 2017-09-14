# Files Text Editor

### Server: v10

### Setup
1. Install and enable the files_texteditor app.
2. Create a "regularuser" and login to that.
3. When entering or editing text in the file, use a range of different/special characters and multiple lines.
4. When checking file contents after editing, first close the editor window then click the file again to open the editor window.

Note: most tests are covered by the automated UI test suite.
The individual test cases here cover basic functionality, and illustrate the range covered by the automated UI test suite.
Manually performing all the individual test cases can be done, and will give basic confidence in the text editor behavior,
however it is not necessary to manually perform test cases already covered automatically.

| Test Case | Steps | Expected result | Result  | Related Comment |
| :---------| :---- | :-------------- | :------:| --------------- |
| UI test suite | Run the automated UI test suite | All tests pass | :construction: | |
| Create a text file | Use "+", "Text file", enter a file name, then enter some text in the file and close the editor window. | File is listed in folder and contains the entered text | :gear: | |
| Create a text file with the default name | Use "+", "Text file", press enter, then enter some text in the file and close the editor window. | "New text file.txt" is listed in folder and contains the entered text | :gear: | |
| Create a text file with an unusual name | Use "+", "Text file", enter a file name containing Unicode characters, special symbols etc, then enter some text in the file and close the editor window. | File is listed in folder and contains the entered text | :gear: | |
| Create a text file using a name that already exists | Use "+", "Text file", enter a name of a file that already exists. | A tooltip is shown 'file.txt already exists' | :gear: | |
| Create a text file with name containing "/" | Use "+", "Text file", enter a name including a "/". | A tooltip is shown 'File name cannot contain "/"' | :gear: | |
| Create a text file ".." | Use "+", "Text file", enter name just "..". | A tooltip is shown '".." is an invalid name' | :gear: | |
| Create a text file "." | Use "+", "Text file", enter name just ".". | A tooltip is shown '"." is an invalid name' | :gear: | |
| Create a text file ".part" | Use "+", "Text file", enter a name ending in ".part". | A tooltip is shown '"filename.part" has a forbidden file type/extension' | :gear: | |
| Edit an existing file | Choose an existing text file and open it. Edit the text. Close the editor window. | The changed text is saved in the file. | :gear: | |
| Perform the above tests in a sub-folder | Create a folder and navigate into it. Create and edit text files in the subfolder, like in the steps above. | Same results as above. | :gear: | |
| Cannot create a text file when app disabled | As an admin, disable the files_texteditor app. As a regular user, go to the files page and click the "+". | An entry for "Text file" does not appear. | :construction: | |
| Cannot edit a text file when app disabled | As an admin, disable the files_texteditor app, . As a regular user, go to the files page and click on an existing text file. | No text editor window appears. You are prompted to download the file. | :construction: | |
