## Setup

<details>
<summary>With 10.6.0 docker - http-only (click to view details)</summary>

```
oc_release.sh app:get oauth2
oc_release.sh app:get web
HTTP_PORT=883
HTTPS_PORT=8443
IPADDR=$(hostname -I | sed -e 's/ .*//')
HTTP_SERVER=http://$IPADDR:$HTTP_PORT
HTTPS_SERVER=$HTTP_SERVER
# HTTPS_SERVER=http://$IPADDR:$HTTPS_PORT
cd mnt_oc

mkdir -p config/
echo -e > config/web.config.php "<?php\n\$CONFIG = array ( 'web.baseUrl' => '$HTTPS_SERVER/index.php/apps/web' );"

docker run -ti --rm -v $HOME/mnt_oc:/mnt/data -p $HTTP_PORT:8080 owncloud/server:10.6.0 & 
echo "Admin -> General -> Log: select Everything ..."
echo "Admin -> 'User Authentication': Add: ownCloud-Web $HTTPS_SERVER/index.php/apps/web/oidc-callback.html"

CLIENT_ID_FROM_OAUTH2=nGqQBjSGwZ33lCgGWXUxOJLKG6SU5AnMGOHJo3w5f39U8KMrg7BMN7vJCvcKDF56

cat <<EOF > config/config.json
{
  "server" : "$HTTPS_SERVER",
  "theme": "owncloud",
  "auth": {
    "clientId": "$CLIENT_ID_FROM_OAUTH2",
    "url": "$HTTPS_SERVER/index.php/apps/oauth2/api/v1/token",
    "authUrl": "$HTTPS_SERVER/index.php/apps/oauth2/authorize"
  },
  "apps" : [ "files" ],
  "applications" : [
    {
      "title": { "en": "Classic Design", "de": "Dateien" },
      "icon": "switch_ui",
      "url": "$HTTP_SERVER/index.php/apps/files"
    },
    {
      "icon": "application",
      "menu": "user",
      "target": "_self",
      "title": { "de": "Einstellungen", "en": "Settings" },
      "url": "$HTTPS_SERVER/index.php/settings/personal"
    }
  ]
}
EOF

docker exec -ti $(docker ps -q | head -1) occ app:enable oauth2
docker exec -ti $(docker ps -q | head -1) occ app:enable web
```
</details>

## 'Web' App Test Plan

- Run Testplan with all supported browsers: Internet Explorer 11, MS EDGE, Mozilla Firefox, Chrome and Safari.
- References: [Template](https://github.com/owncloud/QA/edit/master/Server/Test_Plan_web.md)
  - https://owncloud.github.io/clients/web/deployments/oc10-app/
  
## Testing functionality

Test Case | Expected Result | Result | Related Comment
------------- | -------------- | ----- | ------
**CLI commands** |  |   |
Enable web app via CLI using ```occ app:enable web``` | The apps gets enabled | :construction:  |
|  |   |
 **Web GUI** |  |   |
 Switch to 'Settings' -> 'New Design' | The 'new' web app appears | :construction:  |

...
