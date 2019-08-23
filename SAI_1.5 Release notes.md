
# SAI 1.5 Release Notes

The Switch Abstraction Interface defines the APIs to provide a vendor-independent way of controlling forwarding elements, such as a switching ASIC, an NPU or a software switch in a uniform manner.

This document describes the SAI changes done for new features, enhancements on existing features/sub-features and various bug fixes.

List of new features is as follows.
1) TAM APIs  
2) NAT APIs  
3) sFlow APIs  
4) Generic Resource Monitoring  
5) SAI counters  
6) Drop Counters  

# 2. Features And Enhancements  

## 2.1 TAM  

Telemetry And Monitoring (TAM) has been enhanced from 1.0 to 2.0 to achieve the following goals:
1. Express top-level Telemetry and Monitoring domain for Inband Telemetry
2. Remain backwards compatible for application with minimal or no change in the application code
3. Provide extensibility for new functions/capability in each domain/subdomain and always remain backward compatible
4. Remove any hard coded assumptions about domain or domain’s capabilities
5. Provide full abstraction for operators to dynamically learn the number of domains supported within a networking element
6. Provide full abstraction for operators to dynamically learn domains capabilities
7. Provide flexibility to add new APIs for a given domain/subdomain
8. Support local mathematical functions for hierarchical analysis

### 2.1.1 New TAM 2.0 APIs
1) **create_tam_int**: This API is to create a TAM object. This will further be used to create a binding to the switch  
   ```
   sai_status_t (*sai_create_tam_report_fn)(
        _Out_ sai_object_id_t *tam_report_id,
        _In_ sai_object_id_t switch_id,
        _In_ uint32_t attr_count,
        _In_ const sai_attribute_t *attr_list);
   ```
2) **remove_tam_int**: This API is to remove the TAM object that is already created  
    ```
    sai_status_t (*sai_remove_tam_int_fn)(
        _In_ sai_object_id_t tam_int_id);
   ```
3) **set_tam_int_attribute**: This API is used to set value for a specified interface object attribute    
   ```
   sai_status_t (*sai_set_tam_int_attribute_fn)(
        _In_ sai_object_id_t tam_int_id,
        _In_ const sai_attribute_t *attr);
    ```
4) **get_tam_int_attribute**: This API is used to get values for specified interface object attributes   
   ```
   sai_status_t (*sai_get_tam_int_attribute_fn)(
        _In_ sai_object_id_t tam_int_id,
        _In_ uint32_t attr_count,
        _Inout_ sai_attribute_t *attr_list);
   ```
5) **tam_telemetry_get_data**: This will return data of all the source objects bound to the TAM object or data pertaining to the source only based on the option chosen in the attribute list  
    ```
    sai_status_t (*sai_tam_telemetry_get_data_fn)(
   	_In_ sai_object_id_t switch_id, 
	_In_ uint32_t attr_count, 
	_In_ const sai_attribute_t *attr_list);  
   ```
More details about this feature enhancement are available at [TAM2.0 Spec](https://github.com/opencomputeproject/SAI/blob/master/doc/TAM/SAI-Proposal-TAM2.0-v2.0.docx)
PRs related to this feature are [PR958](https://github.com/opencomputeproject/SAI/pull/958) and [PR959](https://github.com/opencomputeproject/SAI/pull/959)

## 2.2 NAT  
Provisioning of APIs to configure NAT feature. API set is generic to configure various types of NAT.  

**Features:** 
1. Basic NAT (SNAT, DNAT)
2. subnet based NAT
3. NAPT
4. Double NAT
5. NAT Exceptions
6. NAT Hairpin

New SAI APIs are introduced for configuring the following. 
1) **NAT Zones**: NAT Zones are configured for translation. Only when packet crosses across NAT zones then NAT translation is done. SONiC will configure interfaces as a member of the zones. Zone ID is passed in the API setting up NAT rules.
2) **Enabling NAT**: This defines the SAI NAT specifications with attributes such as 'range', set', 'get', 'remove' etc  
3) **Enable Traps for SNAT, DNAT and HAIRPIN Miss Packets**: Traps are configured to record the count of packets based on the source and destination Network Address Translation.
4) **TAM GET API**: Besides configuration, this API can read the NAT table to get aging details. 


