# Testcase by business key

In this scenario we have a simple test pipeline.

1. Start process, using name of testcase as *business key* for each process instance
1. Each testcase fetches on the same topic, but filters process instances on `business key`

# Execution
1. Deploy model using [`Deploy process` task from `camunda_helper.robot`](camunda_helper.robot#L13)
1. Start a few test cases using the different tasks from [`camunda_helper.robot`](camunda_helper.robot)`
1. Validate (i.e. with Camunda Cockpit) that several process instances are waiting at the *Execute Test* task.
1. Run test cases: `robot examples/1_testcase_by_businesskey/tests`

Logs will show that every test case was executed sequentially:
```bash
> robot -d logs -b debug.log examples/1_testcase_by_businesskey/tests
==============================================================================
Tests                                                                         
==============================================================================
Tests.Default Test                                                            
==============================================================================
Default Testcase                                                      | PASS |
Finished processing executions of test case "Default Testcase".
------------------------------------------------------------------------------
Tests.Default Test                                                    | PASS |
1 test, 1 passed, 0 failed
==============================================================================
Tests.Test1                                                                   
==============================================================================
Testcase 1                                                            | PASS |
Finished processing executions of test case "Testcase 1".
------------------------------------------------------------------------------
Tests.Test1                                                           | PASS |
1 test, 1 passed, 0 failed
==============================================================================
Tests.Test2                                                                   
==============================================================================
Testcase 2                                                            | PASS |
Finished processing executions of test case "Testcase 2".
------------------------------------------------------------------------------
Tests.Test2                                                           | PASS |
1 test, 1 passed, 0 failed
==============================================================================
Tests                                                                 | PASS |
3 tests, 3 passed, 0 failed
==============================================================================
```


# Implementation
Key concept is that *name of testcase* and *busiess key of proces instance* match. When that's the case, the Robot testcase can collect its testdata with the following command:

```robot
${testdata}    Fetch Workload    ${topic}    business_key=${TEST NAME}
```
where `${topic}` is the value matching the topic name provided in process model.