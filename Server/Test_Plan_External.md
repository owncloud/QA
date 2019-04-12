## 'External' Test Plan

- Run Test plan by setting up ownCloud in http and https

### :heavy_exclamation_mark: note
- Some sites dont allow rendering from different origin. In that case external sites may not load in ownCloud. Make sure the external site under test allows rendering from different origin.

## Testing functionality

Test Case | Expected Result | Result | Related Comment
------------- | -------------- | ----- | ------
**CLI commands** |  |   |
|  |   |
Enable External app via CLI using ```occ app:enable external``` | The app gets enabled | :construction:  |
Disable External app via CLI using ```occ app:disable external``` | The app gets disabled | :construction:  |
**WEBUI tests** |  |   |
|  |   |
The admin adds a new external site using webUI | The external site icon must be visible in the apps menu | :construction: |
The admin adds invalid url in the add external sites menu | The admin should see an error message in the webUI | :construction: |
The admin adds a new external site using webUI, logs out and a user logs in | The external site icon must be visible on apps menu | :construction: |
The admin adds multiple external sites using the webUI | All the added external site icons must be visible on the apps menu | :construction: |
The admin adds an external site and clicks on the icon for external site in the apps menu | The admin must see the page for the external site in the webUI | :construction: |
The admin adds an external site, logs out, a user logs in and clicks on the icon for external site in the apps menu | The user must see the page for the external site in the webUI | :construction: |
 The admin edits an existing external site's url and clicks the icon for that external site in the apps menu | The admin must see the page for newly edited external site in the webUI | :construction: |
The admin deletes an external site from the external site settings page | The external site icon should not be visible on the apps menu | :construction: |
The admin adds an external site with different type of encryption from the external site settings page  | The external site icon must be visible in the apps menu | :construction: |
The admin adds an external site with different type of encryption and clicks the icon on the apps menu | The external site page should not be visible in the webUI | :construction: |
**webUI with several browsers** |  |   |
Check that external sites are shown properly using Safari as browser |  | :construction:  |
Check that external sites are shown properly using Chrome as browser |  | :construction:  |
Check that external sites are shown properly using Firefox as browser |  | :construction:  |
Check that external sites are shown properly using IE 11 as browser |  | :construction:  |
Check that external sites are shown properly using Edge as browser |  | :construction:  |
