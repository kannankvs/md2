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
| SONiC.201911 | 10/30/2019 |   1.5       |  [Progress Tracking](https://github.com/Azure/SONiC/wiki/Release-Progress-Tracking-201911)                            |
|              |              |  | [ZTP - design review in progress](https://github.com/Azure/SONiC/blob/master/doc/ztp/ztp.md)      |
|              |              |  | [Mgmt VRF](https://github.com/Azure/sonic-utilities/pull/463/commits/d6d14929ef1f1d27f92e4bb5db30fba8b39dcfd4)      |
|              |              |  | [sFlow](https://github.com/Azure/SONiC/pull/389)      |
|              |              |             | [L3 perf enhancement](https://github.com/Azure/SONiC/pull/399) |
|              |              |             | [VRF](https://github.com/Azure/SONiC/blob/master/doc/vrf/sonic-vrf-hld.md) |
|              |              |             | Platform test                                                |
|              |              |             | [SSD diagnostic<br/>tolling](https://github.com/Azure/SONiC/pull/378) |
|              |              |             | [Management<br/>Framework](https://github.com/Azure/SONiC/pull/436) |
|              |              |             | [Multi-DB optimization-Part 1](https://github.com/Azure/SONiC/blob/master/doc/database/multi_database_instances.md) |
|              |              |  | [Sub-port support](https://github.com/Azure/SONiC/pull/420)  |
|              |              |             | [Build time<br/>improvements](https://github.com/Azure/SONiC/pull/419) |
|              |              |  | [Egress mirroring and<br/>ACL action support check via SAI](https://github.com/Azure/SONiC/pull/411) |
|              |              |             | [Configurable<br/>drop counters](https://github.com/Azure/SONiC/pull/434) |
|              |              |             | [Log analyzer to pytest](https://github.com/Azure/SONiC/pull/421) |
|              |              |             | [HW resource monitor](https://github.com/Azure/SONiC/pull/439) |
| SONiC.202006 | 06/30/2020   | TBD         | [Progress Tracking](https://github.com/Azure/SONiC/wiki/Release-Progress-Tracking-202006) |
|            |            |            | [AAA improvement ](https://github.com/Azure/SONiC/pull/541/files#diff-0fe927c97d0445fd919a2316bd0c5aa7) |
|            |              |             | ACL-based rate limiting, Mirroring, L2                                                |
|           |              |             | [BFD SW 100ms interval from FRR](https://github.com/Azure/SONiC/pull/383/files#diff-93861062eace24add663831081adefc8) |
|           |           |           | Build Improvements |
| | | | Bulk API for route |
|            |              |             | Config Replace                                            |
|            |              |             | Consistent ECMP support |
| | | | Container warm restart (BGP/TeamD/SWSS/SyncD) |
|            |              |             | [D-Bus to Host Communications](https://github.com/Azure/SONiC/pull/541/files#diff-0fe927c97d0445fd919a2316bd0c5aa7) |
|           |           |           | Debian 10 upgrade, base image,driver |
|  |              |             | Dynamic headroom calculation               |
|  |              |             | Dynamic port break |
|  |              |             | Egress shaping (port, queue)                             |
|  |              |             | EVPN/VXLAN |
|  |              |             | Flow-based Services (incl. packet DSCP remark)                        |
| | | | FRR BGP NBI (Dell) |
| | | | FW utils extension: SSD upgrade |
| | | | Gearbox |
| | | | IP Helper |
| | | | IPv6 Link Local and BGP Unnumbered |
| | | | Kernel programming performance enhancement |
| | | | Kubernetes (docker to be controlled by Kubernetes) |
| | | | L2 Dot1Q tunneling support |
| | | | Management Framework (Phase 2) |
| | | | Management Framework RBAC (Dell) |
| | | | MC-LAG (L2) |
| | | | Multi-ASIC 202006 |
| | | | Multi-DB enhancement-Part 2 |
| | | | ONIE FW tools |
| | | | PDDF advance to SONiC Platform 2.0, BMC |
| | | | PDK - Platform Development Environment |
| | | | PDK - Platform Driver Development Framework |
| | | | Platform APIs move to new APIs * - Continuation |
| | | | Port Mirroring |
| | | | [Proxy ARP](https://github.com/Azure/SONiC/pull/579/files#diff-27f0a7d1396a80ae9bb361e779f14e8c) |
| | | | Pytest 100% moved from ansible to Pytest |
| | | | RADIUS AAA |
| | | | SPytest |
| | | | Static Anycast Gateway |
| | | | System health and system LED |
| | | | Thermal control |
|  |              |             |                                                              |
| Backlog      |              |             |                          |
|              |              |             | CLI framework|
|              |              |             | L3 MLAG (Taken)          |
|              |              |             | EVPN                     |
|              |              |             | RDMA CLI enhancement     |
|              |              |             | Virtual path for streaming telemetry (pushed off) |
|              |              |             | Management VRF (pushed off)|
| | | | Port and Vlan configuration and validation (TBD) |
| | | |  |
|              |              |             | **Routing** |
| | | | VRF support: BFD                                             |
|              |              |             | VRF support: SSH                                             |
|              |              |             | IPv4 Unnumbered interfaces                                   |
|              |              |             | IPv6 Link Local                                              |
|              |              |             | BGP Unnumbered (RFC 5549)                                    |
|              |              |             | VRRP (incl. IPv6, active-active)                             |
|              |              |             | OSPFv2                                                       |
|              |              |             | EVPN/VXLAN                                                   |
|              |              |             | -  L2 VPN                                                    |
|              |              |             | -  L3 Overlay |
| | | | DHCP Relay enhancements |
| | | | IP Helper |
| | | |  |
| | | | **Switching** |
| | | | MC-LAG (L2) |
| | | | Static LAG |
| | | | LAG scaling (netlink) |
| | | | RPVST+ |
| | | | PVST IS-CLI |
| | | | IGMP Snooping |
| | | | Port Mirroring |
| | | | Storm Control (BUM) |
| | | | UDLD |
| | | |  |
| | | | **QoS** |
| | | | ACL-based packet remark (DSCP) |
| | | | ACL-based rate limiting, Mirroring |
| | | | Egress shaping (port, queue) |
| | | |  |
| | | | Instrumentation and Telemetry |
| | | | Packet timestamping |
| | | | Watermark snapshots |
| | | |  |
| | | | **Port Mgmt** |
| | | | Dynamic Port Breakout<br/>(Sub-WG effort) |
| | | | External PHY/<br/>Gearbox manager |
| | | |  |
| | | | **Servicability** |
| | | | kdump |
| | | | Memory tracking |
| | | |  |
| | | | **Management** |
| | | | RADIUS AAA |
| | | | Management Framework<br/>enhancements |
| | | | - RBAC |
| | | | - Infra optimizations |
| | | | -Extended feature support<br> (IS-CLI, REST, gNMI) |
| | | | SNMP Traps |
| | | | SNMP IS-CLI |
| | | | SNMP Bridge MIBs |
| | | | BroadView BST |
| | | | [Inband Flow Analyzer](https://github.com/Azure/SONiC/pull/427) |
| | | |  |
| | | | **Other** |
| | | | LinuxPTP |
| | | |  |
| | | | **Platform** |
| | | | PDDF advance to SONiC<br/>Platform 2.0, BMC |
| | | | PDE enhancements<br/>(Platform 2.0, more tests) |
| | | |  |
| | | | **Infrastructure** |
| | | | Kernel optimizations<br/>(smaller) |
| | | | Kernel 4.9.189 |
| | | | Erase System<br/>Configuration files |
| | | | Core File Manager |




**NOTE**
* Platform APIs will be backwards compatible in 201908, will be cut over to new APIs in the next release
