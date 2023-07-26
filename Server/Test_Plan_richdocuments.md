## 'Richdocuments' Test Plan

Template: https://github.com/owncloud/QA/tree/master/Server/Test_Plan_richdocuments.md

## Setup
<details><summary>Setup details (click to view)</summary>

* [ ] setup via `make_oc10_apps.sh richdocuments` 2.X.YRC1
    -> https://richdoc-DDMMYYYY.jw-qa.owncloud.works/owncloud
</details>

## Testing functionality

Test Case | Expected Result | Result | Related Comment
------------- | -------------- | ----- | ------
occ a:e richdocuments | app gets enabled  | :construction:  |
occ a:dis richdocuments | app gets disabled |  :construction:  |
Configure wopi | connects via WOPI | :construction:  |
Smoke test text document | Basic editing works | :construction:  |
Smoke test spreadsheet | Basic editing works | :construction:  |
Smoke test impress | Basic editing works | :construction:  |
Smoke test impress | Full screen Presentation | :no_entry_sign:  | Chrome console log: Refused to display 'https://collabora.owncloud-demo.com/' in a frame because it set 'X-Frame-Options' to 'sameorigin'.
Smoke test drawing | Basic editing works | :construction:  |
enable pdfviewer | edit chooser popup allows choice | :construction:   | 
Smoke test PDF | option collabora allows to add comments, then download | :construction:   |   
Smoke test PDF | option files_pdfviewer works | :construction: |
enable texteditor | edit chooser popup allows choice | :construction:  | 
Smoke test TXT | option collabora allows text editing | :construction:   |   
Smoke test TXT | option files_textviewer works | :construction: |
Secure view | checkbox grayed out without ee license | :construction:  |
Secure view | sharing defaults to secure view | :construction:  |
Secure view | documents have watermark, cannot be downloaded | :construction:  |
Secure view | still works with invalid or expired license key, until disabled | :construction:  |

* [ ] configure richdocuments with web app. https://doc.owncloud.com/webui/next/owncloud_web/web_with_oc_server.html#collabora-online-integration
  * [ ] The NEW button has the document types for collabora.
  * [ ] New documents can be created from the web UI.
  * [ ] The 9-dots menu can open the 'Büro' / 'Office' page with. an overview with large icons appears.

----

