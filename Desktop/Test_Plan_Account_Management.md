# Account Management

## 1. Add new account - happy path

### Precondition

Different ways to open ownCloud **connection wizard**

(After installation)

1. Install ownCloud desktop client
2. Open desktop client, wizard opens automatically

or

(From desktop client GUI)

1. Open the desktop client GUI
2. Click 'Add account' from the tab

or

(From system tray icon)

1. Open the desktop client (owncloud icon is available in the system tray)
2. Click the owncloud icon
3. Select ""Create a new account"" from the dropdown menu

| ID | Test Case            | Steps to reproduce                                        | Expected Result                    | Result | Related Comment |
|----|----------------------|-----------------------------------------------------------|------------------------------------|--------|-----------------|
| 1  | Valid server address | Enter a valid server address in the Connection Wizard     | 'Open Browser' wizard is displayed |        |                 |
| 2  | Open browser         | Click ""Open browser"" and finish off the login via webUI | "You're all set" wizard is shown   |        |                 |
| 3  | Confirm              | Confirm "You're all set" wizard                           | New account is added to the client |        |                 |

## 2. SSL Client Certificate

### Precondition

**Server setup**

* create self signed cert **openssl req -new -x509 -days 365 -nodes -out /etc/apache2/ssl/owncloud.pem -keyout
  /etc/apache2/ssl/owncloud.key**
* edit **/etc/apache2/sites-available/default-ssl-conf** to have
    * SSLEngine on
    * SSLVerifyClient require
    * SSLVerifyDepth 0
    * SSLCertificateFile /etc/apache2/ssl/owncloud.pem
    * SSLCertificateKeyFile /etc/apache2/ssl/owncloud.key
* **a2enmod ssl; systemctl restart apache2**
* ...? or something else needed? ...

#### Client setup

1. Go to an Account tab
2. open the Account dropdown menu. -> Add new ...
3. Add server address -> use https:// on a server that only does http
4. Click Next
5. Configure client side certificate

| ID | Test Case           | Steps to reproduce                                                                                                                                                                                                | Expected Result                                                                        | Result | Related Comment |
|----|---------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------|--------|-----------------|
| 1  | Invalid certificate | Upload a certificate that cannot be loaded (eg. empty .p12 file)                                                                                                                                                  | 'Could not load certificate. Maybe wrong password?' warning message has been displayed |        |                 |
| 2  | Expired certificate | Upload an expired certificate. TODO: create one, and attach it here<br/>From: https://github.com/owncloud/client/issues/6128<br/>openssl pkcs12 -export -clcerts -in client.crt -inkey client.key -out client.p12 | Some error message is displayed. TODO: which one?                                      |        |                 |
| 3  | Valid certificate   | Upload a valid certificate. TODO: create one that never expires. attach here ....                                                                                                                                 | TODO ask Michael                                                                       |        |                 |

## 3. Advanced folder connection

### Precondition

1. Click 'Add acoount' from the Account tab
2. Account Connection wizard opens
3. Enter server url and login
4. 'You're all set' window appears
5. Tick Advanced checkbox

| ID | Test Case                        | Steps to reproduce                                                                                                                                                                                                                                 | Expected Result                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | Result | Related Comment |
|----|----------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1  | Sync new local folder            | * Select **Download everything (recommended)**<br/>* Select **local folder that does not exist**                                                                                                                                                   | * Everything from the server has been synced<br/>* New local folder has been created                                                                                                                                                                                                                                                                                                                                                                                                  |        |                 |
| 2  | Sync already synced local folder | * Select **Download everything (recommended)**<br/>* Select **local folder that already exists and includes some folders and files not related to ownCloud**                                                                                       | * Local content has been synced to the server<br/>* Server content has been synced to local folder                                                                                                                                                                                                                                                                                                                                                                                    |        |                 |
| 3  | Manual Configuration             | Select **Configure synchronization manually** and click Finish                                                                                                                                                                                     | 'Add Folder Sync Connection' Wizard is displayed                                                                                                                                                                                                                                                                                                                                                                                                                                      |        |                 |
| 4  | Select Use virtual files         | Select **Use virtual files instead of downloading content immediately**                                                                                                                                                                            | Linux:<br/>Warning window has been shown<br/>Selecting 'Stay safe' returns to 'Download everything (recommended)'                                                                                                                                                                                                                                                                                                                                                                     |        |                 |
| 5  | Experimental place holder mode   | [Linux]<br/>Select **Enable experimental placeholder mode** and click finish                                                                                                                                                                       | Everything form the server has been synced as virtual files                                                                                                                                                                                                                                                                                                                                                                                                                           |        |                 |
| 6  | Select already synced folder     | 1. Sync everything from the server<br/>2. Select **local ownCloud sync folder that was previously used** with the same account on the same server<br/>3. Make sure the content of one file is changed<br/>4. Select Keep local data<br/>5. Connect | * 'There are unresolved conflicts' massage has been shown<br/>* There is an 'i' overlay icon on the folder sync connection<br/>* 'Click for details' redirects to 'Not Synced' tab<br/>* There is a link to documentation on how to resolve at the bottom<br/>* Two copies of the file have been created:<br/>- `<file>.txt` containing "*remote contents*"<br/>- `<file> (conflicted copy <date> <number>).txt` containing "*local contents*" that has not been synced to the server |        |                 |

