# OC11 Server Test Plan Triage

**Date:** 2026-06-12
**Target release:** OC11 — ownCloud classic server, **PHP 8**, **docker-only** deployment.
**Scope:** All `Server/Test_Plan_*.md` and `Server/Smoke_Test_Plan_*.md` except `Test_Plan_OCIS_*.md` (Infinite Scale, separate product). 47 plans in scope.
**Method:** Best-effort triage from existing ecosystem knowledge — **no live repo/marketplace lookups were made.** Every verdict carries a confidence level; Low/Medium app-existence calls need human confirmation before action.

## Verdict legend
- **Keep** — still valid, no material changes.
- **Update** — feature relevant, specifics need fixing (listed per plan).
- **Delete** — app/feature gone in OC11, or stub with no recoverable content.
- **Merge** — overlaps another plan; fold together.
- **Confidence** — High / Medium / Low.

## Summary

| Plan | Verdict | Confidence | Reason |
| ---- | ------- | ---------- | ------ |
| Test_Plan_calendar.md | Delete | Medium | One-line stub to a private enterprise issue; calendar is not an OC11 server app |
| Test_Plan_drawio.md | Delete | Low | drawio integration app; confirm it is dropped from OC11 |
| Test_Plan_market.md | Delete | Medium | Marketplace app conflicts with docker-only bundled-app delivery |
| Test_Plan_msteamsbridge.md | Delete | Low | Niche MS Teams bridge app; confirm it is dropped from OC11 |
| Test_Plan_notes.md | Delete | Low | Community notes app + migration scratchpad; confirm availability |
| Test_Plan_windows_network_drive.md | Delete | Medium | Two-line "See qa-enterprise" stub, no recoverable content |
| Smoke_Test_Plan_customgroups.md | Merge | Medium | Smoke subset of Test_Plan_customgroups.md; fold in |
| Test_Plan_Simplified_Smoke_Test.md | Merge | High | Overlaps Test_Plan_Smoke_Test.md; consolidate |
| Test_Plan_Activity.md | Update | High | IE11/Edge matrix + bare `mysql` triggers; Shibboleth unconfirmed |
| Test_Plan_Addressbook.md | Update | Medium | DAV addressbook valid; contacts-app migration step obsolete |
| Test_Plan_admin_audit.md | Update | Medium | Valid app but stub-quality (TBD/TODO) + dead deploy line |
| Test_Plan_configreport.md | Update | Medium | Valid app; dead oc10.sh/jw-qa host; verify telemetry flags |
| Test_Plan_customgroups.md | Update | High | Valid; remove IE11/Edge browser rows |
| Test_Plan_Diagnostics.md | Update | Medium | Valid; trim IE11; confirm Oracle DB support |
| Test_Plan_encryption.md | Update | High | Core; dead HSM host/deploy + pinned versions |
| Test_Plan_External.md | Update | High | Valid; remove IE11 browser row |
| Test_Plan_External_Auth.md | Update | Medium | files_external auth matrix valid; WND dependency uncertain |
| Test_Plan_Federated_Sharing.md | Update | High | Core matrix valid; refresh "different oC versions" rows |
| Test_Plan_files_antivirus.md | Update | High | High-value; dead setup + host-file/`mysql` edits + v1 dav |
| Test_Plan_Files_external_CLI.md | Update | Medium | Valid CLI; drop removed Dropbox/Google Drive backends |
| Test_Plan_Files_External.md | Update | Medium | Largest plan; prune removed backends; consider splitting |
| Test_Plan_Files_Mediaviewer.md | Update | High | Valid; dead scripts + gallery refs + IE11 |
| Test_Plan_files_pdfviewer.md | Update | High | Valid; dead make_oc10_apps script + IE11 |
| Test_Plan_files_primary_s3.md | Update | High | Highly relevant for docker; dead host script + confluence link |
| Test_Plan_Files_Texteditor.md | Update | High | Valid; bump "Server: v10" label |
| Test_Plan_Files_Transfer_Ownership.md | Update | High | Core occ command valid; confirm Shibboleth rows |
| Test_Plan_Filtering_System_Tags.md | Update | High | Core; remove IE11; fix curl base URL |
| Test_Plan_Firstrunwizard.md | Update | Medium | Likely bundled; remove IE11; confirm app |
| Test_Plan_Guest.md | Update | High | Valid; remove IE11/Edge rows |
| Test_Plan_Impersonate.md | Update | High | Valid; remove IE11 row |
| Test_Plan_notifications.md | Update | Medium | Core flow valid; re-express multi-homed/cron for docker |
| Test_Plan_OAuth2.md | Update | High | Valid and current; verify `occ oauth:add-client` |
| Test_Plan_openidconnect.md | Update | High | Key auth path; dead deploy + market install + version rows |
| Test_Plan_Pluggable_Auth.md | Update | Medium | Flows valid; Ubuntu 16.04 env obsolete; Shibboleth unconfirmed |
| Test_Plan_richdocuments.md | Update | High | Valid; dead make_oc10_apps + demo host |
| Test_Plan_search_elastic.md | Update | High | Valid; dead oc10.sh + enterprise links; confirm ES version |
| Test_Plan_Settings.md | Update | High | Valid; drop IE11 column; updater/channel UI N/A for docker |
| Test_Plan_Sharees.md | Update | High | Matrix valid; Ubuntu 16.04 env obsolete; Shibboleth unconfirmed |
| Test_Plan_Smoke_Test.md | Update | High | Merge target but most outdated: dead scripts/hosts/CI + IE |
| Test_Plan_System_Tagging.md | Update | High | Valid; modernize Edge; fix curl host/credentials |
| Test_Plan_Templateeditor.md | Update | High | Valid; remove IE11 row |
| Test_Plan_template_federation_autocomplete.md | Update | High | Valid; restate ancient "older than 9.0" floor |
| Test_Plan_twofactor_totp.md | Update | High | Valid; dead make_oc10_apps + IE11 + version pins |
| Test_Plan_Updater.md | Update | Medium | In-place web updater N/A for docker; rewrite as image upgrade (may become Delete) |
| Test_Plan_user_ldap.md | Update | High | Essential; dead host/scripts + version pins + CI FIXMEs |
| Test_Plan_WebDav_Interface_WebUI.md | Update | High | Core matrix valuable; Ubuntu/CentOS environments obsolete |
| Test_Plan_web.md | Update | High | Valid + docker-oriented; refresh version/apps/browsers |

