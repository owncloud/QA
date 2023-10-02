###  New Sort Menu

#### Pr: https://github.com/owncloud/android/pull/3012

Devices: Pixel2 v11, Nexus6P v7<br>
Server: 10.5

---

 
| Test Case | Steps | Expected Result | Result | Comments |
| :-------- | :---- | :-------------- | :----: | :------- |
|**View**||||||
| Portrait sort| Open Menu | Options are correctly displayed | P m11 m7 |  |
| Landscape sort | Open Menu | Options are correctly displayed | P m11 m7 |  |
| Portrait FAB | Open FAB | Menu correcly displayed | P m11 m7 |  |
| Landscape FAB | Open FAB | Menu correcly displayed | P m11 m7 |  |
| Grid/list | Open list of files | Icon is correct to switch grid/list | P m11 m7 | FIXED: icons in the wrong way round |
|**File List**||||||
| Portrait sort| Open Menu | Options are correctly displayed | P m11 m7 |  |
| Landscape sort | Open Menu | Options are correctly displayed | P m11 m7 |  |
| Grid/list | Open list of files | Icon is correct to switch grid/list | P m11 m7 | FIXED: icons in the wrong way round |
| Sort by name descending | Select the option "Name" descending <br> | List of files correctly sorted. Z on the top<br> | P m11 m7 | FIXED: from scratch: Name ↓|
| Sort by name ascending | Select the option "Name" ascending <br> | List of files correctly sorted. A on the top<br> | P m11 m7 |  |
| Sort by date descending | Select the option "Date" descending <br> | List of files correctly sorted.  Newest on the top<br> |  P m11 m7|  |
| Sort by date ascending | Select the option "Date" ascending <br> | List of files correctly sorted. Oldest on the top<br> | P m11 m7|  |
| Sort by size descending  | Select the option "Size" descending <br> | List of files correctly sorted. Biggest on the top<br> | P m11 m7|   |
| Sort by size ascending | Select the option "Size" ascending <br> | List of files correctly sorted. Smallest on the top<br> | P m11 m7|   |
|**Empty Folder**||||||
| Sort by name descending | Select the option "Name" descending <br> | Nothing happens<br> | P m11 m7|  |
| Sort by name ascending | Select the option "Name" ascending <br> | Nothing happens<br>  | P m11 m7 |  |
| Sort by date descending | Select the option "Date" descending <br> | Nothing happens<br>  | P m11 m7 |  |
| Sort by date ascending | Select the option "Date" ascending <br> | Nothing happens<br>  | P m11 m7|  |
| Sort by size descending  | Select the option "Size" descending <br> | Nothing happens<br>  |P m11 m7 |   |
| Sort by size ascending | Select the option "Size" ascending <br> | Nothing happens<br> |P m11 m7 |   |
|**Picker**||||||
| Portrait sort| Open Menu | Options are correctly displayed | P m11 m7 |  |
| Landscape sort | Open Menu | Options are correctly displayed | P m11 m7 |  |
| Grid/list | Open picker | Icon is correct to switch grid/list | NA | Removed from here |
| Sort by name descending | Select the option "Name" descending <br> | List of files correctly sorted. Z on the top<br> |  P m11 m7|  |
| Sort by name ascending | Select the option "Name" ascending <br> | List of files correctly sorted. A on the top<br> | P m11 m7|  |
| Sort by date descending | Select the option "Date" descending <br> | List of files correctly sorted.  Newest on the top<br> | P m11 m7 |  |
| Sort by date ascending | Select the option "Date" ascending <br> | List of files correctly sorted. Oldest on the top<br> | P m11 m7|  |
| Sort by size descending  | Select the option "Size" descending <br> | List of files correctly sorted. Biggest on the top<br> | P m11 m7|   |
| Sort by size ascending | Select the option "Size" ascending <br> | List of files correctly sorted. Smallest on the top<br> | P m11 m7|   |
|**Share with oC**||||||
| Portrait sort| Open Menu | Options are correctly displayed | P m11 m7 |  |
| Landscape sort | Open Menu | Options are correctly displayed | P m11 m7 |  |
| Grid/list | Open folder selector | Icon is correct to switch grid/list | NA | Removed from here |
| Sort by name descending | Share from other app with oC<br>In picker, select the option "Name" descending <br> | List of files correctly sorted. Z on the top<br> | P m11 m7|  |
| Sort by name ascending | Share from other app with oC<br>In picker, select the option "Name" ascending <br> | List of files correctly sorted. A on the top<br> | P m11 m7|  |
| Sort by date descending | Share from other app with oC<br>In picker, select the option "Date" descending <br> | List of files correctly sorted.  Newest on the top<br> | P m11 m7 |  |
| Sort by date ascending | Share from other app with oC<br>In picker, select the option "Date" ascending <br> | List of files correctly sorted. Oldest on the top<br> | P m11 m7|  |
| Sort by size descending  | Share from other app with oC<br>In picker, select the option "Size" descending <br> | List of files correctly sorted. Biggest on the top<br> | P m11 m7|   |
| Sort by size ascending | Share from other app with oC<br>In picker, select the option "Size" ascending <br> | List of files correctly sorted. Smallest on the top<br> | P m11 m7|   |
| Create folder option | Share from other app with oC<br>In picker, select the option "Create Folder"<br>Create the folder and share inside it <br> | Content is shared inside<br> | P m11 m7 |   |
|**Upgrade**||||||
| From latest version | Install previous version<br>Select the option "Size" descending <br>Upgrade to current | List of files correctly sorted. Biggest on the top<br> | P m7|   |
