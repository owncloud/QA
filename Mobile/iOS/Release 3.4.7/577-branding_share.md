### Sharing branding option

#### Pr: https://github.com/owncloud/ios/pull/xx branch_ /branded_share_option

Devices: iPad v9 with oc8.2.2 <br>
         iPhone6 v9 with oc9


Server version: 9 and 8.2.2

<br>
 
Test Case ID | Test case     | Steps   | Expected behavior | Result | Related Comments
|:----:|:------------- |:-------------------|:-------------|:-------------:|:----------
***Branding variable API ENABlE***|
1|Disable share completely| 1.- Internal sharing off <br> 2.- Share link off <br> 3.-Select to share a file| Share it is not shown | 
2 |Disable share completely| 1.- Internal sharing off <br> 2.- Share link off <br> 3.-Select to share a file from the share link view| Share it is not shown | 
3 |Disable internal sharing - check portrait| 1.- Internal sharing off <br> 2.- Select to share a file | just share by link is shown | 
4 |Disable internal sharing - check landscape| 1.- Internal sharing off <br> 2.- Select to share a file | just share by link is shown | 
5 |Disable internal sharing - check landscape| 1.- Internal sharing off <br> 2.- Select to share a file from the details view| just share by link is shown | 
6 |Disable share link - check portrait| 1.- Share link off <br> 2.- Select to share a file | Just internal sharing is shown | 
7 |Disable share link - check landscape| 1.- Share link off <br> 2.- Select to share a file | Just internal sharing is shown | 
8 |Disable share link - check landscape| 1.- Share link off <br> 2.- Select to share a file from the details view | Just internal sharing is shown | 
9 |Multiaccount - disable internal sharing| 1.- Share link off <br> 2.- Select to share a file from the details view | Just internal sharing is shown | 





