## 'Files Mediaviewer' Test Plan

- Run Testplan with all supported browsers: Internet Explorer 11, MS EDGE, Mozilla Firefox, Chrome and Safari.

## Testing functionality

Test Case | Expected Result | Result | Related Comment
------------- | -------------- | ----- | ------
**CLI commands** |  |   |
|  |   |
Enable files_mediaviewer app via CLI using ```occ app:enable files_mediaviewer``` | The apps gets enabled | :construction:  |
Disable files_mediaviewer app via CLI using ```occ app:disable files_mediaviewer``` | The apps gets disabled | :construction: |
**Web UI** |  |   |
|  |   |
Enable files_mediaviewer app via webUI | The apps gets enabled | :construction:  |
Disable files_mediaviewer app via webUI | The apps gets disabled | :construction:  |
**Files View** |  |   |
|  |   |
Open an image file | The viewer should apppear and the image is shown. The correct name of the files appears at the bottom of the viewer. | :construction: |
Open a video file | The viewer should appear and the video is shown(unpaused). The correct name of the files appears at the bottom of the viewer. | :construction: |
**MediaViewer Controls** |  |   |
|  |   |
Open an image file and click Rotate button | The image gets rotated | :construction: |
Open an image file and click Zoom In button | The image gets zoomed in | :construction: |
Open an image file and click Zoom out button | The image gets zoomed out | :construction: |
Open a media file and click Download button (:arrow_down:) | The media files gets downloaded | :construction: |
Open an image file and click "X" button | The viewer disappears | :construction: |
Open an image file (in folder having multiple other media files) and click ">"(next) button | The next image should appear | :construction: |
Open an image file (with no other media files) and click ">"(next) button | Nothing should happen. The viewer still has old image. | :construction: |
Open an image file (in folder having multiple other media files) and click "<"(prev) button | The next image should appear | :construction: |
Open an image file (with no other media files) and click "<"(prev) button | Nothing should happen. The viewer still has the old image. | :construction: |
Open the last media file in the folder and click ">"(next) button | Nothing should happen. The viewer still has the old image. | :construction: |
Open the first media file in the folder and click "<"(prev) button | Nothing should happen. The viewer still has the old image. | :construction: |
Open an image and zoom in/zoom out/rotate and open next image | Next image should not be zoomed in/zoomed out/rotated | :construction: |
Open an image/video and press :arrow_left:/:arrow_right: key | Previous/Next media files should appear | :construction: |
Open an image/video and swipe left/right | Previous/Next media files should appear | :construction: |
Open a video file and click play button inside the viewer. | The video starts playing | :construction: |
Play a video file, mute sound (:sound:) button and unmute again. | The video plays with sound muted and when unumuted, plays with sound. | :construction: | 
Play a video file, and click/press anywhere outside the viewer/control | The video stops playing. | :construction: |
Play a video file, and click ⛶ (fullscreen) button. | The video plays in the fullscreen mode.| :construction: |
Play a video file, and click "Replay by 10" button. | The video plays from 10 seconds behind. | :construction: |
Play a video file, and click "X" button | The video stops playing and the viewer disappears. | :construction: |
Play a video file, and click next/previous button | The video stops playing and the next/previous file should appear. | :construction: |
Play a video file, and click anywhere on the scrubber/seek bar | The video skips and plays from the clicked position. | :construction: |
Play a video file, and press next/previous button and re-return to the same video and play the video(without ever closing media_viewer) | The video stops playing. When returned to same video, the video plays from the same position previously stopped. | :construction: |
Open a unsupported video file | The media viewer shows a helpful message | :construction: |
Open a details tab with preview, and then open the image file from files list view in the mediaviewer | The media viewer should appear correctly as previous | :construction: |
Open a video file and delete the video file in another tab, and try to play the video in first tab | A helpful message should be shown | :construction: |
**DetailsDialog View** |  |   |
|  |   |
Open details dialog for a image file, click on the preview/icon of the file and repeat above tests. | | :construction:|
**Favorites Page** |  |   |
|  |   |
Favorite media files and open Favorites, and repeat above tests. |  | :construction: |  |
|**Shared with Others Page** |  |   |
|  |   |
Share files with other media files and open `shared with others` page, and repeat above tests. | | :construction: |
|**Shared with You Page** |  |   |
|  |   |
Share files from other users' account and open `shared with you` page, and repeat above tests. | | :construction: |
|**Tags Page** |  |   |
|  |   |
Set tags on media files and open `tags` page, and repeat above tests. | | :construction: |
|**Public Link Page** |  |   |
|  |   |
Share files by public link and open `Share by link` page, and repeat above tests. | | :construction: |
|**Files Drop** |  |   |
|  |   |
Share a video via files_drop | Check that video plays correctly and buttons work |:construction: | |
Share a folder via files_drop | Check that the viewer shows all files inside folders and buttons work correctly | :construction: | |
