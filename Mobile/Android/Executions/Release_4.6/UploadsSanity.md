## Uploads

**Manual retry**

Server down, credentials revoked

| Scenario   | Outcome                    | Local source | /tmp  | oC10 | oCIS | Comment |
|:----------:|:---------------------------|:------------:|:-----:|:----:|:----:| :------ |
| Manual     | 1st att :white_check_mark: | Keep file    | clean |  :white_check_mark:    | :white_check_mark:     |         |
| Manual     | 1st att :x:                | Keep file    | file  |  :white_check_mark:    | :white_check_mark:      |         |
| Manual     | 2nd att :white_check_mark: | Keep file    | clean |  :white_check_mark:    |   :white_check_mark:    |         |
| Photo      | 1st att :white_check_mark: | Remove file    | clean | :white_check_mark:     | :white_check_mark:      |  |
| Photo      | 1st att :x:                | Keep file    | file  |   :white_check_mark:   |  :white_check_mark:     | sdcard > Android > data > com.owncloud.android > cache    | 
| Photo      | 2nd att :white_check_mark: | Remove file    | clean |   :white_check_mark:   |   :white_check_mark:   |  sdcard > Android > data > com.owncloud.android > cache  |
| Shortcut      | 1st att :white_check_mark: | Remove file    | clean | :white_check_mark:     | :white_check_mark:      |  |
| Shortcut      | 1st att :x:                | Keep file    | file  |   :white_check_mark:   |  :white_check_mark:     | sdcard > Android > data > com.owncloud.android > cache    | 
| Shortcut      | 2nd att :white_check_mark: | Remove file    | clean |   :white_check_mark:   |   :white_check_mark:   |  sdcard > Android > data > com.owncloud.android > cache  |
| Auto Keep  | 1st att :white_check_mark: | Keep file    | clean |   :white_check_mark:   |  :white_check_mark:    |         |
| Auto Keep  | 1st att :x:                | Keep file    | file  |  :white_check_mark:   |   :white_check_mark:    |         |
| Auto Keep  | 2nd att :white_check_mark: | Keep file    | clean |  :white_check_mark:    |   :white_check_mark:   |         |
| Auto Rem.  | 1st att :white_check_mark: | Remove file  | clean |  :white_check_mark:   |  :white_check_mark:    |         |
| Auto Rem.  | 1st att :x:                | Keep file    | file  |  :white_check_mark:    |  :white_check_mark:     |         |
| Auto Rem.  | 2nd att :white_check_mark: | Remove file  | clean |  :white_check_mark:    |   :white_check_mark:   |         |
| External   | 1st att :white_check_mark: | Keep file    | clean |  :white_check_mark:    | :white_check_mark:     |         |
| External   | 1st att :x:                | Keep file    | file  |  :white_check_mark:   |   :white_check_mark:    |         |
| External   | 2nd att :white_check_mark: | Keep file    | clean |  :white_check_mark:    |   :white_check_mark:    |         |


___

**Automatic retry**

Connectivity loss

| Scenario   | Outcome                    | Local source | /tmp  | oC10 | oCIS | Comment |
|:----------:|:---------------------------|:------------:|:-----:|:----:|:----:| :------ |
| Manual     | 1st att :x:                | Keep file    | file  | :white_check_mark:     |   :white_check_mark:   | No pic in /tmp because ENQUEUED status      |
| Manual     | 2nd att :white_check_mark: | Keep file    | clean |    :white_check_mark:  |  :white_check_mark:     |         |
| Photo      | 1st att :x:                | Keep file    | file  |  :white_check_mark:    |  :white_check_mark:     |  sdcard > Android > data > com.owncloud.android > cache   |
| Photo      | 2nd att :white_check_mark: | Remove file    | clean |  :white_check_mark:    | :white_check_mark:      |  sdcard > Android > data > com.owncloud.android > cache  |
| Shortcut      | 1st att :x:                | Keep file    | file  |   :white_check_mark:   |  :white_check_mark:     | sdcard > Android > data > com.owncloud.android > cache    | 
| Shortcut      | 2nd att :white_check_mark: | Remove file    | clean |   :white_check_mark:   |   :white_check_mark:   |  sdcard > Android > data > com.owncloud.android > cache  |
| Auto Keep  | 1st att :x:                | Keep file    | file  |  :white_check_mark:    |  :white_check_mark:    |  No pic in /tmp because ENQUEUED status         |
| Auto Keep  | 2nd att :white_check_mark: | Keep file    | clean |  :white_check_mark:    |  :white_check_mark:     |         |
| Auto Rem.  | 1st att :x:                | Keep file    | file  |  :white_check_mark:    |  :white_check_mark:    |  No pic in /tmp because ENQUEUED status        |
| Auto Rem.  | 2nd att :white_check_mark: | Remove file  | clean |  :white_check_mark:    |  :white_check_mark:     |         |
| External   | 1st att :x:                | Keep file    | file  |  :white_check_mark:    |  :white_check_mark:     |         |
| External   | 2nd att :white_check_mark: | Keep file    | clean |    :white_check_mark:  |   :white_check_mark:    |         |

Corner cases:

- Manual upload + manual retry + automatic retry + success ✅ 
- Manual upload + automatic retry + manual retry + success ✅ 
- Auto upload + manual retry + automatic retry + success ✅ 
- Auto upload + automatic retry + manual retry + success ✅ 
- Photo upload + manual retry + automatic retry + success ✅ 
- Photo upload + automatic retry + manual retry + success ✅ 