## 'Files_external' Test Plan


## Previous requirements

Prepare a OC server with ssl activated and trusted certificates.

Enable LDAP, external storage, Password Policy (enterprise)

Have a LDAP server ready to be used with owncloud.

Have an Active Directory server ready to be used with owncloud.

Have ready external storages configurations of your choice e.g SMB, FTP, S3, ownCloud.

## Testing setup


TestID | Test Case | Expected Result | Result | Related Comment
------------ | ------------- | -------------- | ----- | ------
1 | Enable encryption app and encryption default module | Encryption is enabled correctly | :construction:  |
2 | Populate owncloud server with users and groups | Users and groups are correctly created | :construction:  |
3 | Share a folder remotely using federated sharing with admin user of the other server. | folder can be opened in recipient server without problems | :construction:  |
4 | Set up LDAP, as admin check users. log in with a LDAP user | Users are loaded. LDAP user logs in without problems. | :construction:  |
5 | Set up two external storages different, disable encryption in one of them.| No errors in this process | :construction:  |

## Testing functionality

TestID | Test Case | Expected Result | Result | Related Comment
------------ | ------------- | -------------- | ----- | ------
 | **S3 as external storage** |  |   |
 |  |  |   |
1 | Connect S3 as external storage | The file appears in server | :construction:  |
2 | Create/upload file in S3 as external storage | verify file exists on S3 Backend | :construction:  |
3 | Edit a file in S3 as external storage | Verify file is edited on S3 Backend | :construction:  |
4 | Share file to User 2 | The file is shared and it can be open/edited/downloaded | :construction:  |
5 | Share file to an LDAP user | The file is shared and it can be open/edited/downloaded | :construction:  |
6 | Share file from an LDAP user | The file is shared and it can be open/edited/downloaded | :construction:  |
7 | Share file to an Active Directory User | The file is shared and it can be open/edited/downloaded | :construction:  |
8 | Share file from an Active Directory User | The file is shared and it can be open/edited/downloaded | :construction:  |
9 | Share file to Autoprovisioned Shibboleth user | The file is shared and it can be open/edited/downloaded | :construction:  |
10 | Share file from a Autoprovisioned Shibboleth user | The file is shared and it can be open/edited/downloaded | :construction:  |
11 | Share file to SSO Shibboleth user | The file is shared and it can be open/edited/downloaded| :construction:  |
12 | Share file from a SSO Shibboleth user | The file is shared and it can be open/edited/downloaded | :construction:  |
13 | Fed Share file to Autoprovisioned Shibboleth user that belongs to another server| The file is shared and it can be open/edited/downloaded | :construction:  |
14 | Fed Share file to a LDAP user that belongs to another server| The file is shared and it can be open/edited/downloaded | :construction:  |
15 | Upload a file to S3 backend | verify file exists on oC webUI| :construction:  |
16 | Rename file on S3 backend  | Verify file is renamed on oC webUI | :construction:  |
17 | Rename file on oC webUI  | Verify file is renamed on S3 backend | :construction:  |
18 | Delete a file via the webUI  | verify it goes to Deleted Items folder; verify it is removed from S3 backend storage | :construction:  |
19 | Restore file from the Deleted Items folder  | verify it goes back to the proper location and the back end storage server | :construction:  |
20 | Connect S3 as external storage in a oC server 8.2.X and upgrade to oC 9.X| Check that config still exists and works | :construction:  |
21 | Connect S3 as external storage in a oC server 8.1.X and upgrade to oC 9.X| Check that config still exists and works | :construction:  |
22 | Connect S3 as external storage in a oC server 8.0.X and upgrade to oC 9.X| Check that config still exists and works | :construction:  |
23 | Delete S3 as external storage | The mount disappears from mount points listed in admin view | :construction:  |
24 | Edit some S3 config fields of external storage mount point | Check that the changes are applied | :construction:  |
25 | Create a file on the webUI in S3 | verify there is no version  | :construction:  |
26 | Edit file on the webUI in S3 | Verify version exists | :construction:  |
27 | Roll back to old version | Verify file is the old version | :construction:  |
28 | Upload file on S3 back end.  Edit in webUI | verify Version exists | :construction:  |
29 | Allow users to mount external storage enabled. Connect S3 as external storage Personal mountpoint | Verify mountpoint can be created in users personal page | :construction:  |
30 | Allow users to mount external storage disabled. Try to connect S3 as external storage Personal mountpoint | Verify mountpoint cannot be created in users personal page | :construction:  |
31 | Allow users to mount external storage disabled for S3. Try to connect S3 as external storage Personal mountpoint | Verify mountpoint cannot be created in users personal page | :construction:  |
 |  |  |   |
 | **DropBox as external storage** |  |   |
 |  |  |   |
