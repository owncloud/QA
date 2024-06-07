This is the server app release template, please copy the part below in a new ticket.
For instructions around app releases, see https://kiteworks.atlassian.net/wiki/spaces/OG/pages/404326697/Releasing+Apps

### Reason

- Release needed for "ticket X", "feature Y"

### Product approval 

- [ ] Verify transifex commits (enterprise should update weekly, others daily): If folder `l10n` exists, then `git log` should show '[tx] updated from transifex` ...
- [ ] Check `info.xml` description and screenshot

### QA

- [ ] Create **QA** Milestone and set the description to $version
- [ ] Create release branch with the format "release-$version"
- [ ] Create "$version Testplan" ([QA templates](https://github.com/owncloud/QA/tree/master/Server) or [Enterprise](https://github.com/owncloud/qa-enterprise/tree/master/Core))
- [ ] copy new/reopened issues from the previous release ticket as 'Issues to review' below.
- [ ] check if [Non-normal Release Process](https://kiteworks.atlassian.net/wiki/spaces/OG/pages/404327434/Apps+with+special+release+process) applies, and adapt this checklist.

### Documentation

- [ ] Changes in the docs needed? If so create issue in https://github.com/owncloud/docs-server/issues/new .

### Marketing

- [ ] ~Update https://kiteworks.atlassian.net/wiki/spaces/PROD/pages/403801090/Upcoming+Releases~
- [ ] Check for any left over TODO's at https://kiteworks.monday.com/my_work (hide [x] done, empty)

### Build

All actions to be done on the release branch (`git pull; git checkout -b release-x.x.x`) from here:
- [ ] Bump version in `appinfo/info.xml` (no version suffix)
- [ ] Check php version dependency and minimum ownCloud version dependency in `appinfo/info.xml`
- [ ] Bump "sonar.projectVersion=" in `sonar-project.properties` (no version suffix)
- [ ] Change CHANGELOG.md 'Unreleased' to '$version' (today's date)

#### Beta/RC

- [ ] `git tag -s v${version}-rc.1` on release branch
- [ ] Build and sign RC tarball from github tag `v${version}-rc.1` (see handbook for how to build)
- [ ] Check buildlog for security reports
- [ ] Check github security tab dependabot reports
    - [ ] -> if critical or high entries are reported: open a release blocker issue.
- [ ] Upload as Github release using changelog entries
- [ ] Test and document in testplan + manual explorative testing:
    - [ ] If this is an enterprise app: Enabling the app must start the grace period
    - [ ] Add section "Changlog Testing" using github releases text or CHANGELOG.md from release branch
    - [ ] Do changelog tests
    - [ ] Do regression tests
    - [ ] Watch out for untranslated strings when locale is de oder de_DE.
    - [ ] => Final "Go" from QA (set 'QA-ready' label) => else do another RC after fixing issues in the "release-$version" branch

#### Final

- [ ] Check that no documentation issues are pending
- [ ] Rename last RC tarball to final
- [ ] Create github tag for final `v${version}` on release branch
- [ ] Upload as Github release using changelog entries

### Publishing

- [ ] Upload tarball to marketplace (details https://kiteworks.atlassian.net/wiki/spaces/OG/pages/404326697/Releasing+Apps)
- [ ] Publish tarball for customers `github/owncloud/QA/tools/portal_upload_app.sh` - [old 10](https://customer.owncloud.com/owncloud/index.php/apps/files/?dir=%2FownCloud-Enterprise%2FownCloud-10), [old 10.0](https://customer.owncloud.com/owncloud/index.php/apps/files/?dir=%2FownCloud-Server%2FownCloud-10.0) and [new portal](https://portal.owncloud.com/apps/files/?dir=/Portal%20Data/All%20Account%20Data/ownCloud%20Enterprise%20Resources%20Data/Server&fileid=5661) (details https://kiteworks.atlassian.net/wiki/spaces/OG/pages/404326697/Releasing+Apps)
- [ ] Send mail to release-coordination with link to this ticket and to the changelog `github/owncloud/QA/tools/release/oc_release.sh app:status`
- [ ] Copy email to rocket chat `#updates` channel (`remove all `https://` to avoid auto-expansions.)
- [ ] Submit mail-text as a Markting Request via https://kiteworks.monday.com/boards/5983659465/views/130504071 using login name + password, (not SSO)
	- DONE: Send Email to Alias: release-coordination@owncloud.com
	- DONE: Post to GitHub
	- DONE: Post to ownCloud Marketplace

### Post-release

- [ ] Add a new 'Unreleased' section in CHANGELOG.md (and also update links at the bottom!)
- [ ] Create PR to merge changes back to the `master` branch with description "Closes #XYZ" with the release ticket number
- [ ] Rename QA milestone to `$version` and close the milestone
- [ ] Update https://confluence.owncloud.com/display/PROD/Upcoming+Releases
- [ ] Ensure [release template](https://github.com/owncloud/QA/edit/master/tools/release/templates/server_app_release_template.md) is up to date
- [ ] Ensure the testplan template ([community](https://github.com/owncloud/QA/tree/master/Server) or [enterprise](https://github.com/owncloud/qa-enterprise/tree/master/Core)) is up to date
- [ ] Close the testplan issue
- [ ] Check for any left over TODO's at https://kiteworks.monday.com/my_work (hide [x] done, empty)
