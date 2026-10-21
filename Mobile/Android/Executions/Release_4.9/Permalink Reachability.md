### Permalink Reachability

**Server(s)**: oCIS 8.2.0<br>
**Device(s)**: Xiaomi Redmi 13, Android 15 <br>
**Execution date**: 20/10/2026<br>
**Tester**: jrecio<br>

| Test Case | Steps | Expected | Result | Comments |
|---|---|---|---|---|
| **Share reachability (oCIS)** | | | | |
| Share reachable — personal space | 1. On an oCIS account, open the file list for the personal space<br>2. Open the file menu for a single item | The `Share` option is shown even when `resharing` is `false` and the item has no `R` permission | P m15 t14 | |
| Share reachable — custom space | 1. On an oCIS account, open a custom space with items whose `oc:permissions` is empty<br>2. Open the file menu for a single item | The `Share` option is shown | P m15 t14 | |
| Share hidden — available offline | 1. On an oCIS account, open the available-offline shortcut<br>2. Open the file menu for a single item | The `Share` option is not shown | P m15 t14 | |
| Share hidden — multiselection | 1. On an oCIS account, select two or more items<br>2. Open the multiselection menu | The `Share` option is not shown | P m15 t14 | |
| **Permalink button (oCIS)** | | | | |
| Button shown | 1. On an oCIS account where `filesPrivateLinks` is not `FALSE`<br>2. Open the Share screen for an item that has a private link | The permalink (permanent link) button is shown in the Share header | P m15 t14 | |
| Copy/send permalink | 1. Open the Share header for an item with a private link<br>2. Tap the permalink button | The item's private link is copied/sent (same behavior as oC10 `copyOrSendPrivateLink`) | P m15 t14 | |
| Long-press permalink | 1. Open the Share header for an item with a private link<br>2. Long-press the permalink button | An informational toast explaining the private link is shown (same behavior as oC10) | P m15 t14 | |
| Button hidden — no private link | 1. Open the Share header for an item with no private link | The permalink button is not shown | NA | Every item returns a link |
| Button hidden — capability FALSE | 1. Use an account where `filesPrivateLinks` is `FALSE` (` val privateLinkDisabled = true` in ShareActivity.kt)<br>2. Open the Share header for any item | The permalink button is not shown |  P m15 t14 | |
| **Kiteworks servers (oCIS)** | | | | |
| Button not shown | 1. On an Kiteworks account where `filesPrivateLinks` is not `FALSE`| Share option not available | F m15 t14 | [BUG](https://github.com/owncloud/android/pull/5022#issuecomment-6309729348). Will fix in [5008](https://github.com/owncloud/android/issues/5008) |
| **Regression (oC10)** | | | | |
| Share gate unchanged | 1. On an oC10 account, open the file menu for various items (shared-with-me, no `R`, resharing off/on) | The `Share` option visibility is identical to the current behavior (no observable difference) | P m15 t14 | Non reachable, but expected (legacy behavior)|
| Permalink unchanged | 1. On an oC10 account, open the Share screen for an item with/without a private link | The permalink button shows/hides exactly as before | NA | Every item has link |
| **Accessibility** | **One device** | | | |
| Talkback | 1. Enable Talkback<br>2. Navigate to the permalink button in the Share header | The permalink button is correctly announced and actionable | P m15 | |
| Keyboard | 1. Attach a physical keyboard via Bluetooth<br>2. Navigate to the permalink button | The button is reachable and actionable | P m15 | |
