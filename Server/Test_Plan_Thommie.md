Test results for https://download.owncloud.org/community/testing/owncloud-10.0.7RC1.tar.bz2 including owncloud/core#30398, with **activated encryption**

Login Type | PW Type | Result | Comment
-- | -- | -- | --
Cadaver shell login | standard | Succcessful |  
Cadaver shell login | App password | Succcessful |  

Browser Login | standard | Succcessful |  
Browser Login | Oauth2 & TOTP activated | Succcessful |  

Client Upload | standard | Succcessful | Client 2.4.0 (build 8911).
Client Upload | Oauth2 & TOTP activated | failed | Sync is blocked with „503 Service Unavailable“

Mobile Client Upload | standard | Succcessful | Client 2.6.0 Android
Mobile Client Upload | Oauth2 & TOTP activated 			>> App Password | failed | Client requires Oauth & TOTP PW upon account creation. 			„Encryption not ready, Private key missing for user“ message

CalDAV Client | standard | Succcessful | CalDav/CardDav Sync Android 			Endpoint: remote.php/dav/
CalDAV Client | Oauth2 & TOTP activated 			>> App Password | Succcessful |  

CardDAV  Client | standard | Succcessful | CalDav/CardDav Sync Android 			Endpoint: remote.php/dav/
CardDAV  Client | Oauth2 & TOTP activated 			>> App Password | Succcessful |  

**OVERALL RESULT**
Only partly successful. The user story for „activated Oauth2 & TOTP and login through app password“ is still not correct. In this case, the mobile client should require no TOTP when the app password is used instead.

Moreover, encryption should still be possible for these scenarios. Upon creation of the account, the client should request the standard password AND the app password once. The app password should disable the TOTP requirement for the client. The client should still send the standard password to allow server encryption/decryption. The linking between standard and app password should be active as long as the app password is valid.
