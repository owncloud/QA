## 'Fixed server URL with branded client update' Test Plan


## Testing functionality

Test Case | Expected Result | Result | Related Comment
------------- | -------------- | ----- | ------
**files_external:create** |  |   |
|  |   |
Update desktop client from a hardcoded URL port1 server x(overrideServerUrl) to a hardcoded URL port2 server | The hardcoded URL should be updated with the new port| :construction:  |
Update desktop client from a URL port1 server (overrideServerUrl) to a URL port1 server | The URL should be kept | :construction:  |
Update desktop client from a hardcoded URL basic port1 server to a hardcoded URL Shibboleth port2 server (authType) | The URL should be updated | :construction:  |
Update desktop client from a Shibboleth server to a http server (authType)| The server should be updated and the authentication should be basic after the update | :construction:  |
Update desktop client from a non hardcoded URL server to a hardcoded URL server (overrideServerUrl) | The URL should be updated and hardcoded | :construction:  |
Update desktop client from a hardcoded URL server to a non hardcoded URL server (overrideServerUrl) | The URL should be updated and non hardcoded | :construction:  |
