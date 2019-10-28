# SONiC 201910 Release Notes

This document describes the SONiC changes done for new features,  and enhancements on existing features/sub-features.



## Table of Contents

   * [SONiC 201910 Release Notes](#sonic-201910-release-notes)
      * [Table of Contents](#table-of-contents)
         * [BRANCH LOCATION](#branch-location)
         * [DEPENDENCY VERSION](#dependency-version)
         * [FEATURE LIST](#feature-list)
         * [Security Updates](#security-updates)
         * [SAI APIs](#sai-apis)
         * [Enhancements](#enhancements)

<br><br>

### Branch Location  

<br><br><br><br>



### Dependency Version

| Linux kernel version      | :    |
| ------------------------- | ---- |
| SAI   version             | :    |
| FRR                       | :    |
| LLDPD                     | :    |
| TeamD                     | :    |
| SNMPD                     | :    |
| Python                    | :    |
| syncd                     | :    |
| radvd                     | :    |
| isc-dhcp-relay            | :    |
| sonic-telemetry           | :    |
| redis-server/ redis-tools | :    |

<br><br>

### Feature List

#### BFD Enhancement <br>
 - [HLD](https://github.com/Azure/SONiC/blob/master/doc/bfd/BFD_Enhancement_HLD.md) High level design document for Bidirectional Forwarding Detection
 - [PR 3385](https://github.com/Azure/sonic-buildimage/pull/3385)    To configure BFD timer values to have a timeout of atleast 600 msec<br><br>

#### L2 functional and performance enhancements <br>
 - [PR 303](https://github.com/Azure/sonic-swss-common/pull/303)   Added FDB table in CONFIG_DB & Added lua script for FDB flush<br>
 - [PR 510](https://github.com/Azure/sonic-sairedis/pull/510)      Changes in sonic-sairedis repo to support Layer 2 Forwarding Enhancements<br>
 - [PR 529](https://github.com/Azure/sonic-utilities/pull/529) Changes in swss-utilities submodule to support Layer 2 Forwarding Enhancements<br>
 - [PR 885](https://github.com/Azure/sonic-swss/pull/885) Changes in sonic-swss sub module to supportLayer 2 Forwarding Enhancements<br><br> 

#### L3 perf enhancement <br>
 - [PR 1048](https://github.com/Azure/sonic-swss/pull/1048) change in fpmsyncd to skip the lookup for the Master device name if the route object table value is zero.<br><br>

#### Management Framework <br>
 - [PR 18](https://github.com/Azure/sonic-mgmt-framework/pull/18)  SONiC Management Framework Release <br>
 - [PR 23](https://github.com/Azure/sonic-telemetry/pull/23) updated sonic-telemetry for SONiC Management Framework Release <br>
 - [PR 3488](https://github.com/Azure/sonic-buildimage/pull/3488) updated sonic-buildimage for SONiC Management Framework  <br>
 - [PR 659](https://github.com/Azure/sonic-utilities/pull/659) updated sonic-utilitiesfor SONiC Management Framework  <br><br>
			
#### Manangement VRF <br>
 - [PR 463](https://github.com/Azure/sonic-utilities/pull/463) sonic-utilities - managementVRF cli support<br>
 - [PR 472](https://github.com/Azure/sonic-utilities/pull/472)  Management vrf snmp cli support<br>
 - [PR 627](https://github.com/Azure/sonic-utilities/pull/627)  updated "show ntp" to use cgexec when management vrf is enabled<br>
 - [PR 2585](https://github.com/Azure/sonic-buildimage/pull/2585) sonic-buildimage -  New feature managementVR<br>
 - [PR 2608](https://github.com/Azure/sonic-buildimage/pull/2608) SNMP -  management VRF SNMP support<br>
 - [PR 3204](https://github.com/Azure/sonic-buildimage/pull/3204) Management vrf ntp support<br>
 - [PR 3586](https://github.com/Azure/sonic-buildimage/pull/3586) changes to handle snmp configuration as per the modified CLI<br><br>

#### Multi-DB optimization <br>
 - [HLD](https://github.com/Azure/SONiC/blob/ed69d427dcf358299b2c1b812e59a1e26a4ef4a5/doc/database/multi_database_instances.md) Design document for multiple user-defined redis database instances. <br>
 - [PR 52](https://github.com/Azure/sonic-py-swsssdk/pull/52) Python API changes for Multi-DB optimization<br><br>
			
#### NAT <br> 
 - [PR 100 ](https://github.com/Azure/sonic-linux-kernel/pull/100) Added support in the kernel for fullcone 3-tuple unique NAT.<br>
 - [PR 304](https://github.com/Azure/sonic-swss-common/pull/304) Changes in swss-common submodule to support NAT feature.<br> 
 - [PR 519](https://github.com/Azure/sonic-sairedis/pull/519) Changes in sonic-sairedis repo to support the NAT feature.<br>
 - [PR 645](https://github.com/Azure/sonic-utilities/pull/645)  NAT feature.<br>
 - [PR 1059](https://github.com/Azure/sonic-swss/pull/1059) Changes in sonic-swss sub module to support NAT feature.<br>
 - [PR 3494](https://github.com/Azure/sonic-buildimage/pull/3494) Changes in sonic-buildimage to support the NAT feature.<br><br>
			
#### Platform Driver Development Framework <br>
 - [PR 62](https://github.com/Azure/sonic-platform-common/pull/62) Added changes to psu_base class to support PDDF PSU cli utility. & Added fan_base class to support PDDF FAN cli utility.<br>
 - [PR 624](https://github.com/Azure/sonic-utilities/pull/624) Added PDDF CLI to sonic utilities.<br>
 - [PR 3387](https://github.com/Azure/sonic-buildimage/pull/3387) Generic drivers and plugins. PDDF generic platform drivers and utils are provided under sonic-buildimage/platform/pddf<br><br>
			
#### Platform test cases <br>
 - [Test plan](https://github.com/Azure/SONiC/blob/master/doc/pmon/sonic_platform_test_plan.md) Test plan to check the functionalities of platform related software components.
 - [PR 915](https://github.com/Azure/sonic-mgmt/pull/915) Phase 1 of sonic platform testcases.<br>
 - [PR 980](https://github.com/Azure/sonic-mgmt/pull/980) Phase 2 of sonic platform testcases.<br>
 - [PR 1079](https://github.com/Azure/sonic-mgmt/pull/1079) added testcases for reboot cause.<br><br>
			
#### sFlow <br>
 - [PR 94](https://github.com/Azure/sonic-linux-kernel/pull/94) Backport psample and act_sample drivers to sonic linux kernel 4.9<br>
 - [PR 299](https://github.com/Azure/sonic-swss-common/pull/299) Defining SFLOW Tables<br>
 - [PR 498](https://github.com/Azure/sonic-sairedis/pull/498) For sflow feature, SAI changes needed for sonic-vs platform<br>
 - [PR 592 ](https://github.com/Azure/sonic-utilities/pull/592) Added CLI to configure sFlow globally or per interface & Added CLI to show sFlow settings globally or per interface<br>
 - [PR 1011](https://github.com/Azure/sonic-swss/pull/1011) Copp orch changes for programming genetlink attributes defined in opencomputeproject/SAI#936 and also defining trap group for SFLOW<br>			
 - [PR 1012](https://github.com/Azure/sonic-swss/pull/1012) Added support in swss for SFLOW. It includes sfloworch and sflowmgr changes.<br>
 - [PR 3251](https://github.com/Azure/sonic-buildimage/pull/3251) Build infrastructure changes to support sflow docker and utilities<br><br>

#### SSD diagnostic tolling <br> 
 - [PR 47](https://github.com/Azure/sonic-buildimage/pull/47)  Fixed docker-base image link, which is already expired.<br>
 - [PR 587](https://github.com/Azure/sonic-utilities/pull/587) Added SSD Health CLI utility<br>
 - [PR 3218](https://github.com/Azure/sonic-buildimage/pull/3218) Added SSD Health tools<br><br>

#### STP/PVST <br>
 - [PR 19](https://github.com/Azure/sonic-stp/pull/19) Changes in sonic-stp to support PVST feature implementation<br>
 - [PR 305](https://github.com/Azure/sonic-swss-common/pull/305) Changes in swss-common to support PVSTP feature<br> implementation<br> 
 - [PR 648](https://github.com/Azure/sonic-utilities/pull/648) Changes in sonic-swss sub module to support PVSTP feature implementation <br>
 - [PR 1058](https://github.com/Azure/sonic-swss/pull/1058) Changes in swss-utilities submodule to support PVSTP feature implementation <br>
 - [PR 3463](https://github.com/Azure/sonic-buildimage/pull/3463) Changes in sonic-buildimage to support PVSTP feature implementation<br><br>
 
#### Sub-port support <br> 
 - [PR 1998](https://github.com/opencomputeproject/SAI/pull/998) <br> 
 - [PR 1284](https://github.com/Azure/sonic-swss-common/pull/284)<br>
 - [PR 1969](https://github.com/Azure/sonic-swss/pull/969)<br>
 - [PR 1871](https://github.com/Azure/sonic-swss/pull/871)<br>
 - [PR 13412](https://github.com/Azure/sonic-buildimage/pull/3412)<br>
 - [PR 13422](https://github.com/Azure/sonic-buildimage/pull/3422)<br>
 - [PR 13413](https://github.com/Azure/sonic-buildimage/pull/3413)<br>
 - [PR 1638](https://github.com/Azure/sonic-utilities/pull/638)<br>
 - [PR 1642](https://github.com/Azure/sonic-utilities/pull/642)<br>
 - [PR 1651](https://github.com/Azure/sonic-utilities/pull/651)  <br><br>                                                    

#### VRF  <br>
 - [HLD](https://github.com/Azure/SONiC/blob/master/doc/vrf/sonic-vrf-hld.md) SONiC VRF design document. 
 - [PR 943](https://github.com/Azure/sonic-swss/pull/943) Changes in sonic-swss sub module to VRF implementation.<br>
 - [PR 1065](https://github.com/Azure/sonic-mgmt/pull/1065) VRF testcases according to vrf test plan<br>
 - [PR 3044](https://github.com/Azure/sonic-buildimage/pull/3044) Sonic supports multiple loopback interfaces. Each loopback interfaces can belong to different VRF.<br>
 - [PR 3047](https://github.com/Azure/sonic-buildimage/pull/3047) Added support for BGP and static route. <br><br>			
			
#### ZTP <br> 
 - [HLD](https://github.com/Azure/SONiC/blob/master/doc/ztp/ztp.md) Design document of Zero Touch Provisioning
 - [PR 12](https://github.com/Azure/sonic-ztp/pull/12) First release of SONiC Zero Touch Provisioning feature<br>
 - [PR 599](https://github.com/Azure/sonic-utilities/pull/599)  Implemented CLI commands to use Zero Touch Provisioning <br>
 - [PR 1000](https://github.com/Azure/sonic-swss/pull/1000) Increase incoming packet rate on in-band interfaces to support faster download of large files <br>
 - [PR 3227](https://github.com/Azure/sonic-buildimage/pull/3227) SONiC configuration management service <br>
 - [PR 3298](https://github.com/Azure/sonic-buildimage/pull/3298) ZTP infrastructure changes to support DHCP discovery provisioning data<br>
 - [PR 3299](https://github.com/Azure/sonic-buildimage/pull/3299) Include make recipes for sonic-ztp package<br><br>

<br><br>

### Security Updates  

<br><br> <br><br>



### SAI APIs

Please find the list of API's classified along the newly added SAI features. For further details on SAI API please refer [SAI_1.5_Release_notes]([https://github.com/kannankvs/md2/blob/master/SAI_1.5%20Release%20notes.md](https://github.com/kannankvs/md2/blob/master/SAI_1.5 Release notes.md))

1. TAM

   1. sai_create_tam_report_fn
   2. sai_remove_tam_int_f
   3. sai_set_tam_int_attribute_fn
   4. sai_get_tam_int_attribute_fn
   5. sai_tam_telemetry_get_data_fn

2. NAT

   1. sai_create_nat_range_fn
   2. sai_remove_nat_range_fn
   3. sai_get_nat_range_attribute_fn
   4. sai_get_nat_range_attribute_fn
   5. sai_create_nat_fn
   6. sai_remove_nat_fn
   7. sai_set_nat_attribute_fn
   8. sai_get_nat_attribute_fn

   

3. SFLOW 

   1. sai_hostif_type_genetlink
   2. sai_hostif_attr_genetlink_mcgrp_name
   3. sai_hostif_table_entr_channel_type_genetlink

   

4. Generic Resource Monitoring

   1. sai_object_type_get_availability

   

5. SAI counter

   1. sai_create_counter_fn
   2. sai_remove_counter_fn
   3. sai_set_counter_attribute_fn
   4. sai_get_counter_attribute_fn
   5. sai_get_counter_stats_fn
   6. sai_get_counter_stats_ext_fn
   7. sai_clear_counter_stats_fn

6. Drop Counters 

   1. sai_create_debug_counter_fn
   2. sai_remove_debug_counter_fn
   3. sai_set_debug_counter_attribute_fn
   4. sai_get_debug_counter_attribute_fn

<br><br>

### List of PR's 


| PR   | Description                                                  |
| ---- | ------------------------------------------------------------ |
| 325  | [Mclag-HLD   document](https://github.com/Azure/SONiC/pull/325) |
| 345  | [ZTP -   Zero Touch Provisioning design](https://github.com/Azure/SONiC/pull/345) |
| 379  | [Layer 2   forwarding enhancements HLD](https://github.com/Azure/SONiC/pull/379) |
| 385  | [pmon   enhancement suggestion](https://github.com/Azure/SONiC/issues/385) |
| 386  | [SONiC   PVST feature HLD](https://github.com/Azure/SONiC/pull/386) |
| 390  | [NAT   feature HLD](https://github.com/Azure/SONiC/pull/390) |
| 392  | [Update   Sonic-Vrf-HLD](https://github.com/Azure/SONiC/pull/392) |
| 399  | [L3   performance and scaling enhancements HLD initial version](https://github.com/Azure/SONiC/pull/399) |
| 400  | [SONiC-Mclag](https://github.com/Azure/SONiC/pull/400)       |
| 406  | [PDK   PDDF HLD PR request](https://github.com/Azure/SONiC/pull/406) |
| 407  | [Pde doc](https://github.com/Azure/SONiC/pull/407)           |
| 411  | [Egress mirroring and ACL action support check via   SAI](https://github.com/Azure/SONiC/pull/411) |
| 419  | [SONiC image build time   improvements](https://github.com/Azure/SONiC/pull/419) |
| 420  | [Sub   port interface high level design](https://github.com/Azure/SONiC/pull/420) |
| 427  | [Inband   Flow Analyzer feature specification](https://github.com/Azure/SONiC/pull/427) |
| 428  | [everflow test plan to cover egress mirroring -   updated](https://github.com/Azure/SONiC/pull/428) |
| 429  | [Threshold   feature spec](https://github.com/Azure/SONiC/pull/429) |
| 433  | [SONiC   Configuration Setup Service](https://github.com/Azure/SONiC/pull/433) |
| 434  | [Configurable drop   counters](https://github.com/Azure/SONiC/pull/434) |
| 435  | [SONIC   VRF HLD 1.2](https://github.com/Azure/SONiC/pull/435) |
| 439  | [Monitoring of hardware resources   consumed by a device](https://github.com/Azure/SONiC/pull/439) |
| 475  | [VRRP   HLD](https://github.com/Azure/SONiC/pull/475)        |
| 2943 | [Pmon   docker Add ethtool to pmon docker](https://github.com/Azure/sonic-buildimage/pull/2943) |
| 3066 | [Update   redis to 5.0.3](https://github.com/Azure/sonic-buildimage/pull/3066) |
| 3501 | [Threshold   feature changes](https://github.com/Azure/sonic-buildimage/pull/3501) |
| PVST | [PVST   feature implementation](https://github.com/Azure/sonic-buildimage/pull/3463) |

<br><br>
