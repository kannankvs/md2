# SONiC 201910 Release Notes





## Table of Contents













### BRANCH LOCATION 





### DEPENDENCY VERSION

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



### FEATURE LIST

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
| 420  | [Sub   port interface high level design](https://github.com/Azure/SONiC/pull/420) |
| 427  | [Inband   Flow Analyzer feature specification](https://github.com/Azure/SONiC/pull/427) |
| 429  | [Threshold   feature spec](https://github.com/Azure/SONiC/pull/429) |
| 433  | [SONiC   Configuration Setup Service](https://github.com/Azure/SONiC/pull/433) |
| 435  | [SONIC   VRF HLD 1.2](https://github.com/Azure/SONiC/pull/435) |
| 475  | [VRRP   HLD](https://github.com/Azure/SONiC/pull/475)        |
| 2943 | [Pmon   docker Add ethtool to pmon docker](https://github.com/Azure/sonic-buildimage/pull/2943) |
| 3066 | [Update   redis to 5.0.3](https://github.com/Azure/sonic-buildimage/pull/3066) |
| 3501 | [Threshold   feature changes](https://github.com/Azure/sonic-buildimage/pull/3501) |
| PVST | [PVST   feature implementation](https://github.com/Azure/sonic-buildimage/pull/3463) |

### Security Updates  





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

