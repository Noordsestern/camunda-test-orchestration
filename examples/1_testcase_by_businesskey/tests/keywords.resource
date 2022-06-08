*** Settings ***
Library    CamundaLibrary

*** Variables ***
${WORKLOAD}
${TOPIC}    test_execution
${ASYNC_RESPONSE_TIMEOUT}    1000

*** Keywords ***
Process data
    Log    I am ${TEST NAME}
    Sleep    1s

Fetch Data from Camunda
    [Arguments]
    ${topic}    Get Variable Value    $TOPIC    Abort, because no topic set
    ${variables}    Fetch Workload    ${topic}    async_response_timeout=${ASYNC_RESPONSE_TIMEOUT}     business_key=${TEST NAME}
    ${fetch_response}    Get Fetch Response
    IF   not $fetch_response
        Pass Execution    Finished processing executions of test case "${TEST_NAME}".
    ELSE
        Set Suite Variable    ${TESTDATA}    ${variables}
    END