### 2.2.1 New NAT APIs  

1) **create_nat_range**: This API will create a NAT range that will include the start and end values  
   ```
   sai_status_t (*sai_create_nat_range_fn)(
        _Out_ sai_object_id_t *nat_range_id,
        _In_ sai_object_id_t switch_id,
        _In_ uint32_t attr_count,
        _In_ const sai_attribute_t *attr_list);  
   ```
2) **remove_nat_range**: This API deletes a specified NAT range_object and also single specified NAT range  
   ```
   sai_status_t (*sai_remove_nat_range_fn)(
        _In_ sai_object_id_t nat_range_id);
   ```
3) **set_nat_range_attribute**: This API sets the NAT range attribute values for adapter specific extensions  
   ```
   sai_status_t (*sai_get_nat_range_attribute_fn)(
        _In_ sai_object_id_t nat_range_id,
        _In_ uint32_t attr_count,
        _Inout_ sai_attribute_t *attr_list);
   ```	
4) **get_nat_range_attribute**: This API gets values for specified NAT range attribute  
   ```
   sai_status_t (*sai_get_nat_range_attribute_fn)(
        _In_ sai_object_id_t nat_range_id,
        _In_ uint32_t attr_count,
        _Inout_ sai_attribute_t *attr_list);
   ```		
5) **create_nat**: This API creates and returns a NAT range object  
   ```
   sai_status_t (*sai_create_nat_fn)(
        _Out_ sai_object_id_t *nat_id,
        _In_ sai_object_id_t switch_id,
        _In_ uint32_t attr_count,
        _In_ const sai_attribute_t *attr_list);
    ```
6) **remove_nat**: This API deletes a specified NAT range_object and also single specified NAT range  
   ```
   sai_status_t (*sai_remove_nat_fn)(
        _In_ sai_object_id_t nat_id);
   ```

7) **set_nat_attribute**: This API sets NAT attribute value(s) for adapter specific extensions
   ```
   sai_status_t (*sai_set_nat_attribute_fn)(
        _In_ sai_object_id_t nat_id,
        _In_ const sai_attribute_t *attr);  
   ```	
8) **get_nat_attribute**: This API gets values for specified NAT attributes for adapter specific extensions  
   ```
   sai_status_t (*sai_get_nat_attribute_fn)(
        _In_ sai_object_id_t nat_id,
        _In_ uint32_t attr_count,
        _Inout_ sai_attribute_t *attr_list);
   ```