## 4. Logout

### Precondition

1. Open the desktop client
2. Go to Account tab

| ID | Test Case | Steps to reproduce                                                                                                  | Expected Result                                                                                                                     | Result | Related Comment |
|----|-----------|---------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1  | Log out   | 1. Open an account that is currently connected to the server<br/>2. Click 'Log out' from the Account drop-down menu | Client has been disconnected -  the status overlay icon is grey<br/>Status message has been changed to 'Signed out from http://...' |        |                 |

## 5. Remove Account

### Precondition

1. Open the desktop client
2. Go to Account tab

| ID | Test Case                | Steps to reproduce                           | Expected Result                               | Result | Related Comment |
|----|--------------------------|----------------------------------------------|-----------------------------------------------|--------|-----------------|
| 1  | Remove connection        | Click 'Remove' in the Account drop-down menu | Confirmation pop-up has been displayed        |        |                 |
| 2  | Cancel remove connection | Click 'Cancel'                               | Account has not been removed                  |        |                 |
| 3  | Remove Connection        | Click 'Remove Connection'                    | Account has been removed                      |        |                 |
| 4  | Remove all accounts      | Remove all accounts from the client          | ownCloud connection wizard has been displayed |        |                 |

## 6. Account Information

### Precondition

1. Open the client
2. Add an account
3. Connect to the server
4. Go to the Account tab

To enable **SSL certificates** run

* sudo a2enmod ssl
* systemctl restart apache2
* sudo a2ensite default-ssl
* systemctl reload apache2

To disable **SSL certificates** run

* sudo a2dismod ssl

| ID | Test Case               | Steps to reproduce                                                                                                                                | Expected Result                                                                                                                                                                                                                                                                   | Result | Related Comment |
|----|-------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1  | Server Version          | Verify correct server version is shown in the drop-down menu links next to 'Connected to ... as ...' message                                      | Server version is correct correclty shown in the drop down from the green lock icon.<br/>Server name should not be the name of a branded client.                                                                                                                                  |        |                 |
| 2  | Server Address          | For http server address verify information about the connection in the drop-down menu links next to 'Connected to ... as ...' message is correct  | 'The connection is not secure' information is displayed<br/>The lock icon is grey with little yellow triangle                                                                                                                                                                     |        |                 |
| 3  | Server Address          | For https server address verify information about the connection in the drop-down menu links next to 'Connected to ... as ...' message is correct | The lock icon is green and when clicked user can see all information about certificates according to the following pattern:<br/>Greyed out: TLSv1.2 RSA, ECDH, AESGCM(256), Certificate information<br/>Clickable: DST ROOT CA X3, -> Let's Encrypt Authority X3, -> owncloud.org |        |                 |
| 4  | Signed out user         | Click on the server address when user is signed out                                                                                               | User has been presented with web interface                                                                                                                                                                                                                                        |        |                 |
| 5  | Logged in user          | Click on the server address when user is logged in                                                                                                | User has been presented with web interface                                                                                                                                                                                                                                        |        |                 |
| 6  | Check connection status | 1. Connect a client with a server<br/>2. Stop the server<br/>3. Check if the client is connected to the server                                    | Client indicates that it is offline<br/>Github issue: https://github.com/owncloud/client/issues/7160                                                                                                                                                                              |        |                 |

## 7. Multiple accounts

| ID | Test Case        | Steps to reproduce | Expected Result                | Result | Related Comment |
|----|------------------|--------------------|--------------------------------|--------|-----------------|
| 1  | Add two accounts | Add two accounts   | Client can handle two accounts |        |                 |

## 8. Quota

### Precondition

* Have **versioning disabled** on the server so it does not count against your quota (the ""Versions"" app should be
  enabled by default. Versions are then available at the Details Sidebar of the File (three dots on the right side ->
  Details))
* Have your **trash can empty** (Log in to WebUI -> see Deleted files in left bottom corner)

