# OC11 Server Test Plan Triage Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Produce one triage report verdicting every in-scope `Server/` test plan (Keep / Update / Delete / Merge, with confidence) for the OC11 (PHP8, docker-only) release.

**Architecture:** Dimension-driven triage (Approach A) with a keyword-sweep warm-up. First grep all in-scope plans for known-dead signals to build a hit matrix, then read each plan in full and apply a fixed rubric. Findings are assembled into a single Markdown report at `Server/OC11_Test_Plan_Triage.md`. No test-plan files are edited.

**Tech Stack:** Markdown, `rg`/`grep`, git. No build/test framework (documentation repo).

**Reference spec:** `docs/specs/2026-06-12-oc11-server-test-plan-triage-design.md`

---

## File Structure

- **Create:** `Server/OC11_Test_Plan_Triage.md` — the triage report (the only output artifact).
- **Read-only inputs:** all `Server/Test_Plan_*.md` and `Server/Smoke_Test_Plan_*.md` except the six `Test_Plan_OCIS_*.md`.
- **No other files created or modified.** No test plan is edited.

The report is built incrementally across tasks: scaffold → keyword matrix → per-plan reads → summary table → cross-cutting section. Each task appends/fills a section and commits, so progress is durable and reviewable.

---

## Task 1: Establish the in-scope file list and report scaffold

**Files:**
- Create: `Server/OC11_Test_Plan_Triage.md`

- [ ] **Step 1: Generate the authoritative in-scope list**

Run:
```bash
ls Server/Test_Plan_*.md Server/Smoke_Test_Plan_*.md | grep -v 'Test_Plan_OCIS_' | sort
```
Expected: ~48 files, none starting with `Test_Plan_OCIS_`. Record the exact count — it is the number of rows the summary table must contain.

- [ ] **Step 2: Cross-check the excluded OCIS set**

Run:
```bash
ls Server/Test_Plan_OCIS_*.md
```
Expected: exactly 6 files (`OCIS_Compatibility_Test`, `OCIS_Files_Texteditor`, `OCIS_Smoke_Ldap_Test`, `OCIS_Smoke_Test`, `OCIS_Smoke_Web_Office_Test`, plus any other `OCIS_` prefixed). These are excluded; confirm none leak into the in-scope list from Step 1.

- [ ] **Step 3: Write the report scaffold**

Create `Server/OC11_Test_Plan_Triage.md` with this exact skeleton (sections filled by later tasks):

```markdown
# OC11 Server Test Plan Triage

**Date:** 2026-06-12
**Target release:** OC11 — ownCloud classic server, **PHP 8**, **docker-only** deployment.
**Scope:** All `Server/Test_Plan_*.md` and `Server/Smoke_Test_Plan_*.md` except `Test_Plan_OCIS_*.md` (Infinite Scale, separate product).
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
```

- [ ] **Step 4: Commit**

```bash
git add Server/OC11_Test_Plan_Triage.md
git commit -s -m "docs: scaffold OC11 server test plan triage report"
```

---

## Task 2: Build the keyword-sweep hit matrix

**Files:**
- Modify: `Server/OC11_Test_Plan_Triage.md` (working notes only — see Step 3)

- [ ] **Step 1: Run the known-dead-signal sweep**

Run each grep across the in-scope files and record which plans hit. Use `-l` for file lists and `-c` where counts matter:
```bash
cd Server
FILES=$(ls Test_Plan_*.md Smoke_Test_Plan_*.md | grep -v 'Test_Plan_OCIS_')
for pat in 'IE ?11' 'internet explorer' 'Edge' 'Safari' 'Travis' 'Smashbox' 'smashbox' 'pyocclient' 'ci\.owncloud\.org' 'drone\.owncloud' 'hetzner_deploy' 'oc10\.sh' '\.jw-qa\.owncloud\.works' 'download\.owncloud\.org' 'tar\.bz2' '10\.[0-9]' 'PHP ?7' 'drawio' 'msteams' 'market' 'firstrunwizard' 'windows_network_drive'; do
  echo "### pattern: $pat"
  grep -il "$pat" $FILES 2>/dev/null
done
```
Expected: a mapping of pattern → hitting plans. This is the efficiency aid for Task 3 (tells you what to look for in each plan), not a verdict source on its own.

- [ ] **Step 2: Capture per-plan app/version pins**

Run:
```bash
cd Server
grep -nE '[0-9]+\.[0-9]+\.[0-9]+' Test_Plan_Smoke_Test.md Test_Plan_Simplified_Smoke_Test.md
```
Expected: version-pinned app references (e.g. `ldap 0.16.0`, `web 4.9.0`, `openidconnect 2.1.0`) — flag candidates for dimension 5.