32 | Connect DropBox as external storage | The file appears in server | :construction:  |
33 | Create/upload file in DropBox as external storage | verify file exists on DropBox Backend | :construction:  |
34 | Edit a file in DropBox as external storage | Verify file is edited on DropBox Backend | :construction:  |
35 | Share file to User 2 | The file is shared | :construction:  |
36 | Share file to an LDAP user | The file is shared and it can be open/edited/downloaded | :construction:  |
34 | Share file from an LDAP user | The file is shared and it can be open/edited/downloaded | :construction:  |
35 | Share file to an Active Directory User | The file is shared and it can be open/edited/downloaded | :construction:  |
36 | Share file from an Active Directory User | The file is shared and it can be open/edited/downloaded | :construction:  |
37 | Share file to Autoprovisioned Shibboleth user | The file is shared and it can be open/edited/downloaded | :construction:  |
38 | Share file from a Autoprovisioned Shibboleth user | The file is shared and it can be open/edited/downloaded | :construction:  |
39 | Share file to SSO Shibboleth user | The file is shared and it can be open/edited/downloaded | :construction:  |
40 | Share file from a SSO Shibboleth user | The file is shared and it can be open/edited/downloaded | :construction:  |
41 | Fed Share file to Autoprovisioned Shibboleth user that belongs to another server| The file is shared and it can be open/edited/downloaded | :construction:  |
42 | Fed Share file to a LDAP user that belongs to another server| The file is shared and it can be open/edited/downloaded | :construction:  |
43 | Upload a file to DropBox backend | verify file exists on oC webUI| :construction:  |
44 | Rename file on DropBox backend  | Verify file is renamed on oC webUI | :construction:  |
45 | Rename file on oC webUI  | Verify file is renamed on DropBox backend | :construction:  |
46 | Delete a file via the webUI  | verify it goes to Deleted Items folder; verify it is removed from DropBox backend storage | :construction:  |
47 | Restore file from the Deleted Items folder  | verify it goes back to the proper location and the back end storage server | :construction:  |
48 | Connect DropBox as external storage in a oC server 8.2.X and upgrade to oC 9.X| Check that config still exists and works | :construction:  |
45 | Connect DropBox as external storage in a oC server 8.1.X and upgrade to oC 9.X| Check that config still exists and works | :construction:  |
46 | Connect DropBox as external storage in a oC server 8.0.X and upgrade to oC 9.X| Check that config still exists and works | :construction:  |
47 | Delete DropBox as external storage | The mount disappears from mount points listed in admin view | :construction:  |
48 | Edit some DropBox config fields of external storage mount point | Check that the changes are applied | :construction:  |
49 | Create a file on the webUI in Dropbox | verify there is no version  | :construction:  |
50 | Edit file on the webUI in Dropbox | Verify version exists | :construction:  |
51 | Roll back to old version | Verify file is the old version | :construction:  |
52 | Upload file on Dropbox back end.  Edit in webUI | verify Version exists | :construction:  |
53 | Allow users to mount external storage enabled. Connect Dropbox as external storage Personal mountpoint | Verify mountpoint can be created in users personal page | :construction:  |
54 | Allow users to mount external storage disabled. Try to connect Dropbox as external storage Personal mountpoint | Verify mountpoint cannot be created in users personal page | :construction:  |
55 | Allow users to mount external storage disabled for Dropbox. Try to connect Dropbox as external storage Personal mountpoint | Verify mountpoint cannot be created in users personal page | :construction:  |
 |  |  |   |
 | **FTP as external storage** |  |   |
 |  |  |   |
