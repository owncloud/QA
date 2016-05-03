###  Fix: Passwords with non-alphanumerical characters 

#### Pr: https://github.com/owncloud/android-library/pull/119 

Devices: Smartphone Android 6.0.1

Server: 8.1.7RC1_EE Ubuntu LAMP (1); 7.0.14RC1	Centos6.6 LAMP (2); 9.0.2RC1 Ubuntu LESP (3)

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
| 1 | Password with ä   |  Login with a user which password contains ä |  User can login into the app | P (1) (2) (3) |  |
| 2 | Password with Ä   |  Login with a user which password contains ä |  User can login into the app | P (1) (2) (3) |  |
| 3 | Password with é   |  Login with a user which password contains é |  User can login into the app | P (1) (2) (3) |  |
| 4 | Password with É   |  Login with a user which password contains é |  User can login into the app | P (1) (2) (3) |  |
| 5 | Password with ò   |  Login with a user which password contains ò |  User can login into the app | P (1) (2) (3) |  |
| 6 | Password with Ò   |  Login with a user which password contains ò |  User can login into the app | P (1) (2) (3) |  |
| 7 | Password with {   |  Login with a user which password contains { |  User can login into the app | P (1) (2) (3) |  |
| 8 | Password with €   |  Login with a user which password contains € |  User can login into the app | P (1) (2) (3) |  |
| 9 | Password with $   |  Login with a user which password contains $ |  User can login into the app | P (1) (2) (3) |  |
| 10 | Password with %   |  Login with a user which password contains % |  User can login into the app | P (1) (2) (3) |  |
| 11 | Password with #   |  Login with a user which password contains # |  User can login into the app | P (1) (2) (3) |  |
| 12 | Password with @   |  Login with a user which password contains @ |  User can login into the app | P (1) (2) (3) |  |
| 13 | Password with >   |  Login with a user which password contains > |  User can login into the app | P (1) (2) (3) |  |
| 14 | Password with <   |  Login with a user which password contains < |  User can login into the app | P (1) (2) (3) |  |
| 15 | Password with ç   |  Login with a user which password contains ç |  User can login into the app | P (1) (2) (3) |  |
| 16 | Password with \|   |  Login with a user which password contains \| |  User can login into the app | P (1) (2) (3) |  |
| 17 | Password with -   |  Login with a user which password contains - |  User can login into the app | P (1) (2) (3) |  |
| 18 | Password with _   |  Login with a user which password contains _ |  User can login into the app | P (1) (2) (3) |  |
| 19 | Password with &   |  Login with a user which password contains & |  User can login into the app | P (1) (2) (3) |  |
| 20 | Password with +   |  Login with a user which password contains + |  User can login into the app | P (1) (2) (3) |  |
| 21 | Password with *   |  Login with a user which password contains * |  User can login into the app | P (1) (2) (3) |  |
| 22 | Password with [   |  Login with a user which password contains [ |  User can login into the app | P (1) (2) (3) |  |
| 23 | Password with ?   |  Login with a user which password contains ? |  User can login into the app | P (1) (2) (3) |  |
| 24 | Password with !   |  Login with a user which password contains ! |  User can login into the app | P (1) (2) (3) |  |
| 25 | Password with "   |  Login with a user which password contains " |  User can login into the app | P (1) (2) (3) |  |
| 26 | Password with  ñ  |  Login with a user which password contains ñ |  User can login into the app | P (1) (2) (3) |  |
| 27 | Password with  ^  |  Login with a user which password contains ^ |  User can login into the app | P (1) (2) (3) |  |
| 28 | Password with  ²  |  Login with a user which password contains ² |  User can login into the app | P (1) (2) (3) |  |
| 29 | Password with blank  |  Login with a user which password contains blank |  User can login into the app | P (1) (2) (3) |  |
| 30 | Password with several special characters  |  Login with a user which password contains several special characters (Pässwôrd) |  User can login into the app | P (1) (2) (3) |  |
| 31 | Password with only special characters  |  Login with a user which password is built with special characters (日本語) |  User can login into the app | P (1) (2) (3) |  |
| 32 | Password without special characters  |  Login with a user which password does not contain special characters (Password) |  User can login into the app | P (1) (2) (3) |  |
