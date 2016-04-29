###  Fix: Passwords with non-alphanumerical characters 

#### Pr: https://github.com/owncloud/android-library/pull/119 

Devices: Smartphone Android 6.0.1

Server: 8.1.7RC1_EE Ubuntu LAMP (1); 

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
| 1 | Password with ä   |  Login with a user which password contains ä |  User can login into the app | P (1) |  |
| 2 | Password with Ä   |  Login with a user which password contains ä |  User can login into the app | P (1) |  |
| 3 | Password with é   |  Login with a user which password contains é |  User can login into the app | P (1) |  |
| 4 | Password with É   |  Login with a user which password contains é |  User can login into the app | P (1) |  |
| 5 | Password with ò   |  Login with a user which password contains ò |  User can login into the app | P (1) |  |
| 6 | Password with Ò   |  Login with a user which password contains ò |  User can login into the app | P (1) |  |
| 7 | Password with {   |  Login with a user which password contains { |  User can login into the app | P (1) |  |
| 8 | Password with €   |  Login with a user which password contains € |  User can login into the app | P (1) |  |
| 9 | Password with $   |  Login with a user which password contains $ |  User can login into the app | P (1) |  |
| 10 | Password with %   |  Login with a user which password contains % |  User can login into the app | P (1) |  |
| 11 | Password with #   |  Login with a user which password contains # |  User can login into the app | P (1) |  |
| 12 | Password with @   |  Login with a user which password contains @ |  User can login into the app | P (1) |  |
| 13 | Password with >   |  Login with a user which password contains > |  User can login into the app | P (1) |  |
| 14 | Password with <   |  Login with a user which password contains < |  User can login into the app | P (1) |  |
| 15 | Password with ç   |  Login with a user which password contains ç |  User can login into the app | P (1) |  |
| 16 | Password with \|   |  Login with a user which password contains \| |  User can login into the app | P (1) |  |
| 17 | Password with -   |  Login with a user which password contains - |  User can login into the app | P (1) |  |
| 18 | Password with _   |  Login with a user which password contains _ |  User can login into the app | P (1) |  |
| 19 | Password with &   |  Login with a user which password contains & |  User can login into the app | P (1) |  |
| 20 | Password with +   |  Login with a user which password contains + |  User can login into the app | P (1) |  |
| 21 | Password with *   |  Login with a user which password contains * |  User can login into the app | P (1) |  |
| 22 | Password with [   |  Login with a user which password contains [ |  User can login into the app | P (1) |  |
| 23 | Password with ?   |  Login with a user which password contains ? |  User can login into the app | P (1) |  |
| 24 | Password with !   |  Login with a user which password contains ! |  User can login into the app | P (1) |  |
| 25 | Password with "   |  Login with a user which password contains " |  User can login into the app | P (1) |  |
| 26 | Password with  ñ  |  Login with a user which password contains ñ |  User can login into the app | P (1) |  |
| 27 | Password with  ^  |  Login with a user which password contains ^ |  User can login into the app | P (1) |  |
| 28 | Password with  ²  |  Login with a user which password contains ² |  User can login into the app | P (1) |  |
| 29 | Password with blank  |  Login with a user which password contains blank |  User can login into the app | P (1) |  |
| 30 | Password with several special characters  |  Login with a user which password contains several special characters (Pässwôrd) |  User can login into the app | P (1) |  |
| 31 | Password with only special characters  |  Login with a user which password is built with special characters (日本語) |  User can login into the app | P (1) |  |
| 32 | Password without special characters  |  Login with a user which password does not contain special characters (Password) |  User can login into the app | P (1) |  |
