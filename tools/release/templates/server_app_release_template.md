This is the server app release template, please copy the part below in a new ticket.
For instructions around app releases, see https://confluence.owncloud.com/display/OG/Releasing+Apps

### Reason

- Release needed for "ticket X", "feature Y"

### Product approval 

- [ ] Verify transifex commits are in master: If a toplevel folder `l10n` exists, then `git log` should show '[tx] updated from transifex` ...
- [ ] Ping pmaier to check `info.xml` description and screenshot
- [ ] Get approval on translations from pmaier - send the date of the last tx commit from drone to Patrick

### QA

- [ ] Create **QA** Milestone and set the description to $version
- [ ] Move tickets from milestone `development` to `qa` (testplan and tickets mentioned in release ticket)
- [ ] Create release branch with the format "release-$version"
- [ ] Create "$version Testplan" ([QA templates](https://github.com/owncloud/QA/tree/master/Server) or [Enterprise](https://github.com/owncloud/qa-enterprise/tree/master/Core))
- [ ] copy new/reopened issues from the previous release ticket as 'Issues to review' below.
- [ ] check if [Non-normal Release Process](https://confluence.owncloud.com/display/OG/Apps+with+special+release+process) applies, and adapt this checklist.

### Documentation

- [ ] Changes in the docs needed? If so create issue in owncloud/docs-server.

### Marketing

- [ ] Ping @owncloud/marketing
- [ ] Update https://confluence.owncloud.com/display/PROD/Upcoming+Releases
- [ ] Request a screenshot if the app is new or changed fundamentally

### Build

All actions to be done on the release branch from here:
- [ ] Bump version in `appinfo/info.xml` (no version suffix)
- [ ] Bump "sonar.projectVersion=" in `sonar-project.properties` (no version suffix)
- [ ] Check php version dependency in `appinfo/info.xml`
- [ ] Check minimum ownCloud version dependency in `appinfo/info.xml`
- [ ] Change CHANGELOG.md 'Unreleased' to '$version' (today's date)

#### Beta/RC

- [ ] Ping product owner to create github tag for `v${version}-rc1` on release branch (see https://confluence.owncloud.com/display/EN/Product+Owners+List)
- [ ] Build and sign RC tarball from github tag `v${version}-rc1` (see handbook for how to build)
- [ ] Upload as Github release using changelog entries
- [ ] Test and document in testplan + manual explorative testing:
    - [ ] If this is an enterprise app: Enabling the app must start the grace period
    - [ ] Add section "Changlog Testing" using github releases text or CHANGELOG.md from release branch
    - [ ] Do changelog tests
    - [ ] Do regression tests
    - [ ] => Final "Go" from QA (set 'QA-ready' label) => else do another RC after fixing issues in the "release-$version" branch

#### Final

- [ ] Check that no documentation issues are pending
- [ ] Rename last RC tarball to final
- [ ] Create github tag for final `v${version}` on release branch
- [ ] Upload as Github release using changelog entries

### Publishing

- [ ] Upload tarball to marketplace (see handbook in confluence for details)
- [ ] Publish tarball for customers  - [old 10](https://customer.owncloud.com/owncloud/index.php/apps/files/?dir=%2FownCloud-Enterprise%2FownCloud-10), [old 10.0](https://customer.owncloud.com/owncloud/index.php/apps/files/?dir=%2FownCloud-Server%2FownCloud-10.0) and [new portal](https://portal.owncloud.com/apps/files/?dir=/Portal%20Data/All%20Account%20Data/ownCloud%20Enterprise%20Resources%20Data/Server&fileid=5661) (see [handbook](https://confluence.owncloud.com/display/OG/Releasing+Apps) for details)
- [ ] Send mail to release-coordination with link to this ticket and to the changelog
- [ ] Copy email to rocket chat `#updates` channel

### Post-release

- [ ] Add a new 'Unreleased' section in CHANGELOG.md (and also update links at the bottom!)
- [ ] Create PR to merge changes back to the `master` branch with description "Closes #XYZ" with the release ticket number
- [ ] Rename QA milestone to `$version` and close the milestone
- [ ] Update https://confluence.owncloud.com/display/PROD/Upcoming+Releases
- [ ] Ensure [release template](https://github.com/owncloud/QA/edit/master/tools/release/templates/server_app_release_template.md) is up to date
- [ ] Ensure the testplan template ([community](https://github.com/owncloud/QA/tree/master/Server) or [enterprise](https://github.com/owncloud/qa-enterprise/tree/master/Core)) is up to date
- [ ] Close the testplan issue
