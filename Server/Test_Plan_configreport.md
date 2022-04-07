## 'Configreport' Test Plan

Template: https://github.com/owncloud/QA/tree/master/Server/Test_Plan_configreport.md

## Setup
<details><summary>Setup details (click to view)</summary>

* `env OC10_DNSNAME=oc1091-cr021rc1-s3-DATE bash ./oc10.sh configreport files_antivirus wopi  metrics oauth2 richdocuments search_elastic user_ldap web windows_network_drive files_primary_s3`
  -> https://oc1091-cr021rc1-s3-20220320.jw-qa.owncloud.works

</details>

## Testing functionality

* [x] Sensitive data
   - configure a system with as many apps as possible that use credentials, internal addresses, ports, or path names.
   * [x] `occ configreport:generate` does not contain
      * [x] :no_entry: usernames or passwords -> #167
      * [x] environment variables in phpinfo section 
   * [x] the report contains
      * [x] hostnames or ip addresses or ports of connected services.
      * [x] pathnames used in the host system
      * [x] app config data of all installed apps (disabled / enabled are marked as active: false/true)
      * [x] a merge of all config/config.php* files -> #166
      * [x] statistics about users and groups
* [ ] Consistency
   - Numbers agree with
   * [x] Admin UI: User total and guest counts, ldap counts
   * [x] Admin UI: group counts. (off by one is okayis)
   * [x] Admin UI: generic, integrity checker results
   * [x] Admin UI: external storage mounts
   * [ ] :no_entry: section phpinfo is non-empty and agrees with `php -r "phpinfo();"` -> #168