56 | Connect FTP as external storage | The file appears in server | :construction:  |
57 | Create/upload file in FTP as external storage | verify file exists on FTP Backend | :construction:  |
58 | Edit a file in FTP as external storage | Verify file is edited on FTP Backend | :construction:  |
59 | Share file to User 2 | The file is shared and it can be open/edited/downloaded | :construction:  |
60 | Share file to an LDAP user | The file is shared and it can be open/edited/downloaded | :construction:  |
61 | Share file from an LDAP user | The file is shared and it can be open/edited/downloaded | :construction:  |
62 | Share file to an Active Directory User | The file is shared and it can be open/edited/downloaded | :construction:  |
63 | Share file from an Active Directory User |The file is shared and it can be open/edited/downloaded| :construction:  |
64 | Share file to Autoprovisioned Shibboleth user | The file is shared and it can be open/edited/downloaded | :construction:  |
65 | Share file from a Autoprovisioned Shibboleth user | The file is shared and it can be open/edited/downloaded | :construction:  |
66 | Share file to SSO Shibboleth user | The file is shared and it can be open/edited/downloaded | :construction:  |
67 | Share file from a SSO Shibboleth user | The file is shared and it can be open/edited/downloaded | :construction:  |
68 | Fed Share file to Autoprovisioned Shibboleth user that belongs to another server| The file is shared and it can be open/edited/downloaded | :construction:  |
69 | Fed Share file to a LDAP user that belongs to another server| The file is shared and it can be open/edited/downloaded | :construction:  |
70 | Upload a file to FTP backend | verify file exists on oC webUI| :construction:  |
71 | Rename file on FTP backend  | Verify file is renamed on oC webUI | :construction:  |
72 | Rename file on oC webUI  | Verify file is renamed on FTP backend | :construction:  |
73 | Delete a file via the webUI  | verify it goes to Deleted Items folder; verify it is removed from FTP backend storage | :construction:  |
74 | Restore file from the Deleted Items folder  | verify it goes back to the proper location and the back end storage server | :construction:  |
72 | Connect FTP as external storage in a oC server 8.2.X and upgrade to oC 9.X| Check that config still exists and works | :construction:  |
73 | Connect FTP as external storage in a oC server 8.1.X and upgrade to oC 9.X| Check that config still exists and works | :construction:  |
74 | Connect FTP as external storage in a oC server 8.0.X and upgrade to oC 9.X| Check that config still exists and works | :construction:  |
75 | Delete FTP as external storage | The mount disappears from mount points listed in admin view | :construction:  |
76 | Edit some FTP config fields of external storage mount point | Check that the changes are applied | :construction:  |
77 | Create a file on the webUI in FTP | verify there is no version  | :construction:  |
78 | Edit file on the webUI in FTP | Verify version exists | :construction:  |
79 | Roll back to old version | Verify file is the old version | :construction:  |
80 | Upload file on FTP back end.  Edit in webUI | verify Version exists | :construction:  |
81 | Allow users to mount external storage enabled. Connect FTP as external storage Personal mountpoint | Verify mountpoint can be created in users personal page | :construction:  |
82 | Allow users to mount external storage disabled. Try to connect FTP as external storage Personal mountpoint | Verify mountpoint cannot be created in users personal page | :construction:  |
83 | Allow users to mount external storage disabled for FTP. Try to connect FTP as external storage Personal mountpoint | Verify mountpoint cannot be created in users personal page | :construction:
 |  |  |   |
 | **GoogleDrive as external storage** |  |   |
 |  |  |   |
84 | Connect GoogleDrive as external storage | The file appears in server | :construction:  |
85 | Create/upload file in GoogleDrive as external storage | verify file exists on GoogleDrive Backend | :construction:  |
86 | Edit a file in GoogleDrive as external storage | Verify file is edited on GoogleDrive Backend | :construction:  |
87 | Share file to User 2 | The file is shared and it can be open/edited/downloaded | :construction:  |
88 | Share file to an LDAP user | The file is shared and it can be open/edited/downloaded | :construction:  |
89 | Share file from an LDAP user | The file is shared and it can be open/edited/downloaded | :construction:  |
90 | Share file to an Active Directory User | The file is shared and it can be open/edited/downloaded | :construction:  |
91 | Share file from an Active Directory User | The file is shared and it can be open/edited/downloaded | :construction:  |
92 | Share file to Autoprovisioned Shibboleth user | The file is shared and it can be open/edited/downloaded | :construction:  |
93 | Share file from a Autoprovisioned Shibboleth user | The file is shared and it can be open/edited/downloaded | :construction:  |
94 | Share file to SSO Shibboleth user | The file is shared and it can be open/edited/downloaded | :construction:  |
95 | Share file from a SSO Shibboleth user | The file is shared and it can be open/edited/downloaded | :construction:  |
96 | Fed Share file to Autoprovisioned Shibboleth user that belongs to another server| The file is shared and it can be open/edited/downloaded | :construction:  |
97 | Fed Share file to a LDAP user that belongs to another server| The file is shared and it can be open/edited/downloaded | :construction:  |
98 | Upload a file to GoogleDrive backend | verify file exists on oC webUI| :construction:  |
99 | Rename file on GoogleDrive backend  | Verify file is renamed on oC webUI | :construction:  |
100 | Rename file on oC webUI  | Verify file is renamed on GoogleDrive backend | :construction:  |
101 | Delete a file via the webUI  | verify it goes to Deleted Items folder; verify it is removed from GoogleDrive backend storage | :construction:  |
102 | Restore file from the Deleted Items folder  | verify it goes back to the proper location and the back end storage server | :construction:  |
103 | Connect GoogleDrive as external storage in a oC server 8.2.X and upgrade to oC 9.X| Check that config still exists and works | :construction:  |
104 | Connect GoogleDrive as external storage in a oC server 8.1.X and upgrade to oC 9.X| Check that config still exists and works | :construction:  |
105 | Connect GoogleDrive as external storage in a oC server 8.0.X and upgrade to oC 9.X| Check that config still exists and works | :construction:  |
106 | Delete GoogleDrive as external storage | The mount disappears from mount points listed in admin view | :construction:  |
107 | Edit some GoogleDrive config fields of external storage mount point | Check that the changes are applied | :construction:  |
108 | Create a file on the webUI in GoogleDrive | verify there is no version  | :construction:  |
109 | Edit file on the webUI in GoogleDrive | Verify version exists | :construction:  |
110 | Roll back to old version | Verify file is the old version | :construction:  |
111 | Upload file on GoogleDrive back end.  Edit in webUI | verify Version exists | :construction:  |
112 | Allow users to mount external storage enabled. Connect GoogleDrive as external storage Personal mountpoint | Verify mountpoint can be created in users personal page | :construction:  |
113 | Allow users to mount external storage disabled. Try to connect GoogleDrive as external storage Personal mountpoint | Verify mountpoint cannot be created in users personal page | :construction:  |
114 | Allow users to mount external storage disabled for GoogleDrive. Try to connect GoogleDrive as external storage Personal mountpoint | Verify mountpoint cannot be created in users personal page | :construction:
 |  |  |   |
 | **Local as external storage** |  |   |
 |  |  |   |
