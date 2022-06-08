# Experiments on test case orchestration

During Robocon 2022, attendees considered Camunda capabilities for test run orchestration. This repository provides examples for different approaches.

## Examples

### Business Key mapping Test Case Name
[In this example](examples/1_testcase_by_businesskey/README.md) each process instance maps to a specific test case. The mapping is created through the business key. 

# Improvements

## Parallelization
Examples execute test cases mostly sequentally. That often is the default in test automation as test cases may influence one anther. In case you are using an IDE to trigger test cases by mouseclick, you may realize that test cases fail when they to write their logs in the same place. So you need to take a few things in to consideration, like not writing logs all in the same place. There are a few approach for running test cases savely parallel:

## Pabot
[Pabot](https://pabot.org) is a robot executor allowing to run arbitrary amounts of test cases in parallel. Reports are merged afterwards automatically. Take a look at the execution time and testing time, which gives you a great indication how much time your just saved! 

Pabot comes with a library which allows locking of shared resources. If you do not need to share resources between test cases, you do not need to adapt your testcases at all and just start your test runs with `pabot` instead of `robot`.

## Robotframework Webservice
[robotframework-webservice](https://github.com/MarketSquare/robotframework-webservice) is a small project that lets you wrap robot suites in a small server and trigger them through REST API. Since each REST call gets its own log-folder, you won't struggle log-overrides. However, be aware that the projcet is still in beta, thus intensive usage might cause file system problems anyway.

## Cronjob

You can configure cronjobs executing each test case periodically. That approach works everywhere from Jenkins to K8s.