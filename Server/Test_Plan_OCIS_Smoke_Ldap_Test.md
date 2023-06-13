## Smoke test: ocis with ldap:

### Preparation
- [ ] switch to the latest stable ocis version using https://github.com/owncloud/ocis/blob/master/deployments/examples/ocis_ldap/docker-compose.yml
- [ ] create demo users and group
- [ ] using ldap client https://ldap.owncloud.test/ (login: `cn=admin,dc=owncloud,dc=com`, password: `admin`)
  - [ ] create ldap user `user1`
  - [ ] create ldap group `group1`
  - [ ] add `user1` to `group1`
  - [ ] delete `philosophy-haters` group
  - [ ] delete `marie` user
  - [ ] disable `richard` user

### Test

- [ ] upgrade ocis to new version
- [ ] check that 
  - [ ] created demo users and group still exist
  - [ ] created ldap users `user1` and group `group1` still exist
  - [ ] users `user1` can log in
  - [ ] deleted group `philosophy-haters` and user `marie` doesn't exist
  - [ ] `richard` user still disabled and cannot log in
- [ ] using ldap client https://ldap.owncloud.test/
  - [ ] create new ldap user `user2`
  - [ ] create new ldap group `group2`
  - [ ] add new user `user2` to group `group1` and `group2`
- [ ] new user `user2` can log in
- [ ] log in as `einstein`
  - [ ] try to find sharees by `user` and by `group`
- [ ] using ldap client https://ldap.owncloud.test/
  - [ ] disable user `user1`, `user2`, `einstein`
  - [ ] delete `physics-lovers`, `group1`, `group2`, `einstein`, `user1`, `user2`, `richard`



