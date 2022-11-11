### Case 1: admin share folder(with file) to marie:

Admin:
- [ ] upload big file 10gb (Show details, pause upload, resume upload work correct)
- [ ] upload folder with 803 small images.
- [ ] Check pagination, count items per page.
- [ ] upload folder(drag folder) "folder_to_share" with sample.pdf
- [ ] share folder "folder_to_share" to marie with editor role

Marie:
- [ ] accept "folder_to_share"
- [ ] upload new file "file.txt" to "folder_to_share" (admin sees file.txt)
- [ ] open sample.pdf
- [ ] rename sample.pdf to file.pdf (use rigth click) (admin now sees file.pdf)

Admin:
- [ ] add new file.jpeg to "folder_to_share"
- [ ] move file.pdf to root (ctrl x -> ctrl v) "personal" (marie can not see file.pdf)
- [ ] add new "file.txt" (select replace option) create new version. (use drag and drop)
- [ ] open "file.tx" in markdown-editor. Change and save. (admin sees "file.txt" updated)

Marie:
- [ ] can download both versions
- [ ] can restore old version

Admin:
- [ ] change share "folder_to_share" from role "editor" to "viewer" (marie cannot rename/move/delete files in folder and cannot create new document in the folder)

Marie:
- [ ] can decline "folder_to_share" 
- [ ] can accept again

Admin:
- [ ] delete folder "folder_to_share" (removed from shared with me, removed from Marie)

## Case 2: admin share file to marie:

Admin:
- [ ] upload file.jpeg
- [ ] share file.jpeg to marie with role viewer (use main menu. find marie by email marie@example.org)

Marie:
- [ ] accept file
- [ ] can open/download file
- [ ] can share/copy quicklink
- [ ] cannot delete/move/rename file

Admin:
- [ ] share share "file.txt" with editor role

Marie:
- [ ] change content of the file (can see new version)

Admin:
- [ ] remove share "file.jpeg" (marie cannot see "file.jpeg")

## Case 3: admin create public links to folder

Admin:
- [ ] create folder "for upload"
- [ ] add link with name "to_upload" with role "Uploader" with password and expiration date
- [ ] open link and enter password (can only upload)
- [ ] upload file (admin can see new file)
- [ ] change share "for upload" from "Uploader" to "editor"
- [ ] admin add new file to folder "for upload"
- [ ] refresh link (file exist)
- [ ] admin changes password (refresh link has to type new password)

## Case 4: admin create link to file

Admin:
- [ ] create file png
- [ ] add link with main menu
- [ ] open link(can open, download, see) in the incognito tab
- [ ] edit link by adding password
- [ ] refresh page (input password)
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
- [ ] add member Marie with editor role
- [ ] add member Einstein with viewer role

Marie:
- [ ] can see space without accepting
- [ ] change image and description
- [ ] can upload file/folder and create file and folder
- [ ] can create resource but cannot share space or space resource
- [ ] can see deleted files and can restore files from trash
- [ ] cannot disable space

Einstein:
- [ ] can see space without accepting
- [ ] cannot change image and description
- [ ] cannot upload file/folder and create file and folder
- [ ] cannot create resource and share space
- [ ] can see deleted files and cannot restore files from trash
- [ ] cannot disable space

## Case 6: create new user via accounts:
Admin:
- [ ] create new user account
- [ ] create new group
- [ ] add user to group
- [ ] share folder with group
- [ ] change language
- [ ] delete users

## Case 7: Search
- [ ] personal space
- [ ] project space
- [ ] share jail
