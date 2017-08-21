## Customgroups Test Plan



| Test Case                                | Expected Result                          | Result         | Related Comment |
| ---------------------------------------- | ---------------------------------------- | -------------- | --------------- |
| Enable the app.                          | No problems found.                       | :gear:         |                 |
| Enable the app using CLI.                | No problems found.                       | :gear:         |                 |
| Create a custom group.                   | Custom group is created correctly.       | :gear:         |                 |
| Create an already existing custom group. | The group cannot be created again.       | :gear:         |                 |
| Delete a custom group.                   | The group is removed correctly.          | :gear:         |                 |
| Rename a custom group.                   | The group is renamed correctly.          | :gear:         |                 |
| As a non-admin member try to rename its custom group. | He cannot rename its custom group        | :gear:         |                 |
| Get members of a group.                  | Members are retrieved correctly.         | :gear:         |                 |
| Check that the creator of a custom group becames admin automatically. | No problems found.                       | :gear:         |                 |
| As a creator of a custom group add members. | Members are added correctly.             | :gear:         |                 |
| As non-admin member of a custom group try to add members. | Non-admin member cannot add members.     | :gear:         |                 |
| As non-member of a custom group try to list its members. | Non-admin member cannot list members.    | :gear:         |                 |
| As custom group member try to list members. | Custom group member can list members.    | :gear:         |                 |
| As non-admin member of a custom group try to delete a custom group | A non-admin member of a custom group cannot delete a custom group. | :gear:         |                 |
| As a creator of a custom group try to remove members. | Creator of a custom group can remove members. | :gear:         |                 |
| As a non-admin member of a custom group try to remove members | A non-admin member of a custom group cannot remove members. | :gear:         |                 |
| Not having more admins on a custom group, as group owner try to remove yourself from the group | Group owner cannot remove self if no other admin exists in the group. | :gear:         |                 |
| As member of a custom group leave the custom group. | A member of a custom group can leave the custom group himself. | :gear:         |                 |
| As a user check the groups you belong to. | A user can list his groups.              | :gear:         |                 |
| As owner of a group, try to change the role of a member of the group. | Role is changed successfully.            | :gear:         |                 |
| Create a custom group and let user 'member1' as admin. | 'member1' is the new admin of the group. No problems. | :gear:         |                 |
| As superadmin of the server create a custom group. | Superadmin can create custom groups.     | :gear:         |                 |
| As superadmin add a user to a custom group. | Superadmin can add a user to any custom group. | :gear:         |                 |
| As superadmin rename a custom group.     | Superadmin can rename any custom group.  | :gear:         |                 |
| As superadmin change role of a member of a group making him admin. | Superadmin can change roles.             | :gear:         |                 |
| As superadmin remove a member of a custom group. | Superadmin can remove members.           | :gear:         |                 |
| As superadmin try to list members of a custom group. | Superadmin can list members.             | :gear:         |                 |
| As member converted to group owner add members to group, remove members, change roles and list members. | A member converted to group owner can do the same as group owner | :gear:         |                 |
| Having no other admin in a custom group, as group owner try to remove your own admin permissions. | A group owner cannot remove his own admin permissions if there is no other owner in the group | :gear:         |                 |
| Check that a non-existing user cannot be added to a custom group |                                          | :gear:         |                 |
| **Using frontend**                       |                                          |                |                 |
| Create a custom group.                   | Custom group is created correctly.       | 🚧             |                 |
| Create an already existing custom group. | The group cannot be created again. A warning appears. | 🚧             |                 |
| Delete a custom group.                   | The group is removed correctly.          | 🚧             |                 |
| Rename a custom group.                   | The group is renamed correctly.          | 🚧             |                 |
| As a creator of a custom group add members. | Members are added correctly.             | 🚧             |                 |
| As regular user member of a custom group check the users in the custom groups. | You can see the other members.           | 🚧             |                 |
| As non-admin member of a custom group try to add members. | Non-admin member cannot add members. There is no UI element to do it. | 🚧             |                 |
| As non-admin member of a custom group try to delete a custom group | A non-admin member of a custom group cannot delete a custom group. | 🚧             |                 |
| As a creator of a custom group try to remove members. | Creator of a custom group can remove members. | 🚧             |                 |
| As a non-admin member of a custom group try to remove members | Not even possible.                       | 🚧             |                 |
| Not having more admins on a custom group, as group owner try to remove yourself from the group | Group owner cannot remove self if no other admin exists in the group. | 🚧             |                 |
| As member of a custom group leave the custom group. | A member of a custom group can leave the custom group himself. | 🚧             |                 |
| As a user check the groups you belong to. | A user can list his groups.              | 🚧             |                 |
| As owner of a group, try to change the role of a member of the group. | Role is changed successfully.            | 🚧             |                 |
| Create a custom group and let user 'member1' as admin. | 'member1' is the new admin of the group. No problems. | 🚧             |                 |
| As member converted to group owner add members to group, remove members, change roles and list members. | A member converted to group owner can do the same as group owner | :construction: |                 |
| Having no other admin in a custom group, as group owner try to remove your own admin permissions. | A group owner cannot remove his own admin permissions if there is no other owner in the group | :construction: |                 |
| **Browsers**                             |                                          |                |                 |
| Check that all the UI elements are usable when browsing with safari |                                          | :construction: |                 |
| Check that all the UI elements are usable when browsing with chrome |                                          | :construction: |                 |
| Check that all the UI elements are usable when browsing with firefox |                                          | :construction: |                 |
| Check that all the UI elements are usable when browsing with edge |                                          | :construction: |                 |
| Check that all the UI elements are usable when browsing with IE11 |                                          | :construction: |                 |
| **Extra cases**                          |                                          |                |                 |
| Set up an ldap server. Create a custom group and add ldap users as members. | They can use customgroups without problems. | :construction: |                 |
| Check that ldap users appear with their display name instead of the uuid. |                                          | :construction: |                 |
