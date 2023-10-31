###  Quick Access v12.0

Devices: iPhone XR iOS16, iPadAir v15<br>
Server: oCIS 2.0.0, oC 10.11.0


---

 
| Test Case | Description | Expected | Result | Comment |
| :-------- | :---------- | :------- | :-----: | :----- | 
| **Av. offline** | To be done oCIS - oC10  |  |
| No Av. offline items | No Av. offline items  | Empty view | P m16 t15 | Improve empty view |
| Av. offline items | 1. Set some av. offline items (files and folders) in the account, in different spaces and depth levels<br>2. Use the right arrow to open them  | All of them correctly listed and opened| P t15 F m16 | Crash in iPhone when opening |
| Make item av off in list | 1. Upload file to account<br>2. Open Quick Access -> Available Offline<br>3. Go back to the file and make it av. offline<br>4. Open Quick Access -> Available Offline  | 2. File is not listed there<br>4. File is listed there| P m16 t15 |  |
| Make item not av off in list | 1. Upload file to account and set it av. offline<br>2. Open Quick Access -> Available Offline<br>3. Go back to the file and make it unav. offline<br>4. Open Quick Access -> Available Offline  | 2. File is listed there<br>4. File is not listed there| NA  |  [Need refinement of that feature before](https://github.com/owncloud/ios-app/issues/1128) |
| Make item not av off in quick access | 1. Upload file to account and set it av. offline<br>2. Open Quick Access -> Available Offline<br>3. Open menu of ther item in the av. offline list and make it unav offline  |File is not listed there| NA | [Need refinement of that feature before](https://github.com/owncloud/ios-app/issues/1128) |
| Same name |  1. Upload same file to two different spaces<br>2. Make the file av. offline in both spaces<br>3. Open Quick Access -> Available Offline  | File is listed there twice | P m16 t15 | Better, include the real path! |
| **PDF** | To be done oCIS - oC10  |  |
| No PDF files | No PDF files in the account  | Empty view | P m16 t15 | Improve empty view |
| PDF files | 1. Upload some PDF files in the account, in different spaces and depth levels<br>2. Use the right arrow to open them  | All of them correctly listed and opened| P t15 F m16 | Crash in iPhone when opening |
| Add PDF files | 1. Upload some new PDF files to the account<br>2. Open Quick Access > PDF| New PDF files listed | P m16 t15 |  |
| Remove PDF files | 1. Remove some PDF files from the account<br>2. Open Quick Access > PDF|Removed PDF files not listed anymore | P m16 t15 |  |
| Rename PDF file | 1. Rename a PDF files in the account<br>2. Open Quick Access > PDF| Renamed PDF files listed with the new name | P m16 t15 |  |
| **Documents** | To be done oCIS - oC10  |  |
| No Document files | No Document files in the account  | Empty view | P m16 t15 | Improve empty view |
| Document files | 1. Upload some Document files in the account, in different spaces and depth levels<br>2. Use the right arrow to open them  | All of them correctly listed and opened| P t15 F m16 | Crash in iPhone when opening |
| Add Document files | 1. Upload some new Document files to the account<br>2. Open Quick Access > PDF| New Document files listed | P m16 t15 |  |
| Remove Document files | 1. Remove some Document files from the account<br>2. Open Quick Access > Document |Removed Document files not listed anymore | P m16 t15 |  |
| Rename Document file | 1. Rename a PDF files in the account<br>2. Open Quick Access > PDF| Renamed PDF files listed with the new name | P m16 t15 |  |
| **Images** | To be done oCIS - oC10  |  |
| No Image files | No Image files in the account  | Empty view | P m16 t15 | Improve empty view |
| Image files | 1. Upload some Image files in the account, in different spaces and depth levels<br>2. Use the right arrow to open them  | All of them correctly listed and opened| P t15 F m16 | Crash in iPhone when opening |
| Add Image files | 1. Upload some new Image files to the account<br>2. Open Quick Access > Images | New Image files listed | P m16 t15 |  |
| Remove Image files | 1. Remove some Image files from the account<br>2. Open Quick Access > Images |Removed Image files not listed anymore | P m16 t15 |  |
| Rename Image file | 1. Rename a Image file in the account<br>2. Open Quick Access > Images | Renamed Image files listed with the new name | P m16 t15 |  |
| **Video&Audio** | To be done oCIS - oC10  |  |
| No Media files | No Media files in the account  | Empty view | P m16 t15 | Improve empty view |
| Media files | 1. Upload some Media files in the account, in different spaces and depth levels<br>2. Use the right arrow to open them  | All of them correctly listed and opened| P t15 F m16 | Crash in iPhone when opening |
| Add Media files | 1. Upload some new Media files to the account<br>2. Open Quick Access > Media | New Media files listed | P m16 t15 |  |
| Remove Media files | 1. Remove some Media files from the account<br>2. Open Quick Access > Media |Removed Media files not listed anymore | P m16 t15 |  |
| Rename Media file | 1. Rename a Media file in the account<br>2. Open Quick Access > Media | Renamed Media files listed with the new name | P m16 t15 |  |