# OC11 Docker Smoke Test

Canonical smoke test for ownCloud classic server **OC11** (`owncloud/core` master,
version `11.0.0-rc2`), deployed **docker-only**. This plan replaces the three
legacy smoke plans: `Test_Plan_Smoke_Test.md`, `Test_Plan_Simplified_Smoke_Test.md`
and `Smoke_Test_Plan_customgroups.md` (see **Replaces** at the bottom).

The toplevel checkbox means the step was performed; nested checkboxes mean the result
was as expected.

Scope is the apps **enabled by default** in the docker image (Community edition). The
image also ships many apps **present but disabled** — enterprise/licensed apps (firewall,
ransomware_protection, enterprise_key, sharepoint, kerberos, workflow, theme-enterprise,
files_classifier, files_lifecycle, …) and opt-in apps (encryption, guests, impersonate,
customgroups, user_ldap, oauth2, openidconnect, web, …). Those are **out of scope** here
and get their own plans — see **Out of scope**.

> Verified against `owncloud/server:11.0.0-rc2` on 2026-07-24 (Community edition,
> PHP 8.3.6, sqlite default).

---

## Setup

### Image under test

- Image: **`owncloud/server:11.0.0-rc2`** (Docker Hub).
- This tag may be **rebuilt daily** from `owncloud-daily-master.tar.bz2`, so the exact app
  set and versions can drift day to day. The "Confirm the bundled app set" step below is
  therefore mandatory, not optional.
- Runtime requires **PHP ≥ 8.3 and < 8.6**.
  - [ ] `docker exec oc11 php -v` reports a version in `8.3`–`8.5`. A version outside that
    range means a bad/stale image — stop and re-pull.

### Single-instance deployment (docker run)

The image defaults to an embedded **sqlite** database (`OWNCLOUD_DB_TYPE=sqlite`), so a
single `docker run` boots a complete instance with no database container — fine for smoke
testing. (For a production-like run, set `OWNCLOUD_DB_TYPE=mysql` and add a MariaDB/MySQL
container via compose.)

```
docker pull owncloud/server:11.0.0-rc2
docker run -d --name oc11 \
  -p 8080:8080 \
  -e OWNCLOUD_DOMAIN=localhost:8080 \
  -e OWNCLOUD_ADMIN_USERNAME=admin \
  -e OWNCLOUD_ADMIN_PASSWORD=admin \
  owncloud/server:11.0.0-rc2
```

- The admin env vars are `OWNCLOUD_ADMIN_USERNAME` / `OWNCLOUD_ADMIN_PASSWORD` (both
  default to `admin` if omitted).
- [ ] Wait for first-run install to finish: `docker logs oc11` ends with Apache
  "resuming normal operations". (This image defines no Docker healthcheck, so watch the
  logs rather than `docker inspect` health.)
- [ ] Web UI reachable at `http://localhost:8080`; log in as `admin` / `admin`.

### Running occ

All admin / CLI steps in this plan use `occ` inside the container:

```
docker exec -it -u www-data oc11 occ <command>
```

(If `-u www-data` is rejected on the image, drop it and run `docker exec -it oc11 occ …`.)
This replaces every host-based `oc10.sh` / `make_oc10_apps.sh` invocation and every bare
`mysql owncloud -e '…'` call from the legacy plans.

- [ ] `docker exec -u www-data oc11 occ status` reports version `11.0.0.x` /
  `11.0.0-rc2`.

### Confirm the live app set

```
docker exec -u www-data oc11 occ app:list
```

- [ ] Record the actual **Enabled** and **Disabled** lists. The **default-enabled** set
  (20 apps, this is the smoke scope) is expected to be: `activity`, `comments`,
  `configreport`, `dav`, `diagnostics`, `federatedfilesharing`, `federation`, `files`,
  `files_external`, `files_mediaviewer`, `files_pdfviewer`, `files_sharing`,
  `files_texteditor`, `files_trashbin`, `files_versions`, `firstrunwizard`, `market`,
  `notifications`, `provisioning_api`, `systemtags`, `updatenotification`.
