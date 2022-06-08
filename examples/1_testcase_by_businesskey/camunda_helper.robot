*** Settings ***
Library    CamundaLibrary

*** Keywords ***
Start testcase
    [Arguments]    ${business_key}
    Start Process    test_scheduler    business_key=${business_key}

Deploy demo model
    Deploy    ${CURDIR}/../models/test_scheduler.bpmn

*** Tasks ***
Deploy process
    [Tags]    deploy
    Deploy demo model

Start default testcase
    Start testcase    Default Testcase

Start testcase 1
    Start testcase    Testcase 1

Start testcase 2
    Start testcase    Testcase 2