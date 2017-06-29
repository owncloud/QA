###  Write-only public shares 

#### Pr: https://github.com/owncloud/ios/pull/916 


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :------ |
|**View**||||||
| 1 | Folders  | Create a new public link on a folder<br> | The option "Show" is displayed below the "Allow editing" and is enabled and not editable by default. Check both orientations |  |  |
| 2 | Files  | Create a new public link on a file<br> | The option does not exist. Check both orientations |  |  |
|**Creation**||||||
| 3 | Not Edit +  Show  | 1. Create a new public link on a file<br>2. Save with defaults (not edit + show)<br>3. Save and get the link | Check in browser that link is accesible, contents are listed, and you can NOT upload more content |  |  |
| 4 | Edit + Show  | 1. Create a new public link on a file<br>2. Enable "Allow Editing" and "Show file listing"<br>3. Save and get the link | Check in browser that link is accesible, contents are listed, and you can upload more content |  |  |
| 5 | Edit + not Show  | 1. Create a new public link on a file<br>2. Enable onle "Allow Editing". "Show file listing" remains disabled<br>3. Save and get the link | Check in browser that link is accesible, contents are NOT listed, and you can upload more content |  |  |
|**Edition**||||||
| 7 | Switch "Edit" on | 1. Test case 3.<br>2. Edit the link<br>3. Switch "Edit" on<br>4. Save and get the link  | Check in browser that link is accesible, contents are listed, and you can upload more content |  |  |
| 8 | Switch "Show" off | 1. Test case 4.<br>2. Edit the link<br>3. Switch "Show" off<br>4. Save and get the link  | Check in browser that link is accesible, contents are NOT listed, and you can upload more content |  |  |
| 9 | Switch "Show" on | 1. Test case 5.<br>2. Edit the link<br>3. Switch "Show" on<br>4. Save and get the link  | Check in browser that link is accesible, contents are listed, and you can upload more content |  |  |
| 10 | Switch "Edit" off | 1. Test case 4.<br>2. Edit the link<br>3. Switch "Edit" off<br>4. Save and get the link  | Check in browser that link is accesible, contents are listed, and you can NOT upload more content |  |  |
| 11 | Switch "Edit" off  II | 1. Test case 5.<br>2. Edit the link<br>3. Switch "Edit" off<br>4. Save and get the link  | Check in browser that link is accesible, contents are listed, and you can NOT upload more content |  |  |
|**External actions**||||||
| 12 | Create new link | In web UI, create a new public link with "Edit" and "Show" | In app, the link appears with the correct options|  |  |
| 13 | Switch "Edit" on | 1. In app, create a new public link with defaults<br>2. In web UI, edit it enabling "Edit" | In app, the link appears with the correct options|  |  |
| 14 | Switch "Show" off | 1. In app, create a new public link with "Edit" enabled<br>2. In web UI, edit it disabling "Show" | In app, the link appears with the correct options|  |  |
| 15 | Switch "Edit" off | 1. In app, create a new public link with both "Edit" and "Show" enabled<br>2. In web UI, edit it disabling "Edit" | In app, the link appears with the correct options|  |  |
|**Capabilities**||||||
| 16 | Folders | In web UI admin dashboard, disable "Allow uploads" capability | In app, the options "Edit" and "Show" are hidden |  |  |
| 17 | Files | In web UI admin dashboard, disable "Allow uploads" capability | In app, the options "Edit" and "Show" are hidden |  |  |
|**Legacy (v<10)**||||||
| 18 | Server 9.1 | In server 9.1, create a public link  | The option "show" does not exist |  |  |
| 19 | Server 9.0 | In server 9.0, create a public link  | The option "show" does not exist |  |  |
| 20 | Server 8.2 | In server 8.2, create a public link  | The option "show" does not exist |  |  |