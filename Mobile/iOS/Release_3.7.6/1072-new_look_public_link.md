#### Look of public link permissions

#### Pr: https://github.com/owncloud/ios/pull/1072

Devices: iPhone6SPlus v11.4
Server: 10.0.9

---

 
| Test Case | Steps | Expected Result | Result | Related Comment
:------: | :------------- | :------------- | :-------------- | :-----: | :------
|**View**||||||
| 1 | Portrait folders | Check view of public links of folders | View is correct | P m11 |  |
| 2 | Landscape folders | Check view of public links of folders | View is correct | P m11  |  |
| 3 | Portrait files | Check view of public links of files | View is correct | P m11 | Permission is not needed |
| 4 | Landscape files | Check view of public links of files | View is correct | P m11 |Permission is not needed  |
|**Actions**||||||
| 5 | Read Only | Select the option Read Only | Check in UI that this option is the selected  | P m11  |  |
| 6 | Read & Write | Select the option Read & Write | Check in UI that this option is the selected  | P m11 |  |
| 7 | Upload only | Select the option Upload Only | Check in UI that this option is the selected  | P m11 |  |
| 8 | Several links | Create 3 different links over one folder, each one with a different option of the previous ones | Check in UI that each link has the correct option  | P m11 |  |
| 9 | Edit Read Only | 1. Select the option Read Only and accept<br>2. Edit the link | Check in UI that this option is the selected  | P m11 |  |
| 10 | Edit Read & Write | 1. Select the option Read & Write and accept<br>2. Edit the link | Check in UI that this option is the selected  | P m11 |  |
| 11 | Edit Upload only | 1. Select the option Upload Only and accept<br>2. Edit the link | Check in UI that this option is the selected  | P m11 |  |
|**Legacy server**||||||
| 12 | Server 9.1 | Check the public link view in 9.1 server | Correct view |  |  |
