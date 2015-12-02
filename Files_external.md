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
4 | Share file to User 2 | The file is shared | :construction:  |
5 | Share file to an LDAP user | The file is shared | :construction:  |
6 | Share file from an LDAP user | The file is shared | :construction:  |
7 | Share file to an Active Directory User | The file is shared | :construction:  |
8 | Share file from an Active Directory User | The file is shared | :construction:  |
9 | Share file to Autoprovisioned Shibboleth user | The file is shared | :construction:  |
10 | Share file from a Autoprovisioned Shibboleth user | The file is shared | :construction:  |
11 | Share file to SSO Shibboleth user | The file is shared | :construction:  |
12 | Share file from a SSO Shibboleth user | The file is shared | :construction:  |
13 | Fed Share file to Autoprovisioned Shibboleth user that belongs to another server| The file is shared | :construction:  |
14 | Fed Share file to a LDAP user that belongs to another server| The file is shared | :construction:  |
15 | Upload a file to S3 backend | verify file exists on oC webUI| :construction:  |
16 | Rename file on S3 backend  | Verify file is renamed on oC webUI | :construction:  |
17 | Rename file on oC webUI  | Verify file is renamed on S3 backend | :construction:  |
18 | Delete a file via the webUI  | verify it goes to Deleted Items folder; verify it is removed from S3 backend storage | :construction:  |
19 | Restore file from the Deleted Items folder  | verify it goes back to the proper location and the back end storage server | :construction:  |
20 | Connect S3 as external storage in a oC server 8.2.X and upgrade to oC 9.X| Check that config still exits and works | :construction:  |
21 | Connect S3 as external storage in a oC server 8.1.X and upgrade to oC 9.X| Check that config still exits and works | :construction:  |
22 | Connect S3 as external storage in a oC server 8.0.X and upgrade to oC 9.X| Check that config still exits and works | :construction:  |
23 | Delete S3 as external storage | The mount dissapears from mount points list in admin view | :construction:  |
24 | Edit some S3 config fields of external storage mount point | Check that the changes are applied | :construction:  |
 |  |  |   |
 | **DropBox as external storage** |  |   |
 |  |  |   |
25 | Connect DropBox as external storage | The file appears in server | :construction:  |
26 | Create/upload file in DropBox as external storage | verify file exists on DropBox Backend | :construction:  |
27 | Edit a file in DropBox as external storage | Verify file is edited on DropBox Backend | :construction:  |
28 | Share file to User 2 | The file is shared | :construction:  |
29 | Share file to an LDAP user | The file is shared | :construction:  |
30 | Share file from an LDAP user | The file is shared | :construction:  |
31 | Share file to an Active Directory User | The file is shared | :construction:  |
32 | Share file from an Active Directory User | The file is shared | :construction:  |
33 | Share file to Autoprovisioned Shibboleth user | The file is shared | :construction:  |
34 | Share file from a Autoprovisioned Shibboleth user | The file is shared | :construction:  |
35 | Share file to SSO Shibboleth user | The file is shared | :construction:  |
36 | Share file from a SSO Shibboleth user | The file is shared | :construction:  |
37 | Fed Share file to Autoprovisioned Shibboleth user that belongs to another server| The file is shared | :construction:  |
38 | Fed Share file to a LDAP user that belongs to another server| The file is shared | :construction:  |
39 | Upload a file to DropBox backend | verify file exists on oC webUI| :construction:  |
40 | Rename file on DropBox backend  | Verify file is renamed on oC webUI | :construction:  |
41 | Rename file on oC webUI  | Verify file is renamed on DropBox backend | :construction:  |
42 | Delete a file via the webUI  | verify it goes to Deleted Items folder; verify it is removed from DropBox backend storage | :construction:  |
43 | Restore file from the Deleted Items folder  | verify it goes back to the proper location and the back end storage server | :construction:  |
44 | Connect DropBox as external storage in a oC server 8.2.X and upgrade to oC 9.X| Check that config still exits and works | :construction:  |
45 | Connect DropBox as external storage in a oC server 8.1.X and upgrade to oC 9.X| Check that config still exits and works | :construction:  |
46 | Connect DropBox as external storage in a oC server 8.0.X and upgrade to oC 9.X| Check that config still exits and works | :construction:  |
47 | Delete DropBox as external storage | The mount dissapears from mount points list in admin view | :construction:  |
48 | Edit some DropBox config fields of external storage mount point | Check that the changes are applied | :construction:  |
 |  |  |   |
 | **FTP as external storage** |  |   |
 |  |  |   |
