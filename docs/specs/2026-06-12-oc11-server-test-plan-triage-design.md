# OC11 Server Test Plan Triage — Design

**Date:** 2026-06-12
**Status:** Approved (design); triage not yet run
**Owner:** QA

## Problem

The `Server/` folder holds ~54 Markdown test plans, some up to ~9 years old
(first commits back to 2016). They were written for ownCloud 10 ("classic")
across many releases and reference apps, deployment scripts, CI systems,
browsers, and config that may no longer be valid.

We need them reviewed for the upcoming **OC11** release, whose defining
constraints are:

- **PHP 8** (no PHP 7 support)
- **docker-only** deployment (no tarball / bare-metal / hosted-VM installs)

Likely problems: apps that no longer exist or aren't PHP8/OC11-compatible,
obsolete config and `occ` commands, dead deployment scripts and CI infra,
legacy-browser test steps, and stub plans with no recoverable content.

## Goal & Deliverable

Produce **one triage report** that gives each in-scope plan a clear verdict
and the specifics behind it. This is **analysis only — no plan files are
edited.** Acting on the verdicts (rewrite / delete / merge) is a separate
follow-up, out of scope here.

## Scope

**In scope:** every `Test_Plan_*.md` and `Smoke_Test_Plan_*.md` in `Server/`
**except** the six `Test_Plan_OCIS_*.md` files.

**Out of scope:**
- The OCIS plans (`Test_Plan_OCIS_*.md`) — Infinite Scale is a separate
  product from OC11 classic. Left untouched.
- `Desktop/`, `Mobile/`, `Integrations/`, `tools/`.
- Editing, rewriting, deleting, or merging any test plan.

**Source of truth:** best-effort from existing knowledge of the ownCloud
ecosystem. The report does **not** make live repo/marketplace lookups.
Because of this, every verdict carries an explicit **confidence** level and
uncertain calls are flagged for human confirmation.

Tiny/stub plans (e.g. `Test_Plan_calendar.md`, `Test_Plan_windows_network_drive.md`)
are triaged too — they will mostly land as Delete or Update-with-no-content.

## Rubric — Outdatedness Dimensions

Each plan is scanned for findings across these dimensions:

1. **Dead / uncertain apps** — does the app the plan tests still exist and
   ship for OC11? Known-suspect set to scrutinize: `market`, `drawio`,
   `msteamsbridge`, `notes`, `calendar`, `addressbook`, `firstrunwizard`,
   `windows_network_drive`. Each flagged with confidence.
2. **Obsolete deployment / infra** — `oc10.sh`, `hetzner_deploy/*.sh`, hosted
   `*.jw-qa.owncloud.works` URLs, tarball download URLs, non-docker setup
   steps. All contradict docker-only.
3. **Dead CI / tooling references** — Travis, Smashbox, `ci.owncloud.org`,
   `drone.owncloud.com`, pyocclient.
4. **Legacy browsers** — IE11, legacy Edge, "internet explorer", brittle
   Safari-version assumptions.
5. **Outdated config / `occ` commands / config.php flags** — version-pinned
   app numbers (e.g. `ldap 0.16.0`), encryption defaults, changed settings.
6. **PHP7 / version assumptions** — explicit old-version steps, "update from
   10.8", beta version pins.
7. **Structural quality** — stub/empty plans, dead issue links
   (`owncloud/enterprise` is private/archived), broken template self-links.

## Verdict Model

- **Keep** — still valid, no material changes needed.
- **Update** — feature still relevant, but specifics need fixing (the report
  lists what).
- **Delete** — app/feature gone in OC11, or stub with no recoverable content.
- **Merge** — overlaps another plan; should be folded together (e.g. the
  three smoke-test variants).

Each verdict carries **Confidence: High / Medium / Low**.

## Process

Approach A — dimension-driven triage, with a keyword-sweep warm-up:

1. **Keyword sweep** — grep all in-scope plans for known-dead signals (IE11,
   Travis, Smashbox, `hetzner_deploy`, `oc10.sh`, `.jw-qa.`, drawio, msteams,
   tarball URLs, etc.) to build a hit matrix and read efficiently.
2. **Per-plan read** — read each plan in full, apply the rubric, assign
   verdict + confidence + findings with the specific outdated strings quoted.

## Output

A single Markdown report at **`Server/OC11_Test_Plan_Triage.md`** (lives with
the plans it describes), structured as:

- **Header** — definition of OC11 context, scope, the "best-effort knowledge —
  confidence flagged" caveat, and date.
- **Summary table** — `Plan | Verdict | Confidence | One-line reason`, sorted
  by verdict (Delete first, then Merge, Update, Keep) so actionable items are
  on top.
- **Per-plan details** — one subsection per plan; every finding tagged by
  rubric dimension, with the offending string quoted.
- **Cross-cutting findings** — issues spanning many plans (e.g. "IE11 appears
  in N plans", "the three smoke plans overlap") for batch fixing.

## Non-Goals

- No live verification against GitHub/marketplace.
- No edits to any test plan.
- No OCIS coverage.
- No new tooling or scripts beyond ad-hoc grep during analysis.

## Success Criteria

- Every in-scope plan appears exactly once in the summary table with a verdict
  and confidence.
- Each non-Keep verdict is backed by specific, quoted findings.
- Low/Medium-confidence app-existence calls are clearly flagged for human
  confirmation.
- Report is committed to the repo.