| ID | Test Case                          | Steps to reproduce                                                                      | Expected Result                                                                                                                                                      | Result | Related Comment |
|----|------------------------------------|-----------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1  | Set quota to 5 GB                  | Set the quota to 5 GB on the server<br/>Check the client                                | Client shows in the account tab: ""xxx GB of 5 GB in use""                                                                                                           |        |                 |
| 2  | Set unlimited quota                | Set the quota to unlimited on the server                                                | Client shows in the account tab: ""xxx GB in use""                                                                                                                   |        |                 |
| 3  | Set lower quota                    | Set the quota lower to e.g. 10 MB (but higher than what you already have) on the server | Client shows the new quota                                                                                                                                           |        |                 |
| 4  | Set quota lower than what you have | Set the quota lower than what you already have                                          | Used space and available quota are shown correctly in the client<br/>GitHub issue https://github.com/owncloud/client/issues/7193                                     |        |                 |
| 5  | Compare quota                      | Compare the used GB on server and on client                                             | Used space on server and client are the same<br/>Github issue https://github.com/owncloud/client/issues/7220                                                         |        |                 |
| 6  | Sync file with insufficient quota  | Sync a new file from the client to the server                                           | 'There is insufficient space available on the server for some uploads' message<br/>Red icon against the file in the file system<br/>New entry in Not synced protocol |        |                 |
| 7  | Increase quota                     | Increase quota<br/>Click 'Retry' button in Not synced protocol                          | File has been uploaded                                                                                                                                               |        |                 |

## 9. Context menu in the folder sync connection

### Precondition

1. Open the desktop client
2. Go to the Account tab
3. Expand the folder sync connection

| ID | Test Case                    | Steps to reproduce                                                                                 | Expected Result                             | Result | Related Comment |
|----|------------------------------|----------------------------------------------------------------------------------------------------|---------------------------------------------|--------|-----------------|
| 1  | Open folder in file explorer | 1. Right click on a folder (subfolder of the root ownCloud folder)<br/>2. Select Open local folder | Folder has been opened in the file explorer |        |                 |
| 2  | Open folder in browser       | 1. Right click on a folder<br/>Select Open folder in browser                                       | Folder has been opened in the browser       |        |                 |

## 10. Server Maintenance

### Precondition

Turn off the maintenance mode: sudo -u www-data php occ maintenance:mode --off (run from owncloud directory)

| ID | Test Case               | Steps to reproduce                                             | Expected Result                         | Result | Related Comment |
|----|-------------------------|----------------------------------------------------------------|-----------------------------------------|--------|-----------------|
| 1  | Check connection status | Check the connection status when server is in maintenance mode | 'Server is in maintenance mode' message |        |                 |

## 11. Overlay icons - Windows

### Precondition

* VFS off
* One file that has been synced
* One ignored file
* One file that cannot be synced (e.g. missing etag or virus file)

| ID | Test Case         | Steps to reproduce                                                        | Expected Result                                         | Result | Related Comment |
|----|-------------------|---------------------------------------------------------------------------|---------------------------------------------------------|--------|-----------------|
| 1  | Ignored file      | Check the overlay icon of an ignored file                                 | Yellow round overlay icon with an exclamation mark      |        |                 |
| 2  | Not synced file   | Check the overlay icon of a file that has not been synced due to an error | Red round overlay icon with a cross                     |        |                 |
| 3  | Synced file       | Check the overlay icon of a synced file                                   | Green round overlay icon of a file that is being synced |        |                 |
| 4  | File being synced | Check the overlay icon of a file that is being synced                     | Blue round overlay icon with syncing arrows             |        |                 |

## 12. Local sync folder

| ID | Test Case                | Steps to reproduce                 | Expected Result                                                 | Result | Related Comment |
|----|--------------------------|------------------------------------|-----------------------------------------------------------------|--------|-----------------|
| 1  | Delete local sync folder | Delete the whole local sync folder | ""Unable to find local sync folder"" message in the Account tab |        |                 |

## 13. Overlay icons - macOS

### Precondition

* One file that has been synced
* One ignored file
* One file that connost be synced (e.g. missing etag or virus file)

| ID | Test Case         | Steps to reproduce                                                                         | Expected Result                                    | Result | Related Comment |
|----|-------------------|--------------------------------------------------------------------------------------------|----------------------------------------------------|--------|-----------------|
| 1  | Ignored file      | Check the overlay icon of an ignored file                                                  | Yellow round overlay icon with an exclamation mark |        |                 |
| 2  | Not synced file   | Check the overlay icon of a file that has not been synced due to an error (exceeded quota) | Red round overlay icon with a cross                |        |                 |
| 3  | Synced file       | Check the overlay icon of a synced file                                                    | Green round overlay icon with a check mark         |        |                 |
| 4  | File being synced | Check the overlay icon of a file that is being synced                                      | Blue round overlay icon with syncing arrow         |        |                 |