49 | Connect FTP as external storage | The file appears in server | :construction:  |
50 | Create/upload file in FTP as external storage | verify file exists on FTP Backend | :construction:  |
51 | Edit a file in FTP as external storage | Verify file is edited on FTP Backend | :construction:  |
52 | Share file to User 2 | The file is shared | :construction:  |
53 | Share file to an LDAP user | The file is shared | :construction:  |
54 | Share file from an LDAP user | The file is shared | :construction:  |
55 | Share file to an Active Directory User | The file is shared | :construction:  |
56 | Share file from an Active Directory User | The file is shared | :construction:  |
57 | Share file to Autoprovisioned Shibboleth user | The file is shared | :construction:  |
58 | Share file from a Autoprovisioned Shibboleth user | The file is shared | :construction:  |
59 | Share file to SSO Shibboleth user | The file is shared | :construction:  |
60 | Share file from a SSO Shibboleth user | The file is shared | :construction:  |
61 | Fed Share file to Autoprovisioned Shibboleth user that belongs to another server| The file is shared | :construction:  |
62 | Fed Share file to a LDAP user that belongs to another server| The file is shared | :construction:  |
63 | Upload a file to FTP backend | verify file exists on oC webUI| :construction:  |
64 | Rename file on FTP backend  | Verify file is renamed on oC webUI | :construction:  |
65 | Rename file on oC webUI  | Verify file is renamed on FTP backend | :construction:  |
66 | Delete a file via the webUI  | verify it goes to Deleted Items folder; verify it is removed from FTP backend storage | :construction:  |
67 | Restore file from the Deleted Items folder  | verify it goes back to the proper location and the back end storage server | :construction:  |
68 | Connect FTP as external storage in a oC server 8.2.X and upgrade to oC 9.X| Check that config still exits and works | :construction:  |
69 | Connect FTP as external storage in a oC server 8.1.X and upgrade to oC 9.X| Check that config still exits and works | :construction:  |
70 | Connect FTP as external storage in a oC server 8.0.X and upgrade to oC 9.X| Check that config still exits and works | :construction:  |
71 | Delete FTP as external storage | The mount dissapears from mount points list in admin view | :construction:  |
72 | Edit some FTP config fields of external storage mount point | Check that the changes are applied | :construction:  |
 |  |  |   |
 | **GoogleDrive as external storage** |  |   |
 |  |  |   |
