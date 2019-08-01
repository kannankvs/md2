# SAI 1.5 RELEASE NOTES

This release notes explains the new APIs that are introduced & changes done for various features for SAI1.5 release.

## NEW APIs Introduced In This Release  

1) TAM APIs  
2) NAT APIs  
3) sFlow APIs  
Details of all APIs are given in the appropriate sections given below.



## Features And Enhancements  
### TAM  
Telemetry And Monitoring (TAM) has been enhanced from 1.0 to 2.0 to provide a hierarchical API model designed with following goals:  
•	Express top level Telemetry and Monitoring domain  
•	Remain backward compatible for application with minimal or no change in the application code  
•	Provide extensibility for new functions/capability in each domain/sub domain and always remain backward compatible  
•	Remove any hardcoded assumptions about domain or domain’s capabilities  
•	Provide full abstraction for operators to dynamically learn the number of domains supported within a networking element  
•	Provide full abstraction for operators to dynamically learn domains capabilities  
•	Provide flexibility to add new APIs for a given domain/sub domain  
•	Support local mathematical functions for hierarchical analysis  

#### New TAM 2.0 APIs  

1) **create_tam_int**  
   sai_status_t (*sai_create_tam_report_fn)( _Out_ sai_object_id_t *tam_report_id, _In_ sai_object_id_t switch_id, _In_ uint32_t attr_count, _In_ const sai_attribute_t *attr_list);
	
2) **remove_tam_int**  
   sai_status_t (*sai_remove_tam_int_fn) (_In_ sai_object_id_t tam_int_id);  

3) **set_tam_int_attribute**  
   sai_status_t (*sai_set_tam_int_attribute_fn) (_In_ sai_object_id_t tam_int_id, _In_ const sai_attribute_t *attr);  

4) **get_tam_int_attribute**  
   sai_status_t (*sai_get_tam_int_attribute_fn) (_In_ sai_object_id_t tam_int_id, _In_ uint32_t attr_count, _Inout_ sai_attribute_t *attr_list);  


More details about this feature enhancement is available at [TAM2.0 Spec](https://github.com/opencomputeproject/SAI/blob/master/doc/TAM/SAI-Proposal-TAM2.0-v2.0.docx)
PRs related to this feature are [PR958](https://github.com/opencomputeproject/SAI/pull/958) and [PR959](https://github.com/opencomputeproject/SAI/pull/959) 

### NAT  
•	Provisioning of APIs to configure NAT feature. API set is generic to configure various types of NAT. Besides configuration, these APIs can read the NAT table for aging and is achieved using the TAM GET API  
•	Provisioning a set of new definitions for SAI NAT specifications  

**Features:** Basic NAT (SNAT, DNAT), subnet based NAT, NAPT, Double NAT, NAT Exceptions

New SAI APIs are introduced for configuring the following. 
1) **NAT Zones**: NAT Zones are configured for translation. Only when packet crosses across NAT zones then NAT translation is done. SONiC will configure interfaces as a member of the zones. Zone ID is passed in the API setting up NAT rules.
2) **Enabling NAT**: 
3) **Enable Traps for SNAT and DNAT Miss Packets**

#### New NAT APIs  

1) **create_nat_range**  
   sai_status_t (*sai_create_nat_range_fn) (_Out_ sai_object_id_t *nat_range_id, _In_ sai_object_id_t switch_id, _In_ uint32_t attr_count, _In_ const sai_attribute_t *attr_list);  
   
2) **remove_nat_range**  
   sai_status_t (*sai_remove_nat_range_fn) (_In_ sai_object_id_t nat_range_id);  

3) **set_nat_range_attribute**  
   sai_status_t (*sai_set_nat_range_attribute_fn) (_In_ sai_object_id_t nat_range_id, _In_ const sai_attribute_t *attr);  

4) **get_nat_range_attribute**  
   sai_status_t (*sai_get_nat_range_attribute_fn) (_In_ sai_object_id_t nat_range_id, _In_ uint32_t attr_count, _Inout_ sai_attribute_t *attr_list);  

5) **create_nat**  
   sai_status_t (*sai_create_nat_fn) (_Out_ sai_object_id_t *nat_id, _In_ sai_object_id_t switch_id, _In_ uint32_t attr_count, _In_ const sai_attribute_t *attr_list);  

6) **remove_nat**  
   sai_status_t (*sai_remove_nat_fn)(_In_ sai_object_id_t nat_id);  