## 14. Overlay icons - Linux

* One file that has been synced
* One ignored file
* One file that connost be synced (e.g. missing etag or virus file)

| ID | Test Case         | Steps to reproduce                                                        | Expected Result                                    | Result | Related Comment |
|----|-------------------|---------------------------------------------------------------------------|----------------------------------------------------|--------|-----------------|
| 1  | Ignored file      | Check the overlay icon of an ignored file                                 | Yellow round overlay icon with an exclamation mark |        |                 |
| 2  | Not synced file   | Check the overlay icon of a file that has not been synced due to an error | Red round overlay icon with a cross                |        |                 |
| 3  | Synced file       | Chek the overlay icon of a synced file                                    | Green round overlay icon with a check mark         |        |                 |
| 4  | File being synced | Check the overlay icon of a file that is being synced                     | Blue round overlay icon with syncing arrows        |        |                 |

## 15. Add new account - negative test

### Precondition

Two ways to open ownCloud **connection wizard**

1. Open the desktop client
2. Go to Account tab
3. Click 'Add new' in Account dropdown menu

or

1. Install ownCloud desktop client
2. Wizard gets opened automatically at the end of installation process

To enable **SSL certificates** run

* sudo a2enmod ssl
* systemctl restart apache2
* sudo a2ensite default-ssl
* systemctl reload apache2

To disable **SSL certificates** run

* sudo a2dismod ssl

| ID | Test Case                                                      | Steps to reproduce                                                                                                                              | Expected Result                                                                                                                                                                                                                                                         | Result | Related Comment |
|----|----------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1  | Turned off server                                              | Enter a server address into ownCloud Connection Wizard when the server has been turned off                                                      | 'Failed to connect to ownCloud at... Connection refused' warning message has been displayed                                                                                                                                                                             |        |                 |
| 2  | Wrong server address format                                    | Enter a server address in a wrong format into ownCloud Connectin Wizard                                                                         | 'Invalid URL' warning message has been displayed                                                                                                                                                                                                                        |        |                 |
| 3  | http server address                                            | Enter http server address                                                                                                                       | Lock icon on the right side is grey                                                                                                                                                                                                                                     |        |                 |
| 4  | https server address                                           | Enter https server address                                                                                                                      | Lock icon on the right side is green                                                                                                                                                                                                                                    |        |                 |
| 5  | Use https server address when no secure connection is required | Enter a https server address into ownCloud Connection Wizard when the server doesn't require secure connection                                  | 'Failed to connect to the secure server address... How do you wish to proceed?' warning message has been displayed<br/>Three buttons are avaiable<br/>* Select a different URL<br/>* Retry unencrypted over HTTP (insecure)<br/>* Configure client-side TLS certificate |        |                 |
| 6  | Select different URL                                           | Click on 'Select different URL' button                                                                                                          | 'Failed to connect to ownCloud at... SSL handshake failed' warning message has been displayed                                                                                                                                                                           |        |                 |
| 7  | Retry unencrypted over HTTP                                    | Click on 'Retry unencrypted over HTTP (insecure)' button                                                                                        | 'Enter user credentials' screen has been displayed (when server doesn't require secure connection)                                                                                                                                                                      |        |                 |
| 8  | Configure client-side TLS certificate                          | Click on 'Configure client-side TLS certificate' button                                                                                         | 'SSL client certificate authentication' pop-up has been displayed                                                                                                                                                                                                       |        |                 |
| 9  | Wrong credentials                                              | Click 'Click here' button to request an app password from the web interface<br/>In the 'Enter user credentials' screen, enter wrong credentials | 'Access forbidden by server. To verify that you have proper access, click here to access the service with your browser' warning message has been displayed                                                                                                              |        |                 |
| 10 | Correct credentials when server is off                         | Enter correct credentials within 'Enter user credentials' screen when the server is off                                                         | 'Connection refused' warning message has been displayed                                                                                                                                                                                                                 |        |                 |

## 16. Deleting server folders

| ID | Test Case              | Steps to reproduce                                                                                                                                                                                                                                        | Expected Result                                                                                                                  | Result | Related Comment |
|----|------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1  | Delete received folder | 1. Add the below line into config.php on the server (From now on the incoming shares will be shown in that folder)<br/>'share_folder'=>'/ReceivedShares'<br/>2. User1 shares a resource to User2<br/>3. User2 deletes ReceivedShares folder on the client | Folder has neither been deleted on the client nor on the server<br/>Github issue: https://github.com/owncloud/client/issues/7496 |        |                 |