73 | Connect GoogleDrive as external storage | The file appears in server | :construction:  |
74 | Create/upload file in GoogleDrive as external storage | verify file exists on GoogleDrive Backend | :construction:  |
75 | Edit a file in GoogleDrive as external storage | Verify file is edited on GoogleDrive Backend | :construction:  |
76 | Share file to User 2 | The file is shared | :construction:  |
77 | Share file to an LDAP user | The file is shared | :construction:  |
78 | Share file from an LDAP user | The file is shared | :construction:  |
79 | Share file to an Active Directory User | The file is shared | :construction:  |
80 | Share file from an Active Directory User | The file is shared | :construction:  |
81 | Share file to Autoprovisioned Shibboleth user | The file is shared | :construction:  |
82 | Share file from a Autoprovisioned Shibboleth user | The file is shared | :construction:  |
83 | Share file to SSO Shibboleth user | The file is shared | :construction:  |
84 | Share file from a SSO Shibboleth user | The file is shared | :construction:  |
85 | Fed Share file to Autoprovisioned Shibboleth user that belongs to another server| The file is shared | :construction:  |
86 | Fed Share file to a LDAP user that belongs to another server| The file is shared | :construction:  |
87 | Upload a file to GoogleDrive backend | verify file exists on oC webUI| :construction:  |
88 | Rename file on GoogleDrive backend  | Verify file is renamed on oC webUI | :construction:  |
89 | Rename file on oC webUI  | Verify file is renamed on GoogleDrive backend | :construction:  |
90 | Delete a file via the webUI  | verify it goes to Deleted Items folder; verify it is removed from GoogleDrive backend storage | :construction:  |
91 | Restore file from the Deleted Items folder  | verify it goes back to the proper location and the back end storage server | :construction:  |
92 | Connect GoogleDrive as external storage in a oC server 8.2.X and upgrade to oC 9.X| Check that config still exits and works | :construction:  |
93 | Connect GoogleDrive as external storage in a oC server 8.1.X and upgrade to oC 9.X| Check that config still exits and works | :construction:  |
94 | Connect GoogleDrive as external storage in a oC server 8.0.X and upgrade to oC 9.X| Check that config still exits and works | :construction:  |
95 | Delete GoogleDrive as external storage | The mount dissapears from mount points list in admin view | :construction:  |
96 | Edit some GoogleDrive config fields of external storage mount point | Check that the changes are applied | :construction:  |
 |  |  |   |
 | **Local as external storage** |  |   |
 |  |  |   |
97 | Connect Local as external storage | The file appears in server | :construction:  |
98 | Create/upload file in Local as external storage | verify file exists on Local Backend | :construction:  |
99 | Edit a file in Local as external storage | Verify file is edited on Local Backend | :construction:  |
100 | Share file to User 2 | The file is shared | :construction:  |
101 | Share file to an LDAP user | The file is shared | :construction:  |
102 | Share file from an LDAP user | The file is shared | :construction:  |
103 | Share file to an Active Directory User | The file is shared | :construction:  |
104 | Share file from an Active Directory User | The file is shared | :construction:  |
105 | Share file to Autoprovisioned Shibboleth user | The file is shared | :construction:  |
106 | Share file from a Autoprovisioned Shibboleth user | The file is shared | :construction:  |
107 | Share file to SSO Shibboleth user | The file is shared | :construction:  |
108 | Share file from a SSO Shibboleth user | The file is shared | :construction:  |
109 | Fed Share file to Autoprovisioned Shibboleth user that belongs to another server| The file is shared | :construction:  |
110 | Fed Share file to a LDAP user that belongs to another server| The file is shared | :construction:  |
111 | Upload a file to Local backend | verify file exists on oC webUI| :construction:  |
112 | Rename file on Local backend  | Verify file is renamed on oC webUI | :construction:  |
113 | Rename file on oC webUI  | Verify file is renamed on Local backend | :construction:  |
114 | Delete a file via the webUI  | verify it goes to Deleted Items folder; verify it is removed from Local backend storage | :construction:  |
115 | Restore file from the Deleted Items folder  | verify it goes back to the proper location and the back end storage server | :construction:  |
116 | Connect Local as external storage in a oC server 8.2.X and upgrade to oC 9.X| Check that config still exits and works | :construction:  |
117 | Connect Local as external storage in a oC server 8.1.X and upgrade to oC 9.X| Check that config still exits and works | :construction:  |
118 | Connect Local as external storage in a oC server 8.0.X and upgrade to oC 9.X| Check that config still exits and works | :construction:  |
119 | Delete Local as external storage | The mount dissapears from mount points list in admin view | :construction:  |
120 | Edit some Local config fields of external storage mount point | Check that the changes are applied | :construction:  |
 |  |  |   |
 | **OpenStack as external storage** |  |   |
 |  |  |   |