7) **set_nat_attribute**  
   sai_status_t (*sai_set_nat_attribute_fn)(_In_ sai_object_id_t nat_id, _In_ const sai_attribute_t *attr);  

8) **get_nat_attribute**  
   sai_status_t (*sai_get_nat_attribute_fn)(_In_ sai_object_id_t nat_id, _In_ uint32_t attr_count, _Inout_ sai_attribute_t *attr_list);  


PRs related to this feature are [PR937](https://github.com/opencomputeproject/SAI/pull/937/commits/a682f3d550a5854ba9c71e5e51bd5cb708418482)


### sFlow  

sFlow (defined in https://sflow.org/sflow_version_5.txt) is a standard-based sampling technology the meets the key requirements of network traffic monitoring on switches and routers. sFlow uses two types of sampling:

- Statistical packet-based sampling of switched or routed packet flows to provide visibility into network usage and active routes
- Time-based sampling of interface counters.  

The sFlow monitoring system consists of:  

- sFlow Agents that reside in network equipment which gather network traffic and port counters and combines the flow samples and interface counters into sFlow datagrams and forwards them to the sFlow collector at regular intervals over a UDP socket. The datagrams consist of information on, but not limited to, packet header, ingress and egress interfaces, sampling parameters, and interface counters. A single sFlow datagram may contain samples from many flows.  
- sFlow collectors which receive and analyze the sFlow data.  
sFlow is an industry standard, low cost and scalable technique that enables a single analyzer to provide a network wide view.


sFlow support in SAI requires both samplepacket proposal and host-if proposal changes. The samplepacket proposal hasn’t been changed recently and is used as-is.  
PRs related to Host-if proposal changes are [936](https://github.com/opencomputeproject/SAI/pull/936)


## Pull Request Details  
1) PR983: Added additional fields for hashing -  inner ip protocol, inner ethertype, inner l4 src/dst port, inner src/dst mac that can be used for tunneled packets.  
2) PR982: SAITEST: Default value of ACL entry fields is 'false'. Modified to enable ACL entry action and field when creating ACL entry in PTF client.  
3) PR981: SAITEST: Bug fix: rif_id1 is created using lag_id1, modified to remove rif_id1 before removing lag_id1.  
4) PR980: saibuffer: Added more explanation to include headroom pool in ingress buffer pool.
5) PR979: SAITEST: Bug fix: Added object declaration so that the life time of the objects will be extended to cleanup stage. This is done to resolve the error message "ERROR: saiacl.L3AclTableGroupTestI" that appear in the final block if the traffic test failed.   
6) PR978: SAITEST: Supported SAI_ACL_ENTRY_ATTR_FIELD_DST_IP in client.  
7) PR977: SAITEST: Local routes that are needed in addition to neighbor and next hop are added.  
8) PR976: SAITEST: Added new test scripts to SAI PTF tests for 3AclTableTest_II and L3AclTableTest_III
9) PR975: SAITEST: Added new test script to SAI PTF test for L3AclTableGroupTestII
10) PR974: saibfd.h: Added additional attributes for BFD Session like SAI_BFD_ENCAPSULATION_TYPE_NONE to sai_bfd_encapsulation_type_t, Negotiated Transmit interval, Negotiated Receive interval,  
           Local Diagnostic code field, Remote Diagnostic code field and Remote time Multiplier to sai_bfd_session_attr_t, mostly for diagnostics purpose.