115 | Connect Local as external storage | The file appears in server | :construction:  |
116 | Create/upload file in Local as external storage | verify file exists on Local Backend | :construction:  |
117 | Edit a file in Local as external storage | Verify file is edited on Local Backend | :construction:  |
118 | Share file to User 2 | The file is shared and it can be open/edited/downloaded | :construction:  |
119 | Share file to an LDAP user | The file is shared and it can be open/edited/downloaded | :construction:  |
120 | Share file from an LDAP user | The file is shared and it can be open/edited/downloaded | :construction:  |
121 | Share file to an Active Directory User | The file is shared and it can be open/edited/downloaded | :construction:  |
122 | Share file from an Active Directory User | The file is shared and it can be open/edited/downloaded | :construction:  |
123 | Share file to Autoprovisioned Shibboleth user | The file is shared and it can be open/edited/downloaded | :construction:  |
124 | Share file from a Autoprovisioned Shibboleth user | The file is shared and it can be open/edited/downloaded | :construction:  |
125 | Share file to SSO Shibboleth user | The file is shared and it can be open/edited/downloadedd | :construction:  |
126 | Share file from a SSO Shibboleth user | The file is shared and it can be open/edited/downloaded | :construction:  |
127 | Fed Share file to Autoprovisioned Shibboleth user that belongs to another server| The file is shared and it can be open/edited/downloaded | :construction:  |
128 | Fed Share file to a LDAP user that belongs to another server| The file is shared and it can be open/edited/downloaded | :construction:  |
129 | Upload a file to Local backend | verify file exists on oC webUI| :construction:  |
130 | Rename file on Local backend  | Verify file is renamed on oC webUI | :construction:  |
131 | Rename file on oC webUI  | Verify file is renamed on Local backend | :construction:  |
132 | Delete a file via the webUI  | verify it goes to Deleted Items folder; verify it is removed from Local backend storage | :construction:  |
133 | Restore file from the Deleted Items folder  | verify it goes back to the proper location and the back end storage server | :construction:  |
134 | Connect Local as external storage in a oC server 8.2.X and upgrade to oC 9.X| Check that config still exists and works | :construction:  |
135 | Connect Local as external storage in a oC server 8.1.X and upgrade to oC 9.X| Check that config still exists and works | :construction:  |
136 | Connect Local as external storage in a oC server 8.0.X and upgrade to oC 9.X| Check that config still exists and works | :construction:  |
137 | Delete Local as external storage | The mount disappears from mount points listed in admin view | :construction:  |
138 | Edit some Local config fields of external storage mount point | Check that the changes are applied | :construction:  |
139 | Create a file on the webUI in Local | verify there is no version  | :construction:  |
140 | Edit file on the webUI in Local | Verify version exists | :construction:  |
141 | Roll back to old version | Verify file is the old version | :construction:  |
142 | Upload file on Local back end.  Edit in webUI | verify Version exists | :construction:  |
143 | Allow users to mount external storage enabled. Connect Local as external storage Personal mountpoint | Verify mountpoint can be created in users personal page | :construction:  |
144 | Allow users to mount external storage disabled. Try to connect Local as external storage Personal mountpoint | Verify mountpoint cannot be created in users personal page | :construction:  |
145 | Allow users to mount external storage disabled for Local. Try to connect Local as external storage Personal mountpoint | Verify mountpoint cannot be created in users personal page | :construction:
 |  |  |   |
 | **OpenStack as external storage** |  |   |
 |  |  |   |
