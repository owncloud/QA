#! /bin/sh
#
# this is not yet a useful script. It is just Juergen's quick run trhough Geralds extensive documentation


cat << EOF
Setup Documentation:
https://github.com/GeraldLeikam/tutorials/

Overview:
- Windows AD server + WND server (can be on the same machine, started from the sysprep win2022 snapshot.
- ownCloud 10 server + kerberos app. 
- Windows Desktop - Locally via virtualbox or also at hetzner?

1) Log in to hetzner Cloud Console, select QA project, click snapshots
2) Select the 3 dots from 'winServer2022-sysprep' and 
   -> Create New Server, Nuremberg, CX21
	-> deselect [ ] public IPV6
	-> add a [x] Private networks
	   - kerberos.jw 10.42.0.0/16
	-> Select firewalls:
	   - in-ssh-http-https-ping
	   - gl_windows_server_Active_Directory
	   - in-allow-windows-server-rdp
	   - windows-network-drive
	-> labels owner:jw, used_for: kerberos_testing
        -> Server name: jw-w22-server-20230620 	(the suggested name is something with ubuntu, that is misleading wrong)
3) Should be able to connect wit krdc directly after boot.
	-> Credentials in buttercup?



EOF
