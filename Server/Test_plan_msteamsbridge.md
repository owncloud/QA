## 'Msteamsbridge' Test Plan

- from https://github.com/owncloud/msteamsbridge/issues/38

## Setup
<details><summary>Setup details (click to view)</summary>

  `oc10.sh openidconnect msteamsbridge`
  -> To switch from keycloak to azure,
 - fill in variables in o/config/oidc-azure.config.php.disabled
 - mv o/config/oidc-azure.config.php{.disabled,}
 - mv o/config/oidc-keycloak.config.php{,.disabled}

</details>

## Testing functionality

 - [ ] firefox  https://oc109-openidconnect-220rc7-20230124.jw-qa.owncloud.works/index.php/apps/msteamsbridge
 - [ ] a small azure login window pops up,
   - try user juergen.weigert@owncloud.com
 - [ ] firefox ends up at https://oc109-openidconnect-220rc7-20230124.jw-qa.owncloud.works/index.php/apps/msteamsbridge/finalize
 - [ ] the server-log contains this: which means success:
```
{"reqId":"Y9JRHmV2q1pxe@aWEJ7P@AAAAAM","level":1,"time":"2023-01-26T10:08:31+00:00","remoteAddr":"46.114.159.181","user":"--","app":"OC\\User\\Session::loginInOwnCloud","method":"GET","url":"\/index.php\/apps\/msteamsbridge\/redirect?code=0.ATEAbtSzzBL2bEWsJRjuzTxxR2w_z9TijzFFlBZitJRIl3MxALM.AgABAAIAAAD--DLA3VO7QrddgJg7WevrAgDs_wUA9P_DoKA5SHYQY6NaKxuARdBaTVbO9RE2QOkzl8XFKOrPooCXBjwLU4eNCvrZevnDxbWicsByVqUVgKltR0YUU2pqaTF9VUFS_12Os23MAIQdRatabAo3LObjFhrFvt7oNkGUHqd7LBWEMzQH4gVTqHgkxpnm6-gImOXm60JZaMwZJclujWc3LW4y22LsCmPHDy50mpGIC41r9tLYtScC1K_yvB3kGmhTDDD37xcVwiWWx-YOHrZR7nrwcl1tbNhTfIWbHrDV-lS4AyS7nUWDsbF1uAHtH5kZ3Y_FkT6EeQNjUMgSc8JQEFN22WfCsAYTm1BZpl60beJFG_dAhjRogBq3IHiyk8whcysNP5RKwq7NQLb0kejxxk21Sg-KIw2tEEIOWuisyc7J6DsofBj9yzpIcqWK4_oQ1B7SrxGnUhfczJmk7JryZ-lh8C_BA46BfCiAesQFiaNhiMoUL8adsyX9oZdQspqfcMWLDZ_hxkzWwcjm_ehQaK1GkFXYY-hxrgHEZ0lMFRCPfVODgIT8YOX5EJ_SBDnpJCFSXVf-DRNtTeUP87DIOfp0ERtI4u6FT8dm6Kh3q4VoWcTabUkUFngL3_Tav2dEFRmTGEqdBWc4tN3hkvzBp3FLAWFO0J7VMPfV4-ySDuF2OmnjbYuDsvqUY-6LhPrJZsBN_SjDabLiaDxSYSAPAeBgS3FnWAF931NvPYM0SMvfVDOl4H-xGui1Cr0zJb5rnhMU0KUFFYyAkdTUG4AIQi9LL1l7okkz5X33ZMjTo0MPHgAhJBpJwPkKq_wX6GYY8Gvx_5SCGf5hIriCmeT3QOUUpbzCqMd6qP0&state=7749fad63dfa6cbff1dd20ebeb9589c2&session_state=e96d9ec7-2f7b-45b7-a9ee-7d7a2241039c","message":"login oidc-user-39e637e2be8ed5579739f7cb4abc03b4 using \"OCA\\OpenIdConnect\\OpenIdConnectAuthModule\" login type"}
```



