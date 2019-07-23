###  AVKit Player

#### Pr: https://github.com/owncloud/ios-app/pull/429

Devices: iPhoneX v12, iPadAir v12<br>
Server: 10.2.1

---

 
| Test Case | Steps | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- | 
| Stream video | Click on a non-downloaded video | Video is streamed in both orientations| P m12 t12 |  |  |
| Stream audio | Click on a non-downloaded video | Video is streamed in both orientations | P m12 t12 |  |  |
| Stream downloaded video | Click on a non-downloaded video | Video is streamed in both orientations| F m12 t12 | Not posible to download | P m12 t12 |
| Stream downloaded audio | Click on a non-downloaded video | Video is streamed in both orientations | F m12 t12 | Not posible to download | P m12 t12 |
| Artwork | Click on a audio file  | Artwork is shown during streaming | NA |  |  |
| Media controls | Check controls over streaming on both orientations | Correct working (depending on library, just to check) | P m12 t12 |  |  |
|**Operations**|||||||
| Share | Share an streamed file | Video is shared and streaming goes on | P t12 m12|  |  |
| Link | Create a link on a streamed file | Link is created and streaming goes on| P t12 m12 |  |  |
| Open In | Open In an streamed file | Video is opened and streaming goes on| P t12 m12 |  |  |
| Move | Move an streamed file | Video is moved and streaming goes on ?| F m12 m12 | Weird effect |  |
| Rename | Rename an streamed file | Video is renamed and streaming goes on| F m12 t12 | Error |  |
| Duplicate | Duplicate an streamed file | Video is duplicated and streaming goes on| P t12 m12 |  |  |
| Copy | Copy an streamed file | Video is copied and streaming goes on| P t12 m12 |  |  |
| Delete | Delete an stramed file | Video is deleted and streaming stops| P t12 m12 |  |  |
|**External**|||||||
| Move | Move an streamed file from other client | Video is moved and streaming stops | P m12 m12 |  |  |
| Rename | Rename an streamed file from other client | Video is renamed and streaming goes on| F m12 t12 | File is streamed twice |  |
| Delete | Delete an stramed file from other client | Video is deleted and streaming stops| P t12 m12 |  |  |