- [ ] If the enabled list diverges from the 21 above, note the drift
  and adjust which Cases apply.
- Always-enabled (cannot be disabled): `files`, `dav`, `federatedfilesharing`.
- The image also ships ~34 **disabled** apps (enterprise/licensed and opt-in). This plan
  enables only the few it needs (`encryption`, `external`) in the relevant Cases.

### Enable the extra apps this plan needs

Two in-scope Cases use apps that ship disabled — enable them once up front:

```
docker exec -u www-data oc11 occ app:enable encryption    # Case 8
docker exec -u www-data oc11 occ app:enable external      # Case 13
```

- [ ] both report "enabled"; `occ app:list` shows them under **Enabled**.

### Second instance for federation (Case 6 only)

Run a second instance on a shared docker network so the two can resolve each other by name:

```
docker network create oc11net

docker run -d --name oc11-a --network oc11net -p 8080:8080 \
  -e OWNCLOUD_DOMAIN=oc11-a:8080 \
  -e OWNCLOUD_ADMIN_USERNAME=admin -e OWNCLOUD_ADMIN_PASSWORD=admin \
  owncloud/server:11.0.0-rc2

docker run -d --name oc11-b --network oc11net -p 8081:8080 \
  -e OWNCLOUD_DOMAIN=oc11-b:8080 \
  -e OWNCLOUD_ADMIN_USERNAME=admin -e OWNCLOUD_ADMIN_PASSWORD=admin \
  owncloud/server:11.0.0-rc2
```

- Instance A UI: `http://localhost:8080`; instance B UI: `http://localhost:8081`.
- [ ] Confirm the two instances can reach each other (docker network hostnames `oc11-a` /
  `oc11-b`). Federation between two instances may require HTTPS and/or each
  domain being added to the other's `trusted_domains` — record what was needed.
- (Alternatively, define a `docker-compose.yml` with two services `oc11-a` and `oc11-b`
  on one network — equivalent to the above.)

### Personas, users and groups

Create the cast via `occ` on instance A (recipient `richard` lives on instance B). The
password is read from `OC_PASS` (the `user:add` command is non-interactive only with
`--password-from-env`):

```
docker exec -u www-data -e OC_PASS=opensesame oc11 occ user:add --password-from-env --display-name="Marie Curie"     --email=marie@example.org     marie
docker exec -u www-data -e OC_PASS=opensesame oc11 occ user:add --password-from-env --display-name="Albert Einstein" --email=einstein@example.org einstein
docker exec -u www-data -e OC_PASS=opensesame oc11 occ user:add --password-from-env --display-name="Maurice Moss"    --email=moss@example.org      moss
docker exec -u www-data oc11 occ group:add researchers
docker exec -u www-data oc11 occ group:add-member --member marie researchers
```

(Note the command is `group:add-member --member <user> <group>`, not `group:adduser`.)

| Persona   | Instance | Role in this plan                                   |
| --------- | -------- | --------------------------------------------------- |
| Admin     | A        | Server admin; owns/shares resources                 |
| Marie     | A        | Primary sharee; member of group `researchers`       |
| Einstein  | A        | Second sharee; initially *not* in `researchers`     |
| Moss      | A        | Extra group member                                  |
| Katherine | A        | Spare user for ad-hoc steps                          |
| Richard   | B        | Federated-share recipient on instance B             |

(Classic server has no "Spaces"; the OCIS space personas map to plain users/groups here.)

---

## Browsers

Exercise the Web UI steps in a current Chromium-based browser (Chrome or Edge), Firefox,
and Safari. **Internet Explorer 11 is out of scope.** Browser coverage is ambient — pick
one as primary and spot-check the others; there is no per-browser result matrix.

---

## Case 1: Admin core file operations

Apps: `files`, `files_versions`, `files_trashbin`

Admin:
- [ ] upload a large file (~1 GB) — show details, observe the upload completes
- [ ] upload a folder "smoke_folder" containing `sample.pdf` and `sample.jpg` (drag-drop)
- [ ] create a new folder "docs" inside "smoke_folder"
- [ ] rename `sample.pdf` to `renamed.pdf` (triple dots context menu → Rename)
- [ ] move `renamed.pdf` into "docs" (drag-drop)
- [ ] upload a new version of `sample.jpg` (choose `New Files`) — a new version is created
  - [ ] open the file's Versions, the previous version is listed and restorable