## Per-plan details

### Smoke_Test_Plan_customgroups.md
**Verdict:** Merge — **Confidence:** Medium
**Reason (one line):** Quick smoke subset of `Test_Plan_customgroups.md`; fold the smoke checklist into that plan.

**Findings:**
- *[7: structural]* States "For the full testplan refer to Test_Plan_Customgroups.md" — duplicate scope; maintain one plan with a "smoke" section.
- *[4: legacy browser]* "edge (win10)" — drop Win10/EdgeHTML wording; modern Edge is Chromium.
- *[1: app]* `customgroups` is an enterprise app; confirm it ships for OC11 before keeping either plan.

### Test_Plan_Activity.md
**Verdict:** Update — **Confidence:** High
**Reason (one line):** Activity app is still core, but browser matrix and trigger snippets are outdated.

**Findings:**
- *[4: legacy browser]* "IE 11", "Edge" rows — remove IE11; treat Edge as Chromium.
- *[5: config/occ]* Direct `mysql owncloud -e 'update oc_activity_mq ...'` — docker-only OC11 needs `occ`/container-aware DB access, not a bare `mysql` client on the host.
- *[1: app]* References a Shibboleth user; Shibboleth auth support in OC11 is uncertain — confirm.

### Test_Plan_Addressbook.md
**Verdict:** Update — **Confidence:** Medium
**Reason (one line):** System addressbook via DAV (`occ dav:sync-system-addressbook`) is core and valid; the contacts-app upgrade path is outdated.

**Findings:**
- *[1: app]* "previous major version ... using contacts app ... Contacts app is disabled" — the contacts app migration step predates OC10 and is irrelevant for an OC11 baseline.
- *[1: app]* Shibboleth autoprovisioning row — confirm Shibboleth support.
- *[7: structural]* Relies on Evolution on Linux as the only client; still valid but worth noting as a heavy manual dependency.

### Test_Plan_admin_audit.md
**Verdict:** Update — **Confidence:** Medium
**Reason (one line):** admin_audit app is valid, but the plan is stub-quality and the deploy line is dead.

**Findings:**
- *[7: structural]* "TBD: Nothing useful found ...", "Improve testplan", "TODO: REview last last report" — unfinished authoring placeholders.
- *[2: deploy]* "deploy via make_oc10_apps.sh with ftp, wnd storage, admin_audit" — dead host-side deploy script; OC11 is docker-only.
- *[1: app]* Uses `wnd` (windows_network_drive) external storage — confirm wnd availability in OC11.

### Test_Plan_calendar.md
**Verdict:** Delete — **Confidence:** Medium
**Reason (one line):** One-line stub pointing to a private enterprise issue; calendar is not an OC11 server app.

**Findings:**
- *[7: structural]* Entire file is "See https://github.com/owncloud/enterprise/issues/5247#..." — private/archived link, no recoverable test content.
- *[1: app]* The calendar app is not part of the ownCloud classic server scope; CalDAV lives in clients/other products.

