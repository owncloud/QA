### Server Side Search


**Server(s)**: oCIS 7.0.1<br>
**Device(s)**: iPhoneXR iOS18.2<br>
**Execution date**: 25/02/2025<br>
**Tester**: jrecio<br>
**Context**: required a server with tika enabled. At the bottom is the `docker-compose.yml` file to build it. <br>



| Test Case | Steps | Expected | Result | Related Comment / Defect | 
| :-------- | :---- | :------- | :----: | :----------------------- | 
|**Settings**||||||
| Folder | 1. Open `Settings`, section `Search Settings` and Select `Folder` <br>2. Open the list of files and click on the lens icon| `Folder` selected by default | P m18 t17 |  |
| Tree | 1. Open `Settings`, section `Search Settings` and Select `Tree` <br>2. Open the list of files and click on the lens icon| `Tree` selected by default |P m18  t17 |  |
| Space | 1. Open `Settings`, section `Search Settings` and Select `Space` <br>2. Open the list of files and click on the lens icon| `Space` selected by default |P m18  t17 |  |
| Account | 1. Open `Settings`, section `Search Settings` and Select `Account` <br>2. Open the list of files and click on the lens icon| `Account` selected by default | P m18  t17|  |
| Server | 1. Open `Settings`, section `Search Settings` and Select `Server` <br>2. Open the list of files and click on the lens icon| `Server` selected by default | P m18  t17|  |
|**Server**||||||
| Name - Personal | 1. In web or other client, create a file which name is `testz1.txt` in `Personal` <br>2. Open the list of files and click on the lens icon<br>3. Select `Search in name`<br>4. Type `testz1.txt`| `testz1.txt` listed correctly |P m18  t17  |  |
| Name - Custom space | 1. In web or other client, create a file which name is `testz1.txt` in other space<br>2. Open the list of files and click on the lens icon<br>3. Select `Search in name`<br>4. Type `testz1.txt`| `testz1.txt` listed correctly | P m18  t17 |  |
| Contents - Personal | 1. In web or other client, create a file which name is `testz1.txt` that contains the string `mytext` in `Personal` <br>2. Open the list of files and click on the lens icon<br>3. Select `Search in contents`<br>4. Type `mytext `| `testz1.txt` listed correctly | P m18  t17|  |
| Contents - Custom space | 1. In web or other client, create a file which name is `testz1.txt` that contains the string `mytext` in other space <br>2. Open the list of files and click on the lens icon<br>3. Select `Search in contents`<br>4. Type `mytext `| `testz1.txt` listed correctly | P m18  t17|  |
| Name + Contents - Personal | 1. In web or other client, create a file which name is `testz1.txt` that contains the string `mytext` in `Personal` <br>2. Open the list of files and click on the lens icon<br>3. Select `Search in name+contents`<br>4. Type `mytext`<br>5. Type `mytext`| 3. `testz1.txt` listed correctly<br>4. `testz1.txt` listed correctly | P m18  t17|  |
| Name + Contents - Custom space | 1. In web or other client, create a file which name is `testz1.txt` that contains the string `mytext` in other space <br>2. Open the list of files and click on the lens icon<br>3. Select `Search in name+contents`<br>4. Type `testz1.txt`<br>5. Type `mytext`| 3. `testz1.txt` listed correctly<br>4. `testz1.txt` listed correctly | P m18  t17|  |
| Name - No results | 1. In web or other client, create a file which name is `testz1.txt` that contains the string `mytext`<br>2. Open the list of files and click on the lens icon<br>3. Select `Search in name`<br>4. Type `AAAA`| No results returned | P m18  t17|  |
| Contents - No results | 1. In web or other client, create a file which name is `testz1.txt` that contains the string `mytext`<br>2. Open the list of files and click on the lens icon<br>3. Select `Search in contents`<br>4. Type `AAAA`| No results returned |P m18  t17 |  |
| Name + Contents - No results | 1. In web or other client, create a file which name is `testz1.txt` that contains the string `mytext`<br>2. Open the list of files and click on the lens icon<br>3. Select `Search in name+contents`<br>4. Type `AAAA`| No results returned | P m18 t17|  |
|**File types - Server**||||||
| File | 1. In web or other client, create any file that contains an specific string like `mytext`<br>2. Open the list of files and click on the lens icon<br>3. Select `Search in contents` and with type `File`<br>4. Type `mytext `| file listed | P m18 t17 |  |
| Document | 1. In web or other client, create any document that contains an specific string like `mytext`<br>2. Open the list of files and click on the lens icon<br>3. Select `Search in contents` and with type `Documents`<br>4. Type `mytext `| file listed | P m18 t17 |  |
| PDF | 1. In web or other client, create a PDF file that contains an specific string like `mytext`<br>2. Open the list of files and click on the lens icon<br>3. Select `Search in contents` and with type `PDF`<br>4. Type `mytext `| PDF file listed | P m18 t17 |  |
| Spreadsheet | 1. In web or other client, create any spreadsheet that contains an specific string like `mytext`<br>2. Open the list of files and click on the lens icon<br>3. Select `Search in contents` and with type `Spreadsheet`<br>4. Type `mytext `| file listed | P m18 t17 |  |
| Presentation | 1. In web or other client, create any presentation that contains an specific string like `mytext`<br>2. Open the list of files and click on the lens icon<br>3. Select `Search in contents` and with type `Presentation`<br>4. Type `mytext `| file listed | P m18 t17 |  |
| Image | 1. In web or other client, take any image that contains an specific string like `mytext`<br>2. Open the list of files and click on the lens icon<br>3. Select `Search in contents` and with type `Image`<br>4. Type `mytext `| file listed | P m18 t17 |  |
| Video | 1. In web or other client, take any video that contains an specific string like `mytext`<br>2. Open the list of files and click on the lens icon<br>3. Select `Search in contents` and with type `Video`<br>4. Type `mytext `| file listed | NA |  |
|**File Date - Server**||||||
| Recently used | 1. In web or other client, take any file that contains `mytext` and was recently modified in server<br>2. Open the list of files and click on the lens icon<br>3. Select `Search in contents` and date `Recently used`<br>4. Type `mytext `| file listed |  F m18 t17|  [Bug](https://github.com/owncloud/ocis/issues/11060#issuecomment-2684917665)|
| Today | 1. In web or other client, take any file that contains `mytext` and was modified today in server<br>2. Open the list of files and click on the lens icon<br>3. Select `Search in contents` and date `Today`<br>4. Type `mytext `| file listed | F m18 t17 |[Bug](https://github.com/owncloud/ocis/issues/11060#issuecomment-2684917665)
| This week | 1. In web or other client, take any file that contains `mytext` and was mdified this week in server<br>2. Open the list of files and click on the lens icon<br>3. Select `Search in contents` and date `This week`<br>4. Type `mytext `| file listed | F m18 t17 | [Bug](https://github.com/owncloud/ocis/issues/11060#issuecomment-2684917665) |
| This month | 1. In web or other client, take any file that contains `mytext` and was modified this month in server<br>2. Open the list of files and click on the lens icon<br>3. Select `Search in contents` and date `This month`<br>4. Type `mytext `| file listed | F m18 t17 | [Bug](https://github.com/owncloud/ocis/issues/11060#issuecomment-2684917665) |
| This year | 1. In web or other client, take any file that contains `mytext` and was was modified this year in server<br>2. Open the list of files and click on the lens icon<br>3. Select `Search in contents` and date `This Year`<br>4. Type `mytext `| file listed | F m18 t17 | [Bug](https://github.com/owncloud/ocis/issues/11060#issuecomment-2684917665) |
|**Edge entries**||||||
| Special characters - Content | Search by content using special characters like `ñíôùë*+ç` inside files that contain such characters| Files listed in the result | F m18  t17| [Bug in backend](https://github.com/owncloud/ocis/issues/11060) |
| Special characters - Content+Name | Search by content+name using special characters like `ñíôùë*+ç$%&@?` inside files that contain such characters and also in the name| Files listed in the result | F m18  t17| [Bug in backend](https://github.com/owncloud/ocis/issues/11060) |




To create a server with server-side-search. Just replace `IP` by the ip in which the container will run.

```
version: "3.7"

services:
  ocis:
    image: owncloud/ocis:7.0.1
    ports:
      - "9200:9200"
      - "9215:9215"
    environment:
      OCIS_INSECURE: "true"
      OCIS_URL: "https://IP:9200"
      IDM_CREATE_DEMO_USERS: "true"
      IDM_ADMIN_PASSWORD: "admin"
      PROXY_ENABLE_BASIC_AUTH: "true"
      OCIS_SERVICE_ACCOUNT_ID: "b0fbfad7-3dd6-49cb-b468-3f588f2f82be"
      OCIS_SERVICE_ACCOUNT_SECRET: "asaGE4DF"
      SEARCH_EXTRACTOR_TYPE: tika
      SEARCH_EXTRACTOR_TIKA_TIKA_URL: "http://tika:9998"
      FRONTEND_FULL_TEXT_SEARCH_ENABLED: "true"
    restart: "no"
    entrypoint: ["/bin/sh"]
    command: ["-c", "ocis init || true; ocis server"]
    networks:
      - ocis-net

  tika:
    image: apache/tika:2.9.0.0-full
    restart: "always"
    networks:
      - ocis-net

networks:
  ocis-net:
```