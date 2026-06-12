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
<!-- TASK 4 fills this table -->

## Per-plan details
<!-- TASK 3 fills these subsections -->

## Cross-cutting findings
<!-- TASK 5 fills this section -->

<!-- KEYWORD MATRIX (working notes, remove or summarize in Task 5)
IE11 (explicit): Files_Mediaviewer, market, External, Simplified_Smoke_Test, Firstrunwizard, Guest, Impersonate, Settings, Diagnostics, Activity, customgroups, Templateeditor
internet explorer (generic): Filtering_System_Tags, files_pdfviewer, Files_Mediaviewer, twofactor_totp, web, Smoke_Test
Edge (legacy, ~23 plans): nearly all browser-matrix plans
Safari (version-brittle, ~20 plans): nearly all browser-matrix plans
Travis: Simplified_Smoke_Test, Smoke_Test
Smashbox: Smoke_Test
pyocclient: Smoke_Test
ci.owncloud.org / drone.owncloud: Smoke_Test
hetzner_deploy: Files_Mediaviewer, Smoke_Test, user_ldap, search_elastic
oc10.sh: files_antivirus, msteamsbridge, configreport, Smoke_Test, notes, search_elastic
.jw-qa.owncloud.works (dead hosts): market, files_antivirus, msteamsbridge, richdocuments, configreport, Smoke_Test
download.owncloud.org + tar.bz2 (tarball install): Smoke_Test
version pins: Smoke_Test (openidconnect 2.1.0, windows_network_drive 2.1.0, ldap 0.16.0, web 4.9.0)
suspect apps: drawio (drawio), msteamsbridge (msteams), market (marketplace), Firstrunwizard, windows_network_drive
owncloud/enterprise links (private/archived): search_elastic, calendar, web, Smoke_Test, encryption
one-line stubs: calendar (1 line), windows_network_drive (2 lines)
-->

