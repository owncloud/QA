# QA
Repository for public test plans for owncloud components and apps

###Integration DEV-QA

**1.[QA ISSUE]** QA create **new issue** with labels <em>“iOS/Android/Desktop client/Server”, “1.To develop"</em> and <em>"milestone"</em>

**2.[QA TestPlan]** create **new test plan template branch**, and in QA issue add label <em>“2.Developing”</em> into QA issue

**3.[QA PR]** After created new test plan template, create **new QA PR**, add label <em>"iOS/Android/Desktop client/Server"</em>, and add link QA PR into issue in QA repo

**4.[QA PR REVIEWED]** After reviewed QA test plan template PR, **merge** and in QA issue add label <em>"3.To review”</em> 

**5.[VALIDATING US]**  Pass test plan (in a comment in the issue or another file for longer test plan). Fix bugs found, **[CODE REVIEW and QA again if needed]**

**6.[VALIDATED US]** After validated US PR with new testPlan, add into QA issue labels <em>“4.To release"</em>, **close QA issue**