### Test_Plan_configreport.md
**Verdict:** Update — **Confidence:** Medium
**Reason (one line):** configreport app and its telemetry checks are valid; deploy and host references are dead.

**Findings:**
- *[2: deploy]* "`env OC10_DNSNAME=... bash ./oc10.sh configreport ...`" and "-> https://oc1091-cr021rc1-s3-...jw-qa.owncloud.works" — dead deploy script and host.
- *[5: config/occ]* `occ configreport:*`, telemetry opt-out flags — verify command/flag names against the OC11 configreport version.
- *[1: app]* configreport is enterprise; confirm it ships for OC11.

### Test_Plan_customgroups.md
**Verdict:** Update — **Confidence:** High
**Reason (one line):** Comprehensive and still-relevant customgroups plan; only the browser matrix is outdated.

**Findings:**
- *[4: legacy browser]* "IE11" and "edge" rows under **Browsers** — remove IE11; Edge is Chromium.
- *[1: app]* customgroups is enterprise; confirm OC11 availability (same as the smoke variant).

### Test_Plan_Diagnostics.md
**Verdict:** Update — **Confidence:** Medium
**Reason (one line):** diagnostics app logging tests are valid; browser and DB matrices need trimming.

**Findings:**
- *[4: legacy browser]* "IE11", "edge" rows — remove IE11.
- *[5: config/occ]* "Having a server using oracle" — confirm Oracle DB is still a supported backend for OC11 (MySQL/MariaDB/Postgres are the common docker backends).
- *[1: app]* diagnostics is enterprise; confirm OC11 availability.

### Test_Plan_drawio.md
**Verdict:** Delete — **Confidence:** Low
**Reason (one line):** drawio is a community/marketplace integration unlikely to ship with docker-only OC11 — confirm before removing.

**Findings:**
- *[1: app]* Entire plan tests the `drawio` app integration; if drawio is not part of the OC11 app set, the plan is obsolete. **Needs human confirmation of app availability.**
- *[2: deploy]* References `release/oc10/apps/drawio` paths tied to the old release layout.

### Test_Plan_encryption.md
**Verdict:** Update — **Confidence:** High
**Reason (one line):** Encryption (master key, external storage, federated) is core and valid; deploy and HSM specifics are stale.

**Findings:**
- *[2: deploy]* "Cloned from 135.181.147.142 (Erwin's HSM setup)", "`env OC10_DNSNAME=... ./make_oc10_apps.sh encryption hsmdaemon-0.0.8.zip`" — dead host and deploy script.
- *[5: config/occ]* Pinned `encryption=1.5.0`, `hsmdaemon-0.0.8` versions — re-pin to OC11-era versions.
- *[6: version]* "update migration from previous core release" steps assume the host-based updater (see Updater plan).

### Test_Plan_External.md
**Verdict:** Update — **Confidence:** High
**Reason (one line):** external (sites) app is valid; only the browser matrix is outdated.

**Findings:**
- *[4: legacy browser]* "IE 11", "Edge", "Safari" rows — remove IE11.
- *[1: app]* Confirm the `external` sites app ships for OC11.

### Test_Plan_External_Auth.md
**Verdict:** Update — **Confidence:** Medium
**Reason (one line):** files_external auth-mechanism matrix (FTP/WebDAV/ownCloud/SFTP/SMB/WND) is valid; WND dependency is uncertain.

**Findings:**
- *[1: app]* Many rows test `Windows_network_drive` mounts — confirm the WND app/backend exists in OC11.
- *[5: config/occ]* "save in session" vs "save in DB" credential modes — verify these auth mechanisms are unchanged in the OC11 files_external.

### Test_Plan_Federated_Sharing.md
**Verdict:** Update — **Confidence:** High
**Reason (one line):** Core federated-sharing matrix is valid and valuable; version-comparison rows need refreshing.

**Findings:**
- *[6: version]* Repeated "using different oC versions" / "different O.C versions" rows — define which OC11/OC10 version pairs are actually in support for interop testing.
- *[7: structural]* Empty "ownCloud Version / Encryption enabled?" preamble fields — fine as a template, but should name OC11 as server-under-test.

### Test_Plan_files_antivirus.md
**Verdict:** Update — **Confidence:** High
**Reason (one line):** Thorough, high-value antivirus plan; only setup/deploy is dead.

**Findings:**
- *[2: deploy]* "`oc10.sh files_antivirus`" and "-> https://oc10110a2-antivirus-...jw-qa.owncloud.works" — dead script/host.
- *[5: config/occ]* Editing `lib/Cron/Task.php` and `mysql owncloud -e "update oc_jobs ..."` — host-file edits don't fit docker-only; prefer `occ` and container-aware steps.
- *[1: app]* "old dav path" (v1 webdav) chunking rows — confirm v1 dav/OC-Chunked is still present in OC11 or mark legacy-only.

