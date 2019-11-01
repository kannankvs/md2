# SONiC 201910 Release Notes

This document describes the SONiC changes done for new features,  and enhancements on existing features/sub-features.



# Table of Contents

   * [SONiC 201910 Release Notes](#sonic-201910-release-notes)
      * [Table of Contents](#table-of-contents)
         * [Branch Location](#branch-location)
         * [Dependency Version](#dependency-version)
         * [Feature List](#feature-list)
         * [Security Updates](#security-updates)
         * [SAI APIs](#sai-apis)
         * [List of Major PR's](#enhancements)


# Branch Location  

https://github.com/Azure/sonic-buildimage/tree/201910


# Dependency Version

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


# Feature List

| Feature                                                      | Pull Request                                                 |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| [Bidirectional Forwarding Detection](https://github.com/Azure/SONiC/blob/master/doc/bfd/BFD_Enhancement_HLD.md) - BFD supports creation of single hop and multi hop session to monitor forwarding path failure.Single hop session are created for iBGP. Multihop session are created usually for protocols like eBGP where the neighbors are multiple hop apart.| [3385](https://github.com/Azure/sonic-buildimage/pull/3385)  |
| Build Improvements                                           | [3292](https://github.com/Azure/sonic-buildimage/pull/3292)  |
| [Build system improvements](https://github.com/Azure/SONiC/blob/master/doc/sonic-build-system/build_system_improvements.md) - This document describes few options to improve SONiC build time. To split the work we will consider that SONiC has two stages: 1. debian/python packages compilation <- relatively fast 2. docker images build <- slower espessially when several users are building in parallel | [911](https://github.com/Azure/sonic-swss/pull/911) ,[280](https://github.com/Azure/sonic-swss-common/pull/280)  ,  [461](https://github.com/Azure/sonic-sairedis/pull/461)  , [3048](https://github.com/Azure/sonic-buildimage/pull/3048)  ,  [3049](https://github.com/Azure/sonic-buildimage/pull/3049) |
| [Configurable  drop counters](https://github.com/Azure/SONiC/blob/master/doc/drop_counters/drop_counters_HLD.md)  - The main goal of this feature is to provide better packet drop visibility in SONiC by providing a mechanism to count and classify packet drops that occur due to different reasons.
This is done by adding support for SAI debug counters to SONiC. Support for creating and configuring port-level and switch-level debug counters will be added to orchagent and syncd. A CLI tool will be provided for users to manage and configure their own drop counters | [308](https://github.com/Azure/sonic-swss-common/pull/308) ,  [520](https://github.com/Azure/sonic-sairedis/pull/520) ,   [1075](https://github.com/Azure/sonic-swss/pull/1075)  ,   [1093](https://github.com/Azure/sonic-swss/pull/1093)  ,   [688](https://github.com/Azure/sonic-utilities/pull/688) |
| Core File Manager                                            | [3447](https://github.com/Azure/sonic-buildimage/pull/3447) , [643](https://github.com/Azure/sonic-utilities/pull/643) , [3499](https://github.com/Azure/sonic-buildimage/pull/3499)  , [663](https://github.com/Azure/sonic-utilities/pull/663) |
| Debug Framework | [300](https://github.com/Azure/sonic-swss-common/pull/300)  , [618](https://github.com/Azure/sonic-utilities/pull/618) |
| Dynamic   Break Out |                                                              |
| [Egress mirroring support and ACL action capability check](https://github.com/Azure/SONiC/blob/master/doc/acl/acl_stage_capability.md) - SAI API has two mirror action types - SAI_ACL_ACTION_TYPE_MIRROR_INGRESS, <br> SAI_ACL_ACTION_TYPE_MIRROR_EGRESS which can be set on ingress or egress table. So SONiC will not restrict setting egress mirror rule on ingress table or vice versa. To check wheter such combination is supported by the ASIC application should look into SWITCH_CAPABILITY table which is described in part 2 of this document.| [963](https://github.com/Azure/sonic-swss/pull/963)   , [1019](https://github.com/Azure/sonic-swss/pull/1019)  ,  [575](https://github.com/Azure/sonic-utilities/pull/575) ,  [481](https://github.com/Azure/sonic-sairedis/pull/481) |
| [HW resource monitor](https://github.com/Azure/SONiC/blob/master/doc/DUT_monitor_HLD.md) - This document describes the high level design of verification the hardware resources consumed by a device. The hardware resources which are currently verified are CPU, RAM and HDD. This implementation will be integrated in test cases written on Pytest framework.| [1121](https://github.com/Azure/sonic-mgmt/pull/1121)        |
| [Layer 2 Forwarding Enhancements](https://github.com/Azure/SONiC/blob/master/doc/layer2-forwarding-enhancements/SONiC%20Layer%202%20Forwarding%20Enhancements%20HLD.md) | [885 ](https://github.com/Azure/sonic-swss/pull/885) , [510  ](https://github.com/Azure/sonic-sairedis/pull/510),  [303](https://github.com/Azure/sonic-swss-common/pull/303)  ,  [529](https://github.com/Azure/sonic-utilities/pull/529) |
| L3 performance and scaling enhancements | [1048](https://github.com/Azure/sonic-swss/pull/1048)        |
| Log analyzer to pytest  | [1048](https://github.com/Azure/sonic-mgmt/pull/1048)        |
| [Management Framework](https://github.com/Azure/SONiC/blob/master/doc/mgmt/Management%20Framework.md) | [18](https://github.com/Azure/sonic-mgmt-framework/pull/18)   , [23](https://github.com/Azure/sonic-telemetry/pull/23)  ,   [3488](https://github.com/Azure/sonic-buildimage/pull/3488)  , [659](https://github.com/Azure/sonic-utilities/pull/659) |
| Management VRF  | [2585](https://github.com/Azure/sonic-buildimage/pull/2585)  , [2608](https://github.com/Azure/sonic-buildimage/pull/2608)  ,  [3204](https://github.com/Azure/sonic-buildimage/pull/3204)  ,  [463](https://github.com/Azure/sonic-utilities/pull/463)  ,  [472](https://github.com/Azure/sonic-utilities/pull/472)  ,  [627](https://github.com/Azure/sonic-utilities/pull/627)  ,  [3586](https://github.com/Azure/sonic-buildimage/pull/3586) |
| McLAG              | [2154](https://github.com/Azure/sonic-buildimage/pull/2514) , [1003](https://github.com/Azure/sonic-swss/pull/1003) , [877](https://github.com/Azure/sonic-swss/pull/877) , [814](https://github.com/Azure/sonic-swss/pull/814) , [811](https://github.com/Azure/sonic-swss/pull/811) , [810](https://github.com/Azure/sonic-swss/pull/810) , [809](https://github.com/Azure/sonic-swss/pull/809) ,  [275](https://github.com/Azure/sonic-swss-common/pull/275) , [453](https://github.com/Azure/sonic-utilities/pull/453) |
| [Multi-DB optimization](https://github.com/Azure/SONiC/blob/ed69d427dcf358299b2c1b812e59a1e26a4ef4a5/doc/database/multi_database_instances.md) | [52](https://github.com/Azure/sonic-py-swsssdk/pull/52)      |
| NAT              | [3494](https://github.com/Azure/sonic-buildimage/pull/3494) , [1059](https://github.com/Azure/sonic-swss/pull/1059)  ,  [645](https://github.com/Azure/sonic-utilities/pull/645)  ,  [100 ](https://github.com/Azure/sonic-linux-kernel/pull/100) ,  [304](https://github.com/Azure/sonic-swss-common/pull/304)  ,  [519](https://github.com/Azure/sonic-sairedis/pull/519) |
| [Platform Development Environment](https://github.com/Azure/SONiC/blob/master/doc/platform/pde.md) | [3408](https://github.com/Azure/sonic-buildimage/pull/3408)  , [27](https://github.com/Azure/sonic-platform-pdk-pde/pull/27) |
| [Platform Driver Development Framework | [3387](https://github.com/Azure/sonic-buildimage/pull/3387)   , [62](https://github.com/Azure/sonic-platform-common/pull/62)  ,  [624](https://github.com/Azure/sonic-utilities/pull/624) |
| Platform test                                                | [915](https://github.com/Azure/sonic-mgmt/pull/915)   , [980](https://github.com/Azure/sonic-mgmt/pull/980)  , [1079](https://github.com/Azure/sonic-mgmt/pull/1079) |
| [sFlow](https://github.com/Azure/SONiC/blob/master/doc/sflow/sflow_hld.md)             | [94](https://github.com/Azure/sonic-linux-kernel/pull/94)  , [299](https://github.com/Azure/sonic-swss-common/pull/299)  , [498](https://github.com/Azure/sonic-sairedis/pull/498)  ,  [1012](https://github.com/Azure/sonic-swss/pull/1012)  ,  [1011](https://github.com/Azure/sonic-swss/pull/1011)  ,  [3251](https://github.com/Azure/sonic-buildimage/pull/3251)  ,  [592 ](https://github.com/Azure/sonic-utilities/pull/592) |
| [SSD diagnostic tolling](https://github.com/Azure/SONiC/blob/master/doc/ssdhealth_design.md) | [587](https://github.com/Azure/sonic-utilities/pull/587)  , [47](https://github.com/Azure/sonic-buildimage/pull/47) ,  [3218](https://github.com/Azure/sonic-buildimage/pull/3218) |
| STP/PVST          | [19](https://github.com/Azure/sonic-stp/pull/19)  , [305](https://github.com/Azure/sonic-swss-common/pull/305)  ,  [1058](https://github.com/Azure/sonic-swss/pull/1058)  ,  [648](https://github.com/Azure/sonic-utilities/pull/648)  ,  [3463](https://github.com/Azure/sonic-buildimage/pull/3463) |
| Sub-port support | [998](https://github.com/opencomputeproject/SAI/pull/998) , [284](https://github.com/Azure/sonic-swss-common/pull/284) , [969](https://github.com/Azure/sonic-swss/pull/969)  , [871](https://github.com/Azure/sonic-swss/pull/871) , [3412](https://github.com/Azure/sonic-buildimage/pull/3412) , [3422](https://github.com/Azure/sonic-buildimage/pull/3422) , [3413](https://github.com/Azure/sonic-buildimage/pull/3413) , [638](https://github.com/Azure/sonic-utilities/pull/638) , [642](https://github.com/Azure/sonic-utilities/pull/642) , [651](https://github.com/Azure/sonic-utilities/pull/651) |
| Threshold(BST)   | [3501](https://github.com/Azure/sonic-buildimage/pull/3501)   , [12](https://github.com/Azure/sonic-tam/pull/12) ,  [1067](https://github.com/Azure/sonic-swss/pull/1067) ,  [665](https://github.com/Azure/sonic-utilities/pull/665) ,  [310](https://github.com/Azure/sonic-swss-common/pull/310) |
| [VRF](https://github.com/Azure/SONiC/blob/master/doc/vrf/sonic-vrf-hld.md) | [3044](https://github.com/Azure/sonic-buildimage/pull/3044) , [3047](https://github.com/Azure/sonic-buildimage/pull/3047) , [943](https://github.com/Azure/sonic-swss/pull/943) , [1065](https://github.com/Azure/sonic-mgmt/pull/1065) |
| [ZTP](https://github.com/Azure/SONiC/blob/master/doc/ztp/ztp.md) | [3227](https://github.com/Azure/sonic-buildimage/pull/3227) , [3298](https://github.com/Azure/sonic-buildimage/pull/3298)  , [1000](https://github.com/Azure/sonic-swss/pull/1000) , [3299](https://github.com/Azure/sonic-buildimage/pull/3299) , [12](https://github.com/Azure/sonic-ztp/pull/12), [599](https://github.com/Azure/sonic-utilities/pull/599) |


<br>

### Security Updates  

<br>



### SAI APIs

Please find the list of API's classified along the newly added SAI features. For further details on SAI API please refer [SAI_1.5_Release_notes]([https://github.com/kannankvs/md2/blob/master/SAI_1.5%20Release%20notes.md](https://github.com/kannankvs/md2/blob/master/SAI_1.5 Release notes.md))

| S.No | Feature                     | API                                                          |
| ---- | --------------------------- | ------------------------------------------------------------ |
| 1    | TAM                         | 1. sai_create_tam_report_fn<br/>   2. sai_remove_tam_int_f<br/>   3. sai_set_tam_int_attribute_fn<br/>   4. sai_get_tam_int_attribute_fn<br/>   5. sai_tam_telemetry_get_data_fn |
| 2    | NAT                         | 1. sai_create_nat_range_fn<br/>   2. sai_remove_nat_range_fn<br/>   3. sai_get_nat_range_attribute_fn<br/>   4. sai_get_nat_range_attribute_fn<br/>   5. sai_create_nat_fn<br/>   6. sai_remove_nat_fn<br/>   7. sai_set_nat_attribute_fn<br/>   8. sai_get_nat_attribute_fn |
| 3    | sFLOW                       | 1. sai_hostif_type_genetlink<br/>   2. sai_hostif_attr_genetlink_mcgrp_name<br/>   3. sai_hostif_table_entr_channel_type_genetlink |
| 4    | Generic Resource Monitoring | 1. sai_object_type_get_availability                          |
| 5    | SAI counter                 | 1. sai_create_counter_fn<br/>   2. sai_remove_counter_fn<br/>   3. sai_set_counter_attribute_fn<br/>   4. sai_get_counter_attribute_fn<br/>   5. sai_get_counter_stats_fn<br/>   6. sai_get_counter_stats_ext_fn<br/>   7. sai_clear_counter_stats_fn |
| 6    | Drop Counters               | 1. sai_create_debug_counter_fn<br/>   2. sai_remove_debug_counter_fn<br/>   3. sai_set_debug_counter_attribute_fn<br/>   4. sai_get_debug_counter_attribute_fn |



### List of Major PR's 


| PR   | Description                                                  |
| ---- | ------------------------------------------------------------ |
| 433  | [SONiC   Configuration Setup Service](https://github.com/Azure/SONiC/pull/433) |
| 3066 | [Update   redis to 5.0.3](https://github.com/Azure/sonic-buildimage/pull/3066) |


<br>