146 | Connect OpenStack as external storage | The file appears in server | :construction:  |
147 | Create/upload file in OpenStack as external storage | verify file exists on OpenStack Backend | :construction:  |
148 | Edit a file in OpenStack as external storage | Verify file is edited on S3 Backend | :construction:  |
149 | Share file to User 2 | The file is shared | :construction:  |
150 | Share file to an LDAP user | The file is shared and it can be open/edited/downloaded | :construction:  |
151 | Share file from an LDAP user | The file is shared and it can be open/edited/downloaded | :construction:  |
152 | Share file to an Active Directory User | The file is shared and it can be open/edited/downloaded | :construction:  |
153 | Share file from an Active Directory User | The file is shared and it can be open/edited/downloaded | :construction:  |
154 | Share file to Autoprovisioned Shibboleth user | The file is shared and it can be open/edited/downloaded | :construction:  |
155 | Share file from a Autoprovisioned Shibboleth user | The file is shared and it can be open/edited/downloaded | :construction:  |
156 | Share file to SSO Shibboleth user | The file is shared and it can be open/edited/downloaded | :construction:  |
157 | Share file from a SSO Shibboleth user | The file is shared and it can be open/edited/downloaded | :construction:  |
158 | Fed Share file to Autoprovisioned Shibboleth user that belongs to another server| The file is shared and it can be open/edited/downloaded | :construction:  |
159 | Fed Share file to a LDAP user that belongs to another server| The file is shared and it can be open/edited/downloaded | :construction:  |
160 | Upload a file to OpenStack backend | verify file exists on oC webUI| :construction:  |
161 | Rename file on OpenStack backend  | Verify file is renamed on oC webUI | :construction:  |
162 | Rename file on oC webUI  | Verify file is renamed on OpenStack backend | :construction:  |
163 | Delete a file via the webUI  | verify it goes to Deleted Items folder; verify it is removed from OpenStack backend storage | :construction:  |
164 | Restore file from the Deleted Items folder  | verify it goes back to the proper location and the back end storage server | :construction:  |
165 | Connect OpenStack as external storage in a oC server 8.2.X and upgrade to oC 9.X| Check that config still exists and works | :construction:  |
166 | Connect OpenStack as external storage in a oC server 8.1.X and upgrade to oC 9.X| Check that config still exists and works | :construction:  |
167 | Connect OpenStack as external storage in a oC server 8.0.X and upgrade to oC 9.X| Check that config still exists and works | :construction:  |
168 | Delete OpenStack as external storage | The mount disappears from mount points listed in admin view | :construction:  |
169 | Edit some OpenStack config fields of external storage mount point | Check that the changes are applied | :construction:  |
170 | Create a file on the webUI in OpenStack | verify there is no version  | :construction:  |
171 | Edit file on the webUI in OpenStack | Verify version exists | :construction:  |
172 | Roll back to old version | Verify file is the old version | :construction:  |
173 | Upload file on OpenStack back end.  Edit in webUI | verify Version exists | :construction:  |
174 | Allow users to mount external storage enabled. Connect OpenStack as external storage Personal mountpoint | Verify mountpoint can be created in users personal page | :construction:  |
175 | Allow users to mount external storage disabled. Try to connect OpenStack as external storage Personal mountpoint | Verify mountpoint cannot be created in users personal page | :construction:  |
176 | Allow users to mount external storage disabled for OpenStack. Try to connect OpenStack as external storage Personal mountpoint | Verify mountpoint cannot be created in users personal page | :construction:
 |  |  |   |
 | **ownCloud as external storage** |  |   |
 |  |  |   |