- [ ] **Step 3: Stash the matrix as a working comment in the report**

Append the raw hit matrix as an HTML comment block under the `## Cross-cutting findings` placeholder so it survives between tasks but does not render. Format:
```markdown
<!-- KEYWORD MATRIX (working notes, remove or summarize in Task 5)
IE11/legacy browser: <plan list>
Travis/Smashbox/pyocclient/CI: <plan list>
hetzner_deploy/oc10.sh/jw-qa/tarball: <plan list>
version pins: <plan list>
suspect apps (drawio/msteams/market/firstrunwizard/wnd): <plan list>
-->
```

- [ ] **Step 4: Commit**

```bash
git add Server/OC11_Test_Plan_Triage.md
git commit -s -m "docs: add keyword-sweep hit matrix to triage working notes"
```

---

## Task 3: Per-plan read and verdict (the core analysis)

**Files:**
- Modify: `Server/OC11_Test_Plan_Triage.md` (fills `## Per-plan details`)

Process every in-scope plan. Work alphabetically so none are skipped. For each plan, read it **in full** (do not rely on the keyword matrix alone), then write one subsection.

- [ ] **Step 1: Read every in-scope plan**

Read each file end to end. The matrix from Task 2 tells you what suspect strings to confirm in context, but the verdict comes from reading the whole plan.

- [ ] **Step 2: Apply the rubric to each plan**

For each plan, evaluate all seven dimensions and quote the specific offending strings:
1. Dead/uncertain apps (scrutinize: `market`, `drawio`, `msteamsbridge`, `notes`, `calendar`, `addressbook`, `firstrunwizard`, `windows_network_drive`).
2. Obsolete deployment/infra (`oc10.sh`, `hetzner_deploy/*`, `*.jw-qa.owncloud.works`, tarball URLs, non-docker steps).
3. Dead CI/tooling (Travis, Smashbox, `ci.owncloud.org`, `drone.owncloud.com`, pyocclient).
4. Legacy browsers (IE11, legacy Edge, Safari version assumptions).
5. Outdated config / `occ` / config.php flags (version pins like `ldap 0.16.0`, encryption defaults).
6. PHP7 / version assumptions ("update from 10.8", beta pins).
7. Structural quality (stub/empty, dead `owncloud/enterprise` links, broken self-links).

- [ ] **Step 3: Write one subsection per plan**

Use this exact template per plan (under `## Per-plan details`):
```markdown
### Test_Plan_<Name>.md
**Verdict:** <Keep|Update|Delete|Merge> — **Confidence:** <High|Medium|Low>
**Reason (one line):** <short reason>

**Findings:**
- *[Dimension N: name]* "<quoted offending string>" — <why it's a problem / what to do>
- ... (omit dimensions with no findings; if none, write "No outdated items found.")
```
Stub plans (e.g. `Test_Plan_calendar.md` = a single link, `Test_Plan_windows_network_drive.md` = "See qa-enterprise") get a finding under dimension 7 and typically Delete.

- [ ] **Step 4: Self-check coverage**

