# SONiC 201910 Release Notes

This document describes the SONiC changes done for new features,  and enhancements on existing features/sub-features.



# Table of Contents

   * [SONiC 201910 Release Notes](#sonic-201910-release-notes)
      * [Table of Contents](#table-of-contents)
         * [Branch Location (#branch-location)
         * [Dependency Version](#dependency-version)
         * [Feature List](#feature-list)
         * [Security Updates](#security-updates)
         * [SAI APIs](#sai-apis)
         * [Enhancements](#enhancements)

<br>

# Branch Location  

https://github.com/Azure/sonic-buildimage/tree/201910
<br>

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
| [BFD SW100ms intervalfrom FRR](https://github.com/Azure/SONiC/pull/383) | [3385](https://github.com/Azure/sonic-buildimage/pull/3385)  |
| Build Improvements                                           | [3292](https://github.com/Azure/sonic-buildimage/pull/3292)  |
| [Build   timeimprovements](https://github.com/Azure/SONiC/pull/419) | [911](https://github.com/Azure/sonic-swss/pull/911) ,[280](https://github.com/Azure/sonic-swss-common/pull/280)  ,  [461](https://github.com/Azure/sonic-sairedis/pull/461)  , [3048](https://github.com/Azure/sonic-buildimage/pull/3048)  ,  [3049](https://github.com/Azure/sonic-buildimage/pull/3049) |
| [Configurable  drop counters](https://github.com/Azure/SONiC/pull/434) | [308](https://github.com/Azure/sonic-swss-common/pull/308) ,  [520](https://github.com/Azure/sonic-sairedis/pull/520) ,   [1075](https://github.com/Azure/sonic-swss/pull/1075)  ,   [1093](https://github.com/Azure/sonic-swss/pull/1093)  ,   [688](https://github.com/Azure/sonic-utilities/pull/688) |
| Core File Manager                                            | [3447](https://github.com/Azure/sonic-buildimage/pull/3447) , [643](https://github.com/Azure/sonic-utilities/pull/643) , [3499](https://github.com/Azure/sonic-buildimage/pull/3499)  , [663](https://github.com/Azure/sonic-utilities/pull/663) |
| [Debug   Framework](https://github.com/Azure/SONiC/pull/398) | [300](https://github.com/Azure/sonic-swss-common/pull/300)  , [618](https://github.com/Azure/sonic-utilities/pull/618) |
| [Dynamic   Break Out](https://github.com/Azure/SONiC/pull/450) |                                                              |
| [Egress   mirroringand ACL action support checkvia SAI](https://github.com/Azure/SONiC/pull/411) | [963](https://github.com/Azure/sonic-swss/pull/963)   , [1019](https://github.com/Azure/sonic-swss/pull/1019)  ,  [575](https://github.com/Azure/sonic-utilities/pull/575) ,  [481](https://github.com/Azure/sonic-sairedis/pull/481) |
| [HW resource monitor](https://github.com/Azure/SONiC/pull/439) | [1121](https://github.com/Azure/sonic-mgmt/pull/1121)        |
| [L2 functional and performance enhancements](https://github.com/Azure/SONiC/pull/379) | [885 ](https://github.com/Azure/sonic-swss/pull/885) , [510  ](https://github.com/Azure/sonic-sairedis/pull/510),  [303](https://github.com/Azure/sonic-swss-common/pull/303)  ,  [529](https://github.com/Azure/sonic-utilities/pull/529) |
| [L3 perfenhancement](https://github.com/Azure/SONiC/pull/399) | [1048](https://github.com/Azure/sonic-swss/pull/1048)        |
| [Log analyzer to pytest](https://github.com/Azure/SONiC/pull/421) | [1048](https://github.com/Azure/sonic-mgmt/pull/1048)        |
| [Management   Framework](https://github.com/Azure/SONiC/pull/436) | [18](https://github.com/Azure/sonic-mgmt-framework/pull/18)   , [23](https://github.com/Azure/sonic-telemetry/pull/23)  ,   [3488](https://github.com/Azure/sonic-buildimage/pull/3488)  , [659](https://github.com/Azure/sonic-utilities/pull/659) |
| [Management   VRF](https://github.com/Azure/sonic-utilities/pull/463/commits/d6d14929ef1f1d27f92e4bb5db30fba8b39dcfd4) | [2585](https://github.com/Azure/sonic-buildimage/pull/2585)  , [2608](https://github.com/Azure/sonic-buildimage/pull/2608)  ,  [3204](https://github.com/Azure/sonic-buildimage/pull/3204)  ,  [463](https://github.com/Azure/sonic-utilities/pull/463)  ,  [472](https://github.com/Azure/sonic-utilities/pull/472)  ,  [627](https://github.com/Azure/sonic-utilities/pull/627)  ,  [3586](https://github.com/Azure/sonic-buildimage/pull/3586) |
| [MLAG](https://github.com/Azure/SONiC/pull/325)              | [2154](https://github.com/Azure/sonic-buildimage/pull/2514) , [1003](https://github.com/Azure/sonic-swss/pull/1003) , [877](https://github.com/Azure/sonic-swss/pull/877) , [814](https://github.com/Azure/sonic-swss/pull/814) , [811](https://github.com/Azure/sonic-swss/pull/811) , [810](https://github.com/Azure/sonic-swss/pull/810) , [809](https://github.com/Azure/sonic-swss/pull/809) ,  [275](https://github.com/Azure/sonic-swss-common/pull/275) , [453](https://github.com/Azure/sonic-utilities/pull/453) |
| [Multi-DB optimization](https://github.com/Azure/SONiC/blob/ed69d427dcf358299b2c1b812e59a1e26a4ef4a5/doc/database/multi_database_instances.md) | [52](https://github.com/Azure/sonic-py-swsssdk/pull/52)      |
| [NAT](https://github.com/Azure/SONiC/pull/390)               | [3494](https://github.com/Azure/sonic-buildimage/pull/3494) , [1059](https://github.com/Azure/sonic-swss/pull/1059)  ,  [645](https://github.com/Azure/sonic-utilities/pull/645)  ,  [100 ](https://github.com/Azure/sonic-linux-kernel/pull/100) ,  [304](https://github.com/Azure/sonic-swss-common/pull/304)  ,  [519](https://github.com/Azure/sonic-sairedis/pull/519) |
| [Platform Development Environment](https://github.com/Azure/SONiC/pull/407) | [3408](https://github.com/Azure/sonic-buildimage/pull/3408)  , [27](https://github.com/Azure/sonic-platform-pdk-pde/pull/27) |
| [Platform   Driver Development Framework](https://github.com/Azure/SONiC/pull/406) | [3387](https://github.com/Azure/sonic-buildimage/pull/3387)   , [62](https://github.com/Azure/sonic-platform-common/pull/62)  ,  [624](https://github.com/Azure/sonic-utilities/pull/624) |
| Platform test                                                | [915](https://github.com/Azure/sonic-mgmt/pull/915)   , [980](https://github.com/Azure/sonic-mgmt/pull/980)  , [1079](https://github.com/Azure/sonic-mgmt/pull/1079) |
| [sFlow](https://github.com/Azure/SONiC/pull/389)             | [94](https://github.com/Azure/sonic-linux-kernel/pull/94)  , [299](https://github.com/Azure/sonic-swss-common/pull/299)  , [498](https://github.com/Azure/sonic-sairedis/pull/498)  ,  [1012](https://github.com/Azure/sonic-swss/pull/1012)  ,  [1011](https://github.com/Azure/sonic-swss/pull/1011)  ,  [3251](https://github.com/Azure/sonic-buildimage/pull/3251)  ,  [592 ](https://github.com/Azure/sonic-utilities/pull/592) |
| [SSD  diagnostic tolling](https://github.com/Azure/SONiC/pull/378) | [587](https://github.com/Azure/sonic-utilities/pull/587)  , [47](https://github.com/Azure/sonic-buildimage/pull/47) ,  [3218](https://github.com/Azure/sonic-buildimage/pull/3218) |
| [STP/PVST](https://github.com/Azure/SONiC/pull/386)          | [19](https://github.com/Azure/sonic-stp/pull/19)  , [305](https://github.com/Azure/sonic-swss-common/pull/305)  ,  [1058](https://github.com/Azure/sonic-swss/pull/1058)  ,  [648](https://github.com/Azure/sonic-utilities/pull/648)  ,  [3463](https://github.com/Azure/sonic-buildimage/pull/3463) |
| [Sub-port   support](https://github.com/Azure/SONiC/pull/420) | [998](https://github.com/opencomputeproject/SAI/pull/998) , [284](https://github.com/Azure/sonic-swss-common/pull/284) , [969](https://github.com/Azure/sonic-swss/pull/969)  , [871](https://github.com/Azure/sonic-swss/pull/871) , [3412](https://github.com/Azure/sonic-buildimage/pull/3412) , [3422](https://github.com/Azure/sonic-buildimage/pull/3422) , [3413](https://github.com/Azure/sonic-buildimage/pull/3413) , [638](https://github.com/Azure/sonic-utilities/pull/638) , [642](https://github.com/Azure/sonic-utilities/pull/642) , [651](https://github.com/Azure/sonic-utilities/pull/651) |
| [Threshold(BST)](https://github.com/Azure/SONiC/pull/429)    | [3501](https://github.com/Azure/sonic-buildimage/pull/3501)   , [12](https://github.com/Azure/sonic-tam/pull/12) ,  [1067](https://github.com/Azure/sonic-swss/pull/1067) ,  [665](https://github.com/Azure/sonic-utilities/pull/665) ,  [310](https://github.com/Azure/sonic-swss-common/pull/310) |
| [VRF](https://github.com/Azure/SONiC/blob/master/doc/vrf/sonic-vrf-hld.md) | [3044](https://github.com/Azure/sonic-buildimage/pull/3044) , [3047](https://github.com/Azure/sonic-buildimage/pull/3047) , [943](https://github.com/Azure/sonic-swss/pull/943) , [1065](https://github.com/Azure/sonic-mgmt/pull/1065) |
| [ZTP](https://github.com/Azure/SONiC/blob/master/doc/ztp/ztp.md) | [3227](https://github.com/Azure/sonic-buildimage/pull/3227) , [3298](https://github.com/Azure/sonic-buildimage/pull/3298)  , [1000](https://github.com/Azure/sonic-swss/pull/1000) , [3299](https://github.com/Azure/sonic-buildimage/pull/3299) , [12](https://github.com/Azure/sonic-ztp/pull/12), [599](https://github.com/Azure/sonic-utilities/pull/599) |


<br><br>

### Security Updates  

<br><br> <br><br>



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



<br>

### List of PR's 


| PR   | Description                                                  |
| ---- | ------------------------------------------------------------ |
| 433  | [SONiC   Configuration Setup Service](https://github.com/Azure/SONiC/pull/433) |
| 3066 | [Update   redis to 5.0.3](https://github.com/Azure/sonic-buildimage/pull/3066) |


<br>