177 | Connect ownCloud as external storage | The file appears in server | :construction:  |
178 | Create/upload file in ownCloud as external storage | verify file exists on ownCloud Backend | :construction:  |
179 | Edit a file in ownCloud as external storage | Verify file is edited on ownCloud Backend | :construction:  |
180 | Share file to User 2 | The file is shared and it can be open/edited/downloaded | :construction:  |
181 | Share file to an LDAP user | The file is shared and it can be open/edited/downloaded | :construction:  |
182 | Share file from an LDAP user | The file is shared and it can be open/edited/downloaded | :construction:  |
183 | Share file to an Active Directory User | The file is shared and it can be open/edited/downloaded | :construction:  |
184 | Share file from an Active Directory User | The file is shared and it can be open/edited/downloaded | :construction:  |
185 | Share file to Autoprovisioned Shibboleth user | The file is shared and it can be open/edited/downloaded | :construction:  |
186 | Share file from a Autoprovisioned Shibboleth user | The file is shared and it can be open/edited/downloaded | :construction:  |
187 | Share file to SSO Shibboleth user | The file is shared and it can be open/edited/downloaded | :construction:  |
188 | Share file from a SSO Shibboleth user | The file is shared and it can be open/edited/downloaded | :construction:  |
189 | Fed Share file to Autoprovisioned Shibboleth user that belongs to another server| The file is shared and it can be open/edited/downloaded | :construction:  |
190 | Fed Share file to a LDAP user that belongs to another server| The file is shared and it can be open/edited/downloaded | :construction:  |
191 | Upload a file to ownCloud backend | verify file exists on oC webUI| :construction:  |
192 | Rename file on ownCloud backend  | Verify file is renamed on oC webUI | :construction:  |
193 | Rename file on oC webUI  | Verify file is renamed on ownCloud backend | :construction:  |
194 | Delete a file via the webUI  | verify it goes to Deleted Items folder; verify it is removed from ownCloud backend storage | :construction:  |
195 | Restore file from the Deleted Items folder  | verify it goes back to the proper location and the back end storage server | :construction:  |
196 | Connect ownCloud as external storage in a oC server 8.2.X and upgrade to oC 9.X| Check that config still exists and works | :construction:  |
197 | Connect ownCloud as external storage in a oC server 8.1.X and upgrade to oC 9.X| Check that config still exists and works | :construction:  |
198 | Connect ownCloud as external storage in a oC server 8.0.X and upgrade to oC 9.X| Check that config still exists and works | :construction:  |
199 | Delete ownCloud as external storage | The mount disappears from mount points listed in admin view | :construction:  |
200 | Edit some ownCloud config fields of external storage mount point | Check that the changes are applied | :construction:  |
201 | Create a file on the webUI in ownCloud | verify there is no version  | :construction:  |
202 | Edit file on the webUI in ownCloud | Verify version exists | :construction:  |
203 | Roll back to old version | Verify file is the old version | :construction:  |
204 | Upload file on ownCloud back end.  Edit in webUI | verify Version exists | :construction:  |
205 | Allow users to mount external storage enabled. Connect ownCloud as external storage Personal mountpoint | Verify mountpoint can be created in users personal page | :construction:  |
206 | Allow users to mount external storage disabled. Try to connect ownCloud as external storage Personal mountpoint | Verify mountpoint cannot be created in users personal page | :construction:  |
207 | Allow users to mount external storage disabled for ownCloud. Try to connect ownCloud as external storage Personal mountpoint | Verify mountpoint cannot be created in users personal page | :construction:
 |  |  |   |
|  | **SFTP as external storage** |   |
 |  |  |   |