### Test_Plan_Files_external_CLI.md
**Verdict:** Update — **Confidence:** Medium
**Reason (one line):** files_external CLI commands are valid, but several storage backends are likely removed.

**Findings:**
- *[1: app]* "DropBox" and "GoogleDrive" mountpoint rows — these external-storage backends were deprecated/removed in later ownCloud; almost certainly gone in OC11. **Confirm and drop.**
- *[1: app]* "OpenStack" (Swift) backend — confirm it remains.
- *[5: config/occ]* `occ files_external:*` subcommands — verify the full subcommand set is unchanged.

### Test_Plan_Files_External.md
**Verdict:** Update — **Confidence:** Medium
**Reason (one line):** Largest external-storage plan (40 KB); core matrix is valid but backend list and scale need an OC11 pass.

**Findings:**
- *[1: app]* Same Dropbox/Google Drive/OpenStack backend concern as the CLI plan — prune removed backends.
- *[7: structural]* Very large single file; consider splitting per-backend when updating.
- *[5: config/occ]* Verify mount-option and auth-mechanism names against the OC11 files_external.

### Test_Plan_Files_Mediaviewer.md
**Verdict:** Update — **Confidence:** High
**Reason (one line):** files_mediaviewer plan is valid; setup uses dead scripts and gallery, browser matrix outdated.

**Findings:**
- *[2: deploy]* "`hetzner_deploy/oc_app.sh files_mediaviewer`" / "`...files_gallery`" — dead deploy scripts.
- *[1: app]* "occ app:disable gallery" and a "files_gallery" install — the gallery app is deprecated/removed; drop gallery references.
- *[4: legacy browser]* "Internet Explorer 11", "MS IE11" rows — remove IE11.

### Test_Plan_files_pdfviewer.md
**Verdict:** Update — **Confidence:** High
**Reason (one line):** files_pdfviewer plan is valid; setup script and browser list outdated.

**Findings:**
- *[2: deploy]* "`bash ./make_oc10_apps.sh guests windows_network_drive impersonate ~/Download/apps/files_pdfviewer-0.12.0-RC4.tar.gz`" — dead script + pinned RC tarball.
- *[4: legacy browser]* "Internet Explorer 11" — remove.

### Test_Plan_files_primary_s3.md
**Verdict:** Update — **Confidence:** High
**Reason (one line):** Primary S3 object storage is highly relevant for docker OC11; deploy and confluence refs are stale.

**Findings:**
- *[2: deploy]* "`oc_release.sh app:get files_primary_s3`" — dead host script.
- *[7: structural]* Internal `confluence.owncloud.com` link — likely dead after the Kiteworks move; replace with current docs.
- *[5: config/occ]* "Minio is not officially supported" note dated "August 2021" — re-validate the supported-backend statement for OC11.

### Test_Plan_Files_Texteditor.md
**Verdict:** Update — **Confidence:** High
**Reason (one line):** files_texteditor plan is valid and mostly current; minor version label to refresh.

**Findings:**
- *[6: version]* "### Server: v10" header — update to OC11.
- *[1: app]* Confirm files_texteditor remains a shipped app (vs. richdocuments/web text editing).

### Test_Plan_Files_Transfer_Ownership.md
**Verdict:** Update — **Confidence:** High
**Reason (one line):** Core `occ files:transfer-ownership` matrix is valid; auth-backend rows need confirmation.

**Findings:**
- *[1: app]* Shibboleth and LDAP user transfer rows — confirm Shibboleth support in OC11; LDAP is fine.
- *[5: config/occ]* Verify `occ files:transfer-ownership` flags/behaviour unchanged.

### Test_Plan_Filtering_System_Tags.md
**Verdict:** Update — **Confidence:** High
**Reason (one line):** System-tag filtering (UI + REPORT API) is core and valid; browser list outdated.

**Findings:**
- *[4: legacy browser]* "internet explorer 11" row — remove.
- *[5: config/occ]* `curl ... http://root:admin@localhost/owncloud/remote.php/files/` — adjust base URL/credentials for docker default layout (no `/owncloud` subpath).

### Test_Plan_Firstrunwizard.md
**Verdict:** Update — **Confidence:** Medium
**Reason (one line):** firstrunwizard app is small and likely still bundled; browser matrix outdated.

**Findings:**
- *[4: legacy browser]* "IE 11" row — remove.
- *[1: app]* Confirm firstrunwizard ships in OC11 (low-risk but worth verifying).

