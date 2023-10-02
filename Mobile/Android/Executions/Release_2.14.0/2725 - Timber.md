###  Timber

#### Pr: https://github.com/owncloud/android/pull/2725

Devices: Pixel2 v10, Xiaomi MiA2 V9, Samsung Galaxy S9<br>
Server: 10.3

---

 
| Test Case | Description | Expected | Result | Comments  
| :-------- | :---------- | :------- | :----: | :---------- 
| Searching | Check different patterns  | Logs correctly filtered | P m9 m10 | case sensitive |  |
| Share with oC | Generate some logs<br>Share with oC | Correctly stored in the selected folder | P m10 m9 | FIXED: Nothing happens |  |
| Share with other | Generate some logs<br>Share with gmail/drive (f.ex.) | Correctly stored in the selected folder | P m10 m9 |  |  |
| Filter Verbose | Generate some logs<br>Filter by Verbose | All categories are displayed| P m10 m9 |  |  |
| Filter Debug | Generate some logs<br>Filter by Debug |  Debug, Info, Warning, Error logs displayed | P m10 |  |  |
| Filter Info | Generate some logs<br>Filter by Info |  Info, Warning, Error logs displayed | P m10 m9|  |  |
| Filter Warning | Generate some logs<br>Filter by Warning |  Warning, Error logs displayed | P m10 m9 |  |  |
| Filter Error | Generate some logs<br>Filter by Error |  Only error logs displayed | P m10 m9 |  |  |
| Clear logs | Generate some logs<br>Clear logs in logcat and logfile | Everything cleared | P m10 m9 |  |  |
| Log rotation | Generate some logs<br>In device switch to tomorrow's date<br>Generate more logs | Two different log files| P m9 m10 | FIXED: Logs forever?. Name not branded. |  |