121 | Connect OpenStack as external storage | The file appears in server | :construction:  |
122 | Create/upload file in OpenStack as external storage | verify file exists on OpenStack Backend | :construction:  |
123 | Edit a file in OpenStack as external storage | Verify file is edited on S3 Backend | :construction:  |
124 | Share file to User 2 | The file is shared | :construction:  |
125 | Share file to an LDAP user | The file is shared | :construction:  |
126 | Share file from an LDAP user | The file is shared | :construction:  |
127 | Share file to an Active Directory User | The file is shared | :construction:  |
128 | Share file from an Active Directory User | The file is shared | :construction:  |
129 | Share file to Autoprovisioned Shibboleth user | The file is shared | :construction:  |
130 | Share file from a Autoprovisioned Shibboleth user | The file is shared | :construction:  |
131 | Share file to SSO Shibboleth user | The file is shared | :construction:  |
132 | Share file from a SSO Shibboleth user | The file is shared | :construction:  |
133 | Fed Share file to Autoprovisioned Shibboleth user that belongs to another server| The file is shared | :construction:  |
134 | Fed Share file to a LDAP user that belongs to another server| The file is shared | :construction:  |
135 | Upload a file to OpenStack backend | verify file exists on oC webUI| :construction:  |
136 | Rename file on OpenStack backend  | Verify file is renamed on oC webUI | :construction:  |
137 | Rename file on oC webUI  | Verify file is renamed on OpenStack backend | :construction:  |
138 | Delete a file via the webUI  | verify it goes to Deleted Items folder; verify it is removed from OpenStack backend storage | :construction:  |
139 | Restore file from the Deleted Items folder  | verify it goes back to the proper location and the back end storage server | :construction:  |
140 | Connect OpenStack as external storage in a oC server 8.2.X and upgrade to oC 9.X| Check that config still exits and works | :construction:  |
141 | Connect OpenStack as external storage in a oC server 8.1.X and upgrade to oC 9.X| Check that config still exits and works | :construction:  |
142 | Connect OpenStack as external storage in a oC server 8.0.X and upgrade to oC 9.X| Check that config still exits and works | :construction:  |
143 | Delete OpenStack as external storage | The mount dissapears from mount points list in admin view | :construction:  |
144 | Edit some OpenStack config fields of external storage mount point | Check that the changes are applied | :construction:  |
 |  |  |   |
 | **ownCloud as external storage** |  |   |
 |  |  |   |
145 | Connect ownCloud as external storage | The file appears in server | :construction:  |
146 | Create/upload file in ownCloud as external storage | verify file exists on ownCloud Backend | :construction:  |
147 | Edit a file in ownCloud as external storage | Verify file is edited on ownCloud Backend | :construction:  |
148 | Share file to User 2 | The file is shared | :construction:  |
149 | Share file to an LDAP user | The file is shared | :construction:  |
150 | Share file from an LDAP user | The file is shared | :construction:  |
151 | Share file to an Active Directory User | The file is shared | :construction:  |
152 | Share file from an Active Directory User | The file is shared | :construction:  |
153 | Share file to Autoprovisioned Shibboleth user | The file is shared | :construction:  |
154 | Share file from a Autoprovisioned Shibboleth user | The file is shared | :construction:  |
155 | Share file to SSO Shibboleth user | The file is shared | :construction:  |
156 | Share file from a SSO Shibboleth user | The file is shared | :construction:  |
157 | Fed Share file to Autoprovisioned Shibboleth user that belongs to another server| The file is shared | :construction:  |
158 | Fed Share file to a LDAP user that belongs to another server| The file is shared | :construction:  |
159 | Upload a file to ownCloud backend | verify file exists on oC webUI| :construction:  |
160 | Rename file on ownCloud backend  | Verify file is renamed on oC webUI | :construction:  |
161 | Rename file on oC webUI  | Verify file is renamed on ownCloud backend | :construction:  |
162 | Delete a file via the webUI  | verify it goes to Deleted Items folder; verify it is removed from ownCloud backend storage | :construction:  |
163 | Restore file from the Deleted Items folder  | verify it goes back to the proper location and the back end storage server | :construction:  |
164 | Connect ownCloud as external storage in a oC server 8.2.X and upgrade to oC 9.X| Check that config still exits and works | :construction:  |
165 | Connect ownCloud as external storage in a oC server 8.1.X and upgrade to oC 9.X| Check that config still exits and works | :construction:  |
166 | Connect ownCloud as external storage in a oC server 8.0.X and upgrade to oC 9.X| Check that config still exits and works | :construction:  |
167 | Delete ownCloud as external storage | The mount dissapears from mount points list in admin view | :construction:  |
168 | Edit some ownCloud config fields of external storage mount point | Check that the changes are applied | :construction:  |
 |  |  |   |
