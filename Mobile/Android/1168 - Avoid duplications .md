### Avoid duplications 

#### Pr: https://github.com/owncloud/android/pull/1168 



---

 
| Test case     | Steps           | Expected behavior | Passed / failed | Comments
|:------------- |:---------------:| -------------:|-------------:|----------:
| Upload using ownCloud - move     | Select move file |   File are kept just on oc       | 
| Upload using ownCloud - copy      | Select copy file       |    File are kept on oc and on the folder        | 
| Upload using ownCloud - multiple files    | Select copy file |  File are kept on oc and on the folder     |
| Upload using ownCloud - multiple files    | Select move file |   Files are kept just on oc       |
| Uploads - Changes of orientation    | Check changes of orientation on the uploads view |  Files are uploaded       |
| Uploads - Cancel uploads    |Select to upload a large file, cancel the upload |  Upload is cancel and the file is kept on the original fodler      |
| Uploads - from another app  | Upload files from an external app |  Regular behavior  files are copied    |  |
| **Instant uploads** |         |            |
| Instant uploads - behavior | Change the default behavior |  It is updated on the table view |  |
| Instant uploads - changing user | Change user while a file is instant uploaded |  File is saved correctly| |
| Instant uploads images - kept in original | Take some photos |  Files are kept on oc and on the folder  |   |
| Instant uploads images- move | Take some photos |  Files are kept just on oc | |
| Instant uploads video- kept in original | Record a video |  Video is kept on oc and on the folder  | | 
| Instant uploads video - move | Record a video |  Video is kept on oc| |
| Instant uploads - changing user | Change user while a file is instant uploaded |  Video is saved correctly| |

