# Inatallation and Update

## 1. Windows installation

| ID | Test Case                       | Steps to reproduce                                                                                                                                                                                                    | Expected Result                                                                                                                                                                                            | Result | Related Comment |
|----|---------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1  | Install ownCloud desktop client | Install ownCloud desktop client on Windows using .msi installer<br/>Run the below command in cmd<br/>`"C:\\Program Files (x86)\ownCloud\owncloudcmd.exe" --version`                                                   | ownCloud version has been printed                                                                                                                                                                          |        |                 |
| 2  | Change language settings        | Change your desktop language settings to any other language than English<br/>Run .GPO.msi installer (It should have exactly this suffix. If only a .en_US.msi can be found, that is the same thing, but badly named). | Language of the installer is English                                                                                                                                                                       |        |                 |
| 3  | Check language                  | Finish the installation with .GPO.msi installer and check the language of the client                                                                                                                                  | Language of the client match the language of your computer settings                                                                                                                                        |        |                 |
| 4  | Check MSI detail page           | Check the MSI details page for a verified publisher and certificate expiry                                                                                                                                            | Verified publisher: ownCloud GmbH<br/><br/>Show information about the publisher's certificate<br/>Issued to: ownCloud GmbH<br/>Issued by: COMODO RSA Code Signing CA<br/>Valid from 2/13/2018 to 2/14/2022 |        |                 |

## 2. Windows update

### Precondition

Note: An existing download URL is required to make the install succeed. If we test with an invented one, the update must
fail.

There is also an environment variable to redirect the online updater.

Windows - build number compiled in the build package does not match with the package name. Install the package first,
have a look what build is inside and then set up the online updater config right

**DOCKER**

1) [git clone git@github.com:owncloud/client-updater-server.git][1]
   git checkout the requested version

production is the version in https://customer.owncloud.com/owncloud/index.php/apps/files/?dir=%2Fclient-updater-server

2) bash run_updater_with_docker.sh

3) vi config/ownCloud.yml

when testing hg client: cp ownCloud.yml hg.yml
vi config/ownCloud.yml

4) Edit the config

* the version
  downloadUrl: http://client-linux-install.jw-qa.owncloud.works/client/

* add the win64msi section for Windows

throttle: 1 # throttling disabled

5) Remove seenVersion from owncloud.cfg:

* On Linux distributions:$HOME/.config/ownCloud/owncloud.cfg
* On Microsoft Windows systems:%APPDATA%\ownCloud\owncloud.cfg cd C:\Users\hana\AppData\Roaming\hg notepad hg.cfg
* On MAC OS X systems:$HOME/Library/Preferences/ownCloud/owncloud.cfg


6) Set the environment variable on the VM where the client is running as shown below - https://ip_address/client/

* Linux
    * export OCC_UPDATE_URL=""http://$IP_ADDR_OF_TEST_UPDATER_SERVER/client/""
    * curl -L -i ""$
      OCC_UPDATE_URL?version=2.5.4.11415&platform=win32&oem=ownCloud&versionsuffix=&channel=stable&msi=true""
    * owncloud * Windows
    * Windows-X -&gt; System -&gt; Advanced system settings -&gt; Advanced -&gt; Environment Variables...
    * Search: ""Environment"" -&gt; Edit environment variables for your account (control panel)
      -&gt; [Environment Variables...]
    * User Variables: New... OCC_UPDATE_URL http://172.42.16.57/client/ -&gt; OK -&gt; OK
    * cmd -&gt; echo %OCC_UPDATE_URL%
    * ""C:\Program Files (x86)\ownCloud\owncloud.exe""
* Mac

    * export OCC_UPDATE_URL=""http://$IP_ADDR_OF_TEST_UPDATER_SERVER/client/""


