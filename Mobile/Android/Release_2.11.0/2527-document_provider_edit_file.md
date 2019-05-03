#### Document provider - Edit

#### Pr: https://github.com/owncloud/android/pull/2527

Devices: Nexus 6P v7, Pixel 2 v9

Server: 10.1


---

Doc types to check:

 
| Test | Test Case | Steps | Expected Result | Result | Related Comment
| :----: | :-------- | :---- | :-------------- | :-----: | :------
| 1 | Edit non downloaded file | Using document provider, open a file with any editor and update the content.<br>Save the changes | Changes in oC  | P m7 m9 |
| 2 | Edit downloaded file | Using document provider, open a file with any editor and update the content.<br>Save the changes | Changes in oC  | P m7 m9|
| 3 | Edit external | Using a 3rd party app, edit a oC file using document provider.<br>Save the changes | Changes in oC  | P m7 m9|
| 4 | Edit removed file | Using document provider, open a file with any editor and update the content.<br>Save the changes, and remove the file using other client | Correct error  | P m7 | D.P. does not realize till app is opened |
| 5 | Edit with no connection | With no connection and using document provider, open a downloaded  file with any editor and update the content.<br>Save the changes, and remove the file using other client | File is updated when connection is recovered  | F m7 m9 | File not downloaded -> eternal spinner
| 6 | Edit with no server connection | With no server connection and using document provider, open a downloaded file with any editor and update the content.<br>Save the changes, and remove the file using other client | File is updated when connection is recovered  | F m7 m9 | File not downloaded -> eternal spinner
| 7 | Edit with maintenance mode | With maintenance mode and using document provider, open a downloaded file with any editor and update the content.<br>Save the changes, and remove the file using other client | File is updated when connection is recovered  | F m7 m9 | File not downloaded -> eternal spinner
|**Conflicting**|||||
| 8 | Conflict local | Using document provider, open a file with any editor and update the content.<br>Make another change in other client or webUI.<br>Save the changes.<br>Take local option in conflict | conflict is shown <br>Local version uploaded  | P m7 m9 |
| 9 | Conflict server | Using document provider, open a file with any editor and update the content.<br>Make another change in other client or webUI.<br>Save the changes.<br>Take server option in conflict | Changes in oC<br>Server version downloaded  | P m7 m9 |
| 10 | Conflict both | Using document provider, open a file with any editor and update the content.<br>Make another change in other client or webUI.<br>Save the changes.<br>Take both option in conflict | Changes in oC<br>Both versions keep  | P m7 m9 |
| 11 | Conflict with av. offline | Using document provider, open an av. offline file with any editor and update the content.<br>Make another change in other client or webUI.<br>Save the changes.<br>Take local option in conflict | Conflict is shown in oC  | P m7 m9|