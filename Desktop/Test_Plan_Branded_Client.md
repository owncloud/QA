## Testplan Branded Desktop Client 2.7.5

### Setup

<details><summary>using brandings: damkencloud, ocfablabnbg & testpilot (click to view details)</summary>
Check the configuration

1.   Log in to https://customer.owncloud.com/owncloud/
2.   Go to ownBrander    Change user - > Carlos Damken Testing cloud -> Switch to user
3.    Select Desktop in the left menu
4.    make VFS unchecked
5.    Click Generate

Download the built packages

1.    Login with an admin account
2.   Go to Users
3.    Search for Carlos Damken Testing
4.   Impersonate
5.    Go to All files -> carlos_damken -> Desktop Client
6.    unpack the linux tar archive in a websever root.
    6.1 find the URL of the unpacked archive
    6.2 edit the download/example.sh srcipt to have this URL  instead of 'http://download.example.com/repo'
    6.3 run `bash download/example.sh`
    6.4 in case your webserver cannot do https, run `sed -i -e 's@https://@http://@g' download/*.html`
    6.5 click on the url printed by running the example.sh and follow the instructions as needed.    
</details>


### References:

- [Testlink](https://testlink.owncloud.team/linkto.php?tprojectPrefix=desktop&item=testcase&id=desktop-159)
- [Template](https://github.com/owncloud/enterprise/edit/master/Server/Test_Plan_Branded_Client.md)
  
### Testing functionality


1. * [ ] Install Carlos Damken Testing cloud on **Windows** and log in 
	* [ ] Server address is fixed - https://cloud.damken.com
	* [ ] Installed version is correct
	* [ ] Branded images are correct
	* [ ] Overlay icons are correct

2. * [ ] Install Carlos Damken Testing cloud on **macOS** and log in 
        * [ ] Server address is fixed
        * [ ] Installed version is correct
        * [ ] Branded images are correct
        * [ ] Overlay icons are correct

3. * [ ] Install Carlos Damken Testing cloud on **Linux Mint** and log in 
        * [ ] Server address is fixed
        * [ ] Installed version is correct
        * [ ] Branded images are correct
        * [ ] Overlay icons are correct

4. * [ ] Install Carlos Damken Testing cloud on **openSUSE latest** and log in 
        * [ ] Server address is fixed
        * [ ] Installed version is correct
        * [ ] Branded images are correct
        * [ ] Overlay icons are correct

5. * [ ] Check the list of Linux distributions in customer 
        * [ ] Unpack ...linux.tar -> download -> index.html
        * [ ] All the requested platforms have been built

6. * [ ] Run [Linux Install tests](https://confluence.owncloud.com/display/OG/Automated+Tests)   - @GeraldLeikam
        * [ ] TestpilotCloud
        * [ ] FabLab
        * [ ] DamkenCloud
        * [ ] Attach (folded) reports as a comment below.

7. * [ ] Install Testpilot cloud on **Debian latest** and log in 
        * [ ] Server address is not fixed
        * [ ] Installed version is correct
        * [ ] Branded images are correct
        * [ ] Overlay icons are correct

8. * [ ] Install Testpilot cloud on **Centos latest** and log in 
        * [ ] Server address is not fixed
        * [ ] Installed version is correct
        * [ ] Branded images are correct
        * [ ] Overlay icons are correct


9. * [ ] Check VFS available 
        * [ ] TestPilot is built in ownbrander without VFS.
        * [ ] FabLabClient is built in ownbrander with VFS.
        * [ ] DamkenCloud is built in ownbrander without VFS.
        * [ ] Fablabclient has the experimental VFS option int he three dots menu.

10. * [ ] Check all FabLab packages have been built
        * [ ] All packages have been built (with VFS enabled)

11. * [ ] Check online updater for DamkenCloud works
        * [ ] Online updater works

12. * [ ] There are no experimental items in the branded clients 
        * [ ] No Experimental section in General tab

13. * [ ] VFS is not available in the tree dots menu when the  VFS option is disabled in ownBrander

