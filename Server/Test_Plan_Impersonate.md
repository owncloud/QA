## Impersonate Test Plan



| Test Case                                | Expected Result                          | Result         | Related Comment |
| ---------------------------------------- | ---------------------------------------- | -------------- | --------------- |
| Enable the app.                          | No problems found.                       | :construction: |                 |
| As admin create a group 'group1' add three members 'user1', 'user2', 'user3'. Make 'user1' group admin of 'group1'. Login as 'user1', go to the users view. Impersonate 'user2'. | 'user1' can impersonate 'user2'. See his files. Behave like him. Like if he were logged in. | 🚧             |                 |
| Check that a user who is not group admin cannot impersonate anyone. |                                          | 🚧             |                 |
| As admin create a group 'group1' add four members 'user1', 'user2', 'user3' and 'admin' being admin user of the server. Make 'user1' group admin of 'group1'. Login as 'user1', go to the users view. Impersonate 'admin'. | Super admin cannot be impersonated.      | 🚧             |                 |
| When impersonating a user, a warning appears adverting that you have logged as another user. | a warning appears and disappears after a while. | 🚧             |                 |
| Check that impersonate options appears in the correct settings panel. |                                          | 🚧             |                 |
| **Interaction with other Apps**          |                                          |                |                 |
| Having ldap set up, enable impersonation for an ldap group. Make a user group admin. Using that user impersonate one of the other members of the ldap group. | Users can be impersonated without problems. | 🚧             |                 |
| A guest user cannot impersonate other users. |                                          | 🚧             |                 |
| **Browsers**                             |                                          |                |                 |
| Check that all the UI elements are usable when browsing with safari. |                                          | :construction: |                 |
| Check that all the UI elements are usable when browsing with chrome. |                                          | :construction: |                 |
| Check that all the UI elements are usable when browsing with firefox. |                                          | :construction: |                 |
| Check that all the UI elements are usable when browsing with edge. |                                          | :construction: |                 |
| Check that all the UI elements are usable when browsing with IE11. |                                          | :construction: |                 |

* [ ] Transitive ("cascading") impersonate is disallowed.
   * [ ] Given Alice can impersonate as Bob, and Bob can impersonate as Carol
      * [ ] Alice (after impersonating as Bob) sees the impersonate icon for user Carol
      * [ ] But impersonate fails with an error message.
