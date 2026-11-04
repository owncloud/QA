

### DEX code optimization

**Server(s)**: oCIS 8.2.1, oC 11.0.1<br>
**Device(s)**: Xiaomi Redmi 13, Android 15<br>
**Execution date**: 04/11/2026<br>
**Tester**: jrecio<br>

Tested with `release` build.`debug` builds not affected.

| Test name | Steps to execute | Expected result | Result | Comments |
|---|---|---|---|---|
| Release build compiles | Run `./gradlew assembleOriginalRelease` | Build succeeds, APK produced | Passed | |
| Mapping file generated | Check `owncloudApp/build/outputs/`<br>`mapping/originalRelease/mapping.txt`<br> after release build | File exists and is non-empty | Passed | |
| Debug build unaffected | Run `./gradlew assembleOriginalDebug` | Build succeeds, no minification applied | Passed | |
| Unit tests pass | Run `./gradlew testDebugUnitTest`<br>` testMdmDebugUnitTest` | All tests green | Passed | Run in CI |
| Detekt zero issues | Run `./gradlew detekt` | Zero issues reported | Passed | Run in CI |
| Login works in release APK | Install release APK, open app, log in to an ownCloud server | Login completes, files listed | P m15 | |
| File listing works | Navigate through folders in release APK | Folders and files display correctly | P m15 | |
| File upload works | Upload a file from the release APK | File appears on server | P m15 | |
| File download works | Download a file in the release APK | File saved locally and opens correctly | P m15 | |
| Background sync works | Trigger automatic upload via release APK | Upload worker completes with no `ClassNotFoundException` | P m15|Tested with av. offline |
| Moshi deserialization works | Perform any server request returning JSON (e.g. capabilities, spaces) in release APK | Response parsed correctly, no deserialization errors | P m15 | |
| App registry providers persist across updates | 1. Build a release APK from this branch and install it on a device<br>2. Open a file that has office app support so the app fetches and caches app registry data from the server<br>3. Make a trivial change (e.g. bump a string constant) to force a different R8 obfuscation mapping, build a second release APK, and install it over the top without uninstalling.<br>4. Open the same file again. Note: using a pre-PR `master` build as the "before" APK is not suitable because `master` has `minifyEnabled false` and R8 is inactive, so no obfuscation mapping exists to conflict. Both APKs must be R8-enabled release builds from this branch. | "Open in web" / office app options still appear after the update, no silent data loss | P m15 | All "Open in" correct|
| Custom views inflate correctly in release APK | Navigate to the file list sort options (`SortOptionsView`), passcode screen (`NumberKeyboard`, `SquareFrameLayout`), and image preview (`ViewPagerWorkAround`) in a release APK | All views render correctly with no `ClassNotFoundException` or inflation crash, confirming AAPT-generated rules are sufficient without explicit keep rules in `proguard-rules.pro` | P m15 | |
| Settings navigation works | Tap each item in the Settings screen in a release APK | Each sub-screen opens without a crash (`ClassNotFoundException`) | P m15 | |
| Wildcard settings rule covers subclasses | Tap each item in the Settings screen in a release APK built after replacing the per-class rules with the wildcard | Each sub-screen opens correctly, confirming the wildcard `-keep class * extends PreferenceFragmentCompat` resolves all subclasses without enumerating them individually | P m15 | |