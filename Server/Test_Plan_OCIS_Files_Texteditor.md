# Markdown Editor

Test Case

| Test Case |  Expected result | Result  | Related Comment |
| :---------| :-------------- | :------:| --------------- |
| Toggle (fullscreen in page,fullscreen,preview,previewonly,html preview,catalog)  | It works |  | |
| Paste a URL link and click it | URL should open in new tab (user should not loose any progress)|  | |
| No external links should be present eg. github link | no external link |  | |
| Add an markdown image manually `![alt](url)` | image should render |  | |
| Upload image in editor (add image link,upload image) | image should render |  | |
| Use inline and block formulas (`$x+y^{2x}$`,`$$ \sqrt[3]{x} $$`) | formulas should render correctly |  | |
| Create a mermaid diagram | Mermaid diagram should render correctly|  | |
| Add code blocks | should render correctly |  | |
| Move the cursor (when editing long documents) | preview should follow the cursor|  | |


The editor should have a FAQ or a tooltip that should include:
- programming languages supported in fenced code blocks
- supported shortcuts on Windows and Mac
