*** Settings ***
Resource    keywords.resource

*** Variables ***
${AMOUNT_WORKLOADS_PROCESSED}

*** Test Cases ***
Testcase 2
    [Tags]    2
    FOR  ${AMOUNT_WORKLOADS_PROCESSED}  IN RANGE  0    100
        Fetch Data from Camunda
        Process data
        Complete Task
    END