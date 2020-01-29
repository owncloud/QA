### Licensing

#### PRs: https://github.com/owncloud/ios-app/pull/571

Device/s: iPhoneX 13.3 <br>
Server: 10.3.2

---

Preconditions: Needed mail not associated to any Apple ID to use as Sandbox User. Sandbox users' suscriptions reduce the time of suscription to make testing affordable:

- 1 week of real suscription -> 3 minutes of sandbox suscription<br>
- 1 month -> 5 minutes<br>
- 2 months -> 10 minutes<br>
- 3 months -> 15 minutes<br>
- 6 months -> 30 minutes<br>
- 1 year -> 1 hour<br>
 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | 
| :-------- | :---- | :------- | :----: | :------------------------- | 
|**View**||||||
| Scanner | Open options | Scanner appears as "PRO" | P m13 |
| Shortcuts | Open Shortcuts app and try to create a shortcut over ownCloud | Warning pointing to Settings > Purchase | F m13 | Message to improve
| Purchasing card | Open a PRO feature (scanner) | Card is correctly displayed in both orientations | P m13 |
|**Purchase non-consumable**||||||
| Scanner | 1. Purchase the document scanner feature<br>2. Scan a document | 1. Feature unlocked (check also in Settings > Pro Features)<br>2. Feature works<br>2. Check in Settings > Purchases the correct date, quantity, product and type (purchase)  | P m13 |
| Shortcuts | 1. Purchase the shortcuts feature<br>2. Create a shortcut | 1. Feature unlocked (check also in Settings > Pro Features)<br>2. Feature works<br>2. Check in Settings > Purchases the correct date, quantity, product and type (purchase) | P m13 |
| Multiaccount | 1. Attach two accounts to app<br>2. Purchase the shortcuts feature<br>3. Add another account | Feature available in all accounts | F m13 | features unlocked in the second account
|**Subscription auto-renewable**||||||
| Pro 1 year | 1. In AppStoreConnect, set the pro as 1 year<br>2. Purchase the pro subscription  | 2. Scanner and Shortcuts unlocked (check also in Settings > Pro Features)<br>2. Features work<br>2. Check in Settings > Purchases the correct start date, quantity, product, type (suscription) and end date (1 hour later) | P m13 |
| Pro 1 month | 1. In AppStoreConnect, set the pro as 1 month<br>2. Purchase the pro subscription | 2. Scanner and Shortcuts unlocked (check also in Settings > Pro Features)<br>2. Features work<br>2. Check in Settings > Purchases the correct start date, quantity, product, type (suscription) and end date (5 minutes later) | P m13 |
| Correct renewal | Purchase the pro subscription for 1 year | Scanner and Shortcuts unlocked (check also in Settings > Pro Features)<br>Features work<br>Check in Settings > Purchases the correct start date, quantity, product, type (suscription) and end date (1 hour later)<br>After 1 hour, the features keep unlocked and a new purchase was added to Settings > Purchases | P m13  |
| No more renewals | Wait 5 renewals (maximum for sandbox users) | Features are locked (check also in Settings > Pro Features) | P m13 | 
| Manage Suscriptions | 1. Purchase the pro subscription<br>2. Settigs > Purchases > Manage Suscription | ? | F m13 | Blank page
| Multiaccount | 1. Attach two accounts to app<br>2. Subscribe the pro features<br>3. Add another account | Features available in all accounts | P m13 |
| Periodical Shortcuts | 1. Subscribe the pro features for 2 months<br>2. Create a shortcut executed every hour<br>3. Wait till subscription expires | After expired suscription, shortcut is not executed anymore | P m13 | Notification raises, correct |
| Multiple operations | 1. Purchase a feature (scanner f .ex)<br>2. Subscribe the pro features<br>3. Wait till the subscription expires | Scanner available, the other pro features don't | P m13 |
|**Restore purchases**|||||
| No Purchases | 1. Install the app<br>2. Settings > Purchases > Restore purchases | No purchases in the list | P m13 |
| Purchase | 1. Purchase the scanner<br>2. Remove the app<br>3. Reinstall the app<br>4. Settings > Purchases > Restore purchases | 3. Scanner is not available<br>4. Scanner is available and list in Settings > Purchases is correct| P m13 |
| Suscription | 1. Subscribe the pro features<br>2. Remove the app<br>3. Reinstall the app<br>4. Settings > Purchases > Restore purchases | 3. Pro features are not available<br>4. Features are available and list in Settings > Purchases is correct| P m13 |
| Purchase and Suscription | 1. Purchase a featurez<br>2. Subscribe the pro features<br>3. Remove the app<br>4. Reinstall the app<br>5. Settings > Purchases > Restore purchases | 4. Pro features are not available<br>5. Features are available and list in Settings > Purchases is correct| P m13 |
|**App Store parameters**|||||
| Purchase Pricing | In AppStoreConnect, change the price of a purchase | Price is correct in the app  | P m13 t13 |
| Suscription Pricing | In AppStoreConnect, change the price of the suscription | Price is correct in the app  | NA | Static
| Suscription Duration | In AppStoreConnect, change the duration of the suscription | Duration is correct displayed in the app (in the purchasing card)  | P m13 |
|**Error handling**|||||| 
| No connection | Try to perform a purchase/suscription with no connection/ plane mode | Correct error | F m13 | No error feedback
|**iOS < 13**||||||
| Not available | Install app in device iOS < 13 | Settings does not contain "Pro features" menu. Shortcuts and Scanner does not appear in the app | F m12 | Features available