208 | Connect SFTP as external storage | The file appears in server | :construction:  |
209 | Create/upload file in SFTP as external storage | verify file exists on SFTP Backend | :construction:  |
210 | Edit a file in SFTP as external storage | Verify file is edited on SFTP Backend | :construction:  |
211 | Share file to User 2 | The file is shared and it can be open/edited/downloaded | :construction:  |
212 | Share file to an LDAP user | The file is shared and it can be open/edited/downloaded| :construction:  |
213 | Share file from an LDAP user | The file is shared and it can be open/edited/downloaded | :construction:  |
214 | Share file to an Active Directory User | The file is shared and it can be open/edited/downloaded | :construction:  |
215 | Share file from an Active Directory User | The file is shared and it can be open/edited/downloaded | :construction:  |
216 | Share file to Autoprovisioned Shibboleth user | The file is shared and it can be open/edited/downloaded | :construction:  |
217 | Share file from a Autoprovisioned Shibboleth user | The file is shared and it can be open/edited/downloaded | :construction:  |
218 | Share file to SSO Shibboleth user | The file is shared and it can be open/edited/downloaded | :construction:  |
219 | Share file from a SSO Shibboleth user | The file is shared and it can be open/edited/downloaded | :construction:  |
220 | Fed Share file to Autoprovisioned Shibboleth user that belongs to another server| The file is shared and it can be open/edited/downloaded | :construction:  |
221 | Fed Share file to a LDAP user that belongs to another server| The file is shared and it can be open/edited/downloaded | :construction:  |
222 | Upload a file to SFTP backend | verify file exists on oC webUI| :construction:  |
223 | Rename file on SFTP backend  | Verify file is renamed on oC webUI | :construction:  |
224 | Rename file on oC webUI  | Verify file is renamed on SFTP backend | :construction:  |
225 | Delete a file via the webUI  | verify it goes to Deleted Items folder; verify it is removed from SFTP backend storage | :construction:  |
226 | Restore file from the Deleted Items folder | verify it goes back to the proper location and the back end storage server | :construction:  |
227 | Connect SFTP as external storage in a oC server 8.2.X and upgrade to oC 9.X| Check that config still exists and works | :construction:  |
228 | Connect SFTP as external storage in a oC server 8.1.X and upgrade to oC 9.X| Check that config still exists and works | :construction:  |
229 | Connect SFTP as external storage in a oC server 8.0.X and upgrade to oC 9.X| Check that config still exists and works | :construction:  |
230 | Delete SFTP as external storage | The mount disappears from mount points listed in admin view | :construction:  |
231 | Edit some SFTP config fields of external storage mount point | Check that the changes are applied | :construction:  |
232 | Create a file on the webUI in SFTP | verify there is no version  | :construction:  |
233 | Edit file on the webUI in SFTP | Verify version exists | :construction:  |
234 | Roll back to old version | Verify file is the old version | :construction:  |
235 | Upload file on SFTP back end.  Edit in webUI | verify Version exists | :construction:  |
236 | Allow users to mount external storage enabled. Connect SFTP as external storage Personal mountpoint | Verify mountpoint can be created in users personal page | :construction:  |
237 | Allow users to mount external storage disabled. Try to connect SFTP as external storage Personal mountpoint | Verify mountpoint cannot be created in users personal page | :construction:  |
238 | Allow users to mount external storage disabled for SFTP. Try to connect SFTP as external storage Personal mountpoint | Verify mountpoint cannot be created in users personal page | :construction: | 
 |  |   |
 | **SMB as external storage** |  |   |
 |  |  |   |
239 | Connect SMB as external storage | The file appears in server | :construction:  |
240 | Create/upload file in SMB as external storage | verify file exists on SMB Backend | :construction:  |
241 | Edit a file in SMB as external storage | Verify file is edited on SMB Backend | :construction:  |
242 | Share file to User 2 | The file is shared and it can be open/edited/downloaded | :construction:  |
243 | Share file to an LDAP user | The file is shared and it can be open/edited/downloaded | :construction:  |
244 | Share file from an LDAP user | The file is shared and it can be open/edited/downloaded | :construction:  |
245 | Share file to an Active Directory User | The file is shared and it can be open/edited/downloaded | :construction:  |
246 | Share file from an Active Directory User | The file is shared and it can be open/edited/downloaded | :construction:  |
247 | Share file to Autoprovisioned Shibboleth user | The file is shared and it can be open/edited/downloaded | :construction:  |
248 | Share file from a Autoprovisioned Shibboleth user | The file is shared and it can be open/edited/downloaded | :construction:  |
249 | Share file to SSO Shibboleth user | The file is shared and it can be open/edited/downloaded | :construction:  |
250 | Share file from a SSO Shibboleth user | The file is shared and it can be open/edited/downloaded | :construction:  |
250 | Fed Share file to Autoprovisioned Shibboleth user that belongs to another server| The file is shared and it can be open/edited/downloaded | :construction:  |
251 | Fed Share file to a LDAP user that belongs to another server| The file is shared and it can be open/edited/downloaded | :construction:  |
252 | Upload a file to SMB backend | verify file exists on oC webUI| :construction:  |
253 | Rename file on SMB backend  | Verify file is renamed on oC webUI | :construction:  |
254 | Rename file on oC webUI  | Verify file is renamed on SMB backend | :construction:  |
255 | Delete a file via the webUI  | verify it goes to Deleted Items folder; verify it is removed from SMB backend storage | :construction:  |
256 | Restore file from the Deleted Items folder  | verify it goes back to the proper location and the back end storage server | :construction:  |
257 | Connect SMB as external storage in a oC server 8.2.X and upgrade to oC 9.X| Check that config still exists and works | :construction:  |
258 | Connect SMB as external storage in a oC server 8.1.X and upgrade to oC 9.X| Check that config still exists and works | :construction:  |
259 | Connect SMB as external storage in a oC server 8.0.X and upgrade to oC 9.X| Check that config still exists and works | :construction:  |
260 | Delete SMB as external storage | The mount disappears from mount points listed in admin view | :construction:  |
261 | Edit some SMB config fields of external storage mount point | Check that the changes are applied | :construction:  |
262 | Create a file on the webUI in SMB | verify there is no version  | :construction:  |
263 | Edit file on the webUI in SMB | Verify version exists | :construction:  |
264 | Roll back to old version | Verify file is the old version | :construction:  |
265 | Upload file on SMB back end.  Edit in webUI | verify Version exists | :construction:  |
266 | Allow users to mount external storage enabled. Connect SMB as external storage Personal mountpoint | Verify mountpoint can be created in users personal page | :construction:  |
267 | Allow users to mount external storage disabled. Try to connect SMB as external storage Personal mountpoint | Verify mountpoint cannot be created in users personal page | :construction:  |
268 | Allow users to mount external storage disabled for SMB. Try to connect SMB as external storage Personal mountpoint | Verify mountpoint cannot be created in users personal page | :construction: |
 |  |  |   |
 | **WebDav as external storage** |  |   |
 |  |  |   |