* Client config contains \`optionalDesktopNotifications=true\` in [General] section.

7) Upload the new versions to client-linux-install.jw-qa.owncloud.works/client
   Download the .msi, .pkg.tbz and .tar to your computer and e.g.
   scp btr-3.2.0.10203-x86_64.pkg.tbz root@client-linux-install.jw-qa.owncloud.works:client-repo-downloads/mac
   scp btr-3.2.0.10203-x86_64.msi root@client-linux-install.jw-qa.owncloud.works:client-repo-downloads/win
   scp qa-3.2.0.10266-linux.tar root@client-linux-install.jw-qa.owncloud.works:client-repo-downloads/

**References**

* https://github.com/owncloud/enterprise/blob/master/client\_update\_checker/README.md#deploy
* https://github.com/owncloud/client-updater-server
* http://10.42.16.57/client

[1]: https://github.com/owncloud/client-updater-server

| ID | Test Case                        | Steps to reproduce                                                                                                                                            | Expected Result                                                                                                                                                                                    | Result | Related Comment |
|----|----------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1  | Update Client                    | Update the client by clicking by Restart&amp;Update button                                                                                                    | Client has been updated                                                                                                                                                                            |        |                 |
| 2  | Update dialog                    | 1.  Go back to the previous version (fresh install after deleting owncloud.cfg)<br/>2.  Quit the client<br/>3.  Double click owncloud desktop icon to restart | NOTE: New Update Dialog not yet in Windows (Should be available from client v6)<br/>- 'New ownCloud Update Ready' dialog<br/>- Desktop notification has been shown mentioning the available update |        |                 |
| 3  | Install update                   | Install the update                                                                                                                                            | Update succeeds if a real URL was given in the updater.<br/>Settings tab shows&nbsp;the new version                                                                                                |        |                 |
| 4  | Installing at different location | 1.  Install ownCloud at non default location<br/>2.  Update                                                                                                   | Auto-update follow the installation path selected by the previous version                                                                                                                          |        |                 |

## 3. Windows update - changing channel

### Precondition

Note: An existing download URL is required to make the install succeed. If we test with an invented one, the update must
fail.

There is also an environment variable to redirect the online updater.

Windows - build number compiled in the build package does not match with the package name. Install the package first,
have a look what build is inside and then set up the online updater config right

**DOCKER**

[git clone git@github.com:owncloud/client-updater-server.git][1]

docker-compose up

docker exec -it $CONTAINER bash

vi config/ownCloud.yml

Set the environment variable as shown below - https://online-updater.owncloud.works/client/

Remove seenVersion from owncloud.cfg:

* On Linux distributions:$HOME/.config/ownCloud/owncloud.cfg
* On Microsoft Windows systems:%APPDATA%\ownCloud\owncloud.cfg
* On MAC OS X systems:$HOME/Library/Preferences/ownCloud/owncloud.cfg

**MANUAL INSTALLATION**

**Install Apache with PHP**

* sudo apt install apache2 php7.2

**Enable SSL**

* sudo a2enmod ssl
* sudo a2ensite default-ssl
* sudo apt install ssl-cert
* systemctl restart apache2

Download

* client-qa-server-0.4.tar.bz2 (or later) from

Run the below commands

* scp client-updater-server-*.tar.bz2 root@$IP\_ADDR\_OF\_TEST\_UPDATER_SERVER:/var/www/html
* ssh root@$IP\_ADDR\_OF\_TEST\_UPDATER_SERVER
* cd /var/www/html
* tar xvf client-updater-server-*.tar.bz2
* ln -s client-updater-server-* client
* cd client
* vi config/ownCloud.yml

Add a future release to the three platforms 'linux', 'win32', 'macos'. This affects the stable channel.

Do not add anything for 'linux-unstable', 'win32-unstable', 'macos-undtable'. This affects the beta channel.

Disable throtteling in this server.

For msi, we need to use the msvc build number, as this is the build number seen in the binaries with e.g. strings
ownCloud-2.5.0.10598.msi | grep VERSION:

VERSION:2.5.0 (build 10560):1.1

Add into the file:

throttle: 1 # throttling disabled platforms:win32msi:currentVersion: 3.8.0.4893 currentVersionString: ownCloud Client
3.8.0 (build 4893)updateUrl: http://owncloud.org/sync-clients
downloadUrl: https://download.owncloud.com/desktop/stable/ownCloud-3.8.0.4893-setup.exemacos:... linux:...

* service apache2 restart

**Prepare environment to use a the above update server**  
(Do not try DNS overrides. This yields https:// errors due to self signed or missing certificates.)  
(Do not rely on 302 redirect to append the trailing /. Client 2.5.4.11415 on win32 does not redirect!)

* Linux
    * export OCC\_UPDATE\_URL=""http://$IP\_ADDR\_OF\_TEST\_UPDATER_SERVER/client/""
    * curl -L -i ""$
      OCC\_UPDATE\_URL?version=2.5.4.11415&platform=win32&oem=ownCloud&versionsuffix=&channel=stable&msi=true""
    * owncloud * Windows
    * Windows-X -> System -> Advanced system settings -> Advanced -> Environment Variables...
    * Search: ""Environment"" -> Edit environment variables for your account (control
      panel) -> [Environment Variables...]
    * User Variables: New... OCC\_UPDATE\_URL http://172.42.16.57/client/ -> OK -> OK
    * cmd -> echo %OCC\_UPDATE\_URL%
    * ""C:\Program Files (x86)\ownCloud\owncloud.exe""  * Client config contains \`optionalDesktopNotifications=true\`
      in [General] section.

**Remove seenVersion from owncloud.cfg:**

* On Linux distributions:$HOME/.config/ownCloud/owncloud.cfg
* On Microsoft Windows systems:%APPDATA%\ownCloud\owncloud.cfg
* On MAC OS X systems:$HOME/Library/Preferences/ownCloud/owncloud.cfg

**References**

* https://github.com/owncloud/enterprise/blob/master/client\_update\_checker/README.md#deploy
* https://github.com/owncloud/client-updater-server
* http://10.42.16.57/client

[1]: https://github.com/owncloud/client-updater-server

| ID | Test Case                                   | Steps to reproduce                                                                                                                         | Expected Result                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            | Result | Related Comment |
|----|---------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1  | Cancel button                               | Click the Cancel button                                                                                                                    | Update Channel has not been changed                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |        |                 |
| 2  | Changing updating channel (stable to beta)  | Change Update Channel from **stable** to **beta** in the drop-down menu in General tab                                                     | Warning message has been shown:<br/><br/>The update channel determines which client updates will be offered for installation. The ""stable"" channel contains only upgrades that are considered reliable, while the versions in the ""beta"" channel may contain newer features and bugfixes, but have not yet been tested thoroughly.<br/><br/>Note that this selects only what pool upgrades are taken from, and that there are no downgrades: So going back from the beta channel to the stable channel usually cannot be done immediately and means waiting for a stable version that is newer than the currently installed beta version.<br/><br/>There are two buttons availble 'Cancel' and 'Change update channel' |        |                 |
| 3  | Change update channel                       | Click the 'change update channel' button                                                                                                   | Update Channel has been changed.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |        |                 |
| 4  | Verify chanel update                        | Verify after changing the Update Channel to beta when there is no new version available, 'You&rsquo;re up-to-date!' message has been shown | Message has been shown with the following text in its body:<br/><br/>owncloud *version*&nbsp;is currently the newest version available.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |        |                 |
| 5  | Changing updating channel (beta to stable ) | Change Update Channel from **beta** to **stable** in the drop-down menu in General tab                                                     | Warning message has been shown:<br/><br/>The update channel determines which client updates will be offered for installation. The ""stable"" channel contains only upgrades that are considered reliable, while the versions in the ""beta"" channel may contain newer features and bugfixes, but have not yet been tested thoroughly.<br/><br/>Note that this selects only what pool upgrades are taken from, and that there are no downgrades: So going back from the beta channel to the stable channel usually cannot be done immediately and means waiting for a stable version that is newer than the currently installed beta version.<br/><br/>There are two buttons availble 'Cancel' and 'Change update channel' |        |                 |
| 6  | Change update channel                       | Click the 'Change update channel' button                                                                                                   | Update Channel has been changed                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |                 |

## 4. Windows update - wrong url

### Precondition

There are two different dialogs. 'Update failed' is shown when the download url is wrong . It is shown*only*on startup,
when the client checks whether its version number has increased to the expected value and notices it hasn't.

When the download url is missing, user sees New version available dialog.

| ID | Test Case         | Steps to reproduce                                                                                                                                                                                                                                                                                                                              | Expected Result                                                                    | Result | Related Comment |
|----|-------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------|--------|-----------------|
| 1  | Wrong url         | Make sure downloadUrl in ownCloud.yml in online updater is wrong (e.g. doesn't exist)                                                                                                                                                                                                                                                           | **Update failed**&nbsp;dialog has been shown                                       |        |                 |
| 2  | Skip version      | Doesn't ask anymore<br/>Doesn't update<br/>Increases seenVersion in client config:<br/>seenVersion from owncloud.cfg:<br/>*   On Linux distributions:`$HOME/.config/ownCloud/owncloud.cfg`<br/>*   On Microsoft Windows systems:`%APPDATA%\ownCloud\owncloud.cfg`<br/>*   On MAC OS X systems:`$HOME/Library/Preferences/ownCloud/owncloud.cfg` |                                                                                    |        |                 |
| 3  | Ask again later   | Ask again later                                                                                                                                                                                                                                                                                                                                 | Asks again during next start                                                       |        |                 |
| 4  | Update manually   | Update manually                                                                                                                                                                                                                                                                                                                                 | Opens website                                                                      |        |                 |
| 5  | Restart and upate | Restart and update                                                                                                                                                                                                                                                                                                                              | Retries the update GitHub issue: https://github.com/owncloud/client/issues/7217    |        |                 |
| 6  | Version available | Make sure downloadUrl in ownCloud.yml in online updater is missing                                                                                                                                                                                                                                                                              | **New version available** dialog                                                   |        |                 |
| 7  | Skip              | Skip this time                                                                                                                                                                                                                                                                                                                                  | Asks again on the next start                                                       |        |                 |
| 8  | Skip Version      | Skip this version                                                                                                                                                                                                                                                                                                                               | Increases seen Version in client config<br/>Dosen't ask anymore<br/>Doesn't update |        |                 |
| 9  | Get update        | Get update                                                                                                                                                                                                                                                                                                                                      | Opens download website                                                             |        |                 |

## 5. MacOS installation

| ID | Test Case                       | Steps to reproduce                                                                                                                                           | Expected Result                   | Result | Related Comment |
|----|---------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------|--------|-----------------|
| 1  | Install ownCloud desktop client | Install ownCloud desktop client on MacOS using .pkg installer<br/><br/>Run `/Application/owncloud.app/Contents/MacOs/owncloud --version` command in Terminal | ownCloud version has been printed |        |                 |

## 6. MacOS update

### Precondition

Prepare online updater following description in Windows update test case

online updater works only with **.pkg.tbz**

**example yml [here][2]**

ResponseRenderer in /var/www/html/client-2018100213/src/XmlResponseRenderer.php

```
if (  
    !empty($currentVersionString) &&  
    !empty($pubDate) &&  
    !empty($downloadUrl) &&  
    !empty($currentVersion) &&  
    !empty($signature)  
) {  
    $txt .=  
        '  
            '. $currentVersionString.'  
            '.$pubDate.'  
            
            '.$minimumSystemVersion.'  
        ';
}
```

The client checks for udates in the background, while running. Defailt intervall is 10h.  
It can be changed to e.g. 1 Minute by adding this line to the owncloud.cfg file:

updateCheckInterval=60000

Troubleshooting:

1) php is returned - https connection instead of http

2) client not trying to reach the url - whitespaces in owncloud.yml

3) rss returned -

[1]: http://ttps://testlink.owncloud.team/linkto.php?tprojectPrefix=desktop&item=testcase&id=desktop-2

[2]: https://github.com/owncloud/client-updater-server/blob/master/config/ownCloud.yml#L20

| ID | Test Case           | Steps to reproduce                                                                                                                                                                     | Expected Result                                                                                                                               | Result | Related Comment |
|----|---------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1  | Software Update     | On the m1 mac:<br/>Run the below commands:<br/>`export OCC_UPDATE_URL=""**https**://online-updator.owncloud.works/client/""`<br/>`/Applicatiions/owncloud.app/Contents/MacOS/owncloud` | 'Software Update' dialog has been opened<br/><br/>Three buttons available:<br/>* Skip this version<br/>* Remind me later<br/>* Install Update |        |                 |
| 2  | Install update      | Click 'Install Update'                                                                                                                                                                 | New version has been installed                                                                                                                |        |                 |
| 3  | Check new update    | Check for new update again                                                                                                                                                             | ""You're up to date"" message                                                                                                                 |        |                 |
| 4  | Check for intel mac | Run the same test on Intel mac                                                                                                                                                         |                                                                                                                                               |        |                 |