- [ ] delete "docs" — it disappears from the file list
  - [ ] open Deleted files, "docs" is present, restore it — it returns to the list
- [ ] delete "docs" again, then Empty trash — the trash is empty

## Case 2: WebDAV upload

Apps: `files`, `dav`

Admin:
- [ ] PUT a ~100 MB file via WebDAV (curl or a DAV client):
  ```
  curl -u admin:admin -T bigfile.bin \
    http://localhost:8080/remote.php/dav/files/admin/webdav_upload.bin
  ```
  (Note: the docker default has no `/owncloud` subpath.)
  - [ ] the file appears in the Web UI Files list
- [ ] download it back via DAV — the size matches the upload
  ```
  curl -u admin:admin -o downloaded.bin \
    http://localhost:8080/remote.php/dav/files/admin/webdav_upload.bin
  ```

## Case 3: User share — folder with a user

Apps: `files_sharing`, `files_versions`

Admin:
- [ ] create folder "shared_with_marie" with `sample.txt` inside
- [ ] share "shared_with_marie" with Marie, role "Can edit"

Marie:
- [ ] folder appears in "Shared with me"; open it
- [ ] upload `file_from_marie.txt` (Admin sees it)
- [ ] edit `sample.txt` and save (Admin sees the updated content / a new version)
- [ ] rename `sample.txt` to `renamed.txt` (Admin sees the rename)

Admin:
- [ ] change Marie's role to "Can view(unselect all - can share, can edit, create, change, delete)"

Marie:
- [ ] can open/download but cannot rename, move, delete, or upload in the folder

Admin:
- [ ] unshare "shared_with_marie" — it disappears from Marie's "Shared with you"

## Case 4: Group share

Apps: `files_sharing`, `provisioning_api`

Admin:
- [ ] create folder "team_docs"
- [ ] share "team_docs" with group `researchers`, role "Can edit"

Marie (member of `researchers`):
- [ ] sees "team_docs" in "Shared with me"; can edit a file in it

Einstein (not a member):
- [ ] does not see "team_docs"

Admin:
- [ ] add Einstein to the group: `occ group:add-member --member einstein researchers`

Einstein:
- [ ] now sees "team_docs"

## Case 5: Public links

Apps: `files_sharing`

Admin:
- [ ] create folder "for_upload"
- [ ] create a public link with role "Uploader / File Drop", a password, and an expiry date
  - [ ] open the link in an incognito window, enter the password — only upload is offered
  - [ ] upload a file via the link (Admin sees the new file)
- [ ] change the link role to "Can edit", refresh the link — existing files are now visible
- [ ] create a public link to a single file with role "Can view"
  - [ ] open it incognito — the file opens/downloads
- [ ] delete the link, refresh — "File not found"

## Case 6: Federated sharing

Apps: `federatedfilesharing`, `federation` (requires the two instances from Setup)

Admin (instance A):
- [ ] create folder "federated_folder" with a file inside
- [ ] share it to the federated user `richard@oc11-b:8080`, role "Can edit"

Richard (instance B):
- [ ] accept the incoming federated share (notification / "Shared with me")
- [ ] open the folder, download the file, upload a new file
- [ ] modify a file — the change propagates back to instance A

Admin (instance A):
- [ ] sees Richard's changes
- [ ] unshare "federated_folder" — it disappears on instance B
- [ ] record any HTTPS / `trusted_domains` configuration that federation required

## Case 7: External storage

Apps: `files_external`

`files_external` is enabled by default. Available storage backends on the image include
Local, SFTP, SMB/CIFS, WebDAV, ownCloud, and Google Drive (confirm with
`occ files_external:backends storage`).

Admin:
- [ ] list backends: `occ files_external:backends storage`
- [ ] ensure the local mount path exists inside the container before creating the mount:
  `docker exec oc11 mkdir -p /tmp/smoke_ext`
