#! /bin/bash
#
# prepare a test setup for malafati with clamav
#

# av_app=files_antrivirus=1.0.0Beta1
av_app=files_antivirus 			## Without url or version: Grab the latest tag from github.
backup_app=files_backup 		## Without url or version: Grab the latest tag from github.
export OC10_DNSNAME=malafati-DATE

set -x
bash ./make_oc10_apps.sh --type cx21 $av_app $backup_app


