
# SONiC 201903 Release Notes  

# Branch Location  
https://github.com/Azure/sonic-buildimage/tree/201904

# Dependency Version

- Linux kernel version - 4.9.110-3+deb9u2 
- SAI version - SAI 1.3 
- Quagga - 0.99.24.1-2.1 
- LLDPD - 0.9.6-0 
- TeamD - 1.26-1 
- SNMPD - 5.7.3+dfsg-1.5 
- Python - 3.6

# Feature List 

| # | Big Feature List and Design Doc Link   | Comments |
|---:     |---       |---       |
| 1       | [FRR as default routing stack](#) |  |
| 2       | Upgrade each docker to stretch version | SNMPD, LLDPD, Teamd |
| 3       | Upgrade docker engine to 18.09 |  |
| 4       | Everflow enhancement |  |
| 5       | RDMA CLI enhancement |  |
| 7       | Egress ACL bug fix and ACL CLI enhancement  |  |
| 8       | [L3 RIF counter support](https://github.com/Azure/SONiC/pull/310 )  |  |
| 9       | Transceiver parameter tuning  |  |
| 10      | [PMon Refactoring](https://github.com/Azure/SONiC/tree/master/doc/pmon)  |  |
| 11      | Performance enhancement on Redis DB  |  |
| 12      | Virtual path for streaming telemetry  |  |
| 13      | BGP-EVPN support (type 5)   |  |
| 14      | Port and Vlan configuration and validation  |  |
| 15      | 	  |  |

# Security Updates  
1. [security] Fixes for DSA-4314-1 net-snmp
https://security-tracker.debian.org/tracker/CVE-2018-18065

2. dfa

3. sdafsad

	# SAI APIs used in this release  

| SAI APIs used in this 201903 release | 
|--- |
| SAI_ACL_ACTION_TYPE_ACL_DTEL_FLOW_OP |
| SAI_ACL_ACTION_TYPE_DTEL_DROP_REPORT_ENABLE |
| SAI_ACL_ACTION_TYPE_DTEL_FLOW_SAMPLE_PERCENT |