|  | **SFTP as external storage** |   |
 |  |  |   |
169 | Connect SFTP as external storage | The file appears in server | :construction:  |
170 | Create/upload file in SFTP as external storage | verify file exists on SFTP Backend | :construction:  |
171 | Edit a file in SFTP as external storage | Verify file is edited on SFTP Backend | :construction:  |
172 | Share file to User 2 | The file is shared | :construction:  |
173 | Share file to an LDAP user | The file is shared | :construction:  |
174 | Share file from an LDAP user | The file is shared | :construction:  |
175 | Share file to an Active Directory User | The file is shared | :construction:  |
176 | Share file from an Active Directory User | The file is shared | :construction:  |
177 | Share file to Autoprovisioned Shibboleth user | The file is shared | :construction:  |
178 | Share file from a Autoprovisioned Shibboleth user | The file is shared | :construction:  |
179 | Share file to SSO Shibboleth user | The file is shared | :construction:  |
180 | Share file from a SSO Shibboleth user | The file is shared | :construction:  |
181 | Fed Share file to Autoprovisioned Shibboleth user that belongs to another server| The file is shared | :construction:  |
182 | Fed Share file to a LDAP user that belongs to another server| The file is shared | :construction:  |
183 | Upload a file to SFTP backend | verify file exists on oC webUI| :construction:  |
184 | Rename file on SFTP backend  | Verify file is renamed on oC webUI | :construction:  |
185 | Rename file on oC webUI  | Verify file is renamed on SFTP backend | :construction:  |
186 | Delete a file via the webUI  | verify it goes to Deleted Items folder; verify it is removed from SFTP backend storage | :construction:  |
187 | Restore file from the Deleted Items folder | verify it goes back to the proper location and the back end storage server | :construction:  |
188 | Connect SFTP as external storage in a oC server 8.2.X and upgrade to oC 9.X| Check that config still exits and works | :construction:  |
189 | Connect SFTP as external storage in a oC server 8.1.X and upgrade to oC 9.X| Check that config still exits and works | :construction:  |
190 | Connect SFTP as external storage in a oC server 8.0.X and upgrade to oC 9.X| Check that config still exits and works | :construction:  |
191 | Delete SFTP as external storage | The mount dissapears from mount points list in admin view | :construction:  |
192 | Edit some SFTP config fields of external storage mount point | The mount dissapears from mount points list in admin view | :construction:  |
 |  |  |   |
 | **SMB as external storage** |  |   |
 |  |  |   |
