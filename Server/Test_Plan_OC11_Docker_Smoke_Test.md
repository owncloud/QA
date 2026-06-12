# OC11 Docker Smoke Test

Canonical smoke test for ownCloud classic server **OC11** (`owncloud/core` master,
version `11.0.0-prealpha`), deployed **docker-only**. This plan replaces the three
legacy smoke plans: `Test_Plan_Smoke_Test.md`, `Test_Plan_Simplified_Smoke_Test.md`
and `Smoke_Test_Plan_customgroups.md` (see **Replaces** at the bottom).

The toplevel checkbox means the step was performed; nested checkboxes mean the result
was as expected.

Scope is the apps **bundled in the docker image**. Marketplace apps that are not in the
image (user_ldap, oauth2, richdocuments, …) are **out of scope** and get their own plans
— see **Out of scope**.

---

## Setup

### Image under test

- Image: **`owncloud/server:11.0.0-prealpha`** (Docker Hub).
- This tag is **rebuilt daily** from `owncloud-daily-master.tar.bz2`, so the exact app
  set and versions can drift day to day. The "Confirm the bundled app set" step below is
  therefore mandatory, not optional.
- Runtime requires **PHP ≥ 8.3 and < 8.6**.
  - [ ] `docker exec oc11 php -v` reports a version in `8.3`–`8.5`. A version outside that
    range means a bad/stale image — stop and re-pull.

### Single-instance deployment (docker run)

```
docker pull owncloud/server:11.0.0-prealpha
docker run -d --name oc11 \
  -p 8080:8080 \
  -e OWNCLOUD_DOMAIN=localhost:8080 \
  -e ADMIN_USERNAME=admin \
  -e ADMIN_PASSWORD=admin \
  owncloud/server:11.0.0-prealpha
```

- [ ] Confirm the env-var / database contract of the image on first pull. The
  `owncloud/server` image historically expects `OWNCLOUD_DOMAIN`, `ADMIN_USERNAME`,
  `ADMIN_PASSWORD`, and may need a database container (compose) rather than the bare
  `docker run` above. If the image fails to come up healthy, switch to the image's
  documented `docker-compose.yml` and record what was required.
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
  `11.0.0-prealpha`.

### Confirm the bundled app set

```
docker exec -u www-data oc11 occ app:list
```

- [ ] Record the actual **Enabled** and **Disabled** lists. The image is expected to bake
  in these **21 apps**: `comments`, `configreport`, `dav`, `encryption`, `external`,
  `federatedfilesharing`, `federation`, `files`, `files_external`, `files_mediaviewer`,
  `files_sharing`, `files_trashbin`, `files_versions`, `firstrunwizard`, `market`,
  `notifications`, `provisioning_api`, `systemtags`, `testing`, `updatenotification`,
  `user_external`.
- [ ] If the list diverges from the 21 above, note the drift (daily-build change) and skip
  any Case whose app is absent.
- Always-enabled (cannot be disabled): `files`, `dav`, `federatedfilesharing`.

### Enable the apps under test

Some bundled apps may ship disabled. Enable the ones this plan exercises:

```
docker exec -u www-data oc11 occ app:enable comments systemtags notifications \
  files_mediaviewer external firstrunwizard market
```

- [ ] `occ app:list` shows each of the above under **Enabled**.

### Second instance for federation (Case 6 only)

Run a second instance on a shared docker network so the two can resolve each other by name:

```
docker network create oc11net

docker run -d --name oc11-a --network oc11net -p 8080:8080 \
  -e OWNCLOUD_DOMAIN=oc11-a:8080 -e ADMIN_USERNAME=admin -e ADMIN_PASSWORD=admin \
  owncloud/server:11.0.0-prealpha

docker run -d --name oc11-b --network oc11net -p 8081:8080 \
  -e OWNCLOUD_DOMAIN=oc11-b:8080 -e ADMIN_USERNAME=admin -e ADMIN_PASSWORD=admin \
  owncloud/server:11.0.0-prealpha
```

- Instance A UI: `http://localhost:8080`; instance B UI: `http://localhost:8081`.
- [ ] Confirm the two instances can reach each other (docker network hostnames `oc11-a` /
  `oc11-b`). Federation between two prealpha instances may require HTTPS and/or each
  domain being added to the other's `trusted_domains` — record what was needed.
- (Alternatively, define a `docker-compose.yml` with two services `oc11-a` and `oc11-b`
  on one network — equivalent to the above.)

### Personas, users and groups

Create the cast via `occ` on instance A (recipient `richard` lives on instance B):

```
docker exec -u www-data oc11 occ user:add --display-name="Marie Curie"     --email=marie@example.org     marie
docker exec -u www-data oc11 occ user:add --display-name="Albert Einstein" --email=einstein@example.org einstein
docker exec -u www-data oc11 occ user:add --display-name="Maurice Moss"    --email=moss@example.org      moss
docker exec -u www-data oc11 occ group:add researchers
docker exec -u www-data oc11 occ group:adduser researchers marie
```

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
- [ ] rename `sample.pdf` to `renamed.pdf` (right-click → Rename)
- [ ] move `renamed.pdf` into "docs" (cut/paste)
- [ ] upload a new version of `sample.jpg` (choose Replace) — a new version is created
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
- [ ] change Marie's role to "Can view"

