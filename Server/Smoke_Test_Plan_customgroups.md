## Test Plan custom_groups

The toplevel checkmark indictes the test was performed.
The indented checkmarks indicate the results were as expected.

This is a quick smoke test only. For the full testplan refer to Test_Plan_Customgroups.md

* [ ] Enable the app
   * [ ] No problems found
* [ ] Disable and enable the app using CLI
   * [ ] No problems found
* [ ] Create a custom group
   * [ ] Custom group is created correctly
* [ ] Create an already existing custom group
   * [ ] The group cannot be created again
* [ ] Delete a custom group
   * [ ] The group is removed correctly
* [ ] Rename a custom group
   * [ ] The group is renamed correctly
* [ ] As a non-admin member try to rename its custom group
   * [ ] He cannot rename its custom group
* [ ] Get members of a group
   * [ ] Members are retrieved correctly
* [ ] Check that the creator of a custom group becames admin automatically
   * [ ] No problems found
* [ ] As a creator of a custom group add members
   * [ ] Members are added correctly
* [ ] As non-admin member of a custom group try to add members
   * [ ] Non-admin member cannot add members
* [ ] Check that all the UI elements are usable when browsing
   * [ ] chrome
   * [ ] firefox
   * [ ] edge (win10)
* [ ] can custom groups have same name as normal groups
   * [ ] Try a custrom group named admin. Do user gain no admin powers.
   * [ ] User does not get admin rights

