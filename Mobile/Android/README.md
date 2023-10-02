# Android QA

Repository for public test plans for ownCloud Android app


## Feature Template

Inside this folder, templates for all features in different blocks (sharing, sync, auth...). 

Also, release templates (regression test, smoke test).

Tests linked to [automated](https://github.com/owncloud/android-scenario-testing)

## Executions

Inside this folder, test plans executed by release. Templates are fetched from `Feature Template` or newly created ones for specific new featues, which cases will be added to the templates in case they have to be executed in a recurrent way.

Notation for executions:

- P → Passed
- F → Failed
- NA → Not applied 
- m → mobile
- t → tablet

F ex: 

- P m13 → test passed with mobile in version 13
- F t12 → test failed with tabled in version 12

## Legacy 

Older stuff