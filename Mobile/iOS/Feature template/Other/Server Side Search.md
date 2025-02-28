### Server Side Search


**Server(s)**: <br>
**Device(s)**: <br>
**Execution date**: <br>
**Tester**: <br>
**Context**:  <br>



| Test Case | Steps | Expected | Result | Related Comment / Defect | 
| :-------- | :---- | :------- | :----: | :----------------------- | 
|**Settings**||||||
| Folder | 1. Open `Settings`, section `Search Settings` and Select `Folder` <br>2. Open the list of files and click on the lens icon| `Folder` selected by default |  |  |
| Tree | 1. Open `Settings`, section `Search Settings` and Select `Tree` <br>2. Open the list of files and click on the lens icon| `Tree` selected by default | |  |
| Space | 1. Open `Settings`, section `Search Settings` and Select `Space` <br>2. Open the list of files and click on the lens icon| `Space` selected by default | |  |
| Account | 1. Open `Settings`, section `Search Settings` and Select `Account` <br>2. Open the list of files and click on the lens icon| `Account` selected by default | |  |
| Server | 1. Open `Settings`, section `Search Settings` and Select `Server` <br>2. Open the list of files and click on the lens icon| `Server` selected by default | |  |
|**Server**||||||
| Name - Personal | 1. In web or other client, create a file which name is `testz1.txt` in `Personal` <br>2. Open the list of files and click on the lens icon<br>3. Select `Search in name`<br>4. Type `testz1.txt`| `testz1.txt` listed correctly |  |  |
| Name - Custom space | 1. In web or other client, create a file which name is `testz1.txt` in other space<br>2. Open the list of files and click on the lens icon<br>3. Select `Search in name`<br>4. Type `testz1.txt`| `testz1.txt` listed correctly |  |  |
| Contents - Personal | 1. In web or other client, create a file which name is `testz1.txt` that contains the string `mytext` in `Personal` <br>2. Open the list of files and click on the lens icon<br>3. Select `Search in contents`<br>4. Type `mytext `| `testz1.txt` listed correctly | |  |
| Contents - Custom space | 1. In web or other client, create a file which name is `testz1.txt` that contains the string `mytext` in other space <br>2. Open the list of files and click on the lens icon<br>3. Select `Search in contents`<br>4. Type `mytext `| `testz1.txt` listed correctly | |  |
| Name + Contents - Personal | 1. In web or other client, create a file which name is `testz1.txt` that contains the string `mytext` in `Personal` <br>2. Open the list of files and click on the lens icon<br>3. Select `Search in name+contents`<br>4. Type `mytext`<br>5. Type `mytext`| 3. `testz1.txt` listed correctly<br>4. `testz1.txt` listed correctly | |  |
| Name + Contents - Custom space | 1. In web or other client, create a file which name is `testz1.txt` that contains the string `mytext` in other space <br>2. Open the list of files and click on the lens icon<br>3. Select `Search in name+contents`<br>4. Type `testz1.txt`<br>5. Type `mytext`| 3. `testz1.txt` listed correctly<br>4. `testz1.txt` listed correctly | |  |
| Name - No results | 1. In web or other client, create a file which name is `testz1.txt` that contains the string `mytext`<br>2. Open the list of files and click on the lens icon<br>3. Select `Search in name`<br>4. Type `AAAA`| No results returned | |  |
| Contents - No results | 1. In web or other client, create a file which name is `testz1.txt` that contains the string `mytext`<br>2. Open the list of files and click on the lens icon<br>3. Select `Search in contents`<br>4. Type `AAAA`| No results returned | |  |
| Name + Contents - No results | 1. In web or other client, create a file which name is `testz1.txt` that contains the string `mytext`<br>2. Open the list of files and click on the lens icon<br>3. Select `Search in name+contents`<br>4. Type `AAAA`| No results returned | |  |
|**File types - Server**||||||
| File | 1. In web or other client, create any file that contains an specific string like `mytext`<br>2. Open the list of files and click on the lens icon<br>3. Select `Search in contents` and with type `File`<br>4. Type `mytext `| file listed |  |  |
| Document | 1. In web or other client, create any document that contains an specific string like `mytext`<br>2. Open the list of files and click on the lens icon<br>3. Select `Search in contents` and with type `Documents`<br>4. Type `mytext `| file listed |  |  |
| PDF | 1. In web or other client, create a PDF file that contains an specific string like `mytext`<br>2. Open the list of files and click on the lens icon<br>3. Select `Search in contents` and with type `PDF`<br>4. Type `mytext `| PDF file listed |  |  |
| Spreadsheet | 1. In web or other client, create any spreadsheet that contains an specific string like `mytext`<br>2. Open the list of files and click on the lens icon<br>3. Select `Search in contents` and with type `Spreadsheet`<br>4. Type `mytext `| file listed |  |  |
| Presentation | 1. In web or other client, create any presentation that contains an specific string like `mytext`<br>2. Open the list of files and click on the lens icon<br>3. Select `Search in contents` and with type `Presentation`<br>4. Type `mytext `| file listed |  |  |
| Image | 1. In web or other client, take any image that contains an specific string like `mytext`<br>2. Open the list of files and click on the lens icon<br>3. Select `Search in contents` and with type `Image`<br>4. Type `mytext `| file listed |  |  |
| Video | 1. In web or other client, take any video that contains an specific string like `mytext`<br>2. Open the list of files and click on the lens icon<br>3. Select `Search in contents` and with type `Video`<br>4. Type `mytext `| file listed | |  |
|**File Date - Server**||||||
| Recently used | 1. In web or other client, take any file that contains `mytext` and was recently modified in server<br>2. Open the list of files and click on the lens icon<br>3. Select `Search in contents` and date `Recently used`<br>4. Type `mytext `| file listed |  |  |
| Today | 1. In web or other client, take any file that contains `mytext` and was modified today in server<br>2. Open the list of files and click on the lens icon<br>3. Select `Search in contents` and date `Today`<br>4. Type `mytext `| file listed |  |
| This week | 1. In web or other client, take any file that contains `mytext` and was mdified this week in server<br>2. Open the list of files and click on the lens icon<br>3. Select `Search in contents` and date `This week`<br>4. Type `mytext `| file listed |  |  |
| This month | 1. In web or other client, take any file that contains `mytext` and was modified this month in server<br>2. Open the list of files and click on the lens icon<br>3. Select `Search in contents` and date `This month`<br>4. Type `mytext `| file listed |  |  |
| This year | 1. In web or other client, take any file that contains `mytext` and was was modified this year in server<br>2. Open the list of files and click on the lens icon<br>3. Select `Search in contents` and date `This Year`<br>4. Type `mytext `| file listed |  |  |
|**Edge entries**||||||
| Special characters - Content | Search by content using special characters like `ñíôùë*+ç` inside files that contain such characters| Files listed in the result | | |
| Special characters - Content+Name | Search by content+name using special characters like `ñíôùë*+ç$%&@?` inside files that contain such characters and also in the name| Files listed in the result | | |




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