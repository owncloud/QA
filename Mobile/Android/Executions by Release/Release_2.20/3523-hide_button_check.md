### Check server button disabled if connection works

#### Pr: https://github.com/owncloud/android/pull/3523

Devices: Nexus 6P v7, Pixel2 v11

Server: 10.9.1

---

 
| Test Case | Steps | Expected Result | Result | Related Comment |
| :-------- | :---- | :-------------- | :----: | :-------------- |
|**Basic Auth**| ||||||
| Connection up portrait | 1. `server_url == false` in settings<br>2. Open app in portrait | `Check server` hidden | P m11 m7 |  |
| Connection down portrait | 1.`server_url == false` in settings<br>2. Remove connection from device<br>3. Open app in portrait | `Check server` button visible | P m11 m7|  |
| Connection up landscape | 1. `server_url == false` in settings<br>2. Open app in landscape | `Check server` hidden | P m11 m7 |  |
| Connection down landscape | 1. `server_url == false` in settings<br>2. Remove connection from device<br>3. Open app in landscape | `Check server` visible | P m11 m7 |  |
|**Browser auth**|||||||
| Connection up portrait | 1. `server_url == false`in settings<br>2. Open app in portrait | `Check server` hidden |P m11 m7 |  |
| Connection down portrait | 1. `server_url == false`in settings<br>2. Remove connection from device<br>3. Open app in portrait | `Check server` visible | P m11 m7|  |
| Connection up landscape | 1. `server_url == false` in settings<br>2. Open app in landscape | `Check server` button hidden |P m11 m7 |  |
| Connection down landscape | 1. `server_url == false` in settings<br>2. Remove connection from device<br>3. Open app in landscape | `Check server` visible | P m11 m7 |  |
|**Switch**|||||||
| true -> false | 1. `server_url == true` in settings<br>2. Open app<br>3. `server_url == false` in settings<br>4. Open app | 2. URL visible, `Check server` hidden<br>4. URL hidden, `Check server` visible | P m11 m7 |  |
| false -> true | 1. `server_url == false` in settings<br>2. Open app<br>3. `server_url == true` in settings<br>4. Open app | 2. URL hidden, `Check server` visible<br>4. URL visible, `Check server` hidden | P m11 m7 |  |
|**Regression (`server_url == true`)**| ||||||
| Basic - Connection up portrait | 1. Open app in portrait | `Check server` hidden, URL visible  |P m11 m7 |  |
| Basic - Connection down portrait | 1. Remove connection from device<br>3. Open app in portrait | `Check server` hidden, URL visible |P m11 m7 |  |
| Basic - Connection up landscape | 1. Open app in landscape | `Check server` button hidden, URL visible |P m11 m7 |  |
| Basic - Connection down landscape | 1. Remove connection from device<br>3. Open app in landscape | `Check server` hidden, URL visible | P m11 m7|  |
| Browser - Connection up portrait | 1. Open app in portrait | `Check server` hidden, URL visible  | P m11 m7|  |
| Browser - Connection down portrait | 1. Remove connection from device<br>3. Open app in portrait | `Check server` hidden, URL visible | P m11 m7|  |
| Browser - Connection up landscape | 1. Open app in landscape | `Check server` button hidden, URL visible | P m11 m7|  |
| Browser - Connection down landscape | 1. Remove connection from device<br>3. Open app in landscape | `Check server` hidden, URL visible | P m11 m7|  |