PRs related to this feature is [PR937](https://github.com/opencomputeproject/SAI/pull/937/commits/a682f3d550a5854ba9c71e5e51bd5cb708418482)


## 2.3 sFlow  

sFlow (defined in https://sflow.org/sflow_version_5.txt) is a standard-based sampling technology the meets the key requirements of network traffic monitoring on switches and routers. sFlow uses two types of sampling:

- A statistical packet-based sampling of switched or routed packet flows to provide visibility into network usage and active routes
- A time-based sampling of interface counters.  

The sFlow monitoring system consists of:

- sFlow agents that reside in network equipment which gather network traffic and port counters and combines the flow samples and interface counters into sFlow datagrams and forwards them to the sFlow collector at regular intervals over a UDP socket  
- sFlow collectors which receive and analyze the sFlow data.  

sFlow support in SAI requires both sample packet proposal and host-if proposal changes. The sample packet APIs haven't changed and is used as-is. Host-if is updated to create a new Generic Netlink based interface to lift sFlow samples to the application (sFlow agents) using the following new attributes:  
* SAI_HOSTIF_TYPE_GENETLINK  
* SAI_HOSTIF_ATTR_GENETLINK_MCGRP_NAME  
* SAI_HOSTIF_TABLE_ENTRY_CHANNEL_TYPE_GENETLINK  

PRs related to Host-if proposal changes are [936](https://github.com/opencomputeproject/SAI/pull/936) and [997](https://github.com/opencomputeproject/SAI/pull/997)

## 2.4 Generic Resource Monitoring
SAI manages ASIC resources. It is important for the user to query the current resources usage in the ASIC for different types of SAI objects. It is also essential to make as much resources availability exposed as possible. 

### 2.4.1 Generic Resource Monitoring API

1) **sai_object_type_get_availability**: This is a generic API for SAI resource monitoring. The function accepts an object type for which availability is queried. A new annotation is added to mark object attributes that are used to distinguish between different resource pools of the same object type.  
 ```
   sai_status_t sai_object_type_get_availability(
        _In_ sai_object_type_t object_type,
        _In_ uint32_t attr_count,
        _In_ const sai_attribute_t *attr_list,
        _Out_ uint64_t *count);
  ```
PRs related to Resource monitoring function addition is [942](https://github.com/opencomputeproject/SAI/pull/942)

## 2.5 SAI counter
Defining counters explicitly per object type imposes restrictions to their usage. Hence the new counter's model introduces APIs to query which objects support which counters and create a counter object that can be dynamically attached to other objects  

### 2.5.1 New SAI counter APIs

1) **sai_create_counter**: This API creates a counter that can be attached to an object to collect the statistics. Attaching a counter to an object does not clear it's stats values.
```
   sai_status_t (*sai_create_counter_fn)(
   	_Out_ sai_object_id_t *counter_id, 
	_In_ sai_object_id_t switch_id, 
	_In_ uint32_t attr_count, 
	_In_ const sai_attribute_t *attr_list);  
 ```
2) **sai_remove_counter**: This API removes a counter that is attached to an object to collect the statistics. Detaching a counter from an object does not clear it's stats values
```
   sai_status_t (*sai_remove_counter_fn)(
   	_In_ sai_object_id_t counter_id);
   ```
3) **sai_set_counter_attribute**: This API sets the attribute value for the given object ID
   ```
   sai_status_t (*sai_set_counter_attribute_fn)(
   	_In_ sai_object_id_t counter_id, 
   	_In_ const sai_attribute_t *attr);
   ```
4) **sai_get_counter_attribute**: This API gets the counter's attribute values for the given object ID 
   ```
   sai_status_t (*sai_get_counter_attribute_fn)(
   	_In_ sai_object_id_t counter_id, 
	_In_ uint32_t attr_count, 
	_Inout_ sai_attribute_t *attr_list);
   ```

5) **sai_get_counter_stats**: This API gets the counter statistics values
   ```
   sai_status_t (*sai_get_counter_stats_fn)(
   	_In_ sai_object_id_t counter_id, 
   	_In_ uint32_t number_of_counters, 
   	_In_ const sai_stat_id_t *counter_ids, 
   	_Out_ uint64_t *counters);  

6) **sai_get_counter_stats_ext**: This API gets the statistics of the IP packets collected from the counters
   ```
   sai_status_t (*sai_get_counter_stats_ext_fn)(
   	_In_ sai_object_id_t counter_id, 
   	_In_ uint32_t number_of_counters, 
   	_In_ const sai_stat_id_t *counter_ids, 
   	_In_ sai_stats_mode_t mode, 
   	_Out_ uint64_t *counters);  
   ```
7) **sai_clear_counter_stats**: This API clears the statistics collected in the counters  
   ```
   sai_status_t (*sai_clear_counter_stats_fn)(
   	_In_ sai_object_id_t counter_id, 
	_In_ uint32_t number_of_counters, 
	_In_ const sai_stat_id_t *counter_ids);  
   ```
PRs related to Resource monitoring function addition is [939](https://github.com/opencomputeproject/SAI/pull/939)

**NOTE**: The APIs that define certain attributes are Adapter-specific extensions to SAI, most typically to expose differentiated functionality in the underlying forwarding element. These are added to minimize compatibility issues with versioning of structures and to allow API extensibility  

## 2.6 Drop Counters  
  ASICs can provide a set of debug counters for certain object types. Debug counters belong to certain families, each family is for certain object type. The content of a specific debug counter instance can be defined by the application. Counting every statistics of every family might be too resource intensive, therefore the debug counters provide an efficient way to count and aggregate only the needed information.

Example :
 ```
