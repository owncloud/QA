#### Fix upgrading

#### Pr: https://github.com/owncloud/ios/pull/1021

Devices: iPhone 6SPlus v11, iPad v11 

Server: 10.0.6

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**Basic / OAuth2**||||||
| 1 | 3.6.2 -> 3.7.3 | 1. Install 3.6.2 and set some configs (instant uploas, pass code, downloaded foles, av. offline files)<br>2. Upgrade to the current<br>3. Perform some actions. Check password changes and adding a new account| 2. Upgrading correct<br>3. Actions correct | P m11 t11 | Uploads queued  in iPhone|
| 2 | 3.7.0 -> 3.7.3 | 1. Install 3.7.0 and set some configs (instant uploas, pass code, downloaded foles, av. offline files)<br>2. Upgrade to the current<br>3. Perform some actions. Check password changes and adding a new account | 2. Upgrading correct<br>3. Actions correct | P m11 t11| Uploads queued  in iPhone |
| 3 | 3.7.1 -> 3.7.3 | 1. Install 3.6.2 and set some configs (instant uploas, pass code, downloaded foles, av. offline files)<br>2. Upgrade to the current<br>3. Perform some actions. Check password changes and adding a new account| 2. Upgrading correct<br>3. Actions correct | P m11 t11 |  Uploads queued  in iPhone|
| 4 | 3.7.2 -> 3.7.3 | 1. Install 3.6.2 and set some configs (instant uploas, pass code, downloaded foles, av. offline files)<br>2. Upgrade to the current<br>3. Perform some actions. Check password changes  and adding a new account| 2. Upgrading correct<br>3. Actions correct | P m11 t11 | Uploads queued in iPhone |
|**SAML**||||||
| 5 | 3.6.2 -> 3.7.3 | 1. Install 3.6.2 and set some configs (instant uploas, pass code, downloaded foles, av. offline files)<br>2. Upgrade to the current<br>3. Perform some actions. Check expirations  and adding a new account| 2. Upgrading correct<br>3. Actions correct | P m11 t11 |  |
| 6 | 3.7.0_pre -> 3.7.3 | 1. Install 3.7.0 and set some configs (instant uploas, pass code, downloaded foles, av. offline files)<br>2. Upgrade to the current<br>3. Perform some actions. Check expirations  and adding a new account| 2. Upgrading correct<br>3. Actions correct | P m11 |  |
| 7 | 3.7.1 -> 3.7.3 | 1. Install 3.6.2 and set some configs (instant uploas, pass code, downloaded foles, av. offline files)<br>2. Upgrade to the current<br>3. Perform some actions. Check expirations  and adding a new account| 2. Upgrading correct<br>3. Actions correct | NA |  |
| 8 | 3.7.2 -> 3.7.3 | 1. Install 3.6.2 and set some configs (instant uploas, pass code, downloaded foles, av. offline files)<br>2. Upgrade to the current<br>3. Perform some actions. Check expirations  and adding a new account| 2. Upgrading correct<br>3. Actions correct | P m11 t11 |  |