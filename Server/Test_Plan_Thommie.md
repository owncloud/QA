**Test results for 10.0.9 RC1**

_Server config - OS: Ubuntu 16.04 LTS, Apache 2.4.x, MariaDB, REDIS, PHP 7.x_

_Server config - Apps: Standard, active encryption, TOTP, OAuth2, Calendar/Contacts/Tasks, Polls, Custom Groups, Guests, Impersonate_

_Client: a) OpenSUSE Leap 15 b) Windows 10 Prof. LTSB
Browser: FF 60.0.2 c) Android 7.x_

_CardDAV/CalDAV Client: a) DAVDroid (Android), b) KDE/Akonadi Framework, c) MS Outlook 2016 with CalDav Synchronizer_

Login Type | Login Setting | Result | Comment
-- | -- | -- | --
Cadaver shell login | App password | Succcessful |
Browser Login | standard | Succcessful |
Browser Login | TOTP & OAuth2 activated | Succcessful |
Client Upload | TOTP & OAuth2 activated | Succcessful | Linux Client 2.4.1 GIT-Rev. cd60c2  Qt 5.9.4  |
Client Upload | TOTP & OAuth2 activated | Succcessful | Windows Client 2.4.1
Mobile Client Upload | TOTP & OAuth2 activated | Successful | Android Client 2.8.0. beta 1
CalDAV Client | TOTP & OAuth2 activated | Succcessful | with App Password
CardDAV  Client | TOTP & OAuth2 activated | Succcessful | with App Password

**OVERALL RESULT**
No regressions from 10.0.8
