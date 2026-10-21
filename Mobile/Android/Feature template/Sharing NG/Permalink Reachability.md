### Permalink Reachability

**Server(s)**: <br>
**Device(s)**: <br>
**Execution date**: <br>
**Tester**: <br>

| Test Case | Steps | Expected | Result | Comments |
|---|---|---|---|---|
| **Share reachability (oCIS)** | | | | |
| Share reachable — personal space | 1. On an oCIS account, open the file list for the personal space<br>2. Open the file menu for a single item | The `Share` option is shown even when `resharing` is `false` and the item has no `R` permission | | |
| Share reachable — custom space | 1. On an oCIS account, open a custom space with items whose `oc:permissions` is empty<br>2. Open the file menu for a single item | The `Share` option is shown | | |
| Share hidden — available offline | 1. On an oCIS account, open the available-offline shortcut<br>2. Open the file menu for a single item | The `Share` option is not shown | | |
| Share hidden — multiselection | 1. On an oCIS account, select two or more items<br>2. Open the multiselection menu | The `Share` option is not shown | | |
| **Permalink button (oCIS)** | | | | |
| Button shown | 1. On an oCIS account where `filesPrivateLinks` is not `FALSE`<br>2. Open the Share screen for an item that has a private link | The permalink (permanent link) button is shown in the Share header | | |
| Copy/send permalink | 1. Open the Share header for an item with a private link<br>2. Tap the permalink button | The item's private link is copied/sent (same behavior as oC10 `copyOrSendPrivateLink`) | | |
| Long-press permalink | 1. Open the Share header for an item with a private link<br>2. Long-press the permalink button | An informational toast explaining the private link is shown (same behavior as oC10) | | |
| Button hidden — no private link | 1. Open the Share header for an item with no private link (` val privateLinkDisabled = true` in ShareActivity.kt) | The permalink button is not shown | | |
| Button hidden — capability FALSE | 1. Use an account where `filesPrivateLinks` is `FALSE`<br>2. Open the Share header for any item | The permalink button is not shown | | |
| **Kiteworks servers (oCIS)** | | | | |
| Button not shown | 1. On an Kiteworks account where `filesPrivateLinks` is not `FALSE`| Share option not available | | |
| **Regression (oC10)** | | | | |
| Share gate unchanged | 1. On an oC10 account, open the file menu for various items (shared-with-me, no `R`, resharing off/on) | The `Share` option visibility is identical to the current behavior (no observable difference) | | |
| Permalink unchanged | 1. On an oC10 account, open the Share screen for an item with/without a private link | The permalink button shows/hides exactly as before | | |
| **Accessibility** | **One device** | | | |
| Talkback | 1. Enable Talkback<br>2. Navigate to the permalink button in the Share header | The permalink button is correctly announced and actionable | | |
| Keyboard | 1. Attach a physical keyboard via Bluetooth<br>2. Navigate to the permalink button | The button is reachable and actionable | | |
