### Photo Uploads improvements

#### PR: [https://github.com/owncloud/ios-app/pull/759](https://github.com/owncloud/ios-app/pull/759)

Devices: iPhone XR v13.7<br>
Server: 10.5.0

---

### Upload original Photo
 
| Test Case | Steps | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- | 
|**Enterprise account**|
| Options enabled | Open Settings > Media Upload  | Option "Prefer unedited photos" is there  | P m13 |
| "Prefer unedited" enabled | Edit a picture in Photos App<br>In Settings, enable "Prefer unedited"<br>Upload the edited pic  | Pic is uploaded without the changes, in the original version  | P m13
| "Prefer unedited" disabled | Edit a picture in Photos App<br>In Settings, disable "Prefer unedited"<br>Upload the edited pic  | Pic is uploaded with the changes | P m13
| Edit twice | Edit a picture in Photos App<br>In Settings, disable "Prefer unedited"<br>Upload the edited pic<br>Repeat the process(edit + upload)  | Pic is uploaded without the changes (the original one) in both cases | P m13
|**Non Enterprise account(not purchased)**|
| Options disabled | Open Settings > Media Upload  | Option "Prefer unedited photos" is not there  | P m13 |
| Upload edited pic | Edit a picture in Photos App<br>Upload the edited pic  | Pic is uploaded with the changes | P m13
|**Enterprise + Non Enterprise accounts (not purchased)**|
| Options enabled | Open Settings > Media Upload  | Option "Prefer unedited photos" is there  | P m13 | Is there but for both ¿?
| "Prefer unedited" enabled | Edit a picture in Photos App<br>In Settings, enable "Prefer unedited"<br>Upload the edited pic to both accounts | Enterprise account: Pic is uploaded without the changes, in the original version<br>Non-enterprise account: Pic is uploaded with the changes | F m13 | Non enterprise account -> pic without changes
| "Prefer unedited" disabled | Edit a picture in Photos App<br>In Settings, disable "Prefer unedited"<br>Upload the edited pic to both accounts | Pic is uploaded with the changes in both accounts | P m13
| Edit twice | Edit a picture in Photos App<br>In Settings, disable "Prefer unedited"<br>Upload the edited pic<br>Repeat the process(edit + upload)  | Enterprise: Pic is uploaded without the changes (the original one) after both uploads<br>Non-Enterprise: Pic is uploaded with the changes after both uploads | F m13 | Non enterprise account -> pic without changes
|**Non Enterprise account (purchased)**|
| Options enabled | Open Settings > Media Upload  | Option "Prefer unedited photos" is there  | P m13 |
| "Prefer unedited" enabled | Edit a picture in Photos App<br>In Settings, enable "Prefer unedited"<br>Upload the edited pic  | Pic is uploaded without the changes, in the original version  | P m13
| "Prefer unedited" disabled | Edit a picture in Photos App<br>In Settings, disable "Prefer unedited"<br>Upload the edited pic  | Pic is uploaded with the changes | P m13
| Edit twice | Edit a picture in Photos App<br>In Settings, disable "Prefer unedited"<br>Upload the edited pic<br>Repeat the process(edit + upload)  | Pic is uploaded without the changes (the original one) in both cases | P m13

### RAW

| Test Case | Steps | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- | 
|**Enterprise account**|
| Options enabled | Open Settings > Media Upload  | Option "Prefer RAW" is there  | P m13 |
| "Prefer RAW" enabled | Take a RAW pic with an RAW app (RAW+, f.ex.)<br>In Settings, enable "Prefer RAW"<br>Upload the pic  | Pic is uploaded in DNG format | P m13
| "Prefer RAW" disabled | Take a RAW pic with an RAW app (RAW+, f.ex.)<br>In Settings, disable "Prefer RAW"<br>Upload the pic  | Pic is uploaded in original format | F m13 | DNG
|**Non Enterprise account(not purchased)**|
| Options disabled | Open Settings > Media Upload  | Option "Prefer RAW" is not there  | |
| Upload RAW | Take a RAW pic with an RAW app (RAW+, f.ex.)<br>Upload the pic  | Pic is uploaded in original format | 
|**Enterprise + Non Enterprise accounts (not purchased)**|
| Options enabled | Open Settings > Media Upload  | Option "Prefer RAW" is there  |  | 
| "Prefer RAW" enabled | Take a RAW pic with an RAW app (RAW+, f.ex.)<br>In Settings, enable "Prefer RAW"<br>Upload pic to both accounts | Enterprise account: Pic is uploaded in DNG format<br>Non-enterprise account: Pic is uploaded with original format |   | 
| "Prefer unedited" disabled | Edit a picture in Photos App<br>In Settings, disable "Prefer unedited"<br>Upload the edited pic to both accounts | Pic is uploaded with the changes in both accounts |
| Edit twice | Edit a picture in Photos App<br>In Settings, disable "Prefer unedited"<br>Upload the edited pic<br>Repeat the process(edit + upload)  | Enterprise: Pic is uploaded without the changes (the original one) after both uploads<br>Non-Enterprise: Pic is uploaded with the changes after both uploads |  | 
|**Non Enterprise account (purchased)**|
| Options enabled | Open Settings > Media Upload  | Option "Prefer RAW" is there  | P m13 |
| "Prefer RAW" enabled | Take a RAW pic with an RAW app (RAW+, f.ex.)<br>In Settings, enable "Prefer RAW"<br>Upload the pic  | Pic is uploaded in DNG format | P m13
| "Prefer RAW" disabled | Take a RAW pic with an RAW app (RAW+, f.ex.)<br>In Settings, disable "Prefer RAW"<br>Upload the pic  | Pic is uploaded in original format | F m13 | DNG