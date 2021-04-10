## 'PDF Viewer' Test Plan

Template: https://github.com/owncloud/QA/blob/master/Server/Test_Plan_files_pdfviewer.md

## Setup

<details><summary>Click to view setup details</summary>

* [ ] `bash ./make_oc10_apps.sh guests windows_network_drive impersonate ~/Download/apps/files_pdfviewer-0.12.0-RC4.tar.gz`
      https://...

</details>

## Testing functionality

Run Testplan with all supported browsers

- Run Testplan with all supported browsers: 
* [ ] Internet Explorer 11 
* [ ] MS EDGE 
* [ ] Mozilla Firefox 
* [ ] Chrome 
* [ ] Safari
* [ ] iOS Safari Mobile
* [ ] Android Firefox
* [ ] Android Chrome


Test Case | Expected Result | Result | Related Comment
------------- | -------------- | ----- | ------
**CLI commands** |  |   |
|  |   |
Enable files_pdfviewer app via CLI using ```occ app:enable files_pdfviewer``` | The apps gets enabled | :construction:  |
Disable files_pdfviewer app via CLI using ```occ app:disable files_pdfviewer``` | The apps gets disabled | :construction:  |
**Web UI** |  |   |
|  |   |
Enable files_pdfviewer app via webUI | The apps gets enabled | :construction:  |
Disable files_pdfviewer app via webUI | The apps gets disabled | :construction:  |
**Files View** |  |   |
|  |   |
Open a pdf file | The content is shown and pdf filesviewer buttons work (download, thumbnails, fwd page...) | :construction:  |
**Favorites you section** |  |   |
|  |   |
Make favorite a pdf file and open it from favorite section| The content is shown and pdf filesviewer buttons work (download, thumbnails, fwd page...) | :construction:  |
**Share with you section** |  |   |
Receive a pdf file and open it from share with you section| The content is shown and pdf filesviewer buttons work (download, thumbnails, fwd page...) | :construction:  |
**Share with others section**|  |   |
|  |   |
Share a pdf file and open it from share with others section| The content is shown and pdf filesviewer buttons work (download, thumbnails, fwd page...) | :construction:  |
**Share by link section**|  |   |
|  |   |
Share a pdf file via link and open it from share by link section| The content is shown and pdf filesviewer buttons work (download, thumbnails, fwd page...) | :construction:  |
**Tag section**|  |   |
|  |   |
Tag a pdf file and search for tag and open it from tag section| The content is shown and pdf filesviewer buttons work (download, thumbnails, fwd page...) | :construction:  |
**Public link**|  |   |
|  |   |
Share a pdf file via link and open it from the link| The content is shown and pdf filesviewer buttons work (download, thumbnails, fwd page...) | :construction:  |
|  |   |
Put a pdf file in a folder and share the folder via link and open it from the link| The content is shown and pdf filesviewer buttons work (download, thumbnails, fwd page...) | :construction:  |
**External Storage**|  |   |
|  |   |
Open a pdf file located in an external storage | The content is shown and pdf filesviewer buttons work (download, thumbnails, fwd page...) | :construction:  |
**Guest App**|  |   |
|  |   |
Open a pdf file using a guest user | The content is shown and pdf filesviewer buttons work (download, thumbnails, fwd page...) | :construction:  |
**Impersonate App**|  |   |
|  |   |
Open a pdf file using an impersonated user | The content is shown and pdf filesviewer buttons work (download, thumbnails, fwd page...) | :construction:  |
