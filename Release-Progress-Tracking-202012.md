# 202012 Features Tracking

| Feature  | HLD<br/>Review<br/>Date | Owner| Code<br>Review<br> Owner| Code<br>Review<br>Date | Code PR Status                                                     |
| ----------------------------------- | --------------------- | -----------|-----------| ------------------------ | ------------------------------------------------------------ | 
| [AAA improvement ](https://github.com/Azure/SONiC/blob/a46aa68b3a3ca57fea28c3d139fcef437e0cf0e6/doc/aaa/AAA%20Improvements/AAA%20Improvements.md)<br>[HLDPR](https://github.com/Azure/SONiC/pull/583)-ReviewPending  | 04/07/20     | Dell   | BRCM | 10/30/2020 |[390](https://github.com/Azure/sonic-swss-common/pull/390)- ReviewInProgress <br>[5553](https://github.com/Azure/sonic-buildimage/pull/5553) - ReviewRequested |
| [BFD SW 100ms interval from FRR](https://github.com/Azure/SONiC/blob/master/doc/bfd/BFD_Enhancement_HLD.md)| Done     | BRCM   | MSFT/<br>MLNX|  | WIll be deferred to 202106 <br>New PR for replacing 3838 ?  [3838](https://github.com/Azure/sonic-buildimage/pull/3838) - change requested;<br>[5197](https://github.com/FRRouting/frr/pull/5197) - Merged|
| Consistent ECMP support (fine grain ECMP)  | 04/28/20     | MSFT| MLNX/<br>Alibaba/<br>Intel | | [1315](https://github.com/Azure/sonic-swss/pull/1315) - Merged<br>[623](https://github.com/Azure/SONiC/pull/623) - Merged<br>[1788](https://github.com/Azure/sonic-mgmt/pull/1788)- Merged <br>[4985](https://github.com/Azure/sonic-buildimage/pull/4985) - ReviewPending<br>[374](https://github.com/Azure/sonic-swss-common/pull/374) - Merged<br>[659](https://github.com/Azure/SONiC/pull/659) - MergePending <br>[1056](https://github.com/Azure/sonic-utilities/pull/1056) - Merged<br>[5518](https://github.com/Azure/sonic-buildimage/pull/5518) - Merged<br>[5198](https://github.com/Azure/sonic-buildimage/pull/5198) - Merged<br>[693](https://github.com/Azure/SONiC/pull/693) - MergePending |
| [Container warm restart (BGP/TeamD/SWSS/SyncD)](https://github.com/Azure/SONiC/blob/0c177995044316b898fc355456d9b6e8df72b522/doc/warm-reboot/SONiC_Warmboot.md) | 8/25/2020| MSFT| Alibaba<br>/MSFT | 10/30/2020| [392](https://github.com/Azure/sonic-buildimage/pull/3992) - Merged<br>[1036](https://github.com/Azure/sonic-utilities/pull/1036/files)-Merged<br>[5223](https://github.com/Azure/sonic-buildimage/pull/5233)-Merged<br>[5163](https://github.com/Azure/sonic-buildimage/pull/5163/files)- Merged<br>[5108](https://github.com/Azure/sonic-buildimage/pull/5108/files)- Merged<br>[1036](https://github.com/Azure/sonic-utilities/pull/1036/files)- Merged<br> |
| [CoPP Config/Management](https://github.com/Azure/SONiC/blob/fdc7cff16b7f42f1a1b01dd506279e3e9f9269cb/doc/copp/CoPP%20Config%20and%20Management.md)<br>[HLDPR](https://github.com/Azure/SONiC/pull/606) - Merged |  | MSFT<br>Dell|  |   | [358](https://github.com/Azure/sonic-swss-common/pull/358)-Merged<br>[1333](https://github.com/Azure/sonic-swss/pull/1333)-Merged<br>[4861](https://github.com/Azure/sonic-buildimage/pull/4861)-Merged<br>[1004](https://github.com/Azure/sonic-utilities/pull/1004)- Merged<br>|
| Console support for SONiC(Hardware) | 8/25/2020 | Celestica | MSFT| |[5571](https://github.com/Azure/sonic-buildimage/pull/5571)- Merged<br>[1155](https://github.com/Azure/sonic-utilities/pull/1155) - Merged|
| [Console support for SONiC(ssh forwarding)](https://github.com/Azure/SONiC/blob/126a4f7af8cadd8451b22bd80227c07c11452a63/doc/console/SONiC-Console-Switch-High-Level-Design.md) | 9/1/2020 | MSFT | |10/30/2020 |[664](https://github.com/Azure/SONiC/pull/664) - Merged<br>[673](https://github.com/Azure/SONiC/pull/673) - Merged<br>[1117](https://github.com/Azure/sonic-utilities/pull/1117) - Merged<br>[1120](https://github.com/Azure/sonic-utilities/pull/1120) - Merged<br>[1130](https://github.com/Azure/sonic-utilities/pull/1130) - Merged<br>[1136](https://github.com/Azure/sonic-utilities/pull/1136) - Merged<br>[1166](https://github.com/Azure/sonic-utilities/pull/1166) - Merged<br>[1173](https://github.com/Azure/sonic-utilities/pull/1173) - Merged<br>[1176](https://github.com/Azure/sonic-utilities/pull/1176) - Merged<br>[5438](https://github.com/Azure/sonic-buildimage/pull/5438) - Merged<br>[5717](https://github.com/Azure/sonic-buildimage/pull/5717) - Merged|
| [Dynamic headroom calculation](https://github.com/Azure/SONiC/blob/415f19931bccd900ac528b100aafffa6000e82e9/doc/qos/dynamically-headroom-calculation.md)<br>[HLDPR](https://github.com/Azure/SONiC/pull/605)- Reviewed|   Already Reviewed   |  MLNX  | MSFT/<br>Intel(Barefoot) |   |[1338](https://github.com/Azure/sonic-swss/pull/1338) - ChangeRequested<br>[973](https://github.com/Azure/sonic-utilities/pull/973) - MergePending<br>[4881](https://github.com/Azure/sonic-buildimage/pull/4881)- MergePending<br>[1971](https://github.com/Azure/sonic-mgmt/pull/1971) - MergePending<br>[361](https://github.com/Azure/sonic-swss-common/pull/361) - Merged|
| [Enable synchronous SAI APIs for error handling](https://github.com/Azure/SONiC/pull/672)  | 9/24/2020 | MSFT | BRCM | 10/30/2020  |[5237](https://github.com/Azure/sonic-buildimage/pull/5237) - Merged<br> [650](https://github.com/Azure/sonic-buildimage/pull/650) - Merged<br> [652](https://github.com/Azure/sonic-buildimage/pull/652) - Merged<br> [653](https://github.com/Azure/sonic-buildimage/pull/653) - Merged<br>[1094](https://github.com/Azure/sonic-utilities/pull/1094) - Merged<br> [5308](https://github.com/Azure/sonic-buildimage/pull/5308) - Merged<br>|
| [EVPN/VXLAN](https://github.com/Azure/SONiC/blob/7fbda34ee3315960c164a0c202f39c2ec515cfc3/doc/vxlan/EVPN/EVPN_VXLAN_HLD.md)<br>[HLDPR](https://github.com/Azure/SONiC/pull/437) - MergePending| 05/12/20    |  BRCM|Dell/<br>Alibaba/<br>Intel| |[Complete List](https://groups.google.com/g/sonic-evpn-workgroup/c/rup7aoorZoQ)<br>[339](https://github.com/Azure/sonic-swss-common/pull/339) - Merged<br>[350](https://github.com/Azure/sonic-swss-common/pull/350) - Merged<br>[1264](https://github.com/Azure/sonic-swss/pull/1264) - Merged<br>[1266](https://github.com/Azure/sonic-swss/pull/1266) - FinalReviewAndApprovalPending<br>[1318](https://github.com/Azure/sonic-swss/pull/1318) - ReviewPending<br>[1267](https://github.com/Azure/sonic-swss/pull/1267) - ReviewPending<br>[870](https://github.com/Azure/sonic-utilities/pull/870) - ReviewPending  |
| SONiC entity MIB extensions<br>[HLD PR](https://github.com/Azure/SONiC/pull/657) - Open |    | MLNX |  |   | [134](https://github.com/Azure/sonic-platform-common/pull/134)-Merged<br>[102](https://github.com/Azure/sonic-platform-daemons/pull/102)- Merged<br>[5645](https://github.com/Azure/sonic-buildimage/pull/5645)- Merged<br>[168](https://github.com/Azure/sonic-snmpagent/pull/168)- Merged<br>[2379](https://github.com/Azure/sonic-mgmt/pull/2379)- Merged  | 
| [FRR BGP NBI](https://github.com/Azure/SONiC/blob/48e9012c548528b6528745bda9d75b4164e785eb/doc/mgmt/SONiC_Design_Doc_Unified_FRR_Mgmt_Interface.md)<br>[HLDPR](https://github.com/Azure/SONiC/pull/544) - ChangeRequested | 05/01/20    |  Dell/<br>BRCM  | MLNX/<br>MSFT |Need ETA |[5142](https://github.com/Azure/sonic-buildimage/pull/5142)-Open |
| [Gearbox](https://github.com/Azure/SONiC/blob/master/doc/gearbox/gearbox_mgr_design.md)| 02/25/20    |  BRCM|  |  | [347](https://github.com/Azure/sonic-swss-common/pull/347) - Merged <br>[931](https://github.com/Azure/sonic-utilities/pull/931) - Merged<br>[1321](https://github.com/Azure/sonic-swss/pull/1321) - Merged<br>[624](https://github.com/Azure/sonic-sairedis/pull/624) - Merged<br>[4851](https://github.com/Azure/sonic-buildimage/pull/4851)-Merged |
| [IPv6 Link Local and BGP Unnumbered](https://github.com/Azure/SONiC/blob/3d2e5e66e05bcce0a64f5ad077b96ae2006527fd/doc/ipv6/ipv6_link_local.md)<br>[HLDPR](https://github.com/Azure/SONiC/pull/625) |  6/2/2020   |  BRCM|MSFT<br>/Dell<br>/MLNX<br>/Aviz/<br>Alibaba| 9/30/20 | Will be deferred to 202106<br> [1463](https://github.com/Azure/sonic-swss/pull/1463) - ReviewPending<br>[1159](https://github.com/Azure/sonic-utilities/pull/1159)- ChangeRequested<br>[20](https://github.com/Azure/sonic-ztp/pull/20) - ReviewPending<br>[5584](https://github.com/Azure/sonic-buildimage/pull/5584)- ReviewPending|
| [Kubernetes (docker to be controlled by Kubernetes)](https://github.com/renukamanavalan/SONiC/blob/kube_systemd/doc/kubernetes/Kubernetes-support.md)  | 9/22/2020 |  MSFT| BRCM<br>/Aviz | | [5421](https://github.com/Azure/sonic-buildimage/pull/5421)- ChangeRequested<br>[1133](https://github.com/Azure/sonic-utilities/pull/1133) - ChangeRequested | 
| [L2 functional and performance enhancements](https://github.com/Azure/SONiC/pull/379)| Done  |BRCM|MSFT| 5/10/19 | Will be dropped completely and will not be available in 202106<br>[885](https://github.com/Azure/sonic-swss/pull/885) - FinalReviewAndApprovalPending<br>[529](https://github.com/Azure/sonic-utilities/pull/529) - NotYetApproved &<br> NeedsConflictResolutions<br>[114](https://github.com/Azure/sonic-snmpagent/pull/114) - Merged|
| [MACSec support in chassis](https://github.com/Azure/SONiC/pull/652) |  10/15/2020   | MSFT| BRCM | 10/30/2020  | [5700](https://github.com/Azure/sonic-buildimage/pull/5700) - InProgress<br>[1475](https://github.com/Azure/sonic-swss/pull/1475) - ReviewRequested<br>[1474](https://github.com/Azure/sonic-swss/pull/1474) - ReviewInProgress<br>[677](https://github.com/Azure/sonic-sairedis/pull/677) - Closed<br>[16](https://github.com/Azure/sonic-wpa-supplicant/pull/16) - Closed <br>[691](https://github.com/Azure/sonic-sairedis/pull/691)- Closed <br>[684](https://github.com/Azure/sonic-sairedis/pull/684)-Merged<br>[403](https://github.com/Azure/sonic-swss-common/pull/403)-Merged|
| [Management Framework RBAC ](https://github.com/Azure/SONiC/blob/48fab9db4f090c5beaea5f7a8fdcb9474d23a4e9/doc/aaa/SONiC%20RBAC.md)<br>[HLDPR]()| 04/21/20|  Dell  | BRCM | Need ETA | Will be deferred to 202106 |
| [Management Framework (Phase 2)](https://github.com/Azure/SONiC/blob/34cac1aabdc865fc41cbe064a2ab2442645524b1/doc/mgmt/Management%20Framework.md)<br>[HLDPR](https://github.com/Azure/SONiC/pull/550#)- MergePending| 04/14/20    |  BRCM<br>Dell|Mgmt WG| | [5920](https://github.com/Azure/sonic-buildimage/pull/5920) - Closed <br> [72](https://github.com/Azure/sonic-mgmt-framework/pull/72) - Closed <br>[73](https://github.com/Azure/sonic-mgmt-framework/pull/73) - Closed  |
| [MC-LAG (L2)](https://github.com/Azure/SONiC/blob/176cf4f5a8ee6ecfd8a478573ffc92f0eb23b4e6/doc/mclag/MCLAG_Enhancements_HLD.md)<br> [HLDPR](https://github.com/Azure/SONiC/pull/596) - MergePending| 05/05/20    |  BRCM|Dell | 6/30/20 | [596](https://github.com/Azure/SONiC/pull/596) - MergePending<br>[885](https://github.com/Azure/sonic-swss/pull/885) - NotYetApproved & NeedsConflictResolutions <br>[4819](https://github.com/Azure/sonic-buildimage/pull/4819) - ReviewPending<br>[1331](https://github.com/Azure/sonic-swss/pull/1331) - ChangeRequested<br>[1349](https://github.com/Azure/sonic-swss/pull/1349) - NotYetApproved & NeedsConflictResolutions <br>[529](https://github.com/Azure/sonic-utilities/pull/529) - ReviewPending<br>[405](https://github.com/Azure/sonic-swss-common/pull/405) - FinalReviewAndApprovalPending<br>[59](https://github.com/Azure/sonic-mgmt-framework/pull/59) - MergePending<br>[25](https://github.com/Azure/sonic-mgmt-common/pull/25) - FinalReviewAndApprovalPending|
| [Media Enhancements<br>(Media Information & Settings)](https://github.com/Azure/SONiC/blob/a6e9636552149829e39a82705d1ad2b48a17b3f0/doc/media-info-enhancements/media-info.md)|6/16/2020 Need to update  HLD|Dell| Innovium | mid-Oct | Low conf, will be deferred to 202106 |
| Merge common lib for C++ and python (SWSS common lib) | Not needed (refactory) | MSFT |  |  10/30/2020 | [378](https://github.com/Azure/sonic-swss-common/pull/378) - Merged |
| Move from Python2->python3 | August-end | MSFT<br>MLNX<br>BRCM |  | On-going effort |  |
| [Multi-ASIC 202006](https://github.com/Azure/SONiC/blob/ebe4f4b695af5d2dbd23756d3cff03aef0a0c880/doc/multi_asic/SONiC_multi_asic_hld.md)<br> [HLDPR](https://github.com/Azure/SONiC/pull/644)-ReviewPending |HLD reviewed |  MSFT |   |10/15/20|  [4825](https://github.com/Azure/sonic-buildimage/pull/4825), [4895](https://github.com/Azure/sonic-buildimage/pull/4895), [4926](https://github.com/Azure/sonic-buildimage/pull/4926), [4932](https://github.com/Azure/sonic-buildimage/pull/4932), [4959](https://github.com/Azure/sonic-buildimage/pull/4959), [4973](https://github.com/Azure/sonic-buildimage/pull/4973), [5022](https://github.com/Azure/sonic-buildimage/pull/5022), [5113](https://github.com/Azure/sonic-buildimage/pull/5113), [5121](https://github.com/Azure/sonic-buildimage/pull/5121), [5122](https://github.com/Azure/sonic-buildimage/pull/5122), [5202](https://github.com/Azure/sonic-buildimage/pull/5202), [5221](https://github.com/Azure/sonic-buildimage/pull/5221), [5224](https://github.com/Azure/sonic-buildimage/pull/5224), [5235](https://github.com/Azure/sonic-buildimage/pull/5235), [5316](https://github.com/Azure/sonic-buildimage/pull/5316), [5329](https://github.com/Azure/sonic-buildimage/pull/5329), [5357](https://github.com/Azure/sonic-buildimage/pull/5357), [5358](https://github.com/Azure/sonic-buildimage/pull/5358), [5364](https://github.com/Azure/sonic-buildimage/pull/5364),[5418](https://github.com/Azure/sonic-buildimage/pull/5418), [5420](https://github.com/Azure/sonic-buildimage/pull/5420), [5436](https://github.com/Azure/sonic-buildimage/pull/5436), [5437](https://github.com/Azure/sonic-buildimage/pull/5437), [5446](https://github.com/Azure/sonic-buildimage/pull/5446), [5460](https://github.com/Azure/sonic-buildimage/pull/5460), [5479](https://github.com/Azure/sonic-buildimage/pull/5479), [5503](https://github.com/Azure/sonic-buildimage/pull/5503), [5548](https://github.com/Azure/sonic-buildimage/pull/5548),[87](https://github.com/Azure/sonic-platform-daemons/pull/87),[81](https://github.com/Azure/sonic-py-swsssdk/pull/81), [138](https://github.com/Azure/sonic-snmpagent/pull/138), [140](https://github.com/Azure/sonic-snmpagent/pull/140), [141](https://github.com/Azure/sonic-snmpagent/pull/141), [145](https://github.com/Azure/sonic-snmpagent/pull/145), [154](https://github.com/Azure/sonic-snmpagent/pull/154), [155](https://github.com/Azure/sonic-snmpagent/pull/155), [158](https://github.com/Azure/sonic-snmpagent/pull/158), [161](https://github.com/Azure/sonic-snmpagent/pull/161), [166](https://github.com/Azure/sonic-snmpagent/pull/166), [376](https://github.com/Azure/sonic-swss-common/pull/376), [856](https://github.com/Azure/sonic-utilities/pull/856), [917](https://github.com/Azure/sonic-utilities/pull/917), [978](https://github.com/Azure/sonic-utilities/pull/978), [999](https://github.com/Azure/sonic-utilities/pull/999), [1005](https://github.com/Azure/sonic-utilities/pull/1005), [1006](https://github.com/Azure/sonic-utilities/pull/1006), [1013](https://github.com/Azure/sonic-utilities/pull/1013), [1057](https://github.com/Azure/sonic-utilities/pull/1057), [1064](https://github.com/Azure/sonic-utilities/pull/1064), [1079](https://github.com/Azure/sonic-utilities/pull/1079), [1080](https://github.com/Azure/sonic-utilities/pull/1080), [1081](https://github.com/Azure/sonic-utilities/pull/1081), [1123](https://github.com/Azure/sonic-utilities/pull/1123) & [1137](https://github.com/Azure/sonic-utilities/pull/1137) - Merged |
| Multi-DB enhancement-Part 2|  Already Reviewed   |  Alibaba  | BRCM<br>/MSFT | End of Sept |[5773](https://github.com/Azure/sonic-buildimage/pull/5773)-Open<br>[1205](https://github.com/Azure/sonic-utilities/pull/1205)- Merged |
| [ONIE FW tools(Incl. CPLD, BIOS, SSD, Firmware upgrade[Uniform Tool])](https://github.com/Azure/SONiC/pull/648)|  9/30/2020  |  MSFT  |MLNX| 10/15/2020  |  [1165](https://github.com/Azure/sonic-utilities/pull/1165) - Closed <br>[106](https://github.com/Azure/sonic-platform-common/pull/106) - ReviewRequested|
| [PDDF advance to SONiC Platform 2.0, BMC](https://github.com/Azure/SONiC/blob/master/doc/platform/brcm_pdk_pddf.md)| 04/07/20|BRCM|MSFT<br>Dell|6/11/20 | [4756](https://github.com/Azure/sonic-buildimage/pull/4756) - Merged<br>[940](https://github.com/Azure/sonic-utilities/pull/940) - Merged<br>[92](https://github.com/Azure/sonic-platform-common/pull/92) - Merged<br>[3387](https://github.com/Azure/sonic-buildimage/pull/3387) - ApprovalPending &<br> NeedsConflictResolutions<br>[624](https://github.com/Azure/sonic-utilities/pull/624) - Merged<br>[62](https://github.com/Azure/sonic-platform-common/pull/62) - Merged|
| [PDK - Platform Development Environment](https://github.com/Azure/SONiC/blob/master/doc/platform/pde.md)|  Done |  BRCM|MSFT<br>Dell|   | [3778](https://github.com/Azure/sonic-buildimage/pull/3778) - ChangeRequested<br>[28](https://github.com/Azure/sonic-platform-pdk-pde/pull/28) - Merged<br>[107](https://github.com/Azure/sonic-build-tools/pull/107)-MergePending |
| [RADIUS AAA](https://github.com/Azure/SONiC/blob/3edad287edc79ea7e227648cba566a6ce347bf49/doc/aaa/radius_authentication.md)<br>[HLDPR](https://github.com/Azure/SONiC/pull/500) - ReviewPending| 10/21/19    |BRCM|MSFT| 3/3/2020  |Best Effort<br>[4220](https://github.com/Azure/sonic-buildimage/pull/4220) - ApprovalPending <br>[830](https://github.com/Azure/sonic-utilities/pull/830) - ApprovalPending|
| SONiC app extension(w/o orchagent)[HLD PR](https://github.com/Azure/SONiC/pull/682) |   9/15  | MLNX | BRCM |  ETA : Oct | [5705](https://github.com/Azure/sonic-buildimage/pull/5705) - Open<br>[1199](https://github.com/Azure/sonic-utilities/pull/1199) - Open<br>[5744](https://github.com/Azure/sonic-buildimage/pull/5744) - Open<br>[5939](https://github.com/Azure/sonic-buildimage/pull/5939) - Open<br>[5938](https://github.com/Azure/sonic-buildimage/pull/5938) - Open<br>[5937](https://github.com/Azure/sonic-buildimage/pull/5937) - Open<br>[5935](https://github.com/Azure/sonic-buildimage/pull/5935) - Open<br>[1186](https://github.com/Azure/sonic-utilities/pull/1186)-Open|
| [Support hardware reboot/reload reason (Streaming Telemetry)](https://github.com/sujinmkang/SONiC/blob/6ed19e88c6f7aac74640d3d343210d840af70a23/doc/system-telemetry/reboot-cause.md)<br>[HLD PR](https://github.com/Azure/SONiC/pull/669) - Merged | 11/03/2020 | MSFT | LNKD/<br>Intel  | 10/30/2020  | [5562](https://github.com/Azure/sonic-buildimage/pull/5562) - Closed<br>[1154](https://github.com/Azure/sonic-utilities/pull/1154) - Closed |
| [System health and system LED](https://github.com/Azure/SONiC/blob/master/doc/system_health_monitoring/system-health-HLD.md) |  6/2   |  MLNX|  |   | [4835](https://github.com/Azure/sonic-buildimage/pull/4835)-Merged<br>[4829](https://github.com/Azure/sonic-buildimage/pull/4829)- Merged |
| PCIe Monitoring<br>[HLD PR](https://github.com/Azure/SONiC/pull/634) - Merged<br>[HLD PR](https://github.com/Azure/SONiC/pull/678)-Merged| 11/17/2020 | MSFT/Dell| | |[5000](https://github.com/Azure/sonic-buildimage/pull/5000) - Merged<br>[60](https://github.com/Azure/sonic-platform-daemons/pull/60) - Merged<br>[1169](https://github.com/Azure/sonic-utilities/pull/1169) - In Review<br>[100](https://github.com/Azure/sonic-platform-daemons/pull/100)- In Review<br>[144](https://github.com/Azure/sonic-platform-common/pull/144) - In Review| 
| [VoQ Chassis support in SONiC](https://github.com/Azure/SONiC/blob/b562401372e216f6144ec3eb82584404b185d4b4/doc/voq/voq_hld.md) |   |  |   |  | Progress tracked [SONiC on Chassis](https://github.com/Azure/SONiC/wiki/SONiC-Chassis-Subgroup) |