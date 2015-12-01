### Select to move to the last subfolder, duplicate in local all the father of subfolder structure inside the subfolder 

#### Pr: https://github.com/owncloud/ios/pull/527

M9: iPhone 6 simulator iOS 9.1

Previously we need a estructure like:
*   a/b/c
*   a/b/cc
*   a/b/ccc

---

 
| Test case     | Steps           | Expected behavior | Passed / failed |
|:------------- |:---------------:| -------------:|-------------:|
| Move a folder     | 1.  Move a file from root to a/b/c/file.txt |   Checking the file system all the folders should appear with the same structure than in the app or in the web interface       |

