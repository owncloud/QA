## Create links over sharing NG

**Server(s)**: oCIS 8.2.1<br>
**Device(s)**: Xiaomi Readmi 13, Android 15. Samsung Galaxy Tab A8, Android 14<br>
**Execution date**: 29/10/2026 <br>
**Tester**: jrecio<br>

___

| Test name | Steps to execute | Expected result | Result | Comments |
|-----------|------------------|-----------------|--------|----------|
| **Operation available** | | | | |
| Create button visible — file | As a user with `libre.graph/driveItem/permissions/create`, open the sharing panel for a file. Check both orientations | `+` appears in the `PUBLIC LINKS` header | P m15 t14 | |
| Create button visible — folder | As a user with `libre.graph/driveItem/permissions/create`, open the sharing panel for a folder. Check both orientations | `+` appears in the `PUBLIC LINKS` header | P m15 t14 | |
| Create button hidden — no permission | As a user without `libre.graph/driveItem/permissions/create`, open the sharing panel for a file | No `+` in the `PUBLIC LINKS` header | P m15 t14 | |
| Permission granted dynamically | 1. Open sharing panel without create permission<br>2. In web, grant the create permission<br>3. Reopen sharing panel | 1. No `+` in the `PUBLIC LINKS` header<br>3. `+` appears in the `PUBLIC LINKS` header | P m15 t14 | FIXED: [BUG](https://github.com/owncloud/android/pull/5030#issuecomment-6492650689) |
| Permission removed dynamically | 1. Open sharing panel with create permission<br>2. In web, remove the create permission<br>3. Reopen sharing panel | 1. `+` appears in the `PUBLIC LINKS` header<br>3. No `+` in the `PUBLIC LINKS` header | P m15 t14 | FIXED: [BUG](https://github.com/owncloud/android/pull/5030#issuecomment-6492650689) |
| **Set up link** | User with create permission, on `Add Link` | | | |
| No permission selected | Open the creation view without selecting a permission | `Create` button disabled; password and expiration date fields not visible | P m15 t14 | |
| Password & expiration visible | Select any permission type | Password and expiration date fields become visible | P m15 t14 | |
| Fields reset on reopen | 1. Tap `+`<br>2. Select a permission (password + expiration appear)<br>3. Back arrow to `Share`<br>4. Tap `+` again | Password & expiration are hidden; no permission preselected | P m15 t14 | |
| Add Name | 1. Enter a name<br>2. Select any permission<br>3. Add any Password<br>4. Click `Create` | Link created and listed with the correct name. Check in web | P m15 t14 | |
| Add Empty Name | 1. Leave name empty<br>2. Select any permission<br>3. Add any Password<br>4. Click `Create`| Link created and listed as "Unnamed Link". Check in web | P m15 t14 | |
| Add Long Name | Attempt to enter a name exceeding 255 characters | Input is restricted to 255 characters maximum | P m15 t14 | |
| Can View — file | 1. Tap `+` on a file<br>2. Select `Can view`<br>3. Add any Password<br>4. Click `Create` | Only `Can view` and `Can edit` are offered (no `Secret file drop`); link created with `Can view`. Check in web | P m15 t14  | |
| Can Edit — file | 1. Tap `+` on a file<br>2. Select `Can edit`<br>3. Add any Password<br>4. Click `Create` | Only `Can view` and `Can edit` are offered (no `Secret file drop`); link created with `Can edit`. Check in web  | P m15 t14  | |
| Can View — folder | 1. Tap `+` on a folder<br>2. Select `Can view`<br>3. Add any Password<br>4. Click `Create` | All three options offered; link created with `Can view`. Check in web |P m15 t14  | |
| Can Edit — folder | 1. Tap `+` on a folder<br>2. Select `Can edit`<br>3. Add any Password<br>4. Click `Create` | Link created with `Can edit`. Check in web |P m15 t14  | |
| Secret file drop — folder | 1. Tap `+` on a folder<br>2. Select `Secret file drop`<br>3. Add any Password<br>4. Click `Create` | `Secret file drop` option offered with subtitle "Upload only, existing content is not revealed"; link created. Check in web | P m15 t14  | |
| Secret file drop not available for file | Tap `+` on a file and open permission selector | Only `Can view` and `Can edit` are offered; `Secret file drop` is not shown | P m15 t14  | |
| Add expiration date | 1. Tap `+` on a folder<br>2. Select `Secret file drop`<br>3. Add any Password<br>4. Add an expiration date<br>5. Click `Create` | Link created and listed with the correct expiration date. Check in web | P m15 t14  | |
| All fields together | 1. Enter a valid name<br>2. Select any permission<br>3. Set a password<br>4. Set an expiration date<br>5. Click `Create` | Link created with the correct name, permission, password, and expiration date. Check in web that all four match | P m15 t14  | |
| **Password** | | | | |
| Password mandatory | In a server with mandatory password (`OCIS_SHARING_PUBLIC_SHARE_MUST_HAVE_PASSWORD`), select any permission | Password field visible and mandatory for every permission level; `Create` locked until a password is set | P m15 t14 | |
| Password not mandatory | In a server without mandatory password, select any permission | Password field visible and not mandatory; `Create` enabled without a password | P m15 t14 | |
| Password not compliant with policy | 1. In a server with a password policy, select any permission<br>2. Enter a password that does not comply with the policy | `Set` button disabled | P m15 t14 | |
| Password not mandatory for view (writeable policy) | In a server with `OCIS_SHARING_PUBLIC_WRITEABLE_SHARE_MUST_HAVE_PASSWORD`:<br>1. Select `Can view`<br>2. Click `Create` without entering a password | Password is not mandatory; link created without password. Check in web that the link is accessible without a password | P m15 t14| |
| Password mandatory for edit (writeable policy) | In a server with `OCIS_SHARING_PUBLIC_WRITEABLE_SHARE_MUST_HAVE_PASSWORD`, select `Can edit` | Password is mandatory; `Create` disabled until a password is set | P m15 t14 | |
| Password mandatory for secret drop (writeable policy) | In a server with `OCIS_SHARING_PUBLIC_WRITEABLE_SHARE_MUST_HAVE_PASSWORD`, select `Secret file drop` | Password is mandatory; `Create` disabled until a password is set | P m15 t14| |
| Password enforcement switches with permission | In a server with `OCIS_SHARING_PUBLIC_WRITEABLE_SHARE_MUST_HAVE_PASSWORD`:<br>1. Select `Can view`<br>2. Select `Can edit`<br>3. Select `Secret file drop`<br>4. Select `Can view` again | 1. Password not mandatory, `Create` enabled<br>2. Password mandatory, `Create` disabled<br>3. Password mandatory, `Create` disabled<br>4. Password not mandatory, `Create` enabled | P m15 t14 | |
| Password removed (mandatory server) | 1. In a server with mandatory password, select any permission<br>2. Enter and confirm a password<br>3. Remove the password | `Create` disabled; password field shows as empty | P m15 t14 | |
| Password removed (non-mandatory server) | 1. In a server without mandatory password, select any permission<br>2. Enter and confirm a password<br>3. Remove the password<br>4. Click `Create` | 3. `Create` still enabled<br>4. Link created without password. Check in web that the link is accessible without a password | P m15 t14 | |
| Password generated | 1. Select any permission<br>2. In the password dialog, click `Generate`<br>3. Click `Copy`<br>4. Click `Set`<br>5. Click `Create` | 4. Password set (shown as `****`)<br>5. Link created and listed. Check in web that the link requires the generated password (available in clipboard) | P m15 t14 | |
| Password custom | 1. Select any permission<br>2. In the password dialog, enter a policy-compliant password<br>3. Click `Copy`<br>4. Click `Set`<br>5. Click `Create` | 4. Password set (shown as `****`)<br>5. Link created and listed. Check in web that the link requires the typed password | P m15 t14 | |
| No password policy | 1. In a server with no password policy, select any permission<br>2. In the password dialog, enter any password<br>3. Click `Set`<br>4. Click `Create` | 3. Password set (shown as `****`)<br>4. Link created and listed. Check in web | P m15 t14 | Max 72 chars, always|
| Permission selected & no mandatory password | 1. Select a permission<br>2. Do not enter the mandatory password | `Create` button enabled | P m15  t14| |
| permission selected & mandatory password | Select permission; do not enter a mandatory password | `Create` button disabled |P m15 t14 | |
| **After creation** | | | | |
| New link appears in list | Create a link successfully | The `PUBLIC LINKS` list refreshes and the newly created link appears | P m15 t14 | |
| Unnamed link label | Create a link with an empty name | The list entry shows "Unnamed Link" as the display name | P m15 t14  | |
| Share via chain icon | Tap the chain icon on the newly created link | Android share sheet opens offering the link's `webUrl` | P m15 t14 | |
| **Errors** | | | | |
| Permission removed during creation | 1. Tap `+` and configure a new link<br>2. Before submitting, have the create permission removed server-side<br>3. Click `Create` | Error "Link could not be created" shown; creation view stays open | P m15 t14| Unknown error, [server bug](https://github.com/owncloud/ocis/issues/12179)
| No network connection | 1. Open the creation view<br>2. Disable network on the device<br>3. Fill in required fields and click `Create` | Error "not connected to a network" shown; no results | P m15 t14 | |
| Server down | 1. Open the creation view<br>2. Turn the server off<br>3. Fill in required fields and click `Create` | Error "connecting to the server" shown; no results | P m15 t14 | |
| **Regression** | | | | |
| Space link creation | Create a public link from space management as before | Space link still created via `root/createLink`; behavior unchanged. Check in web | P m15 t14 | FIXED: [BUG](https://github.com/owncloud/android/pull/5030#issuecomment-6497964761) |
| Existing links readable | Open sharing panel for an item that already has public links | Existing links listed correctly; chain icons open the share sheet with the correct URL | P m15 t14 | |
| **Accessibility** | One device | | | |
| Talkback | 1. Enable Talkback<br>2. Navigate through the `Add Link` and password views | Every field is correctly labelled and navigable via Talkback | P m15| |
| Keyboard navigation | 1. Connect a physical keyboard via BT<br>2. Navigate through the `Add Link` and password views | Every field is selectable; no dead paths in navigation | P m15 | |
