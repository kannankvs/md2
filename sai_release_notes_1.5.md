# SAI RELEASE NOTES - SAI 1.5 RELEASE  

This release notes explains the various features and changes done for SAI1.5 release.

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

More details about this feature enhancement is available at [TAM2.0 Spec](#https://github.com/opencomputeproject/SAI/blob/master/doc/TAM/SAI-Proposal-TAM2.0-v2.0.docx)
PRs related to this feature are [PR958](#https://github.com/opencomputeproject/SAI/pull/958) and [PR959](#https://github.com/opencomputeproject/SAI/pull/959) 

### NAT  
•	Creation of APIs to configure NAT feature. API set is generic to configure various types of NAT. Besides configuration these APIs can read the NAT table for aging and is achieved using the TAM GET API  
•	Providing set of new definitions for SAI NAT specifications  

### sFlow  
To be filled

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
22) PR959, : TAM