193 | Connect SMB as external storage | The file appears in server | :construction:  |
194 | Create/upload file in SMB as external storage | verify file exists on SMB Backend | :construction:  |
195 | Edit a file in SMB as external storage | Verify file is edited on SMB Backend | :construction:  |
196 | Share file to User 2 | The file is shared | :construction:  |
197 | Share file to an LDAP user | The file is shared | :construction:  |
198 | Share file from an LDAP user | The file is shared | :construction:  |
199 | Share file to an Active Directory User | The file is shared | :construction:  |
200 | Share file from an Active Directory User | The file is shared | :construction:  |
201 | Share file to Autoprovisioned Shibboleth user | The file is shared | :construction:  |
202 | Share file from a Autoprovisioned Shibboleth user | The file is shared | :construction:  |
203 | Share file to SSO Shibboleth user | The file is shared | :construction:  |
204 | Share file from a SSO Shibboleth user | The file is shared | :construction:  |
205 | Fed Share file to Autoprovisioned Shibboleth user that belongs to another server| The file is shared | :construction:  |
206 | Fed Share file to a LDAP user that belongs to another server| The file is shared | :construction:  |
207 | Upload a file to SMB backend | verify file exists on oC webUI| :construction:  |
208 | Rename file on SMB backend  | Verify file is renamed on oC webUI | :construction:  |
209 | Rename file on oC webUI  | Verify file is renamed on SMB backend | :construction:  |
210 | Delete a file via the webUI  | verify it goes to Deleted Items folder; verify it is removed from SMB backend storage | :construction:  |
211 | Restore file from the Deleted Items folder  | verify it goes back to the proper location and the back end storage server | :construction:  |
212 | Connect SMB as external storage in a oC server 8.2.X and upgrade to oC 9.X| Check that config still exits and works | :construction:  |
213 | Connect SMB as external storage in a oC server 8.1.X and upgrade to oC 9.X| Check that config still exits and works | :construction:  |
214 | Connect SMB as external storage in a oC server 8.0.X and upgrade to oC 9.X| Check that config still exits and works | :construction:  |
215 | Delete SMB as external storage | The mount dissapears from mount points list in admin view | :construction:  |
216 | Edit some SMB config fields of external storage mount point | Check that the changes are applied | :construction:  |
 |  |  |   |
 | **WebDav as external storage** |  |   |
 |  |  |   |
217 | Connect WebDav as external storage | The file appears in server | :construction:  |
218 | Create/upload file in WebDav as external storage | verify file exists on WebDav Backend | :construction:  |
219 | Edit a file in WebDav as external storage | Verify file is edited on WebDav Backend | :construction:  |
220 | Share file to User 2 | The file is shared | :construction:  |
221 | Share file to an LDAP user | The file is shared | :construction:  |
222 | Share file from an LDAP user | The file is shared | :construction:  |
223 | Share file to an Active Directory User | The file is shared | :construction:  |
224 | Share file from an Active Directory User | The file is shared | :construction:  |
225 | Share file to Autoprovisioned Shibboleth user | The file is shared | :construction:  |
226 | Share file from a Autoprovisioned Shibboleth user | The file is shared | :construction:  |
227 | Share file to SSO Shibboleth user | The file is shared | :construction:  |
228 | Share file from a SSO Shibboleth user | The file is shared | :construction:  |
229 | Fed Share file to Autoprovisioned Shibboleth user that belongs to another server| The file is shared | :construction:  |
230 | Fed Share file to a LDAP user that belongs to another server| The file is shared | :construction:  |
231 | Upload a file to WebDav backend | verify file exists on oC webUI| :construction:  |
232 | Rename file on WebDav backend  | Verify file is renamed on oC webUI | :construction:  |
233 | Rename file on oC webUI  | Verify file is renamed on WebDav backend | :construction:  |
234 | Delete a file via the webUI  | verify it goes to Deleted Items folder; verify it is removed from WebDav backend storage | :construction:  |
235 | Restore file from the Deleted Items folder  | verify it goes back to the proper location and the back end storage server | :construction:  |
236 | Connect WebDav as external storage in a oC server 8.2.X and upgrade to oC 9.X| Check that config still exits and works | :construction:  |
237 | Connect WebDav as external storage in a oC server 8.1.X and upgrade to oC 9.X| Check that config still exits and works | :construction:  |
238 | Connect WebDav as external storage in a oC server 8.0.X and upgrade to oC 9.X| Check that config still exits and works | :construction:  |
239 | Delete WebDav as external storage | The mount dissapears from mount points list in admin view | :construction:  |
240 | Edit some WebDav config fields of external storage mount point | Check that the changes are applied | :construction:  |