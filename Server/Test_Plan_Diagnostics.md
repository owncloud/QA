## Diagnostics Test Plan

Examples of the logged elements:

**Summaries:** 

```json
{"type":"SUMMARY","reqId":"eAxU072dhgToClrWcnxg","time":"2017-08-04T09:02:01+00:00","remoteAddr":"X.X.X.X","user":"admin","method":"GET","url":"\/ocs\/v2.php\/apps\/notifications\/api\/v1\/notifications?format=json","diagnostics":{"totalSQLQueries":14,"totalSQLDurationmsec":6.5891742706299,"totalSQLParams":23,"totalEvents":22,"totalEventsDurationmsec":60.784816741943}}
```

**Queries:**

```json
{"type":"QUERY","reqId":"0JL3npDsJNm4ufRps3pY","diagnostics":{"sqlStatement":"SELECT `fileid` FROM `filecache` WHERE `storage` = ? AND `path_hash` = ?","sqlParams":"array (   0 => 2,   1 => 'd41d8cd98f00b204e9800998ecf8427e', )","sqlQueryDurationmsec":0.28014183044434,"sqlTimestamp":1501848721.6344}}
```



**Events:**

```json
{"type":"EVENT","reqId":"0JL3npDsJNm4ufRps3pY","diagnostics":{"eventDescription":"Initialize session","eventDurationmsec":8.965015411377,"eventTimestamp":1501848721.4691}}
```





| Test Case                                | Expected Result                          | Result         | Related Comment |
| ---------------------------------------- | ---------------------------------------- | -------------- | --------------- |
| Enable the app                           | No problems found                        | :construction: |                 |
| Having a server with several users and groups, click on the textfield to select users. | Only users appear, not groups, and they can be selected without problems. | :construction: |                 |
| Click on the checkbox to allow collecting all data. | The user selection dissapears.           | :construction: |                 |
| Choose in the dropdown about "what to log" Nothing | No idea what is this for                 | :construction: |                 |
| Clean the log file. Choose in the dropdown about "what to log" Summary | The log is correctly saved and only has summaries. | :construction: |                 |
| Clean the log file. Choose in the dropdown about "what to log" All queries. | The log is correctly saved and only has queries. | 🚧             |                 |
| Clean the log file. Choose in the dropdown about "what to log" All events. | The log is correctly saved and only has events. | 🚧             |                 |
| Clean the log file. Choose in the dropdown about "what to log" Everything | The log is correctly saved and has queries, events and summaries. | 🚧             |                 |
| **Particular users**                     |                                          |                |                 |
| Disable the checkbox to allow collecting all data. Choose a particular user 'user1'. Choose in the dropdown about "what to log" Summary | The log is correctly saved and only has summaries of 'user1' | 🚧             |                 |
| Disable the checkbox to allow collecting all data. Choose a particular user 'user1'. Choose in the dropdown about "what to log" all queries. | The log is correctly saved and only has queries of 'user1' | 🚧             |                 |
| Disable the checkbox to allow collecting all data. Choose a particular user 'user1'. Choose in the dropdown about "what to log" all events. | The log is correctly saved and only has events of 'user1' | 🚧             |                 |
| Disable the checkbox to allow collecting all data. Choose a particular user 'user1'. Choose in the dropdown about "what to log" Everything. | The log is correctly saved and only has events, queries and summaries of 'user1' | 🚧             |                 |
| Set up a ldap server. Choose a user from ldap 'ldap_user1'. Choose in the dropdown about "what to log" Summary | The log is correctly saved and only has summaries of 'ldap_user1' | 🚧             |                 |
| Set up a ldap server. Choose a user from ldap 'ldap_user1'. Choose in the dropdown about "what to log" queries | The log is correctly saved and only has queries of 'ldap_user1' | 🚧             |                 |
| Set up a ldap server. Choose a user from ldap 'ldap_user1'. Choose in the dropdown about "what to log" events | The log is correctly saved and only has events of 'ldap_user1' | 🚧             |                 |
| Set up a ldap server. Choose a user from ldap 'ldap_user1'. Choose in the dropdown about "what to log" everything. | The log is correctly saved and only has summaries of 'ldap_user1' | 🚧             |                 |
| **Browsers**                             |                                          |                |                 |
| Check that all the UI elements are usable when browsing with safari |                                          | :construction: |                 |
| Check that all the UI elements are usable when browsing with chrome |                                          | :construction: |                 |
| Check that all the UI elements are usable when browsing with firefox |                                          | :construction: |                 |
| Check that all the UI elements are usable when browsing with edge |                                          | :construction: |                 |
| Check that all the UI elements are usable when browsing with IE11 |                                          | :construction: |                 |
| **Databases**                            |                                          |                |                 |
| Having a server using mysql. Choose in the dropdown about "what to log" queries | The log is correctly saved and only has queries. | :construction: |                 |
| Having a server using postgresql. Choose in the dropdown about "what to log" queries | The log is correctly saved and only has queries. | 🚧             |                 |
| Having a server using oracle. Choose in the dropdown about "what to log" queries | The log is correctly saved and only has queries. | 🚧             |                 |