There will be periodic SONiC Roadmap planning sessions.  These will define the new capabilities to be delivered by the SONiC project in its next release.  It's expected that new feature contributions will be aligned with the roadmap.  

Pull requests for features that are not in the roadmap may not be accepted into the project.  This is to help ensure the project can produce a stable, reliable release and make progress.  

| Release      | Release Date | SAI version | Features Included                  |
|--------------|--------------|-------------|------------------------------------|
| SONiC.201705 | 5/15/2017    | 0.9.4       | BGP                                |
|              |              |             | ECMP                               |
|              |              |             | LAG                                |
|              |              |             | LLDP                               |
|              |              |             | QoS - ECN                          |
|              |              |             | QoS - RDMA                         |
|              |              |             | Priority Flow Control              |
|              |              |             | WRED                               |
|              |              |             | COS                                |
|              |              |             | SNMP                               |
|              |              |             | Syslog                             |
|              |              |             | Sysdump                            |
|              |              |             | NTP                                |
|              |              |             | COPP                               |
|              |              |             | DHCP Relay Agent                   |
|              |              |             | SONiC to SONiC upgrade             |
|              |              |             | Multiple Images support            |
|              |              |             | One Image                          |
| SONiC.201709 | 9/15/2017    | 0.9.4       | VLAN                               |
|              |              |             | ACL permit/deny                    |
|              |              |             | IPv6                               |
|              |              |             | Tunnel Decap                       |
|              |              |             | Mirroring                          |
|              |              |             | Post Speed Setting                 |
|              |              |             | BGP Graceful restart helper        |
|              |              |             | BGP MP                             |
|SONiC.201712  | 12/15/2017   | 1.0         | Fast Reload                        |
|              |              |             | SONiC Support SAI 1.0              |
|              |              |             | TACACS+                            |
|              |              |             | LACP Fallback                      |
|              |              |             | MTU Setting                        |
|              |              |             | Vlan Trunk                         |
|              |              |             | Static Port breakout<sup>1<sup>    |
|              |              |             | Dynamic ACL Upgrade                |
|              |              |             | SWSS Unit Test Framework           |
|              |              |             | CobfigDB framework                 |
| SONiC.201803 | 03/15/18     | 1.2         |                                    |
|              |              |             | [Critical Resource Monitoring](https://github.com/Azure/SONiC/wiki/Critical-Resource-Monitoring-High-Level-Design)       |
|              |              |             | MAC Aging                          |
|              |              |             | [IPv6 ACL](https://github.com/Azure/SONiC/blob/gh-pages/doc/ACL-enhancements-on-SONIC.docx) |
|              |              |             | [BGP/Neighbor-down fib-accelerate](https://github.com/Azure/SONiC/blob/gh-pages/doc/sonic-ecmp-acceleration.docx)   |
|              |              |             | [PFC WD](https://github.com/Azure/SONiC/wiki/PFC-Watchdog-Design)                             |
| SONiC.201807 | 07/30/18     | 1.3         |                   |
|              |              |             | [gRPC](https://github.com/Azure/SONiC/pull/207)|
|              |              |             | [Dtel support](https://github.com/Azure/SONiC/pull/182)|
|              |              |             | SONiC Architecture and User Manual (Documentation)| 
|              |              |             | [Sensor transceiver monitoring](https://github.com/Azure/SONiC/pull/202)|
|              |              |             |LLDP extended MIB: lldpremtable, lldplocporttable, lldpremmanaddrtable, lldplocmanaddrtable, lldplocporttable, lldpLocalSystemData|
| SONiC.201811 | 11/30/18     | 1.3         | [Release Note](https://github.com/Azure/SONiC/blob/master/doc/SONiC%20201811%20Release%20Note.pdf)                                   |
|              |              |             | [Debian Kernel Upgrade to 4.9](https://github.com/Azure/SONiC/wiki/Upgrading-SONiC-kernel-to-3.16.0‐5-or-later-versions)       |
|              |              |             | [Warm Reboot](https://github.com/Azure/SONiC/pull/187) |
|              |              |             | [Incremental Config (IP, LAG, Port shut/unshut)](https://github.com/Azure/SONiC/blob/7ae7106fd3106cfc9a6a60a81d3b8f5ebd9ebab5/doc/Incremental%20IP%20LAG%20Update.md)|
|              |              |             | [Asymmetric PFC](https://github.com/Azure/SONiC/wiki/Asymmetric-PFC-High-Level-Design)|
|              |              |             | [PFC Watermark](https://github.com/Azure/SONiC/blob/master/doc/watermarks_HLD.md) |
|              |              |             | [Routing Stack Graceful Restart](https://github.com/Azure/SONiC/blob/dcac72377f23521a394694214678ea4450f6f70a/doc/routing-warm-reboot/Routing_Warm_Reboot.md)|
|              |              |             | [Basic VRF and L3 VXLAN](https://github.com/Azure/SONiC/blob/master/doc/vxlan/Vxlan_hld.md)             |
| SONiC.201904 | 04/30/2019   |   1.4       | [Release Note](https://github.com/Azure/SONiC/blob/master/doc/SONiC%20201904%20Release%20Notes.md )                                  |
|              |              |             | FRR as default routing stack      |
|              |              |             | Upgrade each docker to stretch version   |
|              |              |             | Upgrade docker engine to 18.09    |
|              |              |             | [Everflow enhancement](https://github.com/Azure/SONiC/blob/bb4f4a3a85935a38ec7f9625ef62cbe58c0998b4/doc/SONiC_EVERFLOW_IPv6.pdf)              |
|              |              |             | [Egress ACL bug fix and ACL CLI enhancement](https://github.com/Azure/SONiC/blob/dfa7e58292deb4d7b10d1e0ca73f296cd206e9d2/doc/acl/egress-acl-bug-fix-description.md)|
|              |              |             | [L3 RIF counter support](https://github.com/Azure/SONiC/pull/310 ) |
|              |              |             | [PMon Refactoring](https://github.com/Azure/SONiC/tree/master/doc/pmon)|
|              |              |             | BGP-EVPN support(type 5), (related HLD [Fpmsyncd](https://github.com/Azure/SONiC/pull/375),[Vxlanmgr](https://github.com/Azure/SONiC/pull/369),[template](https://github.com/Azure/sonic-buildimage/pull/2838/files))  |
|              |              |             | [Transceiver parameter tuning](https://github.com/Azure/SONiC/pull/328/files) PR pending on CR sign off|
| SONiC.201911 | 10/30/2019   |   1.5       |  [Progress Tracking](https://github.com/Azure/SONiC/wiki/Release-Progress-Tracking-201911) &nbsp;&nbsp; &nbsp;&nbsp; [Release Notes](https://github.com/Azure/SONiC/blob/master/doc/SONiC_201911_Release_Notes.md)  |
|              |              |             | [ZTP - design review in progress](https://github.com/Azure/SONiC/blob/master/doc/ztp/ztp.md)      |
|              |              |             | [Mgmt VRF](https://github.com/Azure/sonic-utilities/pull/463/commits/d6d14929ef1f1d27f92e4bb5db30fba8b39dcfd4)      |
|              |              |             | [sFlow](https://github.com/Azure/SONiC/pull/389)      |
|              |              |             | [L3 perf enhancement](https://github.com/Azure/SONiC/pull/399) |
|              |              |             | [VRF](https://github.com/Azure/SONiC/blob/master/doc/vrf/sonic-vrf-hld.md) |
|              |              |             | Platform test                                                |
|              |              |             | [SSD diagnostic<br/>tolling](https://github.com/Azure/SONiC/pull/378) |
|              |              |             | [Management<br/>Framework](https://github.com/Azure/SONiC/pull/436) |
|              |              |             | [Multi-DB optimization-Part 1](https://github.com/Azure/SONiC/blob/master/doc/database/multi_database_instances.md) |
|              |              |             | [Sub-port support](https://github.com/Azure/SONiC/pull/420)  |
|              |              |             | [Build time<br/>improvements](https://github.com/Azure/SONiC/pull/419) |
|              |              |             | [Egress mirroring and<br/>ACL action support check via SAI](https://github.com/Azure/SONiC/pull/411) |
|              |              |             | [Configurable<br/>drop counters](https://github.com/Azure/SONiC/pull/434) |
|              |              |             | [Log analyzer to pytest](https://github.com/Azure/SONiC/pull/421) |
|              |              |             | [HW resource monitor](https://github.com/Azure/SONiC/pull/439) |
|              |              |             | [NAT](https://github.com/Azure/SONiC/pull/390) |
|              |              |             | ONIE FW tools - bios & cpld|
| SONiC.202006 | 06/30/2020   | SAI1.6.3    | [Progress Tracking](https://github.com/Azure/SONiC/wiki/Release-Progress-Tracking-202006), [Release Note](https://github.com/Azure/SONiC/blob/9da3e719a613512963b075f2bd151c6d56d6b902/doc/SONiC_202006_Release_Notes.md) |
|            |              |               | Build Improvements |
|            |              |               | Bulk API for route |
|            |              |               | [D-Bus to Host Communications](https://github.com/Azure/SONiC/pull/541/files#diff-0fe927c97d0445fd919a2316bd0c5aa7) |
|            |              |               | Debian 10 upgrade, base image,driver |
|            |              |               | [Dynamic port break](https://github.com/Azure/SONiC/blob/master/doc/dynamic-port-breakout/sonic-dynamic-port-breakout-HLD.md) |
|            |              |               | [Egress shaping (port, queue)](https://github.com/Azure/SONiC/pull/535) |
|            |              |               | [FW utils extension: SSD upgrade](https://github.com/Azure/SONiC/blob/master/doc/fwutil/fwutil.md) |
|            |              |               | Getting docker ready for Debian 10 |
|            |              |               | Platform APIs move to new APIs * - Continuation |
|            |              |               | [Port Mirroring](https://github.com/Azure/SONiC/pull/580) |
|            |              |               | Porting mVRF support to Debian 10  |
|            |              |               | [Proxy ARP](https://github.com/Azure/SONiC/pull/579/files#diff-27f0a7d1396a80ae9bb361e779f14e8c) |
|            |              |               | Pytest 100% moved from ansible to Pytest |
|            |              |               | SPytest |
|            |              |               | [Thermal control](https://github.com/Azure/SONiC/blob/master/thermal-control-design.md) |
|SONiC.202012| 12/31/2020   |       TBD     | [Progress Tracking](https://github.com/Azure/SONiC/wiki/Release-Progress-Tracking-202012) |
|			 |				|				| [Chassis infrastructure, T2 topologies and sample Testcases converted](https://github.com/Azure/sonic-mgmt/blob/master/ansible/library/multi-asic_aware_module_requirements.md) |
|            |              |               | [Consistent ECMP support (fine grain ECMP)](https://github.com/anish-n/SONiC/blob/e5cdb3d9337026a98d6be5d558126926a4e959e4/doc/ecmp/fine_grained_next_hop_hld.md) |
|            |              |               | Console Support for SONiC (Hardware)|
|            |              |               | Console Support for SONiC (SSH forwarding)|
|            |              |               | Container warm restart (BGP/TeamD/SWSS/SyncD) |
|            |              |               | [CoPP Config/Management](https://github.com/Azure/SONiC/blob/262e2581c3360e971c370e347c608d081d7e1c49/doc/copp/CoPP%20Config%20and%20Management.md) |
|            |              |               | [Distributed forwarding in a VOQ architecture HLD](https://github.com/Azure/SONiC/blob/e607a9f3e8e0cc77687acf7913b559210804cc65/doc/chassis/system-ports.md) |
|            |              |               | [Dynamic headroom calculation](https://github.com/Azure/SONiC/blob/415f19931bccd900ac528b100aafffa6000e82e9/doc/qos/dynamically-headroom-calculation.md)               |
|            |              |               | [Enable synchornous SAI APIs (error handling)](https://github.com/shi-su/SONiC/blob/61762c8e709ead5f8ee7df83facea6ceee9de6f5/doc/synchronous-mode/synchronous-mode-cfg.md)|
|            |              |               | [EVPN/VXLAN](https://github.com/Azure/SONiC/blob/7fbda34ee3315960c164a0c202f39c2ec515cfc3/doc/vxlan/EVPN/EVPN_VXLAN_HLD.md) |
|            |              |               | [FRR BGP NBI](https://github.com/Azure/SONiC/blob/48e9012c548528b6528745bda9d75b4164e785eb/doc/mgmt/SONiC_Design_Doc_Unified_FRR_Mgmt_Interface.md) |
|            |              |               | [Gearbox](https://github.com/Azure/SONiC/blob/master/doc/gearbox/gearbox_mgr_design.md) |
|            |              |               | [Kubernetes (docker to be controlled by Kubernetes)](https://github.com/renukamanavalan/SONiC/blob/kube_systemd/doc/kubernetes/Kubernetes-support.md) |
|            |              |               | Management Framework (Phase 2) |
|            |              |               | Merge common lib for C++ and python (SWSS common lib)  |
|            |              |               | Move from Python2->python3 |
|            |              |               | [Multi-ASIC](https://github.com/Azure/SONiC/blob/ebe4f4b695af5d2dbd23756d3cff03aef0a0c880/doc/multi_asic/SONiC_multi_asic_hld.md) |
|            |              |               | Multi-DB enhancement-Part 2 |
|            |              |               | ONIE FW tools CPLD, BIOS, SSD, Firmware upgrade [Uniform Tool] |
|            |              |               | [PDDF advance to SONiC Platform 2.0, BMC](https://github.com/Azure/SONiC/blob/master/doc/platform/brcm_pdk_pddf.md) |
|            |              |               | [PDK - Platform Development Environment](https://github.com/Azure/SONiC/blob/master/doc/platform/pde.md) |
|            |              |               | [RADIUS AAA](https://github.com/Azure/SONiC/blob/3edad287edc79ea7e227648cba566a6ce347bf49/doc/aaa/radius_authentication.md) |
|            |              |               | [SONiC entity MIB extensions](https://github.com/Azure/SONiC/blob/0e53548a8f1023d1be2a1dffd62737c7a1b18a2e/doc/snmp/extension-to-physical-entity-mib.md) |
|            |              |               | [Support hardware reboot/reload reason (Streaming Telemetry)](https://github.com/sujinmkang/SONiC/blob/6ed19e88c6f7aac74640d3d343210d840af70a23/doc/system-telemetry/reboot-cause.md)|
|            |              |               | [System health and system LED](https://github.com/Azure/SONiC/blob/master/doc/system_health_monitoring/system-health-HLD.md) |
|            |              |               |    |
|SONiC.202106| 06/30/2021   |       TBD     | [Progress Tracking](https://github.com/Azure/SONiC/wiki/Release-Progress-Tracking-202106) |
|			 |				|				| Telemetry for Multi-ASIC |
| 			 |              |               | Telemetry for Chassis |
| 			 |              |               | IPv6 Link Local/ BGP Unnumbered |
| 			 |              |               | Radius AAA |
| 			 |              |               | ACL enhancements | 
| 			 |              |               | QoS enhancements |
| 			 |              |               | DHCP relay enhancements |
| 			 |              |               | IP Helper |
| 			 |              |               | BUM storm control | 
| 			 |              |               | IGMP Snooping | 
| 			 |              |               | PVST/RPVST+  |  
| 			 |              |               | Port Channel enhancements | 
| 			 |              |               | MC-LAG enhancements |
| 			 |              |               | UDLD | 
| 			 |              |               | DHCP relay IPv6 support | 
| 			 |              |               | App extension with Orchagent/SWSS | 
| 			 |              |               | App extension CLI generation tool | 
|			 |				|				| App extension with warmboot awareness |
|			 |				|				| [Enable/Disable auto negotiation and speed setting with number of lanes](https://nam06.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2FAzure%2FSONiC%2Fblob%2F9b58ef06ab49b489e3aed287659100ce7be8c76a%2Fdoc%2Fport_auto_neg%2Fport-auto-negotiation-design.md%23cli-enhancements&data=04%7C01%7Cxinxliu%40microsoft.com%7Ce7ab50e42bab4524213308d8bca05843%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C637466744147146102%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=AD9apkj5U5YYYzQ%2BLp9PAh4V4dk8HU5JU15zlmpXv3k%3D&reserved=0) |
|			 |				|				| (Test) Upgrade to Python3 compliance for SONiC mgmt repo Ansible 2.10 upgrade Testbed v2 |
| 			 |              |               | Dynamic Policy Based Hashing | 
| 			 |              |               | Add FRR running configuration to techsupport |	
| 			 |              |               | TPID config support | 
| 			 |              |               | Kubernetes enhancements | 
| 			 |              |               | (Test) Deprecating Python2 platform daemons |
| 			 |              |               | MACSEC enhancement: primary & fallback case |
| 			 |              |               | Error handling (swss)	| 
| 			 |              |               | 100% SONiC YANG model	 |  
| 			 |              |               | Testcase/Testbed Infrastructure |
| 			 |              |               | New branch creation for Debian11 | 
| 			 |              |               | SONiC fanout support |
| 			 |              |               | Dynamic hash policy |
| 			 |              |               | Telemetry for BGP | 
| 			 |              |               | Inband mgmt VRF |
| 			 |              |               | Sample Rate on mirror	|
| 			 |              |               | Sflow with remote collector |	
| 			 |              |               | V4/V6 L3 ACL optimization | 
| 			 |              |               | SONiC for MPLS Dataplane | 
| 			 |              |               | 6to4 NAT | 
| 			 |              |               | MPLS SRv6 |  
|			 |				|				| Better route scalability with multiple next-hops |
|			 |				|				| Enabling IS-IS in the dataplane |
|			 |				|				| Class-based forwarding |
|			 |				|				|				  | 
| Backlog    |              |               |                 |
|		     |			    | 				| BGP Add Path: https://tools.ietf.org/rfc/rfc7911.txt |
|		     |			    | 				| BGP ExtComm: https://tools.ietf.org/rfc/rfc4360.txt |
|		     |			    | 				| BGP Link bandwidth ExtComm: https://tools.ietf.org/pdf/draft-ietf-idr-link-bandwidth-07.pdf |
|            |              |               | [Kernel programming performance enhancement](https://github.com/Azure/SONiC/blob/f39c72147209aab8fec5deebb965bf4c91a1f876/doc/platform/nlapi/netlink_api_kernel_programming.md) |
|            |              |               | SONiC shared headroom - enhanced configuration | 
|            |              |               | SONiC new polling counters for counters which has extend CPU req.|
|            |              |               | ACL enhancements: Policing, DHCP/PCP remark, L2 | 
|            |              |               | VoQ Chassis Support in SONiC |
|            |              |               | [SONiC TPID Configuration](https://github.com/Azure/SONiC/pull/681) | 
|            |              |               | [BFD SW 100ms interval from FRR](https://github.com/Azure/SONiC/blob/master/doc/bfd/BFD_Enhancement_HLD.md)| 
|            |              |               | [IPv6 Link Local and BGP Unnumbered](https://github.com/Azure/SONiC/blob/3d2e5e66e05bcce0a64f5ad077b96ae2006527fd/doc/ipv6/ipv6_link_local.md)| 
|            |              |               | [Management Framework RBAC](https://github.com/Azure/SONiC/blob/48fab9db4f090c5beaea5f7a8fdcb9474d23a4e9/doc/aaa/SONiC%20RBAC.md) | 
|            |              |               | [Media Enhancements<br>(Media Information & Settings)](https://github.com/Azure/SONiC/blob/a6e9636552149829e39a82705d1ad2b48a17b3f0/doc/media-info-enhancements/media-info.md) | 
|          	 |              |               | [AAA improvement ](https://github.com/Azure/SONiC/blob/a46aa68b3a3ca57fea28c3d139fcef437e0cf0e6/doc/aaa/AAA20Improvements/AAA%20Improvements.md) |
|          	 |              |               | [MACSec support in Chassis](https://github.com/Pterosaur/SONiC/blob/fdbaa116fdc4579c67974e70efcce3c882801fcf/doc/macsec/MACsec_hld.md) |
|            |              |               | [MC-LAG (L2)](https://github.com/Azure/SONiC/blob/176cf4f5a8ee6ecfd8a478573ffc92f0eb23b4e6/doc/mclag/MCLAG_Enhancements_HLD.md) |
| 			 |              |               | [PCIe Monitoring](https://github.com/Azure/SONiC/pull/634) 
| 			 |              |               | [Distributed VOQ architecture HLD](https://github.com/Azure/SONiC/blob/a9b221e3252e5ef3a45d18f615c23d3794f39a5b/doc/voq/voq_hld.md)
| 			 |              |               | [Platform Monitoring for Chassis systems](https://github.com/Azure/SONiC/blob/4206c5420c4b63f1d2ec40b10d54adb27fc9d42a/doc/pmon/pmon-chassis-design.md)
| 			 |              |               | [Routing/BGP for Chassis](https://github.com/Azure/SONiC/blob/35d6f8d1a88a8f8b08237d6ec9f719e9c06a6758/doc/voq/bgp_voq_chassis.md)
| 			 |              |               | [Fabric Port support for SONiC](https://github.com/Azure/SONiC/blob/2e1f699a3ba1dbf88abeecb192f6bb5e390b8b8a/doc/chassis/fabric.md)
| 			 |              |               | [LAG Support for Chassis](https://github.com/Azure/SONiC/blob/332ca53d938e0df24c78d76bcf1117d896ed2683/doc/voq/lag_hld.md)
| 			 |              |               | [Inband port support for Chassis](https://github.com/Azure/SONiC/pull/639)
| 			 |              |               | [Everflow Support](https://github.com/Azure/SONiC/blob/9c08b2f3f77230017c7035ceaf880746cb590d49/doc/voq/everflow.md)
| 			 |              |               | VNET ping tool to debug VNET configuration |
|          	 |              |               | SONiC app extension (w/o orchagent)|
| 			 |              |               | Segment Routing support in SONiC | 
|            |              |               | Extending Entphysicaltable MIB table |
|            |              |               | Extend FW debug info in sysdump |
|            |              |               | Flow-based Services (incl. packet DSCP remark) |
|            |              |               | L2 Dot1Q tunneling support |
|            |              |               | [L2 functional and performance enhancements](https://github.com/Azure/SONiC/pull/379)|
|            |              |               | [PDK - Platform Driver Development Framework](https://github.com/Azure/SONiC/blob/master/doc/platform/brcm_pdk_pddf.md) |

  


**NOTE**
* Platform APIs will be backwards compatible in 201908, will be cut over to new APIs in the next release
