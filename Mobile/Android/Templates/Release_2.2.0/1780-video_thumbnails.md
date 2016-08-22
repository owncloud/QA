###  Video thumbnails 

#### Pr: https://github.com/owncloud/android/pull/1780 



Precondition: in config.php file, add the following entry:

  'enabledPreviewProviders' => array(
	'OC\Preview\Movie'
  )

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**Formats supported**|||||||
| 1 | FLV file | Upload an .FLV file | Thumbnail shown in list and grid view |  |  |
| 2 | MKV file | Upload an .MKV file | Thumbnail shown in list and grid view |  |  |
| 3 | 3GP file | Upload an .3GP file | Thumbnail shown in list and grid view |  |  |
| 4 | MP4 file | Upload an .MP4 file | Thumbnail shown in list and grid view |  |  |
| 5 | WEBM file | Upload an .WEBM file | Thumbnail shown in list and grid view |  |  |
|**Formats unsupported**|||||||
| 6 | AVI file | Upload an .AVI file | Thumbnail not shown in list and grid view  |  |  |
| 7 | OGM file | Upload an .OGM file | Thumbnail not shown in list and grid view |  |  |
| 8 | MOV file | Upload an .MOV file | Thumbnail not shown in list and grid view |  |  |