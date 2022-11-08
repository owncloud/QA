### Case 1: admin share folder(with file) to marie:

Admin:
- [ ] upload big file 10gb (Show details, pause upload, resume upload work correct)
- [ ] upload folder with 803 small images.
- [ ] Check pagination, count items per page. Have a bug https://github.com/owncloud/web/issues/6768
- [ ] upload folder(drag folder) "folder_to_share" with file.pdf
- [ ] share folder "folder_to_share" to marie with edit right

Marie:
- [ ] accept "folder_to_share"
- [ ] rename "folder_to_share" - cannot rename folder in new implementation
- [ ] upload new file "file.txt" to "folder_to_share" (admin see new file)
- [ ] open pdf file
- [ ] rename file.pdf (use rigth click) (admin see that file changed name)

Admin:
- [ ] add new file.jpeg to "folder_to_share"
- [ ] move file.pdf to root "personal" (marie can not see file.pdf) cmd c -> cmd v
- [ ]  add new "file.txt" create new version. (use drag and drop)
- [ ] open txt file in markdown-editor. Change and save.

Marie:
- [ ] can download both versions
- [ ] restore old version

Admin:
- [ ] change share "folder_to_share" from "edit" to "viewer" (marie cannot rename/move/delete/download file in folder and cannot create new document in the folder)

Marie:
- [ ] decline folder (removed from shares folder)
- [ ] accept again

Admin:
- [ ] delete folder "folder_to_share" (removed from shared with me, removed from Marie)

## Case 2: admin share file to marie:

Admin:
- [ ] upload file.jpeg
- [ ] share file.jpeg to marie with rigth viewer (use main menu. find marie by email marie@example.org)

Marie:
- [ ] accept file (marie can open/download/copy file but cannot delete/move/rename)
- [ ] open file in Mediaviewer
- [ ] download file

Admin:
- [ ] share share "file.txt" with edit right

Marie:
- [ ] rename file - cannot rename in new implementation
- [ ] change content of the file (can see new version)

Admin:
- [ ] unshare "file.jpeg" (marie cannot see "file.jpeg")

## Case 3: admin create public links to folder

Admin:
- [ ] create folder "for upload"
- [ ] add link with name "to_upload" with role "Uploader" with pass and expiration date
- [ ] open link (can only upload)
- [ ] upload file (admin can see new file)
- [ ] change share "for upload" from "Uploader" to "edit"
- [ ] admin add new file to folder "for upload"
- [ ] refresh link (file exist)
- [ ] admin change pass (refresh link has to type new pass)

## Case 4: admin create link to file

Admin:
- [ ] create file png
- [ ] add link with main menu
- [ ] open link(can open, download, see) in the incognito tab
- [ ] change link, add pass
- [ ] refresh page (input pass)
- [ ] delete link
- [ ] refresh page (resource not found)
- [ ] delete file
- [ ] restore
- [ ] delete
- [ ] Empty trash

## Case 5: space story:
Katherine:
- [ ] create space
- [ ] add space image
- [ ] add subtitle "for test"
- [ ] edit description
- [ ] try to upload file (more 1 Gb)
- [ ] increase quota to 5Gb and try again
- [ ] delete file
- [ ] add member Marie with edit role
- [ ]  add member Einstein with viewer role

Marie:
- [ ] can see space without accepting
- [ ] change image and description
- [ ] can upload file/folder and create file and folder
- [ ] cannot create resource sharing and space sharing
- [ ] can see deleted files and can restore files from trash
- [ ] cannot disable space

Einstein:
- [ ] can see space without accepting
- [ ] cannot change image and description
- [ ] cannot upload file/folder and create file and folder
- [ ] cannot create resource sharing and space sharing
- [ ] can see deleted files and cannot restore files from trash
- [ ] cannot disable space

## Case 6: create new user via accounts:
Admin (test via api):
- [ ]  create new account "tom" use graph Api
- [ ] create new group
- [ ] add user to group
- [ ] share folder with group
- [ ] change language
- [ ] delete users

## Case 7: Search
- [ ] personal space
- [ ] project space
- [ ] share jail - doesn't work