### Test_Plan_Guest.md
**Verdict:** Update — **Confidence:** High
**Reason (one line):** guests app plan is valid; only browser matrix is outdated.

**Findings:**
- *[4: legacy browser]* "IE11", "Edge" rows — remove IE11.
- *[1: app]* Confirm `guests` app ships for OC11 (it is a standard enterprise app).

### Test_Plan_Impersonate.md
**Verdict:** Update — **Confidence:** High
**Reason (one line):** impersonate app plan is valid; only browser matrix is outdated.

**Findings:**
- *[4: legacy browser]* "IE11" row — remove.
- *[1: app]* Confirm `impersonate` app ships for OC11.

### Test_Plan_market.md
**Verdict:** Delete — **Confidence:** Medium
**Reason (one line):** The marketplace app conflicts with docker-only OC11 where apps are bundled in the image.

**Findings:**
- *[1: app]* Entire plan tests the `market` app and `occ market:install/upgrade` against the marketplace — in a docker-only distribution apps ship in the image, so the market app is expected to be removed. **Confirm market is dropped from OC11.**
- *[4: legacy browser]* "IE 11", "Safari", "Edge" rows — moot if deleted.
- *[1: app]* Mentions installing `gallery` (deprecated app) as a test subject.

### Test_Plan_msteamsbridge.md
**Verdict:** Delete — **Confidence:** Low
**Reason (one line):** Niche MS Teams bridge integration unlikely to ship with OC11 — confirm before removing.

**Findings:**
- *[1: app]* Entire plan tests the `msteamsbridge` app via Azure OIDC. **Needs human confirmation that the app exists for OC11.**
- *[2: deploy]* "`oc10.sh openidconnect msteamsbridge`" and "https://oc109-openidconnect-...jw-qa.owncloud.works" — dead script/host.

### Test_Plan_notes.md
**Verdict:** Delete — **Confidence:** Low
**Reason (one line):** notes is a community app and the plan is purely a migration scratchpad — confirm before removing.

**Findings:**
- *[1: app]* Tests the `notes` app upgrade from 2.0.5 and PR #488 behaviour; community app, likely not in the OC11 bundle. **Confirm availability.**
- *[2: deploy]* "`bash hetzner-deploy/oc10.sh notes`" — dead script.
- *[5: config/occ]* Direct `mysql owncloud` `oc_preferences` edits — not docker-friendly; would need rework even if kept.

### Test_Plan_notifications.md
**Verdict:** Update — **Confidence:** Medium
**Reason (one line):** Core notifications/share-acceptance flow is valid and mostly timeless; setup wording needs a docker pass.

**Findings:**
- *[2: deploy]* "Make it a multi-homed machine: Assign two different DNS-names ... trusted_domains" — re-express for docker networking.
- *[5: config/occ]* "Regularly run `occ system:cron -p`" — valid, but document the container-exec form.

### Test_Plan_OAuth2.md
**Verdict:** Update — **Confidence:** High
**Reason (one line):** oauth2 app plan is valid and reasonably current; minor refresh only.

**Findings:**
- *[5: config/occ]* The "OAuth with new Web App" setup block (`occ oauth:add-client`, `web.baseUrl`) — verify command names against OC11; otherwise sound.
- *[7: structural]* Cross-links to QA PRs #473/#474 for client testing — confirm those are still the right pointers.

### Test_Plan_openidconnect.md
**Verdict:** Update — **Confidence:** High
**Reason (one line):** OIDC is a key OC11 auth path; plan is valid but deploy and version/migration rows are stale.

**Findings:**
- *[2: deploy]* "Automated setup script: .../tools/hetzner-deploy/make_openidconnect_test.sh" — dead/host-based.
- *[6: version]* "Update from 1.0.0", "Update from 2.1.1", `occ market:install -l` rows — re-pin versions and drop market-based install.
- *[1: app]* Keycloak/Azure/Kopano IdP references — confirm which IdPs are in the OC11 test scope.

### Test_Plan_Pluggable_Auth.md
**Verdict:** Update — **Confidence:** Medium
**Reason (one line):** Sessions/device-password/token-auth flows are valid; environment and Shibboleth specifics are stale.

**Findings:**
- *[6: version]* "Linux environment: Ubuntu 16.04 mysql and apache with ssl" — obsolete; OC11 is docker-only.
- *[1: app]* Multiple Shibboleth (autoprovisioned + SSO) rows — confirm Shibboleth support in OC11.
- *[4: legacy browser]* "Edge", "Safari" rows — Edge is Chromium now; no IE here (good).

### Test_Plan_richdocuments.md
**Verdict:** Update — **Confidence:** High
**Reason (one line):** richdocuments/Collabora plan is valid; deploy and demo-host references are dead.

