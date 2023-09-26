#### Look of public link permissions

#### Pr: https://github.com/owncloud/android/pull/2150 

Devices: Nexus 6P v7.1.2, Nexus 5X v8.1, Nexus 9 v7

Server: 10.0.7, 10.0.8

---

 
| Test Case | Description |  Steps | Expected Result | Result | Related Comment
| :------:  | :---- | :-------------- | :----- | :-----: | :--- |
|**View**||||||
| 1 | Portrait folders | Check view of public links of folders | View is correct | P m7 m8 t7 |  |
| 2 | Landscape folders | Check view of public links of folders | View is correct | P m7 m8 t7|  |
| 3 | Portrait files | Check view of public links of files | View is correct | P m7 m8 t7|  |
| 4 | Landscape files | Check view of public links of files | View is correct | P m7 m8 t7|  |
|**Actions**||||||
| 5 | Download / View | Select the option Download / View | Check in UI that this option is the selected  | P m7 m8 t7|  |
| 6 | Download / View / Upload | Select the option Download / View / Upload | Check in UI that this option is the selected  | P m7 m8 t7|  |
| 7 | Upload only | Select the option Upload Only | Check in UI that this option is the selected  | P m7 m8 t7|  FIXED: incorrect permissions in request
| 8 | Several links | Create 3 different links over one folder, each one with a different option of the previous ones | Check in UI that each link has the correct option  | P m7 m8 t7| FIXED: incorrect permissions in request|
| 9 | Edit Download / View | 1. Select the option Download / View and accept<br>2. Edit the link | Check in UI that this option is the selected  | P m7 m8 t7|  |
| 10 | Edit Download / View / Upload | 1. Select the option Download / View / Upload and accept<br>2. Edit the link | Check in UI that this option is the selected  | P m7 m8 t7| |
| 11 | Edit Upload only | 1. Select the option Upload Only and accept<br>2. Edit the link | Check in UI that this option is the selected  | P m7 m8 t7|  |
|**Legacy server**||||||
| 12 | Server 9.1 | Check the public link view in 9.1 server | Correct view | P m7 |  |
