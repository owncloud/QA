# QA
Repository for public test plans for owncloud mobile apps


###Test Plan name

number pr + [number library pr] + name branch

Examples:   

1168-avoidDuplicateFiles.md

529-108-search_result_as_web_interface.md

###Devices code

type of device + version 

Examples:

Passed test case with mobile version 9: P(m9)

Failed test case with tablet/ipad version 9: F(t9)


###Integration DEV-QA

**1.[Developing US]** Dev create **new UserStory(US) branch**

**2.[Developed]** After developed, create **new PR US**

**3.[CODE REVIEW]** Update branch with new changes

**4.[QA ISSUE]** After code review, QA create **new issue** with US PR link, labels <em>“iOS/Android/Desktop client/Server”, “1.To develop"</em> and <em>"milestone"</em>

**5.[QA TestPlan]** create **new test plan template branch**, and in QA issue add label <em>“2.Developing”</em> into QA issue

**6.[QA PR]** After created new test plan template, create **new QA PR**, add label <em>"iOS/Android/Desktop client/Server"</em>, and add link QA PR into issue in QA repo

**7.[QA PR REVIEWED]** After reviewed QA test plan template PR, **merge** and in QA issue add label <em>"3.To review”</em> 

**8.[VALIDATING US]**  Pass test plan (in a comment in the issue or another file for longer test plan). Fix bugs found, **[CODE REVIEW and QA again if needed]**

**9.[VALIDATED US]** After validated US PR with new testPlan, add into QA issue labels <em>“4.To release"</em>, **close QA issue**, and add label <em>“approved by QA”</em> into US PR

**10.[DEV MERGE US PR]** Merge US PR and delete branch
