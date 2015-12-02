### Select to move to the last subfolder, duplicate in local all the father of subfolder structure inside the subfolder 

#### Pr: https://github.com/owncloud/ios/pull/527

M9: iPhone 6 simulator iOS 9.1

Previously we need a estructure like:
*   a/b/c
*   a/b/cc
*   a/b/ccc

---

 
| Test case     | Steps           | Expected behavior | Passed / failed | Comments
|:------------- |:---------------:| -------------:|-------------:|
| Move a file with file not download     | 1.  Move a file from root to a/b/c/file.txt |   Checking the file system all the folders should appear with the same structure than in the app or in the web interface       | 
| Move a file with file not downloaded     | 1.  Move a file from root to a/b/c/file.txt |   Checking the file system all the folders should appear with the same structure than in the app or in the web interface<br>The file appear in the right folder      |
| Move a folder with files inside downloaded and with folders     | 1.  Move the folder from root to a/b/c/new_folder |   Checking the file system all the folders should appear with the same structure than in the app or in the web interface<br>The file appear in the right folder      |
