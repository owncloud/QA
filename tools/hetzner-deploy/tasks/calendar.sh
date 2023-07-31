#! /bin/bash
#
# References:
# - https://ocloud.de/doc/user/lang/de/pim/calendar.html
#
# 2022-08-22, jw@owncloud.com

# source ./env.sh	# probably not needed.

user=admin
app=calendar
occ app:enable $app

mkdir ical
wget -q https://www.feiertage-deutschland.de/content/kalender-download/force-download.php -O ical/feiertage-deutschland-bis-2035.ics
wget -q https://www.fonflatter.de/dateien/kalender/$(date +%Y).ics -O ical/fonflatter-$(date +%Y).ics

dest=/var/www/owncloud/data/$user/files/
mkdir -p $dest
chown -R www-data. ical $dest/..
cp -a ical $dest
occ files:scan -q $user

cat << EOM | sed -e "s/^/$app: /g" >>  ~/POSTINIT.msg
Populate a calendar:
 - Log in as admin, download an ics file from the ical folder.
 - Switch to the calendar app, click 'settings & import'
 - Click 'import calendar' select the *.ics file you downloaded.
Sync with korganizer:
 -> Settings -> Configure KOrganizer -> Calendars -> Add
  - Dav groupware resource, admin, admin, ownCloud, ... Test Connection: Connected successfully
  - Find an event, edit the subject -> View -> Refresh, Schedule -> sedn as iCal
  - Reload the ownlcoud app, the changes appear
Cleanup all calendars:
    mysql owncloud -e 'delete from oc_calendarobjects;'
EOM