## 7. MacOs update - special cases

| ID | Test Case    | Steps to reproduce        | Expected Result                                      | Result | Related Comment |
|----|--------------|---------------------------|------------------------------------------------------|--------|-----------------|
| 1  | Skip version | Click 'Skip This Version' | Client not updated and doesn't ask to update anymore |        |                 |
| 2  | Remind later | Click 'Remind me later'   | Client asks again on restart                         |        |                 |

## 8. Linux package installation

### Precondition

To install ownCloud desktop client

1. Go to [daily builds][1]
2. Find and open the intended desktop client version
3. Open ""linux"" and then ""download"" folder
4. Follow the instructions to install desktop client

Check which file manager is used: ""xdg-mime query default inode/directory""

Check which desktop environment is used: ""echo $XDG_CURRENT_DESKTOP""

To make ownCloud work with nautilus: ""sudo apt install owncloud-client-nautilus"" (use distro-specific command)

To make ownCloud work with dolphin: ""sudo apt install owncloud-client-dolphin"" (use distro-specific command)

[1]: https://download.owncloud.com/desktop/ownCloud/daily

| ID | Test Case               | Steps to reproduce                                                                                                                                | Expected Result               | Result | Related Comment |
|----|-------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------|--------|-----------------|
| 1  | Install ownCloud client | Install ownCloud client on **Ubuntu or Debian with GNOME and Nautilus file manager**<br/><br/>Run `owncloudcmd --version` command in the terminal | Client version is printed out |        |                 |
| 2  | Install ownCloud client | Install ownCloud client on **openSUSE with KDE and Dolphin file manager**<br/><br/>Run `owncloudcmd --version` command in the terminal            | Client version is printed out |        |                 |
| 3  | Install ownCloud client | Install ownCloud client on **Fedora or CentOS with GNOME and Nautlius file manager**<br/><br/>Run `owncloudcmd --version` command in the terminal | Client version is printed out |        |                 |
| 4  | Install ownCloud client | Install ownCloud client on **Mint with Nemo file manager**<br/><br/>Run `owncloudcmd --version` command in the terminal                           | Client version is printed out |        |                 |

