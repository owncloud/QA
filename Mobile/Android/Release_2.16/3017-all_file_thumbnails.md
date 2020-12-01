###  All file thumbnails

#### Pr: https://github.com/owncloud/android/pull/3017

Devices: Pixel2 v11<br>
Server: 10.5

---

 
| Test Case | Steps | Expected Result | Result | Comments |
| :-------- | :---- | :-------------- | :----: | :------- |
|**Request**||||||
| Request | Open a folder which contains files of pretty different formats, including images and txt files<br>Open the folder<br>Check requests are sent| One request is sent for every file to fetch the thumbnail. Only images and txt succeded. Other ones, return 404 | P m11 |  |
| Downloaded | Open a folder which contains files of pretty different formats, including images and txt files<br>Open the folder<br>Download some files<br>Check requests are sent| Only sent request of files with no thumbnail and not downloaded | P m11 |  |
|**No downloaded**||||||
| Images | Open a folder which contains images in png, jpg, gif format | Thumbnails are displayed without actions | P m11 |  |
| Txt | Open a folder which contains txt files | Thumbnails are displayed without actions | P m11 |  |
| Change image | Open a folder which contains images<br>In Server or other client, modify the image<br>Sync the folder without clicking the image | Thumbnails are displayed with the change |  P m11|  |
| Change txt | Open a folder which contains a txt file<br>In Server or other client, modify the file<br>Sync the folder without clicking the file| Thumbnail is displayed with the change | F m11 | Thumbnail does not change |
|**Downloaded**||||||
| Images | Open a folder which contains images in png, jpg, gif format and download them by clicking| Thumbnails are displayed | P m11 |  |
| Txt | Open a folder which contains txt files and download them by clicking | Thumbnails are displayed  | P m11 |  |
| Change image | Open a folder which contains images<br>Download one image<br>In Server or other client, modify the image<br>Sync the folder | Thumbnail is displayed with the change |   P m11 | |
| Change txt | Open a folder which contains a txt file<br>Download the txt file<br>In Server or other client, modify the file<br>Sync the folder | Thumbnail is displayed with the change | F m11 | Thumbnail does not change  |  |