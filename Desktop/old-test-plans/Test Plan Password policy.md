# Test Plan Password policy

## Previous requirements

Have a Desktop Client v2.1.0 ready to be used with owncloud



## Testing functionality

TestID | Test Case | Expected Result | Result | Related Comment
------------ | ------------- | -------------- | ----- | ------
1| Minimum characters: As admin put a minimum characters of 8   |  As user shares a folder with a password of less than 8 chars| User is correctly warned that the password isn't long enough, and the share is refused.|
2| Minimum characters: As admin put a minimum characters of 8   | As user shares a folder with a password of 8 chars| Folder is shared correctly.|
3| Minimum characters: As admin put a minimum characters of 8   | As user share a folder with a password of more than 8 chars| File is shared correctly.|
4| As admin put a minimum characters of 0, Having password mandatory for sharing | As user puts an empty password to a shared folder.| User is warned and folder is not shared|
5| Required  numerals: As admin put a minimum numeral characters of 3  | As user share a file with a password with more than 3 numeral chars| File is shared correctly|
6| Required  numerals: As admin put a minimum numeral characters of 3  | As user share a file with a password with less than 3 numeral chars| File is not shared and user is warned.|
7| Required  numerals: As admin put a minimum numeral characters of 3  | 1. As admin put a minimum numeral characters different than [0-72], special character, -1, emoji| An error occurs, user is warned|
8| Required  special characters: As admin put a minimum special characters of 3  | As user share a file with a password with more than 3 special chars| File is shared correctly|
9| Required  uppercase letters: As admin put a uppercase of 2 | As user share a file with 2 uppercase letters| File is shared correctly|
10| Required  uppercase letters: As admin put a uppercase of 2 | As user share a file with less than 2 uppercase letters| File is not shared and user is warned. Not enough uppercase characters.|
11| Required  special characters:As admin put a minimum special characters of 3 | 1. As admin put a minimum numeral characters different than [0-72], special character, -1, emoji| An error occurs, user is warned|
12| Determine special characters allowed: As admin only accept ^,ñ and / chars |  As user share a file with a password with ^,ñ and /|File is shared correctly.|
13| Determine special characters allowed: As admin only accept ^,ñ and / chars |  As user share a file with a password with ¿ and Ç |File is not shared. User is warned that those characters are not allowed.|
14| Determine special characters allowed: As admin only accept ^,ñ and / chars |  As admin allow as special characters  emoji or chinese icons |not sure, perhaps they should be accepted|
15| Determine special characters allowed: As admin only accept ^,ñ and / chars |As user share a folder putting a password which doesn't match the criteria |User is informed about the criteria, and it is clear so the user doesn't need to figure out it. Folder is not shared.|
16| Determine special characters allowed: As admin only accept ^,ñ and / chars |As user share a folder putting a password which doesn't match the criteria, using 8 chars, 1 uppercase, 2 numerals and a 'ç' instead of an 'ñ' |User is informed about the criteria, and it is clear so the user doesn't need to figure out it. Folder is not shared.|
17| Determine special characters allowed: As admin only accept ^,ñ and / chars | As user share a folder putting a password which  match perfectly  the criteri |Folder is shared correctly.|
18| Link expiration: Days to expire link if password is set| Established the link if password is 14 days|You can't create a link without password expiring after 14 days|
19| Link expiration: Days to expire link if password is not set| Established the link if password is not set at 3 days |You can't create a link without password expiring after 3 days|