## 9. Multiple Clients

| ID | Test Case           | Steps to reproduce                                                                     | Expected Result                                                                                                                                         | Result | Related Comment |
|----|---------------------|----------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1  | Install two clients | Install two clients (non-branded client and TestPilot)<br/><br/>Check the context menu | Both clients have ownCloud options in the context menu and icons in file explorer<br/><br/>GitHub issue: https://github.com/owncloud/client/issues/6983 |        |                 |

## 10. Update Failure

### Precondition

Set up an update server with a non-existant future version to provoke update errors.

Setup a custom updater.

Either a) Override the DNS entry for the update server: Add to your /etc/hosts file**: 116.203.54.22
updates.owncloud.com**

Or b) run the client with env var **OCC\_UPDATE\_URL=https://ip.of.test.server/client/**

| ID | Test Case          | Steps to reproduce                           | Expected Result                                                          | Result | Related Comment |
|----|--------------------|----------------------------------------------|--------------------------------------------------------------------------|--------|-----------------|
| 1  | Skip version       | When update fails, select Skip this version  | Not asked again on restart. Shows as ""up to date"" in updater info view |        |                 |
| 2  | Ask again later    | When update fails, select Ask again later    | Asks again on client restart                                             |        |                 |
| 3  | Restart and update | When update fails, select Restart and update | Attempts the updating process again                                      |        |                 |
| 4  | Update manually    | When update fails, select Update Manually    | Like ""skip this version"" but also opens browser on updating page       |        |                 |

