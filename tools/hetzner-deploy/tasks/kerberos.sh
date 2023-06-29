#! /bin/sh
#
# this is not yet a useful script. It is just Juergen's quick run trhough Geralds extensive documentation


cat << EOF
Setup Documentation:
- https://github.com/GeraldLeikam/tutorials/
- https://confluence.owncloud.com/display/~gleikam/Tutorials

Overview:
- Windows AD server + WND server (can be on the same machine, started from the sysprep win2022 snapshot).
- ownCloud 10 server + user_ldap + kerberos + wnd-2.2.0 apps.
- Windows Desktop - (must be in domain?) at hetzner, must be in same network.  (or also locally on virtualbox?)

Tasks:
- Users from a windows desktop should be able to authenticate at ownCloud using Kerberos protocol
- ownCloud offers a WND share and uses kerberos autenticaiton, to make this share available to users.


Setup steps:

1) Log in to hetzner Cloud Console, select QA project, click snapshots
2) Select the 3 dots from 'winServer2022-sysprep' and
   -> Create New Server, Nuremberg, CPX31
        -> keep selected both,
           [X] public IPv4 and
           [X] public IPv6         (server won't configure correctly if IPv6 is off here, we disable it later.
        -> add a [x] Private networks
           - kerberos.jw 10.42.0.0/16
        -> Select firewalls:
           - in-allow-windows-server-rdp
        -> labels owner:jw, used_for: kerberos_testing
        -> Server name:
           jw-w22-server-20230620          (the suggested name is something with ubuntu, that is misleading wrong)
3) Should be able to connect wit krdc directly after boot.
        -> Credentials in buttercup?

Again for the desktop, except only the
        type cx21 (should be sufficient)
        firewall in-allow-windows-server-rdp
and
        name jw-w22-desktop-20230620

Heztner console, [x] gui mode, click in window
 -> What is your country, language, keyboard:
        Germany, German (Germany), German
 -> License -> Accept
 -> Username Administrator
 -> Password
  -> Finish
  -> (Login at hconsole not needed, but shoud work)

apt install remmina-plugin-rdp
remmina
  name: w22-ad-server
  grup: kerberos.jw
  Protocol: RDP - ...
  Server: 157.90.23.205
  Username: Administrator
  Password: *****************
  Domain: (empty)
   -> Save and Connect, Certificate -> Accept
   -> Left side menu: [^v] Toggle dynamic resolution update

   -> edge
    - Start without your data
    - Continue without this data
    - ... bringing your browser data ...??? -> Don't allow
    - ... Microsoft more useful ...??? -> Don't allow
    -> Next -> Finish

Run updates -> https://github.com/GeraldLeikam/tutorials/blob/master/windows/server/2022/update_windows_server.md
 -> Restart (this kills the remmina connection. Wait 30 min before attempting to reconnect, or check the hetzner console)
 -> repeat once more


