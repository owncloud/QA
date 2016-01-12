# Test Plan WebDav interface on the WebUI

### Environment #1:

**Ubuntu 14.04 without encryption. Using Chrome as main browser.**

TestID | Test Case | Expected Result | Result | Related Comment
------------ | ------------- | -------------- | ----- | ------
1 | Move multiple files from one folder to another | No errors | :construction:  |
2 | Having deleted one folder from another browser, move some files to that removed folder | Error is shown, nothing else happens | :construction:  |
3 | Rename a file using special characters | No errors | :construction:  |
4 | Rename a file which was deleted in other browser | No errors | :construction:  |
5 | Rename a file putting a name of a file which already exists | No errors | :construction:  |
6 | Try to rename a file using forbidden characters | Error is shown | :construction:  |
7 | Create a file in current folder (Check timestamp) | No errors | :construction:  |
8 | Create a file using a name of a file which already exists | Error is shown | :construction:  |
9 | Create a folder | No errors | :construction:  |
10 | Create a folder which already exists | No errors | :construction:  |
11 | Download a small file | No errors | :construction:  |
12 | Download a file >150MiB | No errors | :construction:  |
13 | Download a file of 4GiB | No errors | :construction:  |
14 | Move multiple files from one folder to another | No errors | :construction:  |
15 | Make a public share of a file, download it anonymously | No errors | :construction:  |
16 | Favorite some files | No errors | :construction:  |
17 | Mount an external storage, move files inside it | No errors | :construction:  |
18 | Mount an external storage, rename files inside it | No errors | :construction:  |
19 | Mount an external storage, delete files inside it | No errors | :construction:  |
20 | Mount an external storage, create a folder inside it | No errors | :construction:  |
21 | Using userB share a folder with userA, as userA move files inside shared folder | No errors | :construction:  |
22 | Using userB share a folder with userA, as userA rename files inside shared folder  | No errors | :construction:  |
23 | Using userB share a folder with userA, as userA delete files inside shared folder | No errors | :construction:  |
24 | Using userB share a folder with userA, as userA create a folder inside shared folder | No errors | :construction:  |
25 | Delete a file | No errors | :construction:  |
26 | Delete several files together | No errors | :construction:  |
27 | Delete all files | No errors | :construction:  |
28 | Remove folder from another browser and delete a file from it in your first browser | Error is shown | :construction:  |
29 | Remove file from another browser and delete same file in your first browser | Error is shown | :construction:  |



### Environment #2:

**Ubuntu 14.04 enabling encryption from beginning. Use Firefox :cat: as main browser.**


TestID | Test Case | Expected Result | Result | Related Comment
------------ | ------------- | -------------- | ----- | ------
1 | Move multiple files from one folder to another | No errors | :construction:  |
2 | Having deleted one folder from another browser, move some files to that removed folder | Error is shown, nothing else happens | :construction:  |
3 | Rename a file using special characters | No errors | :construction:  |
4 | Rename a file which was deleted in other browser | No errors | :construction:  |
5 | Rename a file putting a name of a file which already exists | No errors | :construction:  |
6 | Try to rename a file using forbidden characters | Error is shown | :construction:  |
7 | Create a file in current folder (Check timestamp) | No errors | :construction:  |
8 | Create a file using a name of a file which already exists | Error is shown | :construction:  |
9 | Create a folder | No errors | :construction:  |
10 | Create a folder which already exists | No errors | :construction:  |
11 | Download a small file | No errors | :construction:  |
12 | Download a file >150MiB | No errors | :construction:  |
13 | Download a file of 4GiB | No errors | :construction:  |
14 | Move multiple files from one folder to another | No errors | :construction:  |
15 | Make a public share of a file, download it anonymously | No errors | :construction:  |
16 | Favorite some files | No errors | :construction:  |
17 | Mount an external storage, move files inside it | No errors | :construction:  |
18 | Mount an external storage, rename files inside it | No errors | :construction:  |
19 | Mount an external storage, delete files inside it | No errors | :construction:  |
20 | Mount an external storage, create a folder inside it | No errors | :construction:  |
21 | Using userB share a folder with userA, as userA move files inside shared folder | No errors | :construction:  |
22 | Using userB share a folder with userA, as userA rename files inside shared folder  | No errors | :construction:  |
23 | Using userB share a folder with userA, as userA delete files inside shared folder | No errors | :construction:  |
24 | Using userB share a folder with userA, as userA create a folder inside shared folder | No errors | :construction:  |
25 | Delete a file | No errors | :construction:  |
26 | Delete several files together | No errors | :construction:  |
27 | Delete all files | No errors | :construction:  |
28 | Remove folder from another browser and delete a file from it in your first browser | Error is shown | :construction:  |
29 | Remove file from another browser and delete same file in your first browser | Error is shown | :construction:  |


