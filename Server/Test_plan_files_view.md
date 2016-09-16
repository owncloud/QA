## Improvements in files view




| Test Case                                | Expected Result                          | Result Chrome  | Result Firefox | Result Edge    | Result IE 11   | Result Safari  | Result public page | Related Comment |
| ---------------------------------------- | ---------------------------------------- | -------------- | -------------- | -------------- | -------------- | -------------- | ------------------ | --------------- |
| Move several entries from "a" into "b" while viewing "a" | Files are moved correctly                | :construction: | :construction: | :construction: | :construction: | 🚧             | 🚧                 |                 |
| Move several entries from "c" into "a" using drop on breadcrumb | Files are moved correctly                | :construction: | :construction: | :construction: | :construction: | :construction: | 🚧                 |                 |
| Move several entries from "a" into "c", hold on "b" to enter it, drop on "c" | Enters properly in "b" and files are moved | :construction: | :construction: | :construction: | :construction: | :construction: | 🚧                 |                 |
| Move several entries from "a" into "c", hold on "b" then "c" to enter it, drop on empty table space | Files are moved correctly                | :construction: | :construction: | :construction: | :construction: | :construction: | 🚧                 |                 |
| Move several entries from "c" into "a", hold on "a" breadcrumb, drop on empty table space | Files are moved correctly                | :construction: | :construction: | :construction: | :construction: | :construction: | 🚧                 |                 |
| Move entry into the same folder by dropping onto table space | Nothing happens (because it is not yet developed) | :construction: | :construction: | :construction: | :construction: | :construction: | 🚧                 |                 |
| Drag hold on a file (not folder) does nothing | Nothing fails, no warnings               | :construction: | :construction: | :construction: | :construction: | :construction: | 🚧                 |                 |
| Copy several entries from "a" into "b" while viewing "a" | Files are copied correctly               | :construction: | :construction: | :construction: | :construction: | :construction: | 🚧                 |                 |
| Copy several entries from "c" into "a" using drop on breadcrumb | Files are copied correctly               | :construction: | :construction: | :construction: | :construction: | :construction: | 🚧                 |                 |
| Copy several entries from "a" into "c", hold on "b" to enter it, drop on "c" | Enters properly in "b" and files are copied | :construction: | :construction: | :construction: | :construction: | :construction: | 🚧                 |                 |
| Copy several entries from "a" into "c", hold on "b" then "c" to enter it, drop on empty table space | Files are copied correctly               | :construction: | :construction: | :construction: | :construction: | :construction: | 🚧                 |                 |
| Copy several entries from "c" into "a", hold on "a" breadcrumb, drop on empty table space | Files are copied correctly               | :construction: | :construction: | :construction: | :construction: | :construction: | 🚧                 |                 |
| Having a/b/c copy several entries from "c" into "a" hold on "a" breadcrumb, drop inside | Files are copied correctly               | :construction: | :construction: | :construction: | :construction: | :construction: | 🚧                 |                 |
| Having a/b/c move several entries from "c" into "a", hold on "a" breadcrumb, drop on empty table space | Files are moved correctly                | 🚧             | :construction: | :construction: | :construction: | :construction: | 🚧                 |                 |
| Having encryption enabled copy entries into folders | Files are copied correctly               | 🚧             | 🚧             | 🚧             | :construction: | 🚧             | 🚧                 |                 |
| Having encryption enabled move entries into folders | Files are moved correctly                | 🚧             | 🚧             | 🚧             | :construction: | 🚧             | 🚧                 |                 |
| Using an ldap user copy some entries into a folder. | Files are copied correctly               | 🚧             | 🚧             | 🚧             | 🚧             | 🚧             | 🚧                 |                 |







