###  Spaces Management

**Server(s)**: oCIS 7.1.1<br>
**Device(s)**: iPhoneXR v18.2, iPad Air iPadOS 17.6.1<br>
**Execution date**: 26/03/2025<br>
**Tester**: jrecio <br>
**Context**: <br>


| Test Case | Description | Expected | Result | Comments |
| :-------- | :---------- | :------- | :----: | :------- |
|**Spaces list (local)**| **Admin or Space admin user**|
| Create new space with title and subtitle| 1. Open sidebar and select `Spaces`<br>2. Click on 3-dot-button on the top right<br>3. Create space<br>4. Add title and subtitle<br>5. Create | Space is created with correct title and subtitle (check in server) | P m18 t17 |  |  |
| Create new space with title | 1. Open sidebar and select `Spaces`<br>2. Click on 3-dot-button on the top right<br>3. Create space<br>4. Add title and let subtitle empty<br>5. Create | Space is created with correct title and without subtitle (check in server) | P m18 t17|  |  |
| Create new space with quota | 1. Open sidebar and select `Spaces`<br>2. Click on 3-dot-button on the top right<br>3. Create space<br>4. Add quota 10GB<br>5. Create | Space is created with correct title quota 10GB(check in server) |P m18 t17  | [Web bug](https://github.com/owncloud/web/issues/12388) |  |
| No title | 1. Open sidebar and select `Spaces`<br>2. Click on 3-dot-button on the top right<br>3. Create space | `Create`is disabled because no name was typed | P m18 t17 |  |
| Rename space | 1. In the space 3-dot-button, select `Edit Space`<br>2. Rename the space<br>3. Save | Space is renamed correctly (check in server) | P m18 t17 | DONE: [Suggestion](https://github.com/owncloud/ios-app/pull/1435#issuecomment-2765844182) |  |
| Change subtitle |  1. In the space 3-dot-button, select `Edit Space`<br>2. Change subtitle<br>3. Save | Space's subtitle changed (check in server)  | P m18 t17| DONE: [Suggestion](https://github.com/owncloud/ios-app/pull/1435#issuecomment-2765844182)|  |  |
| Remove subtitle |  1. In the space 3-dot-button, select `Edit Space`<br>2. Remove subtitle<br>3. Save | Space's subtitle removed (check in server)  | P m18 t17| DONE: [Suggestion](https://github.com/owncloud/ios-app/pull/1435#issuecomment-2765844182) |  |
| Change quota |  1. In the space 3-dot-button, select `Edit Space`<br>2. Change limit space<br>3. Save | Space's quota changed(check in server)  | P m18 t17 | [Web bug](https://github.com/owncloud/web/issues/12388) |  |
| Disable space | 1. In an existing space, click on the space 3-dot-button<br>2. Select `Disable space`<br>3. On the top-right 3-dot-button, select `Show disabled spaces`| 2. Space not listed (check also in server)<br>3. Space listed as disabled |P m18 t17 |  |  |
| Enable space | 1. Disable a space<br>2. On the top-right 3-dot-button, select `Show disabled spaces`<br>.3. Click on the space 3-dot-button<br>4. Enable  | Space listed (check also in server)  |P m18 t17 |  |  |
| Remove space | 1. Disable a space<br>2. On the top-right 3-dot-button, select `Show disabled spaces`<br>.3. Click on the space 3-dot-button<br>4. Delete and confirm deletion | Space removed and not listed anymore (check also in server)  | P m18 t17 |  |  |
| Edit description | 1. In an existing space, click on the space 3-dot-button<br>2. Select `Edit description`<br>3. Add description in markdown | Check description in the root folder of the space. (check also in server) | P m18 t17 | | 
| Remove description | 1. In an existing space with description, click on the space 3-dot-button<br>2. Select `Edit description`<br>3.Remove  description| Check empty description in the root folder of the space. (check also in server) | P m18 t17 |  |
| Edit image - Pick a Photo | 1. In an existing space, click on the space 3-dot-button<br>2. Select `Edit Image`<br>3. Pick a photo| Check image is updated (check also in server) | P m18 t17|  |  |
| Edit image - Text | 1. In an existing space, click on the space 3-dot-button<br>2. Select `Edit Image`<br>3. Write text | Check image is updated with the written text (check also in server) | P m18 t17|  |  |
| Edit image - Emoji | 1. In an existing space, click on the space 3-dot-button<br>2. Select `Edit Image`<br>3. Pick emoji from keyboard | Check image is updated with the emoji (check also in server) | P m18 t17|  |  |
|**Spaces list (remote)**| In a remote authenticated oCIS session|
| Create new space | Using web, create new space with title | Space is listed in app, in both sidebar and list of spaces | P m18 t17 |  |  |
| Rename space | Using web, rename an existing space | Space is renamed correctly in app | P m18 |  |  |
| Add subtitle | Using web, create space with subtitle| Check that space is created with subtitle  |  P m18 t17 |  |  |
| Edit subtitle | 1. Using web, create space with subtitle<br>2. In web, change subtitle, adding a very long one (exceeding screen size) | 1. Check that space is created without subtitle in app (grid mode)<br>2. Subtitle added in app | P m18 t17 |  |  |
| Set icon | Using web, create space with an icon as image |  In app, check that space is created with the icon (emoji) as image | P m18 t17 |  |  |
| Edit image | 1. Using web, create space with image<br>2. In web, edit the space to add another image |  1. In app, check that space is created with image<br>2. Image is displayed in app in the top side of the files view and list of spaces | P m18 t17 |  |  |
| Change quota | 1. Using web, create space<br>2. In web, edit the quota, from 1GB to 5GB| Check in app that the quota was correctly edited | P m18 t17 |  |  |
| Disable space | 1. Using web, create a new space and wait till app detects it<br>2. In web, disable the space| In app, space is not available |P m18 t17  |  |  |
| Enable space | 1. Using web, over a disabled space, open the list of options and select "Enable"<br>2. In app, open space | Content is available (check also in server) and thumbnail visible |  P m18 t17 |  |  |
| Remove space | 1. Using web, disable an existing space<br>2. In web, remove the space | In app, space removed and no longer listed |  P m18 t17 |  |  |
| Remove space from inside | 1. In app, enter in an existing space<br>2. Using web, disable an existing space | In app, moved to the list of spaces, showing correctly the disabled one | P m18 t17  |  |  |
|**Spaces sharing and membering - manager (local)**| 
| Add member as viewer | 1. In the 3-dot-button of a space, select `Members`<br>2. Click on `Invite` to add another user as viewer to the space| Check in web that the user appears in the list of recipients with viewer permission | P m18 t17 | |
| Add member as editor | 1. In the 3-dot-button of a space, select `Members`<br>2. Click on `Invite` to add another user as editor to the space| Check in web that the user appears in the list of recipients with editor permission  | P m18 t17| |
| Add member as manager | 1. In the 3-dot-button of a space, select `Members`<br>2. Click on `Invite` to add another user as manager to the space| Check in web that the user appears in the list of recipients with manager permission | P m18 t17 | |
| Change member's role | 1. In the 3-dot-button of a space, select `Members`<br>2. Change the rol of a viewer user to editor<br>3. Change the rol of the editor to manager<br>3. Change the rol of the manager to viewer| 1. New options to add content are now available, but not sharing options<br>2. Sharing options are now available<br>3. No sharing, no upload options available. Check in web. | P m18 t17 |  |
| Add default expiration | 1. In the 3-dot-button of a space, select `Members`<br>2. Click on `Invite` to add a new member to any space, granting any level of permission<br>3. Click on `Add` | Member is added, including an expiration date one week later from the creation date. Check in web | P m18 t17
| Add custom expiration | 1. In the 3-dot-button of a space, select `Members`<br>2. Click on `Invite` to add a new member to any space, granting any level of permission<br>3. Click on `Add`<br>4. Click on the default date and select a different one | Member is added, including the chosen expiration date. Check in web | P m18 t17
| Edit expiration | 1. In the 3-dot-button of a space, select `Members`<br>2. Click on `Invite` to add a new member to any space, granting any level of permission and an expiration date<br>3. Click on the expiration date and select a different one | Member is updated, with the new expiration date. Check in web | P m18 t17
| Remove expiration | 1. In the 3-dot-button of a space, select `Members`<br>2. Add a new member to any space, granting any level of permission and an expiration date<br>3. Remove the expiration date | 3. Check in web that the membership has no expiration date | P m18 t17
| Unshare member | 1. In the 3-dot-button of a space, select `Members`<br>2. Remove an existing member from the space | Check in web that the user is not in the list of members anymore | P m18 t17|
| Edit last manager | 1. Space with several members but only one manager, that is the current user<br>2. In the 3-dot-button of the space, select `Members`<br>2. Click over the member with `Manager` permission in the list | Not allowed to edit, at least one manager is mandatory | P m18 t17| FIXED: [Bug](https://github.com/owncloud/ios-app/pull/1435#issuecomment-2769075643)
| Create link with name | 1. In the 3-dot-button of a space, select `Members`<br>2. Create a link to the space with name| Check in web that the name was correctly added to the newly created link | P m18 t17
| Create link as viewer | 1. In the 3-dot-button of a space, select `Members`<br>2. Create a link as viewer to the space| Check in web that the link was created with viewer permissions | P m18 t17
| Create link as editor | 1. In the 3-dot-button of a space, select `Members`<br>2. Create a link as editor to the space| Check in web that the link was created with editor permissions  | P m18 t17
| Create link as secret drop | 1. In the 3-dot-button of a space, select `Members`<br>2. Create a secret drop link to the space| Check in web that the link was created with secret drop permissions | P m18 t17
| Create link with password | 1. In the 3-dot-button of a space, select `Members`<br>2. Create a link to the space including password | Check with the recipient user that the link is open after typing the correct password. | P m18 t17
| Create link with default expiration date | 1. In the 3-dot-button of a space, select `Members`<br>2. Click on `Add` for adding a new expiration date<br>3. `Share`| Check in web the expiration date is correct, 8 days later than the creation date  | P m18 t17 | [Improvement](https://github.com/owncloud/ios-app/pull/1435#issuecomment-2772280099) 
| Create link with custom  expiration date | 1. In the 3-dot-button of a space, select `Members`<br>2. Click on `Add` for adding a new expiration date<br>3. Click on the dedfault date and pick a differnet one<br>4. `Share` | Check in web the expiration date is the chose one  | P m18 t17 | [Improvement](https://github.com/owncloud/ios-app/pull/1435#issuecomment-2772280099) 
| Create link with everything | 1. In the 3-dot-button of a space, select `Members`<br>2. Create a link to the space including name, password expiration date and edit permission | Check in web the link is correct, including all name, password, expiration date and edit permission | P m18 t17 | |
| Edit link with name | 1. Create a link on a space adding name <br>2. In the 3-dot-button of a space, select `Members`<br>3. Edit the link name | Check in web that the name was correctly edited  | P m18 t17 | |
| Edit link permission | 1. Create a link on a space adding edit permission <br>2. In the 3-dot-button of a space, select `Members`<br>3. Edit permission setting secret drop | Check in web that the permission was correctly updated to secret drop  | P m18 t17 | |
| Edit expiration date | 1. Create a link on a space adding expiration date<br>2. In the 3-dot-button of a space, select `Members`<br>3. Edit expiration date | Check in web that the expiration date was correctly updated | P m18 t17 | |
| Remove link | 1. Create a link on a space<br>2. In the 3-dot-button of a space, select `Members`<br>3. Remove the link| Check in web that the link was removed | P m18 t17 | |
| Copy private link | 1. In the 3-dot-button of a space, select `Members`<br>2. Clock on `Copy Private Link`<br>3. Paste the content somewhere (notes app, mail...) | The link is the same as the link copied in the web over the same space | P m18 t17
|**Spaces sharing and membering (remote)**| 
| Add member as viewer | In web, add another user as viewer to a space| In app, check the user is in list of `Members` with viewer permission | P m18 t17
| Add member as editor | In web, add another user as editor to the space| In app, check the user is in list of `Members` with editor permission  | P m18 t17
| Add member as manager | In web, add another user as manager to the space| In app, check the user is in list of `Members` with manager permission| P m18 t17
| ----- Change member's role | 1. In web, change the rol of a viewer user to editor<br>2. Change the rol of the editor to manager<br>3. Change the rol of the manager to viewer| 1. In app, new options to add content are now available, but not sharing options<br>2. In app, sharing options are now available<br>3. In app, no sharing, no upload options available. | P m18 t17
| Add expiration | 1. In web, add a new member to any space, granting any level of permission<br>2. Add an expiration date | In app, check the user is in list of `Members` with an expiration date of membership | P m18 t17 | |
| Remove expiration | 1. In web, add a new member to any space, granting any level of permission and an expiration date<br>3. Remove the expiration date | 3. In app, check that the membership has no expiration date | P m18 t17 | |
| Unshare member | In web, remove an existing member from the space | In app, check with the recipient user that can not access the space anymore | P m18 t17 | |
| Create link with name | In web, create a link to any space with name| In app, check that the name was correctly added to the newly created link |P m18 t17 | |
| Create link as viewer | In web, create a link as viewer to the space| In app, check that  the link was created with viewer permissions | P m18 t17 | |
| Create link as editor | In web, create a link as editor to the space| In app, check that the link was created with editor permissions  | P m18 t17 | |
| Create link as secret drop | In web, create a secret drop link to the space| In app, check that the link was created with secret drop permissions | P m18 t17| |
| Create link with password | In web, create a link to the space including password | In app, check that the link is open after typing the correct password | P m18 t17| |
| Create link with default expiration date | In web, create a link to the space including  expiration date | Check in app the expiration date is correct  |P m18 t17 | |
| Create link with everything | In web, create a link to the space including name, password expiration date and edit permission | Check in app the link is correct, including all name, password, expiration date and edit permission | P m18 t17| |
| Edit link with name | In web, edit a link on a space changing the name | Check in app that the name was correctly edited  | P m18 t17 | |
| Edit link permission | In web, edit a link on a space setting secret drop permission  | In app, check that the permission was correctly updated to secret drop  | P m18 t17 | |
| Edit expiration date | In web, edir a link on a space editing expiration date| In app,check that the expiration date was correctly updated | P m18 t17 | |
| Remove link | 1. In web, remove any link on a space | In app, check that the link was removed | P m18 t17 | |
|**User with edit/view permission**|
| No options | 1. In an existing space, click on the space 3-dot-button<br>2. Click on `Members` | 1. Only available `Members`, `Details` (check in server) | P m18 t17 |  |  |
| Manage Members not available | 1. In an existing space, click on the space 3-dot-button<br>2. Click on `Members` | No way to add a new member or modify an existing one. Just listing| P m18 t17 |  |  |
| Details | 1. In an existing space, click on the space 3-dot-button<br>2. Click on `Details` | Check in web that the name, subtitle, qouta and members of the space are correctly displayed| P m18 t17  | DONE: [Improvement](https://github.com/owncloud/ios-app/pull/1435#issuecomment-2772329590) |  |