### Environment #3:

**CentOS 6.6 without encryption. Use Edge :blue_heart: as main browser.**

TestID | Test Case | Expected Result | Result | Related Comment
------------ | ------------- | -------------- | ----- | ------
1 | Move multiple files from one folder to another | No errors | :construction:  |
2 | Having deleted one folder from another browser, move some files to that removed folder | Error is shown, nothing else happens | :construction:  |
3 | Rename a file using special characters | No errors | :construction:  |
4 | Rename a file which was deleted in other browser | No errors | :construction:  |
5 | Rename a file putting a name of a file which already exists | No errors | :construction:  |
6 | Try to rename a file using forbidden characters | Error is shown | :construction:  |
7 | Create a file in current folder (Check timestamp) | No errors | :construction:  |
8 | Create a file using a name of a file which already exists | Error is shown | :construction:  |
9 | Create a folder | No errors | :construction:  |
10 | Create a folder which already exists | No errors | :construction:  |
11 | Download a small file | No errors | :construction:  |
12 | Download a file >150MiB | No errors | :construction:  |
13 | Download a file of 4GiB | No errors | :construction:  |
14 | Move multiple files from one folder to another | No errors | :construction:  |
15 | Make a public share of a file, download it anonymously | No errors | :construction:  |
16 | Favorite some files | No errors | :construction:  |
17 | Mount an external storage, move files inside it | No errors | :construction:  |
18 | Mount an external storage, rename files inside it | No errors | :construction:  |
19 | Mount an external storage, delete files inside it | No errors | :construction:  |
20 | Mount an external storage, create a folder inside it | No errors | :construction:  |
21 | Using userB share a folder with userA, as userA move files inside shared folder | No errors | :construction:  |
22 | Using userB share a folder with userA, as userA rename files inside shared folder  | No errors | :construction:  |
23 | Using userB share a folder with userA, as userA delete files inside shared folder | No errors | :construction:  |
24 | Using userB share a folder with userA, as userA create a folder inside shared folder | No errors | :construction:  |
25 | Delete a file | No errors | :construction:  |
26 | Delete several files together | No errors | :construction:  |
27 | Delete all files | No errors | :construction:  |
28 | Remove folder from another browser and delete a file from it in your first browser | Error is shown | :construction:  |
29 | Remove file from another browser and delete same file in your first browser | Error is shown | :construction:  |


### Environment #4:

**Ubuntu 14.04 without encryption. Use an iPad with Safari as main browser.**

TestID | Test Case | Expected Result | Result | Related Comment
------------ | ------------- | -------------- | ----- | ------
1 | Move multiple files from one folder to another | No errors | :construction:  |
2 | Having deleted one folder from another browser, move some files to that removed folder | Error is shown, nothing else happens | :construction:  |
3 | Rename a file using special characters | No errors | :construction:  |
4 | Rename a file which was deleted in other browser | No errors | :construction:  |
5 | Rename a file putting a name of a file which already exists | No errors | :construction:  |
6 | Try to rename a file using forbidden characters | Error is shown | :construction:  |
7 | Create a file in current folder (Check timestamp) | No errors | :construction:  |
8 | Create a file using a name of a file which already exists | Error is shown | :construction:  |
9 | Create a folder | No errors | :construction:  |
10 | Create a folder which already exists | No errors | :construction:  |
11 | Download a small text file | No errors | :construction:  |
12 | Move multiple files from one folder to another | No errors | :construction:  |
13 | Make a public share of a file, download it anonymously | No errors | :construction:  |
14 | Favorite some files | No errors | :construction:  |
15 | Mount an external storage, move files inside it | No errors | :construction:  |
16 | Mount an external storage, rename files inside it | No errors | :construction:  |
17 | Mount an external storage, delete files inside it | No errors | :construction:  |
18 | Mount an external storage, create a folder inside it | No errors | :construction:  |
19 | Using userB share a folder with userA, as userA move files inside shared folder | No errors | :construction:  |
20 | Using userB share a folder with userA, as userA rename files inside shared folder  | No errors | :construction:  |
21 | Using userB share a folder with userA, as userA delete files inside shared folder | No errors | :construction:  |
22 | Using userB share a folder with userA, as userA create a folder inside shared folder | No errors | :construction:  |
23 | Delete a file | No errors | :construction:  |
24 | Delete several files together | No errors | :construction:  |
25 | Delete all files | No errors | :construction:  |
26 | Remove folder from another browser and delete a file from it in your first browser | Error is shown | :construction:  |
27 | Remove file from another browser and delete same file in your first browser | Error is shown | :construction:  |