**Findings:**
- *[2: deploy]* "`make_oc10_apps.sh richdocuments` 2.X.YRC1 -> https://richdoc-DDMMYYYY.jw-qa.owncloud.works" — dead script/host.
- *[7: structural]* "collabora.owncloud-demo.com" X-Frame-Options note — re-test against the current Collabora deployment.
- *[1: app]* Confirm richdocuments + WOPI + secure-view (EE) availability for OC11.

### Test_Plan_search_elastic.md
**Verdict:** Update — **Confidence:** High
**Reason (one line):** search_elastic plan is valid and detailed; deploy and TODOs are stale.

**Findings:**
- *[2: deploy]* "`hetzner_deploy/oc10.sh search_elastic`" — dead script.
- *[3: CI/tooling]* Dead `owncloud/enterprise` issue links in TODOs.
- *[5: config/occ]* `occ search:index:*` commands — verify subcommand names; confirm the supported Elasticsearch version for OC11.

### Test_Plan_Settings.md
**Verdict:** Update — **Confidence:** High
**Reason (one line):** Core personal/admin settings coverage is valid; the per-browser result columns are outdated.

**Findings:**
- *[4: legacy browser]* Dedicated "Result IE 11" column — remove the IE11 column; Edge column is Chromium.
- *[5: config/occ]* "Check that updater section appears in CE and can change the channel" — the updater/channel UI is meaningless in docker-only OC11 (see Updater plan).
- *[1: app]* "Enable apps included in the enterprise tarball" — re-express for docker app delivery.

### Test_Plan_Sharees.md
**Verdict:** Update — **Confidence:** High
**Reason (one line):** Sharee-autocompletion matrix is valid; environment and Shibboleth specifics are stale.

**Findings:**
- *[6: version]* "Linux environment: Ubuntu 16.04 mysql and apache with ssl activated" — obsolete; docker-only.
- *[1: app]* SHIB configuration in setup — confirm Shibboleth support in OC11.

### Test_Plan_Simplified_Smoke_Test.md
**Verdict:** Merge — **Confidence:** High
**Reason (one line):** Overlaps `Test_Plan_Smoke_Test.md`; consolidate into one canonical smoke plan.

**Findings:**
- *[3: CI/tooling]* "Travis nightly cron job with UI tests on chrome, firefox, Edge, IE11" — Travis is dead; IE11 gone.
- *[4: legacy browser]* IE11 reference in the automated-checks row.
- *[7: structural]* Web/Desktop/Mobile smoke matrix duplicates `Test_Plan_Smoke_Test.md`; merge.

### Test_Plan_Smoke_Test.md
**Verdict:** Update — **Confidence:** High
**Reason (one line):** Central smoke plan and merge target, but currently the most outdated file in the set.

**Findings:**
- *[2: deploy]* "oc10.sh ...", "hetzner_deploy/deploy_oc10_apps.sh ...", "*.jw-qa.owncloud.works", `OC10_TAR_URL=...owncloud-complete-...tar.bz2`, `download.owncloud.org` — dead scripts/hosts and tarball install; replace with docker run/compose.
- *[5: config/occ]* Pinned app versions "openidconnect 2.1.0 / windows_network_drive 2.1.0 / ldap 0.16.0 / web 4.9.0" and image `owncloud/server:10.9.0-beta1` — re-pin to OC11.
- *[3: CI/tooling]* "Travis", "Smashbox", "pyocclient", "drone.owncloud.com", "ci.owncloud.org" — dead/frozen CI references.
- *[4: legacy browser]* "internet explorer or edge" upload step — drop IE.

### Test_Plan_System_Tagging.md
**Verdict:** Update — **Confidence:** High
**Reason (one line):** System-tagging (UI + DAV) plan is valid; browser matrix and host URLs need a pass.

**Findings:**
- *[4: legacy browser]* "Edge" rows — Chromium now; no IE (good). Re-confirm Safari scope.
- *[5: config/occ]* `curl ... HOST/remote.php/dav/systemtags` examples — adjust host/credentials for docker default layout.

### Test_Plan_Templateeditor.md
**Verdict:** Update — **Confidence:** High
**Reason (one line):** templateeditor app plan is valid; browser matrix outdated.

**Findings:**
- *[4: legacy browser]* "IE11" row — remove.
- *[1: app]* Confirm `templateeditor` ships for OC11; "mailhog" suggestion is fine (works in docker).

### Test_Plan_template_federation_autocomplete.md
**Verdict:** Update — **Confidence:** High
**Reason (one line):** Federation app + autocomplete plan is valid; version-floor row is stale.