IPV6 aus -> https://github.com/GeraldLeikam/tutorials/blob/master/windows/server/2022/disable_ipv6_network.md
 -> Server Manager -> Local Server -> Interfaces (Click any)
   -> for both interfaces: -> Properties -> disable [ ] Internet Protocol 6 (TCP/IP 6)
     -> OK
 -> (`><,) Refresh local server

DNS NAME via cloudflare
  - ad01.ker.jw-qa.owncloud.works
  - desktop.ker.jw-qa.owncloud.works

Server Namen Ändern -> https://github.com/GeraldLeikam/tutorials/blob/master/windows/server/2022/change_server_name.md
 -> Server Manager -> Local Server -> Computer name (Click on the WIN-7GBXSE)
  Computer Name -> Computer description: [ad01.ker.jw-qa.owncloud.works]
  Computer Name -> Change: Computer name: [ad01]
        # Not yet: Member of (*) Domain: [ker.jw-qa.owncloud.works]
   -> ok, close, ..
   -> must restart -> restart now.
 - same for the [desktop] machine

Rolle hinzufügen
 -> Server Manager ->
   Select Server Roles -> Activ directory domain serice
   next next next next
        [x] Restart the destination server automatically...
         -> yes -> install
 wait ...
  -> Installation succeeded on ad01. -> Close

Active Direcory promoten...
 -> server manager Flag in gray top bar has a yellow triangle, -> click there
    small box with blue text -> Promote this server to a domain controller.
 -> (*) Add a new forest
   Root domain name: ker.jw-qa.owncloud.works
   -> next
        Password: [type an new password]
        Confirm Password:
   -> next
        [ ] DNS delgatin (not enabled)
   -> next
        Verify the netbios name:
        -> click, KER appears
        -> next
             location of the db
        -> next next ... wait ... (many yellw triangle appear. ignore these warnings)
         -> install ... wait longer ...

  -> you are about be signed out -> wait 1 min, remmina breaks,
        check console ..
          Applying computer settings (ca 5 min)
  -> Server Manager Dashboard now has two new badges
        AD DS
        DNS




Desktop joins domain

local server ethernet, details, find the one with the 10.xx.xx.03 address -> Ethernet instance 0 2
        properties
        internet protocol version 4 double click.
        (*) Use the following DNS server addess
        10.42.0.2                  (click through the interfaces of the server to find this...)
local server ethernet, details, find the one with the external interfac 10.xx.xx.03 address -> Ethernet instance 0
        properties
        internet protocol version 4 double click.
        (*) Use the following DNS server addess
        127.0.0.1                  (do not use the external IP of the ad01 here. strange, but it only works with localhost.)

Click on computer name, change
Member of
  (*) Domain
        ker.jw-qa.owncloud.works

Welcome to the ker.jw-qa.owncoud.works domain. -> OK

        restart -> ok -> close -> restart now.

Change remmina config for both machines.
        Domain: ker.jw-qa.owncoud.works



create more users at the AD. put them all in an rdp group,
        -> Server Manager
         -> top right bar, Tools, -> Active Directory Users and Computers
          click open ker.jwq-qa.owncloud.works
         -> There is an orgnisation unit Users. We can use that, but we better create an own unit.
           Right clock on ker.jwq-qa.owncloud.works -> New -> Organizationa Unit
                 ownCloud
                 -> there another -> New -> Organizationa Unit
                          Groups
                          -> New Group
                                   RDP
                 -> there another -> New -> Organizationa Unit
                          Users
                           -> New -> User
        Alice wonderland alice
        [ ] user must change
        [X] User cannot change
        [X] Password never expires
        -> enter a password with numbers and dashes:         1-pass-2-word-3
          -> Finish

        alice, bob, einstein
        -> select all three users, -> right click, -> Add to Roup
                 -> Enter the object name to select (examples):
                          rdp -> [Check Names] -> RDP gets underlined.
                 -> OK -> successfull.. -> OK

        and allow all users in group rdp to log in via rdp (at server or desktop or both?)

Desktop-> Server Manager -> Local Server -> Prpoerties -> Rempte Desktop -> click [Enabled] -> a new window opens
        System Properties -> Remote
        (*) allow remote connections to this computer [Select Users]
         rdp -> [check Names] -> (login, if needed) -> RDP gets underlined.

Log in alice via remmina

Then create a windows network share for the users...
Desktop -> File Explorer -> This PC -> Map Network Drive ...
        Drive: H:
        Folder: \\ad01 -> Browse -> click open, -> [Alice]          -> OK

OC10 connect: ?semi added to domain?, ?controller knows?
        - create hetzner machine, ...  fqdn: oc.jw-qa.owncloud.works
                 https://confluence.owncloud.com/display/SA/Kerberos+Setup+Guide
        - add to subnet jw.kerberos
        - ldap sync
                 - ad01-int.jw-qa.owncloud.works         10.42.0.2
                 Cannot autodetect base dn, when using an IP address. we a host name
                 Benutzer DN: Administrator@ker.jw-qa.owncloud.works
                 host: ldap://ad01-int.jw-qa.owncloud.works         port: 389
                 base dn: dc=ker,dc=jw-qa,dc=owncloud,dc=works
                 ldapsearch -d 0 -H ldap://10.42.0.2 -D administrator@ker.jw-qa.owncloud.works -w "$password" -b dc=ker,dc=jw-qa,dc=owncloud,dc=works
          Only these object classes: person
          Only from these groups: []
          Available groups
           scroll down to find 'RDP', click '>' -> it appears in 'Selected groups
            -> Ldap Filter appears: (&(|(objectclass=person))(|(|(memberof=CN=RDP,OU=Groups,OU=ownCloud,DC=ker,DC=jw-qa,DC=owncloud,DC=works)(primaryGroupID=1108))))
          [verify settings and count users]: 3
          Login Attributes
           -> [x] LDAP/AD Username
           -> [x] LDAP/AD Email-Addresse
            Other Attributes: userPrincpaName, sAMAccounName, givenName, displayName
          Advanced: [x] Configuration Aktive

            occ user:sync "OCA\User_LDAP\User_Proxy"

        - internal DNS:
		- ad01:	
                 	- C:\Windows\System32\driver\etc\hosts
				10.42.0.4	oc10122-kerberos-100rc2-20230627.jw-qa.owncloud.works
                        - service user
		- oc10122-kerberos-...:	
				10.42.0.2	ad01.ker.jw-qa.owncloud.works

- kerberos app config

   mv ~/krb5.conf /etc/krb5.conf
   echo "extension=krb5.so" > /etc/php/7.4/mods-available/krb5.ini
   phpenmod krb5
cat <<EOM >"/var/www/owncloud/config/kerberos.config.php"
<?php \$CONFIG = [

    /**
    * path to keytab to use, default is '/etc/krb5.keytab'
    */
    'kerberos.keytab' => '/etc/apache2/oc.ker.jw-qa.owncloud.works.keytab',

    /**
    * timeout before re-enableing spnego based auth after logout, default is 60
    */
    'kerberos.suppress.timeout' => 0,

    /**
    * the domain name - remove from principals to match the pure username
    * e.g. alice@corp.dir will look for the user alice in ldap if 'kerberos.domain' is set to corp.dir
    */
    'kerberos.domain' => '',

    /**
    * Name of login button on login page
    */
    'kerberos.login.buttonName' => 'Windows Domain Login (Kerberos)',

    /**
    * If set to true the login page will immediately try to log in via Kerberos
    */
    'kerberos.login.autoRedirect' => false

];
EOM


add to config.php:

    'wnd.kerberos.servers' => [
        'ad01' => [
            'ockeytab' => '/etc/apache2/oc.ker.jw-qa.owncloud.works.keytab',
            'ocservice' => 'HTTP/oc10122-kerberos-100rc2-20230627.jw-qa.owncloud.works', 
            'usermapping' => ['type' => 'Noop'],
            'ccachettl' => 3600,
        ],
    ],
   'wnd.kerberos.mappings' => [
      'id1' => ['type' => 'noop'],
      'id5' => ['type' => 'custom', 'param' => ['1234-abcd-9876' => 'user1', '1234-efdc-5555' => 'user2']],
    ],



create a keytabfile at windows:
Cmd:
	ktpass /princ HTTP/oc10122-kerberos-100rc2-20230627.jw-qa.owncloud.works@KER.JW-QA.OWNCLOUD.WORKS /mapuser krb5httpoc +rndPass /out oc.ker.jw-qa.owncloud.works.keytab /crypto all /ptype KRB5_NT_PRINCIPAL /mapop set

PowerShell:
	Set-ADAccountControl -Identity krb5httpoc -TrustedToAuthForDelegation $True 


mv ~/oc.ker.jw-qa.owncloud.works.keytab /etc/apache2/
service apache2 restart
Add ad01 as a dns server:
	vi /etc/netplan/50-cloud-init.yaml
	netplan apply
	systemd-resolve --flush-caches


Login at windows with domain, check user settings: KER\alice
 -> login at owncloud from that windows machine: using the 'Windows Domain Login (Kerberos)' button.
   -> A windows security requester come up. Username Alice, 
	Password .... (is still needed. TODO: Dennis says: no password is needed)


owncloud admin settings storage: 
	[x] Allow users to mount external storage
	   [x] Windows Network Drive

User Alice: Settings Storage: 
	Folder name:		Alice-WND 
	External storage: 	Windows Network Drive 
	Authentication: 	Kerberos
	Host:			ad01.ker.jw-qa.owncloud.works
	Share:			alice
	Domain:			KER
	Kerberos data id:	
EOF
