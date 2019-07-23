###  Keep Gallery Alive

#### Pr: https://github.com/owncloud/ios-app/pull/447

Devices: iPhoneX v12, iPadAir v12<br>
Server: 10.2.1

---

 
| Test Case | Steps | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- | 
| Open In | Start the gallery and select "Open In" | Gallery is not dismissed | P m12 t12 |  |  |
| Move | Start the gallery and select "Move" | Gallery is not dismissed | P m12 t12|  |  |
| Move existing locatoin | Start the gallery and select "Move"<br>Set an existing location | Gallery is not dismissed | F m12 t12| Weird effect |  |
| Rename | Start the gallery and select "Rename" | Gallery is not dismissed | P m12 t12|  |  |
| Rename existing name| Start the gallery and select "Rename"<br>Set an existing name | Gallery is not dismissed | P m12 t12 |  |  |
| Duplicate | Start the gallery and select "Duplicate" | Gallery is not dismissed | F m12 t12| The image duplicated is not the opened. Moved to first image |  |
| Copy | Start the gallery and select "Copy" | Gallery is not dismissed | P m12 t12 |  |  |
| Copy existing locatoin | Start the gallery and select "Copy"<br>Set an existing location | Gallery is not dismissed | P m12 t12|  |  |
| Delete | Start the gallery and select "Delete" | Gallery is not dismissed | P m12 t12 |  |  |
| Delete/Move externally | Start the gallery and stay in any item<br>From other client, delete/move the item | Gallery is not dismissed and item is not there |  |  |  |
| Rename externally | Start the gallery and stay in any item<br>From other client, rename the item | Gallery is not dismissed and item is renamed | P m12 t12 |  |  |
| Share | Start the gallery and select "Share" | Gallery is not dismissed | P m12 t12 |  |  |
| Link | Start the gallery and select "Link" | Gallery is not dismissed | P m12 t12 |  |  |