enum _sai_debug_counter_type_t {
    /** Port in drop reasons. Base object : SAI_OBJECT_TYPE_PORT */
    SAI_DEBUG_COUNTER_TYPE_PORT_IN_DROP_REASONS,
     /** Port out drop reasons. Base object : SAI_OBJECT_TYPE_PORT */
    SAI_DEBUG_COUNTER_TYPE_PORT_OUT_DROP_REASONS,
 } sai_debug_counter_type_t;
 ```
Debug counter port in drop reason family can be expressed as shown below. 
```
 enum _sai_port_in_drop_reason_t {
    /* L2 reasons */
    /* L3 reasons */
 } 
 ```
### List of Drop counters 

#### Layer 2 drop counters

    1.  SAI_PORT_IN_DROP_REASON_SMAC_MULTICAST - Source MAC is multicast  
    2.  SAI_PORT_IN_DROP_REASON_SMAC_EQUALS_DMAC - Source MAC equals Destination MAC  
    3.  SAI_PORT_IN_DROP_REASON_DMAC_RESERVED - Destination MAC is Reserved (DMAC=01-80-C2-00-00-0x)  
    4.  SAI_PORT_IN_DROP_REASON_VLAN_TAG_NOT_ALLOWED - VLAN tag not allowed  
    5.  SAI_PORT_IN_DROP_REASON_INGRESS_VLAN_FILTER Ingress VLAN filter - Frame tagged when a port is dropping tagged or untagged when dropping untagged  
    6.  SAI_PORT_OUT_DROP_REASON_EGRESS_VLAN_FILTER - Egress VLAN filter  
    7.  SAI_PORT_IN_DROP_REASON_INGRESS_STP_FILTER - Ingress STP filter   
    8.  SAI_PORT_IN_DROP_REASON_FDB_UC_DISCARD -  Unicast FDB table action discard   
    9.  SAI_PORT_IN_DROP_REASON_FDB_MC_DISCARD - Multicast FDB table empty tx list   
    10. SAI_PORT_IN_DROP_REASON_LOOPBACK_FILTER - Port loopback filter   
    
#### Layer 3 drop counters        
    
    1.  SAI_PORT_IN_DROP_REASON_DIP_LINK_LOCAL - IPv4 Unicast Destination IP is link-local (Destination IP=169.254.0.0/16)
    2.  SAI_PORT_IN_DROP_REASON_SIP_LINK_LOCAL - IPv4 Source IP is link-local (Source IP=169.254.0.0/16)
    3.  SAI_PORT_IN_DROP_REASON_EXCEEDS_MTU - Packet size is larger than the MTU
    4.  SAI_PORT_IN_DROP_REASON_ACL_DISCARD - Packet is dropped due to configured ACL rules
    5.  SAI_PORT_OUT_DROP_REASON_L3_EGRESS_LINK_DOWN - Packet is destined for a neighboring device but neighbour device link is down

PRs related to this feature is [PR985](https://github.com/opencomputeproject/SAI/pull/985)  

## 3. Pull Request Details

## SAI Pull Requests

1) [PR929](https://github.com/opencomputeproject/SAI/pull/929): saibridge.h: Added bridge port type router to facilitate flooding to the router or a tunnel, on top of the regular behaviour  of flooding to all local ports, without needing to manage the list of local ports, by choosing the combined flood type. A sample use case for flooding to the router, is VXLAN L3 peering use case, demonstrated in OCP, where unknown unicast traffic is sent to the router.  
2) [PR936](https://github.com/opencomputeproject/SAI/pull/936): saihostif.h: Added a generic Netlink interface (over a loopback) to receive trapped packets/buffers from the SAI driver. This can be used as an alternative to callback/FD based mechanisms.    
3) [PR937](https://github.com/opencomputeproject/SAI/pull/937): sainat.h:  Added Network Address Translation (NAT) specific API definitions.   
4) [PR938](https://github.com/opencomputeproject/SAI/pull/938): TAM:  Introduced a special data pull function in the existing API structure.           
5) [PR939](https://github.com/opencomputeproject/SAI/pull/939): saicounter.h: Generic counters are added for better visibility and debugging. Tx packet and byte count for statistics along with stats in custom range base is added. The behaviour of the counter is that it can be attached/detached multiple times during its lifetime. Attaching or detaching a counter from an object does not clear its stats values. Counter can be attached to multiple objects at the same time.  
6) [PR942](https://github.com/opencomputeproject/SAI/pull/942): SAI.h: SAI generic resource monitoring. To help differentiate between different resource pools for the same object type; attributes that are annotated with `@isresourcetype` must be passed to the function with corresponding values  
7) [PR946](https://github.com/opencomputeproject/SAI/pull/945): saihostif.h: Added support for BFD packets to be trapped to CPU  
8) [PR947](https://github.com/opencomputeproject/SAI/pull/947): saiswitch.h: Added an RO attribute for STP Max Instances on the switch object.    
9) [PR948](https://github.com/opencomputeproject/SAI/pull/948): saiport.h: Added an attribute for controlling Link Training on the ports, for improving interoperability among devices.    
10) [PR958](https://github.com/opencomputeproject/SAI/pull/958): TAM: Added attributes to associate telemetry objects and probes. Created an object in the driver for tracking the buffer usage.    
11) [PR959](https://github.com/opencomputeproject/SAI/pull/959): TAM: Added optional attribute in ACL to bind a TAM INT object. Enhanced sai_tam_int_type enum to distinguish between P4 INT v1 and v2 and added a codepoint for direct export.    
12) [PR960](https://github.com/opencomputeproject/SAI/pull/960): saibfd.h, saiswitch.h: Added capabilities for the SAI/BFD API to allow applications to query the list of supported offloads (SAI_BFD_SESSION_OFFLOAD_TYPE_FULL, SAI_BFD_SESSION_OFFLOAD_TYPE_SUSTENANCE & SAI_BFD_SESSION_OFFLOAD_TYPE_NONE)  and choose an offload while creating a BFD session.  
13) [PR962](https://github.com/opencomputeproject/SAI/pull/962): saiacl.h: Fixed SAI_ACL_ENTRY_ATTR_ACTION_PACKET_ACTION description.  
14) [PR964](https://github.com/opencomputeproject/SAI/pull/964): saitypes.h: Fixed qosmap comment in sai_attribute_value_t.  
15) [PR969](https://github.com/opencomputeproject/SAI/pull/969): saiseraialize.c, saiseraializetest.c: Fixes for ARM32 bit in the usage of printf format specifiers.  
16) [PR970](https://github.com/opencomputeproject/SAI/pull/970): saihostif.h: Added an RO attribute to trap object, to count the packets trapped to CPU.   
17) [PR971](https://github.com/opencomputeproject/SAI/pull/971): saiport.h: added attribute SAI_PORT_ATTR_PTP_MODE to port-obj for timestamping for PTP packets.  
18) [PR974](https://github.com/opencomputeproject/SAI/pull/974): saibfd.h: Added additional attributes for BFD Session like SAI_BFD_ENCAPSULATION_TYPE_NONE to sai_bfd_encapsulation_type_t, Negotiated Transmit interval, Negotiated Receive interval, Local Diagnostic code field, Remote Diagnostic code field and Remote time Multiplier to sai_bfd_session_attr_t, mostly for diagnostics purpose.    
19) [PR980](https://github.com/opencomputeproject/SAI/pull/980): saibuffer: Added more explanation to include headroom pool in the ingress buffer pool.  
20) [PR983](https://github.com/opencomputeproject/SAI/pull/983): Added additional fields for hashing -  inner ip protocol, inner ethertype, inner l4 src/dst port, inner src/dst mac that can be used for tunnelled packets.  

## SAI TEST Pull Requests

1) [PR916](https://github.com/opencomputeproject/SAI/pull/916): SAITEST: Added new test scripts SAI PTF tests for the below tests. Added sai_thrift_set_neighbor_attribute proc to update the MAC entry.    
... L2MtuTest, L3MtuTest, L2MacMoveTestI, L2MacMoveTestII, L2MacMoveTestIII, L3IPv4NeighborMacTest, L3IPv6NeighborMacTest.    
2) [PR921](https://github.com/opencomputeproject/SAI/pull/921): SAITEST: Added L3 Directed Broadcast tests into SAI PTF tests for L3DirectedBroadcast-I, II.   
3) [PR922](https://github.com/opencomputeproject/SAI/pull/923): SAITEST: Added new test script SAI PTF tests for NeighborFdbAgeoutTest. Closed this PR and opened another PR-961 to resolve conflicts.    
4) [PR924](https://github.com/opencomputeproject/SAI/pull/924): SAITEST: Added new test script SAI PTF tests for IPv4/IPv6 ECMP Group member (L3IPv4EcmpGroupMemberTest-I, II, III), L3IPv6EcmpGroupMemberTest-I, II).     
5) [PR925](https://github.com/opencomputeproject/SAI/pull/925): SAITEST: Added new test script SAI PTF tests for LAG ACL (L3AclTableTest, L3AclTableGroupTest).    
6) [PR934](https://github.com/opencomputeproject/SAI/pull/934): SAITEST: Added SAI PTF Test for LAGHashseedTest.    
7) [PR935](https://github.com/opencomputeproject/SAI/pull/935): SAITEST: Added SAI PTF tests for BridgePortTest-I.    
8) [PR949](https://github.com/opencomputeproject/SAI/pull/949): SAITEST: Implementation of a buffer pool statistics counter in a Broadcom DUT is executed.   
9) [PR950](https://github.com/opencomputeproject/SAI/pull/950): SAITEST: Metafiles 'saiserializetest.c', 'saisanitycheck.c', 'Makefile', 'test.pm' are updated to work on GCC & PERL.    
10) [PR956](https://github.com/opencomputeproject/SAI/pull/956): SAITEST: Added enhancements for L2 VLAN broadcast/Unicast. The enhancements are removing the MAC from the MAC table after testing and removing only the testing ports from default VLAN before the testing.  
11) [PR961](https://github.com/opencomputeproject/SAI/pull/961): SAITEST: Added SAI PTF tests for NeighborFdbAgeoutTest.  
12) [PR963](https://github.com/opencomputeproject/SAI/pull/963): SAITEST: Fixed the wrong argument for api sai_thrift_flush_fdb_by_vlan.  13) [PR967](https://github.com/opencomputeproject/SAI/pull/967): SAITEST: Fixed SAI PTF Script error in L3IPv6EcmpGroupMemberTest.    
14) [PR972](https://github.com/opencomputeproject/SAI/pull/972): SAITEST: Added new test scripts to SAI PTF tests for L3LpbkSubnetTest.  15) [PR973](https://github.com/opencomputeproject/SAI/pull/973): SAITEST: Added a new test scripts to SAI PTF tests for L3IPv4_32Test.  
16) [PR975](https://github.com/opencomputeproject/SAI/pull/975): SAITEST: Added new test script to SAI PTF test for L3AclTableGroupTestII.  
17) [PR976](https://github.com/opencomputeproject/SAI/pull/976): SAITEST: Added new test scripts to SAI PTF tests for 3AclTableTest_II and L3AclTableTest_III.  
18) [PR977](https://github.com/opencomputeproject/SAI/pull/977): SAITEST: Local routes that are needed in addition to a neighbour and next hop are added.  
19) [PR978](https://github.com/opencomputeproject/SAI/pull/978): SAITEST: Supported SAI_ACL_ENTRY_ATTR_FIELD_DST_IP in client.  
20) [PR979](https://github.com/opencomputeproject/SAI/pull/979): SAITEST: Bugfix: Added object declaration so that the lifetime of the objects will be extended to the cleanup stage. This is done to resolve the error message "ERROR: saiacl.L3AclTableGroupTestI" that appears in the final block if the traffic test is failed.   
41) [PR981](https://github.com/opencomputeproject/SAI/pull/981): SAITEST: Bugfix: rif_id1 is created using lag_id1, modified to remove rif_id1 before removing lag_id1.  
42) [PR982](https://github.com/opencomputeproject/SAI/pull/982): SAITEST: Default value of ACL entry fields is 'false'. Modified to enable ACL entry action and field when creating ACL entry in PTF client.  
