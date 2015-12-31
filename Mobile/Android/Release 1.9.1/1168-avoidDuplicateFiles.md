### Avoid duplications 

#### Pr: https://github.com/owncloud/android/pull/1168 

Device 4: S3 Android 4.1.2  
Device 8: Tablet nexus Android 6

---

 
| Test case     | Steps           | Expected behavior | Passed / failed |Related comments
|:------------- |:---------------| :-------------|:-------------:|:---------|
| Upload using ownCloud - move     | Select move file |   File are kept just on oc       | p m4 t5
| Upload using ownCloud - copy      | Select copy file       |    File are kept on oc and on the folder        | p m4 t5
| Upload using ownCloud - multiple files    | Select copy file |  File are kept on oc and on the folder     | p m4 t5
| Upload using ownCloud - multiple files    | Select move file |   Files are kept just on oc       | p m4 t5
| Uploads - Changes of orientation    | Check changes of orientation on the uploads view |  Files are uploaded       | p m4 t5
| Uploads - Cancel uploads    |Select to upload a large file, cancel the upload |  Upload is cancel and the file is kept on the original folder      | p t5 m4
| Uploads - from another app  | Upload files from an external app |  Regular behavior  files are copied    | p m4 t5 |
| **Instant uploads** |         |            |
| Instant uploads - behavior | Change the default behavior |  It is updated on the table  | p m4 t6 t5|
| Instant uploads - changing user | Change user while a file is instant uploaded |  File is saved correctly| p m4|
| Instant uploads images - do nothing | Take some photos |  Files are uploaded and stored on both oc folder and on local  |  p m4 t5 *deprecated*|
| Instant uploads images - do nothing | Take some photos (10) while they are uploaded the connection is down |  Files are uploaded and stored both on oc folder nor on local  | p m6 t5 *deprecated* |
| Instant uploads images - copy | Take some photos |  Files are kept on oc and on the folder  | p m4  t5|
| Instant uploads images- move | Take some photos |  Files are kept just on oc | p m4 t5|
| Instant uploads images- delete | Take some photos |  Files are just uploaded, deleted from both folders | https://github.com/owncloud/android/issues/1313 p t5 *deprecated*|
| Instant uploads images- delete | Take some photos, while are being uploaded the connection is down |  Files are kept locally | https://github.com/owncloud/android/issues/1313 p t5 *deprecated*|
| Instant uploads videos - do nothing | Record a video |  Video is uploaded and stored on both oc folder and on local  | blocked by https://github.com/owncloud/android/issues/1313 p t5 *deprecated*|
| Instant uploads video - do nothing | Record a long video while they are uploaded the connection is down |  Video is stored on the local folder  |  p t5 m4 *deprecated*|
| Instant uploads video- copy | Record a video |  Video is kept on oc and on the folder  | p t5 m4|
| Instant uploads video - move | Record a video |  Video is kept on oc| p t5 m4|
| Instant uploads video - delete | Record a video |  Video is just uploaded, deleted from both folders | blocked by https://github.com/owncloud/android/issues/1313 p t5 *deprecated*|
| Instant uploads video - delete | Record a video, while it is being uploaded the connection is down |  Files are kept locally | blocked by https://github.com/owncloud/android/issues/1313 p t5 *deprecated*|
