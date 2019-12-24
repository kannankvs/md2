# Development Guide

## Workflow

All SONiC source code repositories follow a similar branching paradigm, as described in detail below.

 - Master: This branch is always intended to be stable. Pull requests to master are expected to come from **finished features branches** which have been shown to implement and pass all defined tests.
 - Release: Official builds of the repository are based off these branches (e.g. 201811, 201910). Only pull requests for bug fixes will be accepted.
 - Feature: Feature branches are where development occurs prior to submitting a pull request to master. Feature branches should not be created on the main repository, but rather on forked copies of the project repository. Forked repositories should periodically (i.e. weekly) rebase onto master.

We're following basic GitHub Flow. If you have no idea what we're talking about, check out [GitHub's official guide](https://guides.github.com/introduction/flow/). Note that merges are only performed by the repository maintainer.

## Design Specs For New Features

If you are a developer who plans on developing new features for SONiC, you need to follow the [[ Design Guidelines ]] first and write a design spec. Here are some examples:
  * [ACL](https://github.com/Azure/SONiC/blob/master/doc/acl/ACL-High-Level-Design.md)
  * [[ ECMP and LAG Hash Seed ]]
  * [[ Enable ECN on lossless queues ]]
  * [[ LogAnalyzer ]]
  * [Management Framework](https://github.com/Azure/SONiC/blob/master/doc/mgmt/Management%20Framework.md)
  * [[ MMU Allocation ]]
  * [NAT](https://github.com/Azure/SONiC/blob/master/doc/nat/nat_design_spec.md)
  * [[ PFC Watchdog Design]]
  * [Port Breakout and Speed](https://github.com/Azure/SONiC/wiki/Port-Breakout-and-Speed-Requirements)
  * [Sub Port Interface](https://github.com/Azure/SONiC/blob/master/doc/subport/sonic-sub-port-intf-hld.md)
  * [TACACS+](https://github.com/Azure/SONiC/blob/master/doc/aaa/TACACS%2B%20Authentication.md)
  * [Warm Reboot](https://github.com/Azure/SONiC/blob/master/doc/warm-reboot/SONiC_Warmboot.md)

## Test Plans For New Features

If you are developing new features for SONiC, or if you are adding further tests for existing features, you should also write a test plan. Here are some examples:
  * [[ ACL Test Plan ]]
  * [BSL Test Plan](https://github.com/Azure/SONiC/blob/master/doc/Sonic%20BSL%20Test%20plan.md)
  * [[ DHCP Relay Agent Test Plan ]]
  * [[ Everflow Test Plan ]]
  * [[ FIB Scale Test Plan ]]
  * [[ IPv4 Decapsulation Test ]]
  * [[ LAG Feature Test Suite ]]
  * [[ VLAN Feature Test Suite ]]

## Development Tutorials

We also have some tutorials for common SONiC development tasks, and some debugging tips:

  * [[ HOWTO Commit a code in SONiC  ]]
  * [[ HOWTO Compile and Run SAI Server Docker ]]
  * [[ HOWTO Reset syncd Docker ]]
  * [[ HOWTO Write a PTF Test ]]
  * [[ Using swssconfig to apply configuration ]]
  * [[ How to Deploy SONiC ]]
  * [[ How to Use SAI Player ]]