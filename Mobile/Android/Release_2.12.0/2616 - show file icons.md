###  Show file icons

#### Pr: https://github.com/owncloud/android/pull/2616

Devices: Pixel2 v9 <br>
Server: 10.2.1

---

 
| Test Case | Actions | Expected | Result | Related Comment / Bug link | 
| :-------- | :------- | :----- | :------ | :-------------------------
|**App**||||||
| No shared | Item not shared   | No icons | P m9 |  |  |
| Private | Share a non-shared item with an user/group  | Private share icon | P m9 |  |  |
| Private II | Share an already shared item with another user/group  | Private share icon  | P m9 |  |  |  |
| Public | Share a non-shared item publicly | Public share icon | P m9 |  |  |  |
| Public II | Share an already shared item publicly | Public share icon | P m9 |  |  |  |
| Private + Public | Share publicly an private shared item | Public share icon | P m9 |  |  |  |
| Unshare Private | Unshare an item private shared | No share icons | P m9 |  |  |  |
| Unshare Public | Unshare an public shared item | No share icons | P m9 |  |  |  |
| Unshare Private + Public | Unshare publicly an item private and public shared  | Private share icon | P m9 |  |  |  |
| Unshare Public + Private | Unshare private an item private and public shared  | Public share icon | P m9 |  |  |  |
|**External**||||||
| Private | From web UI, share a non-shared item with an user/group  | In app, private share icon | P m9 |  |  |
| Private II | From web UI, share an already shared item with another user/group  | In app, private share icon  | P m9 |  |  |  |
| Public | From web UI, share a non-shared item publicly | In app, public share icon |  |  |  |  |
| Public II | From web UI, share an alreadyshared item publicly | In app, public share icon |  |  |  |  |
| Private + Public | From web UI, share publicly an private shared item | In app, public share icon |  |  |  |  |
| Unshare Private | From web UI, unshare an item private shared | In app, no share icons |  |  |  |  |
| Unshare Public | From web UI, unshare an public shared item | In app, no share icons |  |  |  |  |
| Unshare Private + Public | From web UI, unshare publicly an item private and public shared  | In app, private share icon |  |  |  |  |
| Unshare Public + Private | From web UI, unshare private an item private and public shared  | In app, public share icon |  |  |  |  |