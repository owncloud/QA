#### Enforce passwords in public links

#### Pr: https://github.com/owncloud/android/pull/2445



---

 
| Test | Test Case | Steps | Expected Result | Result | Related Comment
| :----: | :-------- | :---- | :-------------- | :-----: | :------
|**Read Only**||||||
| 1 | Read only | 1. Enable capability "Enforce password for read-only"<br>2. Create a read-only public link without password<br>3. Create a read-only public link with password | 2. Error<br>3. Link created (check server)| |  |
| 2 | Read & write | 1. Enable capability "Enforce password for read-only"<br>2. Create a  Read & write public link without password<br>3. Create a  Read & write public link with password | 2. Link created (check server)<br>3. Link created (check server)| |  |
| 3 | Upload only | 1. Enable capability "Enforce password for read-only"<br>2. Create a  Upload only public link without password<br>3. Create a Upload only public link with password | 2. Link created (check server)<br>3. Link created (check server)| |  |
| 4 | Edit Read only | 1. Enable capability "Enforce password for read-only"<br>2. Create a read-only public link in server<br>3. In app, try to remove the password from the link | Not allowed| |  |
|**Read and write**||||||
| 5 | Read & write | 1. Enable capability "Enforce password for read & write"<br>2. Create a Read & write public link without password<br>3. Create a Read & write public link with password | 2. Error<br>3. Link created (check server)| |  |
| 6 | Read only | 1. Enable capability "Enforce password for read & write"<br>2. Create a  Read only public link without password<br>3. Create a Read only public link with password | 2. Link created (check server)<br>3. Link created (check server)| |  |
| 7 | Upload only | 1. Enable capability "Enforce password for read & write"<br>2. Create a  Upload only public link without password<br>3. Create a Upload only public link with password | 2. Link created (check server)<br>3. Link created (check server)| |  |
| 8 | Edit Read and write | 1. Enable capability "Enforce password for read and write"<br>2. Create a Read and write public link in server<br>3. In app, try to remove the password from the link | Not allowed| |  |
|**Upload Only**||||||
| 9 | Upload Only | 1. Enable capability "Enforce password for Upload Only"<br>2. Create a Read & write public link without password<br>3. Create a Read & write public link with password | 2. Error<br>3. Link created (check server)| |  |
| 10 | Read only | 1. Enable capability "Enforce password for Upload Only"<br>2. Create a  Read only public link without password<br>3. Create a Read only public link with password | 2. Link created (check server)<br>3. Link created (check server)| |  |
| 11 | Read & write | 1. Enable capability "Enforce password for Upload Only"<br>2. Create a  Read & write public link without password<br>3. Create a Read & write public link with password | 2. Link created (check server)<br>3. Link created (check server)| |  |
| 12 | Edit upload only | 1. Enable capability "Enforce password for upload only"<br>2. Create a upload only public link in server<br>3. In app, try to remove the password from the link | Not allowed| |  |






