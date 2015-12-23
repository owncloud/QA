### Material Design

#### Pr: https://github.com/owncloud/android/pull/1209

Devices: Phone Galaxy Nexus v4.2, Tablet Nexus v6.0

Server version: 8.2.2

<br>

Test Case ID | Test case   | Expected behavior | Result | Related Comments
|:----:|:------------- |:-------------|:-------------:|:----------
List of files|
1| Check list of files portrait | Includes higher items, mod date includes time, size of files is on the left separated with coma, footer is slightly shorter (in height) | F m4 t6 | Date does not include time
2| Check list of files landscape | Includes higher items, mod date includes time, size of files is on the left separated with coma, footer is slightly shorter (in height) | F m4 t6 | Date does not include time
3| Details view | Improved margins, adaptive decimals in size  (landscape and portrait) | P m4| Decimals only with big files (enhacement)
4| Upload view | RadioButton and checkboxes are blue | P m4
Primary Buttons| 
5| Passcode view: cancel | Change color of text and background and check it is correctly displayed | P m4
6| Upload file view: upload| Change color of text and background it is correctly displayed | P m4
7| Uploader view: upload| Change color of text and background it is correctly displayed | P m4
8| Copy view: choose| Change color of text and background it is correctly displayed| P m4
9| Move view: choose| Change color of text and background it is correctly displayed| P m4
10| Logs view: send history| Change color of text and background it is correctly displayed| P m4
Secondary buttons|
11| Upload file view: cancel| Change color of text and background it is correctly displayed| P m4
12| Uploader view: cancel| Change color of text and background it is correctly displayed| P m4
13| Copy view: cancel| Change color of text and background it is correctly displayed| P m4
14| Move view: cancel| Change color of text and background it is correctly displayed| P m4
15| Logs view: delete history| Change color of text and background it is correctly displayed| P m4
Dialog Buttons |
16| Dialog buttons| They do not change, for example the "remove" dialog | P m4

