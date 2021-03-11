### More keyboard shortcuts

#### PR: https://github.com/owncloud/ios-app/pull/908

Devices: iPadAir v13<br>
Server: 10.6

---

Precondition: attach a physical keyboard to the iPad
 
| Test Case | Steps | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- |
|**PDF**|||
| Search menu| Open PDF file and tap cmd + L | Open search view | P t13 |  |
| Search pattern | In the search view, write a pattern to search in the file | Results are navigated and selected correctly | F t13 | No way to do it |
| Close Search | Close the search view with the keyboard | View closed | F t13 | No way to do it |
| Go to Page | Open PDF file and tap cmd + G | Open Go to Page view | P t13 |  |
| Go to Page select page | In the Go To Page, select a correct page | Displayed | P t13 |  |
| Close Go to Page | In the Go To Page, select Cancel option with the keyboard cmd + C | View Closed | P t13 |  |
| Regression | With the PDF file opened, check that all the previous shortcuts work | Shortcuts work | F t13 | "Links" is missing |
|**Play Media**|||
| Play/Pause | Open media file and tap "P" | Media paused | P t13 |  |
| Play/Pause II | Open media file and tap "P" twice | Media paused and then, played again | P t13 |  |
| Next | Open media file and tap right arrow | Moved to the next media item | P t13 |  |
| Previous | Open media file and tap left arrow | Moved to the previous media item | P t13 |  |
| Fast Forward | Open media file and tap ^ + right arrow | Go forward in the playback | F t13 | Not working |
| Rewind | Open media file and tap ^ + left arrow | Go back in the playback | F t13 | Not working |
| Replay | Open media file and tap cmd + left arrow | Playback starts again | P t13 |  |
| Regression | With the media file opened, check that all the previous shortcuts work | Shortcuts work | P t13 | |
|**Move/Copy**|||
| Copy item | Open list of files, select Copy wth keyboard<br>Select an item to Copy | Correctly selected | F t13 | Not posible to select from picker |
| Move item | Open list of files, select Move wth keyboard<br>Select an item to Move | Correctly selected | F t13 | Not posible to select from picker |
