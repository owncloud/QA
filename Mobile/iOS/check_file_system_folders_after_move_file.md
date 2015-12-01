### Avoid duplications 

#### Pr: https://github.com/owncloud/android/pull/1168 

Device 4: S3 Android 4.1.2  
Device 8: Tablet nexus Android 6

---

 
| Test case     | Steps           | Expected behavior | Passed / failed |
|:------------- |:---------------:| -------------:|-------------:|
| Upload using ownCloud - move     | Select move file |   File are kept just on oc       | 
| Upload using ownCloud - copy      | Select copy file       |    File are kept on oc and on the folder        | 
| Upload using ownCloud - multiple files    | Select move file |  File are kept on oc and on the folder     |
| Upload using ownCloud - multiple files    | Select copy file |   Files are kept just on oc       |
| Uploads - Changes of orientation    | Check changes of orientation on the uplaods view |  Files are uploaded       |
| Uploads - Cancel uploads    |Select to upload a large file, cancel the upload |  Upload is cancel and the file is kept on the original fodler      |
| Uploads - from another app  | Upload files from an external app |  Regular behavior  files are copied    |  |
| Instant uploads |         |            |
| Instant uploads - behavior | Change the default behavior |  It is updated on the table  |  |
| Instant uploads images - do nothing | Take some photos |  Files are uploaded and stored on both oc folder and on local  | |
| Instant uploads images - do nothing | Take some photos (10) while they are uploaded the connection is down |  Files are uploaded and stored both on oc folder nor on local  |  |
| Instant uploads images - copy | Take some photos |  Files are kept on oc and on the folder  |   |
| Instant uploads images- move | Take some photos |  Files are kept just on oc | |
| Instant uploads images- delete | Take some photos |  Files are just uploaded, deleted from both folders | |
| Instant uploads images- delete | Take some photos, while are being uploaded the connection is down |  Files are kept locally | |
| Instant uploads videos - do nothing | Record a video |  Video is uploaded and stored on both oc folder and on local  | |
| Instant uploads video - do nothing | Record a long video while they are uploaded the connection is down |  Video is stored on the local folder  |  |
| Instant uploads video- copy | Record a video |  Video is kept on oc and on the folder  | |
| Instant uploads video - move | Record a video |  Video is kept on oc| |
| Instant uploads video - delete | Record a video |  Video is just uploaded, deleted from both folders | |
| Instant uploads video - delete | Record a video, while it is being uploaded the connection is down |  Files are kept locally | |