Run:
```bash
cd Server
COUNT=$(ls Test_Plan_*.md Smoke_Test_Plan_*.md | grep -v 'Test_Plan_OCIS_' | wc -l)
HEADS=$(grep -c '^### Test_Plan\|^### Smoke_Test_Plan' OC11_Test_Plan_Triage.md)
echo "in-scope=$COUNT  detail-subsections=$HEADS"
```
Expected: `detail-subsections` ≥ `in-scope` (one subsection per plan; the report's own filename is not matched by the pattern). Add any missing plan.

- [ ] **Step 5: Commit**

```bash
git add Server/OC11_Test_Plan_Triage.md
git commit -s -m "docs: per-plan triage findings and verdicts"
```

---

## Task 4: Build the summary table

**Files:**
- Modify: `Server/OC11_Test_Plan_Triage.md` (fills `## Summary`)

- [ ] **Step 1: Derive the table from the per-plan subsections**

For every `### <plan>` subsection written in Task 3, extract `Verdict`, `Confidence`, and the one-line reason into a row. Do not introduce verdicts not present in the details — the table is a roll-up, the details are the source.

- [ ] **Step 2: Write the table, sorted by actionability**

Under `## Summary`, sort rows by verdict in order **Delete → Merge → Update → Keep**, then by plan name within each group:
```markdown
| Plan | Verdict | Confidence | Reason |
| ---- | ------- | ---------- | ------ |
| Test_Plan_market.md | Delete | Medium | Marketplace app removed in OC11 (confirm) |
| ... | ... | ... | ... |
```

- [ ] **Step 3: Verify row count matches in-scope count**

Run:
```bash
cd Server
COUNT=$(ls Test_Plan_*.md Smoke_Test_Plan_*.md | grep -v 'Test_Plan_OCIS_' | wc -l)
ROWS=$(awk '/^## Summary/{f=1;next} /^## /{f=0} f && /^\| Test_Plan|^\| Smoke_Test_Plan/{n++} END{print n}' OC11_Test_Plan_Triage.md)
echo "in-scope=$COUNT  table-rows=$ROWS"
```
Expected: `table-rows` == `in-scope`. Reconcile any mismatch.

- [ ] **Step 4: Commit**

```bash
git add Server/OC11_Test_Plan_Triage.md
git commit -s -m "docs: add OC11 triage summary table"
```

---

## Task 5: Write cross-cutting findings and finalize

**Files:**
- Modify: `Server/OC11_Test_Plan_Triage.md` (fills `## Cross-cutting findings`, removes working matrix)

- [ ] **Step 1: Summarize patterns spanning multiple plans**

Replace the working keyword-matrix comment with prose findings. Cover at least:
- Legacy browsers (IE11/legacy Edge): which plans, count, recommendation (drop IE11 entirely for OC11).
- Dead CI/infra (Travis, Smashbox, `hetzner_deploy`, `oc10.sh`, `jw-qa` URLs): which plans, recommend replacing with docker-only setup language.
- Smoke-plan overlap (`Test_Plan_Smoke_Test.md`, `Test_Plan_Simplified_Smoke_Test.md`, `Smoke_Test_Plan_customgroups.md`): merge recommendation.
- Suspect-app cluster: list every plan whose entire subject app is in doubt, grouped so they can be confirmed in one pass.

- [ ] **Step 2: Add an action-summary line**

After the cross-cutting prose, add counts: how many Delete / Merge / Update / Keep, and how many verdicts are Low/Medium confidence (i.e. need human confirmation).

- [ ] **Step 3: Confirm no working notes remain**

Run:
```bash
grep -n 'KEYWORD MATRIX\|working notes\|TASK [0-9]\|<!-- TASK' Server/OC11_Test_Plan_Triage.md
```
Expected: no output. Remove anything that matches.

- [ ] **Step 4: Final consistency pass**

Run:
```bash
grep -nE 'TBD|TODO|FIXME|XXX' Server/OC11_Test_Plan_Triage.md
```
Expected: matches only where they are *quoted findings from a plan* (e.g. a plan literally containing "TODO"). No authoring placeholders of our own.

- [ ] **Step 5: Commit**

```bash
git add Server/OC11_Test_Plan_Triage.md
git commit -s -m "docs: cross-cutting findings and action summary for OC11 triage"
```

---

## Task 6: Open the PR

- [ ] **Step 1: Push the branch**

```bash
git push -u origin oc11-test-plan-triage
```

- [ ] **Step 2: Open the PR against master**

```bash
gh pr create --base master --title "docs: OC11 server test plan triage report" \
  --body "Triages all in-scope Server/ test plans for OC11 (PHP8, docker-only). Adds Server/OC11_Test_Plan_Triage.md with per-plan verdicts (Keep/Update/Delete/Merge + confidence), a summary table, and cross-cutting findings. Analysis only — no test plans edited. Design: docs/specs/2026-06-12-oc11-server-test-plan-triage-design.md"
```
Expected: PR URL returned. Do not merge; leave for review.

---

## Self-Review Notes (author)

- **Spec coverage:** scope (Task 1) ✓, rubric all 7 dimensions (Task 3 Step 2) ✓, verdict+confidence model (Task 3 template) ✓, keyword sweep (Task 2) ✓, output at `Server/OC11_Test_Plan_Triage.md` with header/summary/details/cross-cutting (Tasks 1,3,4,5) ✓, OCIS excluded (Task 1 Steps 1-2) ✓, best-effort caveat in header (Task 1 Step 3) ✓, success criteria coverage check (Task 3 Step 4, Task 4 Step 3, Task 5 Step 2) ✓.
- **No edits to test plans:** every task only creates/modifies `Server/OC11_Test_Plan_Triage.md`. ✓
- **Placeholder scan:** the `<!-- TASK N -->` markers are intentional scaffold comments removed in Task 5 Step 3; no other placeholders. ✓
