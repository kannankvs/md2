# 202106 Features Tracking

| Feature| HLD<br/>Review<br/>Date | Owner| Code<br>Review<br>Owner| Code<br>Review<br>Date | Code PR Status   |
| ------ | ------- | -----|---------| ------------ | ---------- | 
| | | |  | | |
| Telemetry for Multi-ASIC | |	MSFT  |  | | |
| Telemetry for Chassis | |	TBD | |  |To be discussed in Chassis workgroup | 
| IPv6 Link Local/ BGP Unnumbered | |	BRCM | |  |Deferred from 202012 release  | 
| Radius AAA	| | BRCM | |  |Deferred from 202012 release  | 
| ACL enhancements	| | BRCM | |  | | 
| QoS enhancements	 || BRCM | |  | | 
| DHCP relay enhancements|	 | BRCM | |  |Ben to share details on the feature | 
| IP Helper	| | BRCM | |  | | 
| BUM storm control	| | BRCM | |  | | 
| IGMP Snooping	| | BRCM | |  | | 
| PVST/RPVST+	| | BRCM | |  | | 
| Port Channel enhancements	| | BRCM | |  | | 
| MC-LAG enhancements	| | BRCM | |  | | 
| UDLD	| | BRCM | |  | | 
| DHCP relay IPv6 support	| | Nvidia | |  | Currently DHCP relay supports only IPv4. The idea is to extend the support to IPv6 and it should work for both as the same time. Also, currently DHCP relay is enabled only based on the Type in the METADATA and it must be ‘ToRRouter’. We will remove this restriction and will integrate it with copp manager so user can decide if to have DHCP relay or not regardless of the device type | 
| App extension with Orchagent/SWSS	| | Nvidia | |  | 2nd phase of the application extension: dynamically adds logic to swss/orchagent so additional use applications can be developers developed based on SONiC application extension infrastructure. For example: dynamic policy based hashing | 
| App extension CLI generation tool	| | Nvidia | |  | 2nd phase of the application extension: a CLI generation tool for application extension programs. An improvements following the current infra available  | 
| App extension with warmboot awareness	| | Nvidia | |  | 2nd phase of the application extension: warmboot awareness and integration of an application extension that requires warmboot support | 
| [Enable/Disable auto negotiation <br> and speed setting with number of lanes](https://nam06.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2FAzure%2FSONiC%2Fblob%2F9b58ef06ab49b489e3aed287659100ce7be8c76a%2Fdoc%2Fport_auto_neg%2Fport-auto-negotiation-design.md%23cli-enhancements&data=04%7C01%7Cxinxliu%40microsoft.com%7Ce7ab50e42bab4524213308d8bca05843%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C637466744147146102%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=AD9apkj5U5YYYzQ%2BLp9PAh4V4dk8HU5JU15zlmpXv3k%3D&reserved=0) | | Nvidia | |  | Add new CLIs to enable/disable auto negotiation per interface as well as setting the number of lanes per requested speed. | 
| (Test) Upgrade to Python3 compliance <br> for SONiC mgmt repo Ansible <br> 2.10 upgrade Testbed v2 | | MSFT | |  | |
| Dynamic Policy Based Hashing	| | Nvidia | |  | | 
| Add FRR running configuration to techsupport|	 | Nvidia | |  | Improve the FRR information in the tech support following the below github issue [5067](https://github.com/Azure/sonic-buildimage/issues/5067) | 
| TPID config support 	| | MSFT | |  | Deferred from 202012 release SAI 1.6.x supports this; Vendor support required | 
| Kubernetes enhancements	| | MSFT | |  | | 
| (Test) Deprecating Python2 platform daemons	| | MSFT | |  | | 
| MACSEC enhancement: primary & fallback case	| | MSFT | |  | | 
| Error handling (swss)	| | MSFT | |  | | 
| 100% SONiC YANG model	 | | MSFT | |  | New Working group: To be discussed in sonic-yang-subgroup@googlegroups.com, please join subgroup to learn more.  | 
| Testcase/Testbed Infrastructure|	 | MSFT | |  | | 
| New branch creation for Debian11	| | MSFT | |  | | 
| SONiC fanout support	| | MSFT | |  | | 
| Dynamic hash policy|	 | MSFT | |  | | 
| Telemetry for BGP	| | MSFT | |  | | 
| Inband mgmt VRF |	 | DELL | |  |  HLD pending for review (#638) | 
| Sample Rate on mirror	| | Innovium | |  | Ability to sample on a mirror. i.e, instead of mirroring all the packets, just send 1 out of n packets. This involves adding SONiC support  for Mirror session attribute SAI_MIRROR_SESSION_ATTR_SAMPLE_RATE. | 
| Sflow with remote collector |	 | Innovium | |  |  Currently, SONiC supports sending sFlow samples to local CPU. Add support to send the samples to a remote collector  using a mirror session of type (SAI_SAMPLEPACKET_TYPE_MIRROR_SESSION).| 
| V4/V6 L3 ACL optimization	| | Innovium | |  | Currently SONiC uses separate ACL tables for L3 and L3v6 RACLs. In some ASICs, if a user wants both v4 and v6 rules, they would end up using two hardware ACL tables instead of one. The proposal is to give the platform the ability to mention if they want to support L3 and L3V6 ACLs in the same hardware ACL Table. This approach has been taken in the community for Mirror ACL tables but not for L3 ACLs. We are extending this to L3 ACLs as well. | 
| SONiC for MPLS Dataplane	| | Juniper | |  | New Working group: To be discussed in sonic-mpls-workgroup@googlegroups.com. Please join the subgroup to learn more and contributions.  | 
| 6to4 NAT	| | Intel | |  | Will be in 202112 (Remove from list) | 
| MPLS SRv6	| | Intel | |  | SONiC/SAI support for linux static route+SRV6 encapsulation;To be discussed in sonic-mpls-workgroup | 
| Better route scalability with multiple<br> next-hops | |	Metaswitch  | |  | Split next hop groups out of routing table (back-compatibly). To be discussed in sonic-mpls-workgroup | 
| Enabling IS-IS in the dataplane | | Metaswitch | |  | Getting IS-IS PDUs to the control plane. To be discussed in sonic-mpls-workgroup | 
| Class-based forwarding | | Metaswitch | |  | Policy-based tunnel selection. To be discussed in sonic-mpls-workgroup | 
