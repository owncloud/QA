## Test Plan

### Setup

Two QNAP NAS are in the office reachable via VPN -> see [Confluence](https://confluence.owncloud.com/display/QNAP/Credentials+for+Access+to+DEV+machines+and+License+Manager)

- Test on a known state device
  - no ownCloud app installed (installation from scratch)
  - previous ownCloud app version installed (upgrade case)

- [ ] when using Licenses from "Stage Store" / "Alpha License"
  - [ ] install QDevelop App first from [Confluence](https://confluence.owncloud.com/display/QNAP/Credentials+for+Access+to+DEV+machines+and+License+Manager) and set the environment to "Alpha"
  - [ ] start VPN, start Socks Proxy (ssh command), configure browser to use socks proxy -> you can now visit https://stage-software.qnap.com and https://alpha-license.qnap.com, exact instructions see [Confluence](https://confluence.owncloud.com/display/QNAP/Credentials+for+Access+to+DEV+machines+and+License+Manager)

### Test items

- [ ] Installation
  - [ ] by uploading QPKG for x86 (while not released)
  - [ ] by uploading QPKG for ARM (while not released)
     ~~\* [ ] from QNAP Appstore for x86 (when available in Appstore)~~
     ~~\* [ ] from QNAP Appstore for ARM (when available in Appstore)~~
---
- [ ] ownCloud App icon is on the homescreen
  - [ ] clicking the ownCloud App icon opens the ownCloud web interface
- [ ] QR codes on login page
  - [ ] Google Playstore leads to https://play.google.com/store/apps/details?id=com.owncloud.android
  - [ ] Apple Appstore leads to https://apps.apple.com/de/app/owncloud-file-sync-and-share/id1359583808
  - [ ] The QR codes will be enlarged when hovering over them https://github.com/owncloud/theme-qnap/issues/3
- [ ] Login as `admin`, with password `admin`
- [ ] configure ownCloud email settings (eg. by using MailHog on qnap-teamviewer-proxy.owncloud.works)
- [ ] Licensing
  - [ ] Under Settings -> General there is NO input field for a EE license key
  - [ ] ownCloud CE
    - [ ] There is no ownCloud license in the QNAP license manager, if so remove it
      - [ ] ownCloud reports that itself is a CE
      - [ ] the license table is empty
      - [ ] the license information above the license table says 5 users are allowed
      - [ ] the current user count above the license table says 1 user is active
    - [ ] create 5 more users (so that you have 6 in total)
      - [ ] the current user count above the license table says 6 users are active
      - [ ] after a maximum waiting time of 60 seconds
        - [ ] the last added user is deactivated (see users overview)
        - [ ] the current user count above the license table says 5 users are active
        - [ ] all admins have a notification which informs about the exceeding of licensed users
        - [ ] all admins have an email wich informs about the exceeding of licensed users
        - [ ] the deactivated user can not log in (error message says `user deactivated`)
    - [ ] EE apps installed to a CE https://jira.owncloud.com/browse/QNAPN-75
      - [ ] admins will see NO grace period message after activating first EE app (trial period was triggered internally, but message is disabled for QNAP)
      - [ ] manually shorten trial period by setting it shortly before expiry `occ config:app:set core grace_period --value=$(date +%s -d "-24 hours + 120 seconds")`
      - [ ] when trial period expired after 120 seconds
        - [ ] all EE apps are disabled
        - [ ] all EE apps are disabled shortly after activation (try to activate EE apps)
    - [ ] unlimited guest users https://github.com/owncloud/qnap/issues/17
      - [ ] enable Guests app
      - [ ] create a share and share it to at least 6 email addresses
        - [ ] the current user count above the license table says 5 users are active
        - [ ] after a minimum waiting time of 60 seconds
          - [ ] no normal user is be deactivated
          - [ ] all guest users can sign up / log in with the link they received
  - [ ] ownCloud EE
    - [ ] add one 5-seat 1-year license to the QNAP license manager (you may obtain it from the Alpha store)
      - [ ] ownCloud reports that itself is a EE
      - [ ] the license table shows the license you added (right license number, start and expiry date, number of licensed users)
      - [ ] the license information above the license table says 5 users are allowed
    - [ ] delete all users except five and then create one more users (so that you have 6 in total)
      - [ ] the current user count above the license table says 6 users are active
      - [ ] after a maximum waiting time of 60 seconds
        - [ ] the last added user is deactivated (see users overview)
        - [ ] the current user count above the license table says 5 users are active
        - [ ] all admins have a notification which informs about the exceeding of licensed users
        - [ ] all admins have an email wich informs about the exceeding of licensed users
        - [ ] the deactivated user can not log in (error message says `user deactivated`)
    - [ ] add one 5-seat 1-year license to the QNAP license manager (you may obtain it from the Alpha store)
      - [ ] ownCloud still reports that itself is a EE
      - [ ] the license table shows the two licenses you added (right license number, start and expiry date, number of licensed users)
      - [ ] the license information above the license table says 10 users are allowed
      - [ ] the current user count above the license table says 5 users are active
    - [ ] enable the 6th user which has been deactivate before
      - [ ] the user will stay active
      - [ ] the current user count above the license table says 6 users are active
    - [ ] add 5 more users
      - [ ] all users, except the last one, will stay active
      - [ ] the current user count above the license table says 10 users are active
    - [ ] remove one 5-seat 1-year license from the QNAP license manager
      - [ ] ownCloud reports that itself is a EE
      - [ ] the license table shows only the license you did not remove (right license number, start and expiry date, number of licensed users)
      - [ ] the license information above the license table says 5 users are allowed
      - [ ] the current user count above the license table says 10 users are active
      - [ ] after a maximum waiting time of 60 seconds
        - [ ] the last added users are deactivated (see users overview)
        - [ ] the current user count above the license table says 5 users are active
        - [ ] all admins have a notification which informs about the exceeding of licensed users
        - [ ] all admins have an email wich informs about the exceeding of licensed users
        - [ ] the deactivated user can not log in (error message says `user deactivated`)
    - [ ] unlimited guest users https://github.com/owncloud/qnap/issues/17
      - [ ] enable Guests app
      - [ ] create a share and share it to at least 6 email addresses
        - [ ] the current user count above the license table says 5 users are active
        - [ ] after a minimum waiting time of 60 seconds
          - [ ] no normal user is be deactivated
          - [ ] all guest users can sign up / log in with the link they received
    - [ ] EE apps installed to a EE
      - [ ] EE apps can be used without limitation
    - [ ] remove all licenses from QNAP license manager
      - [ ] ownCloud reports that itself is a CE
      - [ ] the license table is empty
      - [ ] the license information above the license table says 5 users are allowed
      - [ ] all guest users are still active
      - [ ] all EE apps are disabled (fallback to EE would have triggered a trial period, but that was already used during CE above)
      - [ ] all EE apps are disabled shortly after activation (try to activate EE apps)
- [ ] Retreive ownCloud server log via WebUI, according to the [Docs]
- [ ] Connect a share from the NAS as external storage
  - [ ] create a share on the QNAP device -> see [Confluence](https://confluence.owncloud.com/display/QNAP/Documentation)
  - [ ] set up external storage with the SMB app
  - [ ] set up external stroage with the WND app (activate EE before that)

## Further test items

- [ ] test upgrade path from previous ownCloud app
- [ ] Test when purchased license expires - user settings fall back to default 5 users oC CE.
- [ ] Check the performance impact of QNAP license implemenation (noticeable slowdown or not)
- [ ] Backup and Restore
