###  Fix: Passwords with non-alphanumerical characters 

#### Pr: https://github.com/owncloud/android-library/pull/119 

Devices:

Server:

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
| 1 | Password with ä   |  Login with a user which password contains ä |  User can login into the app |  |  |
| 2 | Password with Ä   |  Login with a user which password contains ä |  User can login into the app |  |  |
| 3 | Password with é   |  Login with a user which password contains é |  User can login into the app |  |  |
| 4 | Password with É   |  Login with a user which password contains é |  User can login into the app |  |  |
| 5 | Password with ò   |  Login with a user which password contains ò |  User can login into the app |  |  |
| 6 | Password with Ò   |  Login with a user which password contains ò |  User can login into the app |  |  |
| 7 | Password with {   |  Login with a user which password contains { |  User can login into the app |  |  |
| 8 | Password with €   |  Login with a user which password contains € |  User can login into the app |  |  |
| 9 | Password with $   |  Login with a user which password contains $ |  User can login into the app |  |  |
| 10 | Password with %   |  Login with a user which password contains % |  User can login into the app |  |  |
| 11 | Password with #   |  Login with a user which password contains # |  User can login into the app |  |  |
| 12 | Password with @   |  Login with a user which password contains @ |  User can login into the app |  |  |
| 13 | Password with >   |  Login with a user which password contains > |  User can login into the app |  |  |
| 14 | Password with <   |  Login with a user which password contains < |  User can login into the app |  |  |
| 15 | Password with ç   |  Login with a user which password contains ç |  User can login into the app |  |  |
| 16 | Password with \|   |  Login with a user which password contains \| |  User can login into the app |  |  |
| 17 | Password with -   |  Login with a user which password contains - |  User can login into the app |  |  |
| 18 | Password with _   |  Login with a user which password contains _ |  User can login into the app |  |  |
| 19 | Password with &   |  Login with a user which password contains & |  User can login into the app |  |  |
| 20 | Password with +   |  Login with a user which password contains + |  User can login into the app |  |  |
| 21 | Password with *   |  Login with a user which password contains * |  User can login into the app |  |  |
| 22 | Password with [   |  Login with a user which password contains [ |  User can login into the app |  |  |
| 23 | Password with ?   |  Login with a user which password contains ? |  User can login into the app |  |  |
| 24 | Password with !   |  Login with a user which password contains ! |  User can login into the app |  |  |
| 25 | Password with "   |  Login with a user which password contains " |  User can login into the app |  |  |
| 26 | Password with  ñ  |  Login with a user which password contains ñ |  User can login into the app |  |  |
| 27 | Password with  ^  |  Login with a user which password contains ^ |  User can login into the app |  |  |
| 28 | Password with  ²  |  Login with a user which password contains ² |  User can login into the app |  |  |
| 29 | Password with blank  |  Login with a user which password contains blank |  User can login into the app |  |  |
| 30 | Password with several special characters  |  Login with a user which password contains several special characters |  User can login into the app |  |  |
| 31 | Password with only special characters  |  Login with a user which password is built with special characters |  User can login into the app |  |  |
| 32 | Password without special characters  |  Login with a user which password does not contain special characters |  User can login into the app |  |  |