269 | Connect WebDav as external storage | The file appears in server | :construction:  |
270 | Create/upload file in WebDav as external storage | verify file exists on WebDav Backend | :construction:  |
271 | Edit a file in WebDav as external storage | Verify file is edited on WebDav Backend | :construction:  |
272 | Share file to User 2 | The file is shared and it can be open/edited/downloadedd | :construction:  |
273 | Share file to an LDAP user | The file is shared and it can be open/edited/downloaded | :construction:  |
274 | Share file from an LDAP user | The file is shared and it can be open/edited/downloaded | :construction:  |
275 | Share file to an Active Directory User | The file is shared and it can be open/edited/downloaded | :construction:  |
276 | Share file from an Active Directory User | The file is shared and it can be open/edited/downloaded | :construction:  |
277 | Share file to Autoprovisioned Shibboleth user | The file is shared and it can be open/edited/downloaded | :construction:  |
278 | Share file from a Autoprovisioned Shibboleth user | The file is shared and it can be open/edited/downloaded | :construction:  |
279 | Share file to SSO Shibboleth user | The file is shared and it can be open/edited/downloaded | :construction:  |
280 | Share file from a SSO Shibboleth user | The file is shared and it can be open/edited/downloaded | :construction:  |
281 | Fed Share file to Autoprovisioned Shibboleth user that belongs to another server| The file is shared and it can be open/edited/downloaded | :construction:  |
282 | Fed Share file to a LDAP user that belongs to another server| The file is shared and it can be open/edited/downloaded | :construction:  |
283 | Upload a file to WebDav backend | verify file exists on oC webUI| :construction:  |
284 | Rename file on WebDav backend  | Verify file is renamed on oC webUI | :construction:  |
285 | Rename file on oC webUI  | Verify file is renamed on WebDav backend | :construction:  |
286 | Delete a file via the webUI  | verify it goes to Deleted Items folder; verify it is removed from WebDav backend storage | :construction:  |
287 | Restore file from the Deleted Items folder  | verify it goes back to the proper location and the back end storage server | :construction:  |
288 | Connect WebDav as external storage in a oC server 8.2.X and upgrade to oC 9.X| Check that config still exists and works | :construction:  |
289 | Connect WebDav as external storage in a oC server 8.1.X and upgrade to oC 9.X| Check that config still exists and works | :construction:  |
290 | Connect WebDav as external storage in a oC server 8.0.X and upgrade to oC 9.X| Check that config still exists and works | :construction:  |
291 | Delete WebDav as external storage | The mount disappears from mount points listed in admin view | :construction:  |
292 | Edit some WebDav config fields of external storage mount point | Check that the changes are applied | :construction:  |
293 | Create a file on the webUI in WebDav | verify there is no version  | :construction:  |
294 | Edit file on the webUI in WebDav | Verify version exists | :construction:  |
295 | Roll back to old version | Verify file is the old version | :construction:  |
296 | Upload file on WebDav back end.  Edit in webUI | verify Version exists | :construction:  |
297 | Allow users to mount external storage enabled. Connect WebDav as external storage Personal mountpoint | Verify mountpoint can be created in users personal page | :construction:  |
298 | Allow users to mount external storage disabled. Try to connect WebDav as external storage Personal mountpoint | Verify mountpoint cannot be created in users personal page | :construction:  |
299 | Allow users to mount external storage disabled for WebDav. Try to connect WebDav as external storage Personal mountpoint | Verify mountpoint cannot be created in users personal page | :construction: |
