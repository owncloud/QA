# 'Market' Test Plan

## Setup
<details><summary>Setup details (click to view)</summary>
   - https://oc1091-rwp-140-rc1-20220211.jw-qa.owncloud.works
</details>

## Testing functionality

----
| Test Case                                | Expected Result                                                                      | Result          | Related Comment |
| ---------------------------------------- | ------------------------------------------------------------------------------------ | --------------- | --------------- |
| Enable market app. Login as admin user and regular user. | Admin user can see cart icon in the left menu and can be accessed. Regular user cannot see cart icon and cannot access market. | :construction:  |                 |
| Check that left and right menus are following the css style of the rest of oC server |                                          | :construction:  |                 |
| Check that the connection with the marketplace is working and the list of apps is being retrieved. |                            | :construction:  |                 |
| Install one community app previously included with owncloud. (user_ldap, activity,  gallery, etc) | There is no problem with installation. (If there are problems try with another, here we are testing the market app, not the actual app installed) | :construction:  |                 |
| Use occ market:list                      | A list of the existing apps in the marketplace appears.                              | :construction:  |                 |
| Use occ market:install {choose an app from the previous list} | The app is installed correctly.                                 | :construction:  |                 |
| 1. Download the code from marketplace of an app of your choice like a tar.gz file. 2. Use occ market:install --local=AppCode.tar.gz | The app is installed correctly.          | :construction:  |                 |
| 1. Download the code from marketplace of an app of your choice with several versions available like a tar.gz file, get the oldest version available. Also download the newest version. 2. Use occ market:install --local=App.oldVersion.tar.gz 3. Run occ market:upgrade --local=App.newVersion.tar.gz | The app is updated correctly.          | :construction:  |                 |
| Check that the web ui elements work fine using Safari |                                                                         | :construction:  |                 |
| Check that the web ui elements work fine using IE 11 |                                                                          | :construction:  |                 |
| Check that the web ui elements work fine using Edge |                                                                           | :construction:  |                 |
| Check that the web ui elements work fine using Firefox |                                                                        | :construction:  |                 |
| Check that the web ui elements work fine using Chrome |                                                                         | :construction:  |                 |
| Having installed one app from the marketplace, uninstall it using the webui, reinstall it again |  The app is uninstalled correctly and installed again without problems.                                         | :construction:  |                 |