**Findings:**
- *[6: version]* "add an owncloud server older than 9.0 | A warning message appears" — the 9.0 floor is ancient; restate against OC11-era minimums.
- *[4: legacy browser]* "chrome, firefox, safari and edge" — fine (no IE); Edge is Chromium.

### Test_Plan_twofactor_totp.md
**Verdict:** Update — **Confidence:** High
**Reason (one line):** twofactor_totp plan is valid; setup script and browser list outdated.

**Findings:**
- *[2: deploy]* "`./make_oc10_apps.sh twofactor_totp`" and the `make_openidconnect_test.sh` LDAP-user note — dead host scripts.
- *[4: legacy browser]* "internet explorer 11" row — remove.
- *[6: version]* "Since 0.8.0 and core 10.13.0" enforcement note — re-pin to OC11 versions.

### Test_Plan_Updater.md
**Verdict:** Update — **Confidence:** Medium
**Reason (one line):** The in-place web updater + release channels do not apply to docker-only OC11; rewrite as an image-upgrade test (may become Delete).

**Findings:**
- *[2: deploy]* "deploy a version of the update server", "Make sure the ownCloud directory is writable by the web server", `updater.server.url => https://updates.owncloud.com/server/` — the host-based updater is incompatible with immutable docker images.
- *[5: config/occ]* "production / stable / beta / daily channel" rows — channels are an updater concept; replace with "pull new image tag + `occ upgrade`" flow.
- *[7: structural]* If OC11 has no in-place updater at all, this plan should be **Deleted** and replaced by a docker upgrade plan — needs product confirmation.

### Test_Plan_user_ldap.md
**Verdict:** Update — **Confidence:** High
**Reason (one line):** user_ldap is essential and the plan is rich, but setup, version pins, and CI notes are stale.

**Findings:**
- *[2: deploy]* "`make_oc10_apps.sh user_ldap=0.15.3-rc4 ...`", "ldap_server=95.217.210.161", "hetzner_deploy/task/openldap_config.txt" — dead host/scripts.
- *[6: version]* Pinned `user_ldap=0.15.3-rc4` / `0.15.2` for upgrade testing — re-pin to OC11-era versions.
- *[3: CI/tooling]* "FIXME: Weed out CI items", "(outdated: .../docker-servers/tree/owncloud-openldap)" — author-flagged stale content; resolve during update.

### Test_Plan_WebDav_Interface_WebUI.md
**Verdict:** Update — **Confidence:** High
**Reason (one line):** Core WebDAV-via-WebUI matrix is valuable; the OS/browser "environments" are obsolete.

**Findings:**
- *[6: version]* "Ubuntu 16.04", "CentOS 6.6" environment headers — obsolete OSes; OC11 is docker-only, so re-frame "environments" as DB/browser variants.
- *[4: legacy browser]* "Edge" (EdgeHTML era) and iPad-Safari environment — modernize; Edge is Chromium.

### Test_Plan_web.md
**Verdict:** Update — **Confidence:** High
**Reason (one line):** ownCloud Web (web app on classic server) is valid and docker-oriented already; refresh versions, apps, and browsers.

**Findings:**
- *[6: version]* "With 10.6.0 docker - http-only" setup — re-pin to OC11 image.
- *[1: app]* `config.json` lists `"draw-io"` and `media-viewer` apps — drop draw-io if removed; confirm app list.
- *[4: legacy browser]* "Internet Explorer 11" in the supported-browser line — remove (ownCloud Web never supported IE anyway).
- *[3: CI/tooling]* Dead `owncloud/enterprise` issue link and `owncloud/web#4531`, `ocis#1075` re-evaluate items — recheck status.

### Test_Plan_windows_network_drive.md
**Verdict:** Delete — **Confidence:** Medium
**Reason (one line):** Two-line stub ("See qa-enterprise") with no recoverable content.

**Findings:**
- *[7: structural]* Entire file is "See qa-enterprise" — no test content; the real plan lives in the private enterprise QA repo.
- *[1: app]* WND availability in OC11 is itself uncertain (see External/External_Auth plans) — confirm before recreating.


## Cross-cutting findings

These patterns span many plans and are best fixed in a single batch pass rather than plan-by-plan.

### Legacy browsers (IE11 / EdgeHTML)
Internet Explorer 11 appears as an explicit test target in **18 plans**: Activity, customgroups, Smoke_Test_Plan_customgroups, Diagnostics, External, Files_Mediaviewer, files_pdfviewer, Filtering_System_Tags, Firstrunwizard, Guest, Impersonate, market, Settings, Simplified_Smoke_Test, Smoke_Test, Templateeditor, twofactor_totp, web. **Recommendation:** drop IE11 entirely for OC11 (it has been unsupported across the ownCloud stack for years). Likewise, every "Edge" row predates Chromium Edge — either delete the dedicated Edge row or treat Edge as "a Chromium browser". Several plans also assume specific Safari versions; keep Safari but stop pinning versions.

