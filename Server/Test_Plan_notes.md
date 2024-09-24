## 'Notes' Test Plan

## Setup

`bash hetzner-deploy/oc10.sh notes`

## Testing functionality

* [ ] Update from notes app 2.0.5
   - [ ] User receives shared Notes folder
   - [ ] User starts the old notes app, happily adds notes (which is a security issue)
   - [ ] Admin updates to the notes app including #488
   - [ ] The new notes app changes notesRoot to a 'Notes (2)' folder. Which is now empty.
   - [ ] User panics, as he believes all his notes are lost. (Until he realizes the exiatance of the original 'Notes' folder.)
      --> https://github.com/owncloud/notes/pull/488#issuecomment-2364028100

* [ ] #488 share an existing Notes folder
   - [ ] `echo "insert into oc_preferences values ( 'admin', 'notes', 'notesRoot', 'NotesDir');"  | mysql owncloud`
   - [ ] add some notes.
   - [ ] share the /NotesDir folder with other user
   - [ ] add some more notes. Check for newly created '/NotesDir (2)' folder. None expected.
   - [ ] Old notes should be still there. They are.

* [ ] #488 configure notesRoot into a subfolder of a share
   - [ ] Share folder /Shared with other user.
   - [ ] `echo "update oc_preferences set configvalue = '/Shared/NotesSub' where userid='admin' and appid='notes' and configkey='notesRoot'"  | mysql owncloud`
   - [ ] Add some notes. Check for newly created toplevel folder 'Notes'.
   - [ ] Add some more notes. Are multiple `/Shared/NotesSub (\d)` folders created? No.

----
