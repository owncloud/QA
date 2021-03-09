### Presentation mode

#### PR: https://github.com/owncloud/ios-app/pull/893

Devices: iPhoneXR v14.2, iPadAir v13<br>
Server: 10.6

---

Precondition: set in device's settings a screen time of 30 seconds
 
| Test Case | Steps | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- |
|**View**|||
| Portrait | Open any file<br>Open menu | Presentation mode visible | P m14 t13 |  |
| Landscape | Open any file<br>Open menu | Presentation mode visible | P m14 t13 |  
|**Preview mode**|||
| pdf | Open PDF file<br>Set presentation mode<br>Wait 30 seconds | Device is awake | P m14 t13 |  |
| txt | Open txt file<br>Set presentation mode<br>Wait 30 seconds | Device is awake | P m14 t13 |  |    
| image | Open image file<br>Set presentation mode<br>Wait 30 seconds | Device is awake | P m14 t13 |  |  
| ppt/pptx | Open ppt/pptx file<br>Set presentation mode<br>Wait 30 seconds | Device is awake | F m14 t13 | No way to dismiss the full screen mode |
| video | Open video file<br>Set presentation mode<br>Wait 30 seconds | Device is awake | NA | Video files keep always screen awake |
| audio | Open audio file<br>Set presentation mode<br>Wait 30 seconds | Device is awake | P m14 t13 |  |
| No preview file | Open a zip file (or any other with no preview)<br>Open menu | Presentation mode not present | F m14 t13 | Presentation mode present |
| Cancel presentation mode| Open any kind of file<br>Set presentation mode<br>Cancel it in the dialog<br>Wait 30 seconds | Device is asleep | P m14 t13 |  |
| Multiwindow | Open any kind of file in iPad an another one in different window<br>Set presentation mode in one of them<br>Wait 30 seconds | Device keeps awake | P t13 |  |
| Offline-not downlaoded | Remove device connection<br>Open any kind of file<br>Set presentation mode| It should not be posible since file is not downloaded | F m14 t13 | It is not prevented |
|**Other views**|||
| Go out from preview | Open a pdf file and enable presentation mode<br>Go back to file list<br>Wait 30 seconds | Device is asleep | P m14 t13 |  |