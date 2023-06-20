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
	-> deselect [ ] public IPV6
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
   -> Restart (this kills the remmina connection. Wait 60 min before attempting to reconnect, or check the hetzner console)

  IPV6 aus,
  dns name bei cloudflare - ad01.jw-qa.owncloud.works
  Server Namen Ändern
  Rolle hinzufügen
  Active Direcory promoten...

EOF
