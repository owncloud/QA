#### Multiple Upload Gallery 

#### PRs: https://github.com/owncloud/ios-app/pull/295<br>


Device/s: iPad Air v12, iPhoneX v12 <br>
Server: 10.0.10



---

 
| Test Case | Steps | Expected Result | Result | Related Comment
|:---------:| :---- | :-------------- | :----: | :------------: |
| Albums portrait | Select "Upload from your photo library" | List of albums opened correctly | P t12 m12 |  |
| Albums landscape | Select "Upload from your photo library" | List of albums opened correctly | P t12 m12 |  |
| List of pics view | Select an album from the list | View is correct, with all the options in the bottom bar | P t12 m12| FIXED: Upload button disabled with no selection |
| List of pics portrait | Select an album from the list | List of pics opened correctly | P t12 m12|  |
| List of pics landscape | Select an album from the list | List of pics opened correctly | P t12 m12| FIXED: Incorrect paddings |
| Selection marks | Select an album from the list. Select some pics | Correct view of the selection marks | P t12 m12|  |
