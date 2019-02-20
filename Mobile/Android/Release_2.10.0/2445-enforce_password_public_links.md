#### Enforce passwords in public links

#### Pr: https://github.com/owncloud/android/pull/2445

Devices: Nexus 6P v7<br>
Server: 10.0.9


---

 
| Test | Test Case | Steps | Expected Result | Result | Related Comment
| :----: | :-------- | :---- | :-------------- | :-----: | :------
|**Read Only**||||||
| 1 | Read only | 1. Enable capability "Enforce password for read-only"<br>2. Create a read-only public link without password<br>3. Create a read-only public link with password | 2. Error<br>3. Link created (check server)| P m7 m8|  |
| 2 | Read & write | 1. Enable capability "Enforce password for read-only"<br>2. Create a  Read & write public link without password<br>3. Create a  Read & write public link with password | 2. Link created (check server)<br>3. Link created (check server)| P m7 m8|  |
| 3 | Upload only | 1. Enable capability "Enforce password for read-only"<br>2. Create a  Upload only public link without password<br>3. Create a Upload only public link with password | 2. Link created (check server)<br>3. Link created (check server)| P m7 m8|  |
| 4 | Edit Read only | 1. Enable capability "Enforce password for read-only"<br>2. Create a read-only public link in server<br>3. In app, try to remove the password from the link | Not allowed| NA | Not posible remove, only edit |
|**Read and write**||||||
| 5 | Read & write | 1. Enable capability "Enforce password for read & write"<br>2. Create a Read & write public link without password<br>3. Create a Read & write public link with password | 2. Error<br>3. Link created (check server)| P m7 m8|  |
| 6 | Read only | 1. Enable capability "Enforce password for read & write"<br>2. Create a  Read only public link without password<br>3. Create a Read only public link with password | 2. Link created (check server)<br>3. Link created (check server)| P m7 m8|  |
| 7 | Upload only | 1. Enable capability "Enforce password for read & write"<br>2. Create a  Upload only public link without password<br>3. Create a Upload only public link with password | 2. Link created (check server)<br>3. Link created (check server)| P m7 m8 |  |
| 8 | Edit Read and write | 1. Enable capability "Enforce password for read and write"<br>2. Create a Read and write public link in server<br>3. In app, try to remove the password from the link | Not allowed| NA | Not posible remove, only edit |
|**Upload Only**||||||
| 9 | Upload Only | 1. Enable capability "Enforce password for Upload Only"<br>2. Create a Read & write public link without password<br>3. Create a Read & write public link with password | 2. Error<br>3. Link created (check server)| P m7 m8|  |
| 10 | Read only | 1. Enable capability "Enforce password for Upload Only"<br>2. Create a  Read only public link without password<br>3. Create a Read only public link with password | 2. Link created (check server)<br>3. Link created (check server)| P m7 m8|  |
| 11 | Read & write | 1. Enable capability "Enforce password for Upload Only"<br>2. Create a  Read & write public link without password<br>3. Create a Read & write public link with password | 2. Link created (check server)<br>3. Link created (check server)| P m7 m8|  |
| 12 | Edit upload only | 1. Enable capability "Enforce password for upload only"<br>2. Create a upload only public link in server<br>3. In app, try to remove the password from the link | Not allowed| NA | Not posible remove, only edit |






