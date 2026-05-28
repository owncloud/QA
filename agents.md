# AI Agent Guidelines for QA

This file provides context for AI coding agents (Claude Code, GitHub Copilot, Cursor, etc.) working in this repository.

## Repository Overview
- **Product family:** Infrastructure / Tooling
- **Primary language(s):** Shell, Markdown
- **Build system:** None
- **Test framework:** Manual test plans (Markdown-based)
- **CI system:** None

## Architecture & Key Paths
- `Server/` - Server-side QA test plans
- `Desktop/` - Desktop client QA test plans
- `Mobile/` - Mobile app QA test plans
- `Integrations/` - Integration QA test plans
- `tools/` - QA tooling and helper scripts

## Development Conventions
- **Branching:** master
- **Commit messages:** DCO sign-off required (`git commit -s`)
- **Code style:** No specific linter configured
- **PR process:** Open a PR against master. All CI checks must pass.

## Build & Test Commands
```bash
# Build
Not applicable - this is a documentation/test-plan repository

# Test
Not applicable

# Lint
Not applicable
```

## Important Constraints
- All code contributions must be compatible with the **AGPL-3.0** license
- Do not introduce new **copyleft-licensed dependencies** (GPL, AGPL, LGPL, MPL) without explicit discussion in an issue first. This is especially important for repos migrating to Apache 2.0.
- Do not introduce new dependencies without discussion in an issue first
- Test plans follow a specific workflow (issue -> branch -> PR -> review -> merge -> validate -> release)


## OSPO Policy Constraints

### GitHub Actions
- **Only** use actions owned by `owncloud`, created by GitHub (`actions/*`), verified on the GitHub Marketplace, or verified by the ownCloud Maintainers.
- Pin all actions to their full commit SHA (not tags): `uses: actions/checkout@<SHA> # vX.Y.Z`
- Never introduce actions from unverified third parties.

### Dependency Management
- Dependabot is configured for automated dependency updates.
- Review and merge Dependabot PRs as part of regular maintenance.
- Do not introduce new dependencies without discussion in an issue first.

### Git Workflow
- **Rebase policy**: Always rebase; never create merge commits. Use `git pull --rebase` and `git rebase` before pushing.
- **Signed commits**: All commits **must** be PGP/GPG signed (`git commit -S -s`).
- **DCO sign-off**: Every commit needs a `Signed-off-by` line (`git commit -s`).
- **Conventional Commits & Squash Merge**: Use the [Conventional Commits](https://www.conventionalcommits.org/) format where the repository enforces it. Many repos use squash merge, where the PR title becomes the commit message on the default branch — apply Conventional Commits format to PR titles as well. A reusable GitHub Actions workflow enforces this.

## Context for AI Agents
- Match existing code style
- Do not refactor unrelated code in the same PR
- Write tests for new functionality
- Keep PRs focused and atomic
- Test plans are organized by product area - place new plans in the correct directory