### Dead deployment scripts and hosts (the docker-only conflict)
The bulk of staleness is host-based deployment that directly contradicts docker-only OC11:
- **`oc10.sh` / `make_oc10_apps.sh` / `deploy_oc10_apps.sh` / `oc_app.sh` / `oc_release.sh`** — host provisioning scripts referenced by: Smoke_Test, files_antivirus, configreport, msteamsbridge, notes, search_elastic, user_ldap, encryption, Files_Mediaviewer, files_pdfviewer, files_primary_s3, richdocuments, twofactor_totp, web, admin_audit.
- **`*.jw-qa.owncloud.works` ephemeral hosts** — dead URLs in: market, files_antivirus, msteamsbridge, richdocuments, configreport, Smoke_Test.
- **Tarball install** (`download.owncloud.org`, `owncloud-complete-*.tar.bz2`, `OC10_TAR_URL`) — Smoke_Test.
- **Obsolete host OSes** ("Ubuntu 16.04", "CentOS 6.6") — Pluggable_Auth, Sharees, WebDav_Interface_WebUI.
**Recommendation:** replace all of the above with a single canonical docker setup snippet (`docker run` / compose with the OC11 image and `occ` via `docker exec`), referenced by the plans instead of per-plan deploy lines.

### Dead CI / tooling references
**Travis** (Smoke_Test, Simplified_Smoke_Test), **Smashbox**, **pyocclient**, **ci.owncloud.org**, **drone.owncloud.com** (all in Smoke_Test) are dead or frozen. Numerous plans link to **`github.com/owncloud/enterprise/issues/*`**, which is a private/archived repo (calendar, encryption, search_elastic, web, Smoke_Test). **Recommendation:** strip dead CI badges/links and re-point or remove enterprise-issue references.

### Host-level DB and file manipulation
Several plans drive tests via bare `mysql owncloud -e '...'` or by editing app source files on disk (Activity, files_antivirus, notes, System_Tagging, Filtering_System_Tags curl examples, Updater `delete from oc_appconfig`). These assume shell access to the host filesystem/DB and won't work cleanly against a container. **Recommendation:** convert to `occ` commands where possible and document the `docker exec` form for the rest.

### Smoke-plan consolidation
Three overlapping smoke plans exist: **Test_Plan_Smoke_Test.md**, **Test_Plan_Simplified_Smoke_Test.md**, and **Smoke_Test_Plan_customgroups.md**. **Recommendation:** keep `Test_Plan_Smoke_Test.md` as the canonical smoke plan (with a "simplified" section), fold the other two in, and delete the duplicates.

### Apps whose OC11 availability must be confirmed (best-effort — not verified)
Because this triage made no live lookups, the following app-existence calls need product confirmation before acting:
- **Likely removed (Delete candidates):** `market` (marketplace; conflicts with bundled docker apps), `drawio`, `msteamsbridge`, `notes`, `gallery` (referenced by Files_Mediaviewer, market, web — deprecated), the in-place **updater** mechanism (Updater, Settings channel UI).
- **Uncertain, used across multiple plans:** `windows_network_drive` (Smoke_Test, External, External_Auth, admin_audit, configreport, user_ldap, files_pdfviewer), **Shibboleth** auth (Activity, Addressbook, Files_Transfer_Ownership, Pluggable_Auth, Sharees), and the **Dropbox / Google Drive / OpenStack** external-storage backends (Files_External, Files_external_CLI).
- **Enterprise apps to confirm are in the OC11 set:** customgroups, configreport, diagnostics, guests, impersonate, admin_audit, search_elastic, richdocuments, templateeditor, files_primary_s3.

### Stub plans with no recoverable content
`Test_Plan_calendar.md` (1 line) and `Test_Plan_windows_network_drive.md` (2 lines) contain only pointers to external/private sources — Delete.

## Action summary

- **47 plans triaged** (OCIS excluded): **6 Delete, 2 Merge, 39 Update, 0 Keep.**
- **Confidence:** 29 High, 15 Medium, 3 Low.
- **18 verdicts are Medium/Low confidence and need human confirmation before acting** — driven almost entirely by app-availability questions (the Delete candidates and the WND/Shibboleth/external-backend clusters above), since this triage made no live repo/marketplace lookups.
- **No plan was rated Keep:** every in-scope plan needs at least a deploy/browser refresh for OC11, even where the test logic is sound. The highest-value, lowest-risk batch fix is removing IE11 and replacing the host-deploy snippets with a docker setup.

