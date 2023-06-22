#! /bin/sh
#
# this is not yet a useful script. It is just Juergen's quick run trhough Geralds extensive documentation


cat << EOF
Setup Documentation:
- https://github.com/GeraldLeikam/tutorials/
- https://confluence.owncloud.com/display/~gleikam/Tutorials

Overview:
- Windows AD server + WND server (can be on the same machine, started from the sysprep win2022 snapshot).
- ownCloud 10 server + user_ldap + kerberos app.
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
           [X] public IPv6	(server won't configure correctly if IPv6 is off here, we disable it later.
	-> add a [x] Private networks
	   - kerberos.jw 10.42.0.0/16
	-> Select firewalls:
	   - in-allow-windows-server-rdp
	-> labels owner:jw, used_for: kerberos_testing
        -> Server name:
	   jw-w22-server-20230620 	(the suggested name is something with ubuntu, that is misleading wrong)
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
   next next next next install

Active Direcory promoten...
 -> zum domain controller promoten ...

Desktop joins domain

OC10 connect: ?semi added to domain?, ?controller knows?

EOF