## 11. Change update channel

| ID | Test Case             | Steps to reproduce                                                | Expected Result                                                        | Result | Related Comment |
|----|-----------------------|-------------------------------------------------------------------|------------------------------------------------------------------------|--------|-----------------|
| 1  | Change update channel | Change from Beta to Stable when Stable is lower version than Beta | It stays at the Beta version.<br/>FIXME: Downgrade is not implemented. |        |                 |

## 12. Linux branded repo updates

### Precondition

A branded client was installed from an ownbrander:Qt562:xxxx or ownbrander:Qt5121:xxxx repo.  
The current release of the branded client has a new QT version and is built in another obs project (or with drone).

| ID | Test Case                      | Steps to reproduce                                                              | Expected Result                                                          | Result | Related Comment |
|----|--------------------------------|---------------------------------------------------------------------------------|--------------------------------------------------------------------------|--------|-----------------|
| 1  | Unpack older version           | Unpack the older version of the linux repo of a branded client in a web server. | The repo is available in the webserver, the old version number is shown. |        |                 |
| 2  | Register repo location         | Register the repo location on Ubuntu 18.04 and Install.                         | Install works flawless                                                   |        |                 |
| 3  | Replace old repo with new repo | On the webserver replace the old repo with the new repo inplace.                | The new version number is shown in the donwload page.                    |        |                 |
| 4  | Run update command             | On the client run apt-get update                                                | The new content of the repo is offered as an update.                     |        |                 |
| 5  | Run update                     | Run the update                                                                  | The update works, the client remains functional after quit and restart.  |        |                 |

