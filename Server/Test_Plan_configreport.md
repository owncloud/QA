## 'Configreport' Test Plan

Template: https://github.com/owncloud/QA/tree/master/Server/Test_Plan_configreport.md

## Setup
<details><summary>Setup details (click to view)</summary>

* `env OC10_DNSNAME=oc1091-cr021rc1-s3-DATE bash ./oc10.sh configreport files_antivirus wopi  metrics oauth2 richdocuments search_elastic user_ldap web windows_network_drive files_primary_s3`
  -> https://oc1091-cr021rc1-s3-20220320.jw-qa.owncloud.works

</details>

## Testing functionality

* [ ] Sensitive data
   - configure a system with as many apps as possible that use credentials, internal addresses, ports, or path names.
   * [ ] `occ configreport:generate` does not contain
      * [ ] :no_entry: usernames or passwords -> #167
      * [ ] environment variables in phpinfo section 
   * [ ] the report contains
      * [ ] hostnames or ip addresses or ports of connected services.
      * [ ] pathnames used in the host system
      * [ ] app config data of all installed apps (disabled / enabled are marked as active: false/true)
      * [ ] a merge of all config/config.php* files -> #166
      * [ ] statistics about users and groups
* [ ] Consistency
   - Numbers agree with
   * [ ] Admin UI: User total and guest counts, ldap counts
   * [ ] Admin UI: group counts. (off by one is okayis)
   * [ ] Admin UI: generic, integrity checker results
   * [ ] Admin UI: external storage mounts
   * [ ] :no_entry: section phpinfo is non-empty and agrees with `php -r "phpinfo();"` -> #168
----
* [ ] Telemetry
   * [ ] No errors: `occ configreport:send-telemetry -vvv`
      - [ ] nothing in `grep -i telemetry owncloud.log`
      - [ ] With active enterprise-license, the log has: `<INFO>: Telemetry data submitted to ...`
   * [ ] https://github.com/owncloud/configreport/pull/197
      - [ ] no exposed secrets, (licensekey *is* exposed)
      - [ ] cron interval daily
      - [ ] no telemetry is sent, when 
         - [ ] opt-out `occ config:system:set telemetry.enabled --type boolean --value false`
         - [ ] community edition, license-key is empty.
      - [ ] telemetry submission is logged as `info`.
      - [ ] estimates of active-users, active guests
      - [ ] receiving site honors GDPR / DSGVO
      - [ ] it is transparent to the admin, what is being sent.
   * [ ] Documentation https://github.com/owncloud/docs-server/issues/1350
   * [ ] Certificate is valid for at least 12 months: `curl -vk https://telemetry.owncloud.com/oc10-telemetry 2>&1 | grep expire`  