Marie:
- [ ] can open/download but cannot rename, move, delete, or upload in the folder

Admin:
- [ ] unshare "shared_with_marie" — it disappears from Marie's "Shared with me"

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
- [ ] add Einstein to the group: `occ group:adduser researchers einstein`

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
- [ ] delete the link, refresh — "resource not found"

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
- [ ] record any HTTPS / `trusted_domains` configuration that prealpha federation required

## Case 7: External storage

Apps: `files_external`

Admin:
- [ ] confirm which backends the bundled app offers: `occ files_external:backends`
- [ ] create one mount that needs no extra infrastructure — prefer **Local** or **SFTP**
  (do **not** use Dropbox/Google Drive — removed — or Windows Network Drive — not bundled):
  ```
  occ files_external:create /smoke_mount local null::null
  ```
  (adjust backend/auth/config for the chosen backend)
- [ ] `occ files_external:list` shows the mount
- [ ] `occ files_external:verify <mount-id>` returns status OK
- [ ] open the mount in Files, upload a file into it, download it back, delete it

## Case 8: Encryption (master key)

Apps: `encryption`

Admin:
- [ ] confirm the exact subcommand names first: `occ encryption` (lists encryption commands)
- [ ] `occ encryption:enable`
- [ ] select the master-key module: `occ encryption:select-encryption-type masterkey`
  (confirm exact flag, e.g. `--yes`, on the image)
- [ ] `occ encryption:encrypt-all` to encrypt existing files
- [ ] `occ encryption:status` shows encryption enabled
- [ ] verify encrypted-at-rest — shell in and inspect a file under the data directory; its
  on-disk bytes are ciphertext, not plaintext (confirm the data-dir path on the image):
  ```
  docker exec oc11 sh -c 'head -c 200 /mnt/data/files/admin/files/sample.txt'
  ```
- [ ] the same file still opens with correct plaintext content in the Web UI

## Case 9: Media viewer

Apps: `files_mediaviewer`

Admin:
- [ ] upload an image (jpg/png) and, if available, a small video (mp4)
- [ ] click the image — it opens in the media viewer overlay
  - [ ] navigate next/previous through multiple images
- [ ] click the video — it plays in the viewer

## Case 10: Comments and system tags

Apps: `comments`, `systemtags`

Admin:
- [ ] open a file's details panel, add a comment
  - [ ] the comment persists after reloading the page
- [ ] add a system tag "smoke" to two files (details panel → Tags)
- [ ] use the tag filter / search to list files tagged "smoke" — both files appear
- [ ] remove the tag from one file — the filter now shows only the other

## Case 11: Notifications

Apps: `notifications`

Admin:
- [ ] run cron at least once: `occ system:cron`
- [ ] share a file with Marie

Marie:
- [ ] sees a notification under the bell icon for the new share, and can accept/dismiss it

## Case 12: First-run wizard

Apps: `firstrunwizard`

Admin:
- [ ] create a fresh user: `occ user:add newbie`

Newbie:
- [ ] log in for the first time — the first-run wizard / welcome dialog is shown
- [ ] dismiss it, log out, and log back in — the wizard does not reappear

## Case 13: External sites

Apps: `external`

Admin:
- [ ] Admin → Additional settings → External sites: add a site (name + URL, e.g.
  `https://owncloud.com`)
- [ ] a new entry appears in the top app menu and opens the configured site

## Case 14: App management, market, user_external (light)

Apps: `market`, `user_external`, plus `app:enable/disable` smoke

Admin:
- [ ] `occ app:list` returns the enabled/disabled lists without error
- [ ] disable then re-enable a bundled app:
  `occ app:disable comments` then `occ app:enable comments` — no errors
- [ ] open the Market app in the Web UI (Admin → Market) — it loads and lists app
  categories (do **not** install anything)
- [ ] `occ app:list` shows `user_external` present (external-auth backend infra; no live
  backend is configured in smoke scope — presence-only check)

## Case 15: User/group administration and transfer-ownership

Apps: `provisioning_api`, `files:transfer-ownership`

Admin:
- [ ] create a user via the UI (Admin → Users), set a storage quota
- [ ] create a group via the UI, add the user to it
- [ ] change a user's display language
- [ ] transfer ownership of Marie's files to Einstein:
  `occ files:transfer-ownership marie einstein` — files move owner without error
- [ ] delete the test user

---

## Out of scope

This plan covers only the apps bundled in the `owncloud/server:11.0.0-prealpha` image.
The following are intentionally **not** covered here and get their own plans:

- **Non-bundled / marketplace apps:** `user_ldap`, `oauth2`, `openidconnect`,
  `richdocuments`, `guests`, `impersonate`, `customgroups`, `search_elastic`,
  `files_primary_s3`, `windows_network_drive`, `twofactor_totp`, `admin_audit`,
  `diagnostics`, `files_antivirus`, `files_pdfviewer`, `files_texteditor`.
  (`templateeditor` is archived/discontinued — use theming — and is not planned.)
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
  to a bundled app in Case 14; `customgroups` itself is not bundled, so its group-management
  specifics move to the future `customgroups` plan.