11) PR973: SAITEST: Added new test scripts to SAI PTF tests for L3IPv4_32Test
12) PR972: SAITEST: Added new test scripts to SAI PTF tests for L3LpbkSubnetTest
13) PR971: saiport.h: added attribute SAI_PORT_ATTR_PTP_MODE to port-obj for timestamping for PTP packets.
14) PR970: saihostif.h: Added a RO attribute to trap object to count the packets trapped to CPU. 
15) PR969: saiseraialize.c, saiseraializetest.c: Fixes for ARM32 bit in the usage of printf format specifiers.
16) PR967: SAITEST: Fixed SAI PTF Script error in L3IPv6EcmpGroupMemberTest
17) PR964: saitypes.h: Fixed qosmap comment in sai_attribute_value_t
18) PR963: SAITEST: Fixed the wrong argument for api sai_thrift_flush_fdb_by_vlan
19) PR962: saiacl.h: Fixed SAI_ACL_ENTRY_ATTR_ACTION_PACKET_ACTION description
20) PR961: SAITEST: Added SAI PTF tests for NeighborFdbAgeoutTest
21) PR960: saibfd.h, saiswitch.h: Added capabilities for the SAI/BFD API to allow applications to query the list of supported offloads (SAI_BFD_SESSION_OFFLOAD_TYPE_FULL, SAI_BFD_SESSION_OFFLOAD_TYPE_SUSTENANCE & SAI_BFD_SESSION_OFFLOAD_TYPE_NONE)  and choose an offload while creating a BFD session.
22) PR959: TAM: Added optional attribute in ACL to bind a TAM INT object. Enhanced sai_tam_int_type enum to distinguish between P4 INT v1 and v2 and added a codepoint for direct export  
23) PR958: TAM: Added attributes to associate telemetry objects and probes. Created an object in the driver for tracking the buffer usage  
24) PR956: SAITEST: Added enhancement for L2 VLAN broadcast, Unicat testing. After testing MAC "00:00:00:00:00:01" leared in the ingress port is removed and before testing only the testing ports from default vlan are removed  
25) PR950: METAFILES: Metafiles 'saiserializetest.c', 'saisanitycheck.c', 'Makefile', 'test.pm' are updated to work on GCC & PERL  
26) PR949: SAITEST: Tested the implementation of a buffer pool statistics counter in a broadcom DUT  
27) PR948: saiport.h: Added an attribute for controlling Link Training on the ports, for improving interoperability among devices  
28) PR947: saiswitch.h: Added a RO attribute for STP Max Instances on the switch object  
29) PR946: saihostif.h: Added support for BFD packets to be trapped to CPU  
30) PR943: SAI data plane telemetry (DTEL).  DTEL Queue Report is complementary to TAM snapshot. While TAM snapshot reports queue statistics data in bulk on threshold breach, DTEL Queue Report can send reports for every packet on congestion start, so that the network monitor can have per-packet full visibility on how the queue is built up  
31) PR942: SAI generic resource monitoring. To help distibguish between different resource pools for the same object type, attributes that are annotated with `@isresourcetype` must be passed to the function with corresponding values  
32) PR941: To use default gateway for routing insted of switching; L3_VXLAN table entry is used instead of fdb in cases, where the overlay destination MAC is global for all VTEPs.     
33) PR939: Generic counters are added for better visibility and debugging. Tx packet and byte count for statistics along with stats in custom range base are added. The behaviour of the counter is as follows. Counter can be attached/detached multiple times during it's lifetime. Detaching a counter from an object does not clear it's stats values. Attaching a counter to an object does not clear it's stats values. Counter can be attached to multiple objects at the same time  
34) PR936: API can create a virtual tunnel interface (over a loopback) to receive trapped packets/buffers from the SAI driver. This can be used as an alternative to callback/FD based mechanisms  
35) PR935: SAITEST: Added SAI PTF tests for BridgePortTest-I  
36) PR934: SAITEST: Added SAI PTF Test for LAGHashseedTest  
37) PR929: Added bridge port type router to facilitate flooding to router or to a tunnel, on top of the regular behavior of flooding to all local ports, without needing to manage the list of local ports, by choosing the combined flood type. A sample use case for flooding to router, is VXLAN L3 peering use case, demoed in OCP, where unknown unicast traffic is sent to router  
38) PR925: SAITEST: Added new test script SAI PTF tests for LAG ACL (L3AclTableTest, L3AclTableGroupTest)  
39) PR924: SAITEST: Added new test script SAI PTF tests for IPv4/IPv6 ECMP Group member (L3IPv4EcmpGroupMemberTest-I,II,III), L3IPv6EcmpGroupMemberTest-I,II)   
40) PR922: SAITEST: Added new test script SAI PTF tests for NeighborFdbAgeoutTest. Closed this PR and opened another PR-961 to resolve conflicts  
41) PR921: SAITEST: Added L3 Directed Broadcast tests into SAI PTF tests for L3DirectedBroadcast-I,II  
42) PR916: SAITEST: Added new test scripts SAI PTF tests for the below tests. Added sai_thrift_set_neighbor_attribute proc to update the MAC entry  
           L2MtuTest, L3MtuTest, L2MacMoveTestI, L2MacMoveTestII, L2MacMoveTestIII, L3IPv4NeighborMacTest, L3IPv6NeighborMacTest  
		   	
