# QA
Repository for public test plans for owncloud components and apps

###Integration

**1.[QA ISSUE]** QA create **new issue** for the new feature to test, with labels <em>“iOS/Android/Desktop client/Server”, “1.To develop"</em> and <em>"milestone"</em>

**2.[QA TestPlan]** create **new test plan template branch**, and in QA issue add label <em>“2.Developing”</em> into QA issue

**3.[QA PR]** After created new test plan template, create **new QA PR**, add label <em>"iOS/Android/Desktop client/Server"</em>, and add link QA PR into issue in QA repo

**4.[QA PR REVIEWED]** After reviewed QA test plan template PR, **merge** and in QA issue add label <em>"3.To review”</em> 

**5.[VALIDATING]**  Pass test plan (in a comment in the issue or another file for longer test plan).

**6.[VALIDATED]** After validated new feature with the testPlan, add into QA issue label <em>“4.To release"</em>, **close QA issue**
