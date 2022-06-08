*** Settings ***
Resource    keywords.resource

*** Variables ***
${AMOUNT_WORKLOADS_PROCESSED}


*** Test Cases ***
Testcase 1
    [Tags]    1
    FOR  ${AMOUNT_WORKLOADS_PROCESSED}  IN RANGE  0    100
        Fetch Data from Camunda
        Process data
        Complete Task
    END
    