- Enable local backend (system config): `occ config:system:set files_external_allow_create_new_local --value=true --type=boolean`

  This is needed because local storage backend visibility is stripped for admin mounts when this flag is false (the default)

- Enable External storage app in UI (if not already): Go to Settings → Admin → Storage and enable External storage (or confirm it's already enabled).
- [ ] create one mount that needs no extra infrastructure — use **Local** (point it at a
  path inside the container) or **SFTP** (against any reachable host):
  ```
  occ files_external:create /smoke_mount local null::null -c datadir=/tmp/smoke_ext
  ```
  (adjust backend/auth identifier/config for the chosen backend)
- [ ] `occ files_external:list` shows the mount
- [ ] `occ files_external:verify <mount-id>` returns status OK
- [ ] assign mount to admin user: `occ files_external:applicable --add-user admin <mount-id>`
- [ ] open the mount in Files, upload a file into it, download it back, delete it

## Case 8: Encryption (master key)

Apps: `encryption` (ships **disabled** — enable it, which loads the default module)

Admin:
- [ ] enable the encryption app: `occ app:enable encryption` (this is what loads the
  encryption module — `occ encryption:enable` alone only flips the feature flag and reports
  "No encryption module is loaded")
- [ ] enable encryption: `occ encryption:enable`
- [ ] confirm the module is loaded: `occ encryption:list-modules` lists
  `OC_DEFAULT_MODULE: Default encryption module [default*]`
- [ ] choose master-key mode (server-wide single key, recommended for OC):
  `occ config:app:set encryption useMasterKey --value 1`
- [ ] `occ encryption:encrypt-all` to encrypt existing files (confirm when prompted)
- [ ] `occ encryption:status` shows `enabled: true` and `defaultModule: OC_DEFAULT_MODULE`
- [ ] verify encrypted-at-rest — inspect a file under the data directory; its on-disk bytes
  are ciphertext, not plaintext (the image's data dir is `/mnt/data/files/<user>/files/...`;
  confirm with `occ config:system:get datadirectory`):
  ```
  docker exec oc11 sh -c 'head -c 200 /mnt/data/files/admin/files/<somefile>'
  ```
- [ ] the same file still opens with correct plaintext content in the Web UI

## Case 9: Media viewer

Apps: `files_mediaviewer`

Admin:
- [ ] upload multiple images (jpg/png) (or use the skeleton images provided in the Photos folder)
  and, if available, a small video (mp4)
- [ ] click the image — it opens in the media viewer overlay
  - [ ] navigate next/previous through multiple images
- [ ] click the video — it plays in the viewer

## Case 10: Comments, favorites and system tags

Apps: `comments`, `systemtags`

Admin:
- [ ] open a file's details panel, add a comment
  - [ ] the comment persists after reloading the page
- [ ] add a system tag "smoke" to two files (details panel → Tags)
- [ ] use the tag filter / search to list files tagged "smoke" — both files appear
- [ ] remove the tag from one file — the filter now shows only the other
- [ ] mark two files and a folder as favorites
- [ ] select Favorites (left-hand menu bar) - the favorite files and folder are listed

## Case 11: Notifications

Apps: `notifications`

Admin:
- [ ] go to Settings, Admin, Sharing and unselect "Automatically accept new incoming local user shares"
- [ ] run cron at least once: `occ system:cron`
- [ ] share a file with Marie

Marie:
- [ ] sees a notification under the bell icon for the new share, and can accept/dismiss it

## Case 12: First-run wizard

Apps: `firstrunwizard`

Admin:
- [ ] create a fresh user: `occ user:add --password-from-env newbie` (with `-e OC_PASS=...`)

Newbie:
- [ ] log in for the first time — the first-run wizard / welcome dialog is shown
- [ ] click each of the documentation links - relevant documentation pages are displayed in new tabs
- [ ] dismiss it, log out, and log back in — the wizard does not reappear

## Case 13: External sites

Apps: `external` (ships disabled — enabled in Setup)

Admin:
- [ ] Settings → Admin → Additional settings → External sites: add a site (name + URL, e.g.
  "Docs" `https://doc.owncloud.com`)
- [ ] a new entry appears in the top app menu and opens the configured site

## Case 14: Document viewers (PDF + text editor)

Apps: `files_pdfviewer`, `files_texteditor` (both enabled by default)

Admin:
- [ ] create a text file via "+" → "Text file", enter content, close — the file is saved
  with the entered text (files_texteditor)
- [ ] reopen the text file, edit it, close — changes are saved
- [ ] upload a PDF and open it — it renders in the PDF viewer with working controls
  (download, page navigation, search, resizing) (files_pdfviewer)

## Case 15: Activity stream

Apps: `activity` (enabled by default)

Admin:
- [ ] perform a few actions: create a file, share a file with Marie, delete a file
- [ ] open the Activity view — the create / share / delete actions appear in the stream

## Case 16: App management

Apps: `app:enable/disable` smoke

Admin:
- [ ] `occ app:disable market` disable the market app
- [ ] `occ app:list` returns the enabled/disabled lists without error
- [ ] disable then re-enable a default-enabled app:
  `occ app:disable comments` then `occ app:enable comments` — no errors, comments work again
- [ ] enable a currently-disabled opt-in app and confirm it appears under Enabled, e.g.
  `occ app:enable guests` (then `occ app:disable guests` to restore) — exercises the
  enable/disable path without needing the marketplace

## Case 17: User/group administration and transfer-ownership

Apps: `provisioning_api`, `files:transfer-ownership`

Admin:
- [ ] create a user via the UI (Admin → Users), set a storage quota
- [ ] create a group via the UI, add the user to it
- [ ] login as the user, change the display language (Settings, General) - the UI is rendered in the selected language
- [ ] transfer ownership of Marie's files to Einstein:
  `occ files:transfer-ownership marie einstein` — files move owner without error
- [ ] delete the test user

---

## Out of scope

This plan covers only the apps **enabled by default** in the
`owncloud/server:11.0.0-rc2` Community image. The following are intentionally **not**
covered here and get their own plans:

- **Opt-in apps shipped disabled** (present in the image, but need explicit enable and/or
  external infrastructure): `user_ldap`, `user_shibboleth`, `oauth2`, `openidconnect`,
  `guests`, `customgroups`, `files_primary_s3`, `windows_network_drive`,
  `admin_audit`, `files_antivirus`, `wopi`, `password_policy`,
  `graphapi`, `announcementcenter`, `drawio`, `systemtags_management`, `user_external`,
  `files_external_dropbox`, `files_external_ftp`.
- **Enterprise/licensed apps shipped disabled** (need an enterprise license — Community
  edition cannot exercise them): `firewall`, `ransomware_protection`,
  `kerberos`, `workflow`, `theme-enterprise`, `files_classifier`,
  `files_lifecycle`, `files_ldap_home`.
- **`market`** — the marketplace app is present in this Community image (but most apps are
  already baked into the image). Marketplace install flows are out of scope.
- **Desktop and mobile sync clients** — the legacy smoke plan's Desktop/Mobile matrices
  are tracked separately, not part of this server-image smoke test.
- **In-place updater / release channels** — not applicable to docker; covered by a future
  image-upgrade plan.

---

## Replaces

This plan supersedes and replaces:

- **`Test_Plan_Smoke_Test.md`** — file ops, federated sharing, external storage and
  webdav-upload coverage folded into Cases 1–8; LDAP / 2FA / OAuth / desktop / mobile rows
  dropped as out of scope; dead `oc10.sh` / `hetzner_deploy` / `jw-qa` / tarball / Travis /
  Smashbox / pyocclient references removed.
- **`Test_Plan_Simplified_Smoke_Test.md`** — Web UI file/share rows folded into Cases 1, 3,
  4, 5; Travis / IE11 / desktop / mobile rows dropped.
- **`Smoke_Test_Plan_customgroups.md`** — the "enable/disable app via CLI" idea is retargeted
  to a default-enabled app in Case 16; `customgroups` itself ships disabled, so its
  group-management specifics move to the future `customgroups` plan.
