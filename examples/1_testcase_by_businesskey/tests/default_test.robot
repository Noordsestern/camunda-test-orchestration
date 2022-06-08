*** Settings ***
Resource    keywords.resource

*** Test Cases ***
Default Testcase
    [Tags]    default
    FOR  ${i}  IN RANGE  0    100
        Fetch Data from Camunda
        Process data
        Complete Task
    END