## Test Plan drawio

The toplevel checkmark indictes the test was performed.
The indented checkmarks indicate the results were as expected.

This is a quick smoke test only. We don't test drawio itself, only the integration with ownCloud.

* [ ] Enable the app
   * [ ] No problems found
* [ ] Disable and enable the app using CLI
   * [ ] No problems found
* [ ] Create a drawing file using the '+' button.
   * [ ] A template dialog appears.
   * [ ] An empty file with the suffix .drawio can be created created. 
   * [ ] Multiple other templates are available, choosing one, a prepopulated drawing appears.
* [ ] Save a drawing.
   * [ ] The content of the file is updated in the server.
* [ ] File locking
   * [ ] Multiple users cannot open a drawing for editing simultaneously. -> #5
   * [ ] all additional users see a readonly view, as if through a readonly share.
* [ ] editing through a share
   * [ ] Drawing file shared as read-write can be updated.
   * [ ] Drawing file in a shared folder can be updated, if the folder is shared rad/write
* [ ] view through readonly-share
   * [ ] A readonly version of the drawing is renderd. No editing menues appear, on save button is chosen.
* [ ] a drawio file uploaded through web or clients can be edited.
   * [ ] an error is shown, if a corrupt file was uploaded. -> #7