## 13. Linux AppImage Installation

Install documentation: https://doc.owncloud.com/desktop/next/installing.html#appimage

| ID | Test Case        | Steps to reproduce | Expected Result        | Result | Related Comment |
|----|------------------|--------------------|------------------------|--------|-----------------|
| 1  | Install AppImage | Install AppImage   | Successfully installed |        |                 |

## 14. Linux AppImage Update

| ID | Test Case       | Steps to reproduce                       | Expected Result           | Result | Related Comment |
|----|-----------------|------------------------------------------|---------------------------|--------|-----------------|
| 1  | Update AppImage | Update the AppImage using online updater | AppImage has been updated |        |                 |

## 15. Linux Package Update

| ID | Test Case      | Steps to reproduce                                                                                 | Expected Result                                                       | Result | Related Comment |
|----|----------------|----------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------|--------|-----------------|
| 1  | Package update | Make sure the client displays a notification when there is new version available in online updater | Notification has been shown, update has to be done manually and works |        |                 |

## 16. Downgrade

| ID | Test Case         | Steps to reproduce                                                                                                                      | Expected Result                                                 | Result | Related Comment |
|----|-------------------|-----------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------|--------|-----------------|
| 1  | Downgrade version | Downgrade to the old major version<br/>or<br/>Edit your ownCloud.cfg to change clientVersion to newer version, start the current client | index.php?/attachments/get/081215f6-628c-4cd7-b93f-adf98f7a9d27 |        |                 |
