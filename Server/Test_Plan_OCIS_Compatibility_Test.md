## Compatibility test:
Note: It is necessary to switch to the latest stable version and do all the steps below.
After switching to the new ocis version you need to check that all resources, shares and settings still exist and remain unchanged


### After upgrade from previous release version to new release version

shares:
- [ ] public share (with an expiration date)
- [ ] share with user as role editor (with an expiration date)
- [ ] share with user as role viewer
- [ ] share with group "Users"
- [ ] check activities

project space:
- [ ] uploaded folder & files
- [ ] trashed files
- [ ] share space with user
- [ ] public share space
- [ ] check space activities

files:
- [ ] uploaded folder & files
- [ ] version of files
- [ ] trashed files

users
- [ ] non demo user with role admin
- [ ] non demo user with role user
- [ ] created new user
- [ ] disabled user
- [ ] created new group

settings
- [ ] language settings
- [ ] update logo
- [ ] new password
- [ ] GDPR export
