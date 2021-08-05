---
title: "Vxlan Debug"
date: 2021-07-07
weight: 5
description: >
  This document explains how to debug the issues related to Vxlan feature
---

{{% pageinfo %}}
This page provides the required links related to Vxlan feature
{{% /pageinfo %}}


# Steps in debugging VXLAN issue 

## Step 1 – General Steps 
1)	Ensure that the esonic version running on the device supports that feature. 
show version
2)	Ensure that the underlying ports that are used for vxlan are up and running.
show interfaces status

## Step 2 – Verify the VXLAN configuration is correct 
1)	Creating vxlan vtep
config vxlan add <vtep-name> <src-vtep-ip> 
Example: config vxlan add vtep1 16.16.100.16 
vtep1 is the vtep-name and 16.16.100.16 is the src vtep-ip. 
It is used as next-hop attribute in the BGP EVPN NLRI updates for advertising all the EVPN routes. 
It must be one of the loopback address.

2) Add vtep-name to nvo object 
config vxlan evpn_nvo add <nvo-name> <vtep-name> 
Example: config vxlan evpn_nvo add nvo1 vtep1 
This is the src vtep name which was used in the earlier command to associate it to evpn_nvo object. 
The name must match with the earlier command.


3) Verify the vxlan basic configuration.
show vxlan interface
Use this command to verify that the above configurations commands are successful . 
Verify the VtepName, Source VTEP IP, NVO Name & Source Interface.

```
VTEP Information:
VTEP Name : vtep1, SIP  : 192.168.10.1
NVO Name  : nvo1,  VTEP : vtep1
Source interface  : Loopback1
```

4) Map vlan to vni for the vtep 
config vxlan map add <vtep-name> <vlan-id> <vni-id> 
Example: config vxlan map add vtep1 101 10101
Vtep name should be same as used before. Next param is VlanID and last param is VniID.

5) Map range of vlans to vni
config vxlan map_range add/del <vxlan_name> <vlan_start> <vlan_end> <vni_start>
Example: config vxlan map_range add vtep1 101 200 10101


6) Verify VlanVniMap
show vxlan vlanvnimap
Use this command to verify that VLANID to VNI mapping is correct.
```
+----------+--------+
| VLAN     |    VNI |
+==========+========+
| Vlan40   |   1040 |
+----------+--------+
| Vlan101  |  10101 |
+----------+--------+
```

## Step 3 – Verify the BGP EVPN configuration is correct 

1)	BGP EVPN 
BGP neighbor between each leaf & spine. In this specific case there are 2 network uplinks with BGP session on each ofthe links
```
router bgp 16
 bgp graceful-restart
 bgp graceful-restart preserve-fw-state
 bgp bestpath as-path multipath-relax
 neighbor 10.8.8.8 remote-as 8
 neighbor 11.8.8.8 remote-as 8  
 address-family ipv4 unicast
  redistribute connected
 exit-address-family
```

2)	EVPN Address Family
Activate each of the neighbors in the address-family l2vpn evpn.  Advertise-all-vni will ensure that the vlan/vni mapping configured are advertised to all the remote BGP evpn peers.
```
  address-family l2vpn evpn
  neighbor 10.8.8.8 activate
  neighbor 11.8.8.8 activate
  advertise-all-vni
 exit-address-family
```

## L3VNI Config 
### L3VNI Config(click)
```
Create a Vrf
config vrf add Vrf1

Add Vlan
config vlan add 4001

Bind Vlan to Vrf1
config interface vrf bind Vlan4001 Vrf1

Vxlan Mapping
config vxlan map add vtep4 4001 104001

L3VNI config for the Vrf
config vrf add_vrf_vni_map Vrf1 104001
```

### VxLAN show commands
#### VxLAN Information (Tunnel, Remote VNI, Remote Mac) 
```
show vxlan tunnel
+--------------+--------------+-------------------+--------------+
| SIP          | DIP          | Creation Source   | OperStatus   |
+==============+==============+===================+==============+
| 16.16.100.16 | 15.15.100.15 | EVPN              | oper_up      |
+--------------+--------------+-------------------+--------------+
This reflects the hw status of the remote tunnel picked from the STATE_DB.VxLANOrch populates this table when it receives the tunnel bridgeport notification from SAI. 

```
```
show vxlan evpn_remote_vni all
+---------+--------------+-------+
| VLAN    | RemoteVTEP   |   VNI |
+=========+==============+=======+
| Vlan101 | 15.15.100.15 |   101 |
+---------+--------------+-------+
| Vlan102 | 15.15.100.15 |   102 |
+---------+--------------+-------+
This information is picked from the APP_DB. It is populated by fdbsyncd.
```
```
show vxlan evpn_remote_mac all
+---------+-------------------+--------------+-------+---------+
| VLAN    | MAC               | RemoteVTEP   |   VNI | Type    |
+=========+===================+==============+=======+=========+
| Vlan102 | 00:15:00:00:00:00 | 15.15.100.15 |   102 | dynamic |
+---------+-------------------+--------------+-------+---------+
This information is picked from the APP_DB. It is populated by fdbsyncd.

```


## EVPN VXLAN COMMANDS  

### VxLAN Configuration Commands 
```
config vxlan add/del <vtep-name> <vtep-src-ip>
config vxlan evpn_nvo add/del <nvo-name> <vtep-name>
config vxlan map add/del <vtep-name> <vlan-id> <vni-id>
config vxlan map_range add/del <vtep-name> <start-vlan-id> <end-vlan-id> <start-vni-id>
```
### VxLAN show Commands  
```
show vxlan interface
show vxlan vlanvnimap
show vxlan vrfvnimap
show vxlan tunnel
show vxlan evpn_remote_vni <ip-address|all> [count]
show vxlan evpn_remote_mac <ip-address|all> [count]
```
### BGP/FRR Show Commands 
```
show ip bgp summary
show evpn vni
show evpn vni detail
show bgp l2vpn evpn route type multicast
show bgp l2vpn evpn route type macip
```
### Linux Kernel Commands 
```
bridge fdb show
ip link show type vxlan
```

### VxlanMgrd debugsh command 
```
show system internal vxlanmgr global
```

### Fdbsyncd debugsh commands 
```
show system internal fdbsync imet
show system internal fdbsync local_fdb
show system internal fdbsync vxlan_fdb
show system internal fdbsync counters
```

### Orchagent - VxLANOrch debugsh command 
```
show system internal orchagent vxlanorch global
```
### Orchagent - Fdborch debug command 
```
show debug fdborch counters
```
### SAI VLAN debugsh commands 
```
show system internal sai vlan sw dump [vlan-id]
show system internal sai vlan hw dump [vlan-id]
```
### SAI Mptnl debugsh commands 
```
show system internal sai mptnl global <brief|detail>
show system internal sai mptnl sip <brief|detail>
show system internal sai mptnl dip <brief|detail>
show system internal sai mptnl nh <brief|detail>
show system internal sai mptnl mapentry <brief|detail>
show system internal sai mptnl cmntnl <brief|detail>
show system internal sai mptnl tnlmap <brief|detail>
``` 
### Brcm Diag Shell Commands 
```
knetctrl netif show
ps
trunk show
vlan show
l2 show
l3 defip show
l3 ecmp egress show
l3 egress show
multicast show <group=gid> (0x300000x)
d chg MPLS_ENTRY_SINGLE
d chg VLAN_XLATE_1_DOUBLE
d chg EGR_VLAN_XLATE_1_SINGLE
d chg VFI
```

## EVPN VXLAN COMPONENT INTERACTION 
![EVPN VXLAN COMPONENT INTERACTION Diagram](/debug_images/evpn_vxlan_component_interaction.png)

## EVPN VXLAN SAMPLE TOPOLOGY  
![EVPN VXLAN SAMPLE TOPOLOGY Diagram](/debug_images/evpn_vxlan_sample_topology.png)

### FRR BGP Config 
```
router bgp 500 vrf Vrf1
 !
 address-family ipv4 unicast
  redistribute connected
 exit-address-family
 !
 address-family ipv6 unicast
  redistribute connected
 exit-address-family
 !
 address-family l2vpn evpn
  advertise ipv4 unicast (To advertise vrf route in EVPN.)
  advertise ipv6 unicast (To advertise vrf route in EVPN.)
 exit-address-family

```
Even though VNI values are exchanged in the type-2 and type-5 routes, the received values are not used when installing the routes into the forwarding plane; the local configuration is used. You must ensure that the VLAN to VNI mappings and the layer 3 VNI assignment for a tenant VRF are uniform throughout the network.
If EVPN prefix need to be imported to other VRF, then the prefix need to be imported to tenant VRF first then leaked to other VRF using VRF leaking feature.

### FRR L3VNI VERIFICATION 
```
show evpn vni
VNI        Type VxLAN IF              # MACs   # ARPs   # Remote VTEPs  Tenant VRF
10100      L2   vtep4-100             0        0        1               Vrf1
10200      L2   vtep4-200             2        2        1               Vrf1
104001     L3   vtep4-4001            1        1        n/a             Vrf1
```
```
show evpn vni 104001
VNI: 104001
  Type: L3
  Tenant VRF: Vrf1
  Local Vtep Ip: 5.5.5.2
  Vxlan-Intf: vtep4-4001
  SVI-If: Vlan4001
  State: Up
  VNI Filter: none
  Router MAC: 80:a2:35:26:0d:5e
  L2 VNIs:
```
Note: Your must make sure that L3VNI Vlan interface Vlan4001 is in up state. Here in this case Vlan 4001 is mapped to vni 104001

### FRR Debug in type-5 learning
Check in global evpn table to verify prefix is learned from the remote
```
sonic# show bgp l2vpn evpn route type prefix
BGP table version is 4, local router ID is 5.5.5.2
Status codes: s suppressed, d damped, h history, * valid, > best, i - internal
Origin codes: i - IGP, e - EGP, ? - incomplete
EVPN type-1 prefix: [1]:[ESI]:[EthTag]
EVPN type-2 prefix: [2]:[EthTag]:[MAClen]:[MAC]:[IPlen]:[IP]
EVPN type-3 prefix: [3]:[EthTag]:[IPlen]:[OrigIP]
EVPN type-4 prefix: [4]:[ESI]:[IPlen]:[OrigIP]
EVPN type-5 prefix: [5]:[EthTag]:[IPlen]:[IP]

   Network          Next Hop            Metric LocPrf Weight Path
                    Extended Community
Route Distinguisher: 0.0.0.0:5347
*>  [5]:[0]:[32]:[172.16.120.41]
                    6.6.6.2                                        0 200 1000 ?
                    RT:1000:104001 ET:8 Rmac:80:a2:35:26:0c:5e
*   [5]:[0]:[32]:[172.16.120.41]
                    6.6.6.2                                        0 300 1000 ?
                    RT:1000:104001 ET:8 Rmac:80:a2:35:26:0c:5e
*>  [5]:[0]:[32]:[172.16.120.42]
                    6.6.6.2                                        0 200 1000 ?
                    RT:1000:104001 ET:8 Rmac:80:a2:35:26:0c:5e
*   [5]:[0]:[32]:[172.16.120.42]
                    6.6.6.2                                        0 300 1000 ?
                    RT:1000:104001 ET:8 Rmac:80:a2:35:26:0c:5e

```
Check in bgp vrf routing table to verify prefix is import from global evpn to bgp vrf routing table
```
sonic(config-router)# do show bgp vrf Vrf1 ipv4 unicast
BGP table version is 4, local router ID is 0.0.0.0, vrf id 1574
Default local pref 100, local AS 500
Status codes:  s suppressed, d damped, h history, * valid, > best, = multipath, # not installed in hardware
               i internal, r RIB-failure, S Stale, R Removed
Nexthop codes: @NNN nexthop's vrf id, < announce-nh-self
Origin codes:  i - IGP, e - EGP, ? - incomplete

   Network          Next Hop            Metric     LocPrf     Weight Path
*>  172.16.120.41/32 6.6.6.2                                        0 200 1000 ?
*                    6.6.6.2                                        0 300 1000 ?
*>  172.16.120.42/32 6.6.6.2                                        0 200 1000 ?
*                    6.6.6.2                                        0 300 1000 ?
```
Check in vrf routing table to verify prefix
```
sonic# show ip route vrf Vrf1
Codes: K - kernel route, C - connected, S - static, R - RIP,
       O - OSPF, I - IS-IS, B - BGP, E - EIGRP, N - NHRP,
       T - Table, v - VNC, V - VNC-Direct, A - Babel, D - SHARP,
       F - PBR, f - OpenFabric,
       > - selected route, * - FIB route, q - queued route, r - rejected route, # - not installed in hardware
VRF Vrf1:
B>*  172.16.120.41/32 [20/0] via 6.6.6.2, Vlan4001 onlink, 00:09:30
B>*  172.16.120.42/32 [20/0] via 6.6.6.2, Vlan4001 onlink, 00:09:30
```
NOTE: the next hops for these routes are specified by EVPN to be onlink, or reachable over the specified SVI

## FRR DEBUG COMMANDS 
### Enable FRR Debug
```
debug zebra vxlan
Enable debug for VNI, MAC and ARP addition and deletion local and remote node.

debug zebra kernel
Enable debug for netlink messages exchanged with the kernel and zebra.

debug bgp zebra
Enable debug for interactions between BGP and zebra for EVPN and other routes.
```
Check Type5 prefix in APP_DB
```
127.0.0.1:6379> HGETALL ROUTE_TABLE:Vrf1:172.16.120.42/32
1) "nexthop"
2) "6.6.6.2"
3) "ifname"
4) "Vlan4001"
5) "vni_label"
6) "104001" (Type5 prefix along with normal information in APP_DB contain VNI and RMAC information as well.)
7) "router_mac"
8) "80:a2:35:26:0c:5e"
```
## Fdbsyncd debugsh commands 
### FdbSyncd Information (imet, local/remote FDB)
```
show system internal fdbsync imet
Show IMET Msg
Total IMET Add: 2
Total IMET Del: 0
Key:Vlan101:15.15.100.15 VNI:101
Key:Vlan102:15.15.100.15 VNI:102
show system internal fdbsync local_fdb
Show Local FDB Msg
Total Local FDB Add: 1
Total Local FDB Del: 0
Key:Vlan102:00:16:00:00:00:00 Best:LOCAL Kernel:1 port_name:Ethernet46 Type:dynamic
Local FDB Counter: 1
show system internal fdbsync vxlan_fdb
Show Vxlan FDB Msg
Total Vxlan FDB Add: 1
Total Vxlan FDB Del: 0
Key:Vlan102:00:15:00:00:00:00 Vtep:15.15.100.15 VNI:102 Type:0 IfName:vtep1-102

```
### FdbSyncd Information (Global Counters) 
```
show system internal fdbsync counter
Show All the counter:
IMET Add: 2
IMET Del: 0
Vxlan FDB Add: 1
Vxlan FDB Del: 0
Local FDB Add: 1
Local FDB Del: 0
Error in Kernel FDB Add: 0
Error in Kernel FDB Del: 0
Vlan Vni Mapping Counter: 2
Global Vlan Vni Mapping set: 1
FDB REFRESH: 0
Processing Timer expired: 14788
Free Map: 3
Pending Msg: 0
Detail debug status: 0
Nbr Msg Process in the thread: 6
IMET Process in the thread: 2
MAC Process in the thread: 1
```

## Redis DB - VxLAN Remote VNI/Mac/Tunnels
### APP_DB 
```
hgetall EVPN_REMOTE_VNI_TABLE:Vlan101:15.15.100.15
1) "vni"
2) "101"
hgetall VXLAN_FDB_TABLE:Vlan102:00:15:00:00:00:00
1) "remote_vtep"
2) "15.15.100.15"
3) "type"
4) "dynamic"
5) "vni"
6) "102"
The remote IMET & remote mac table are written to appDB by fdbsyncd. vxlanOrchagent/fdbOrchagent process and triggers the tunnel creation request by writing it to AsicDB.

```
### ASIC DB 
```
hgetall ASIC_STATE:SAI_OBJECT_TYPE_TUNNEL:oid:0x2a000000000d4f
 1) "SAI_TUNNEL_ATTR_TYPE"
 2) "SAI_TUNNEL_TYPE_VXLAN"
 3) "SAI_TUNNEL_ATTR_UNDERLAY_INTERFACE"
 4) "oid:0x6000000000c99"
 5) "SAI_TUNNEL_ATTR_DECAP_MAPPERS"
 6) "2:oid:0x29000000000d30,oid:0x29000000000d32"
 7) "SAI_TUNNEL_ATTR_ENCAP_MAPPERS"
 8) "2:oid:0x29000000000d31,oid:0x29000000000d33"
 9) "SAI_TUNNEL_ATTR_ENCAP_SRC_IP"
10) "16.16.100.16"
11) "SAI_TUNNEL_ATTR_ENCAP_DST_IP"
12) "15.15.100.15"

```

## Orchagent - VxLANOrch 
### VxLAN Information (Tunnel, Remote VNI, Remote Mac) 
```
show system internal orchagent vxlan global

 VTEP Name:vtep1: SIP:16.16.100.16 (Src-vtep name/ip configuration. VxLANOrch processes from APP_DB and writes it to ASIC_DB)

 tot_diptunnel_add:1 tot_diptunnel_del:0
 Num Tunnels on this VTEP:1
 tot_mapentry_add:2 tot_mapentry_del:0
 Tot_mappings:2 active:1 hw_del_pending:0

Indicates the configured number of Vlan/Vni mappings.
Usual scenario hw_del_pending must be 0. When all the Vlan/VNI mappings are deleted, it will remain in hw_del_pending till all the remote ip/imet/mac routes are withdrawn across all evpn peers so that all the remote tunnels are deleted. This is to ensure that any new configuration of Vlan/Vni mapping is not processed till all the old information is removed.

 ============== SAI Object IDs ================
 TunnelID:0x2a000000000d34, dedicated encap_mapper(1) decap_mapper(1)
 VLAN-VNI DecapMapper:0x29000000000d30 EncapMapper:0x29000000000d31
 VRF-VNI DecapMapper:0x29000000000d32 EncapMapper:0x29000000000d33

 ==============Refcnts per tunnel===============================
 tnl_name(EVPN_15.15.100.15) imr(2) mac(0) ip(0) dupimradd(0) dupimrdel(0)
tunnport(Port_EVPN_15.15.100.15) fdbcount(1)

 =============================================================
List of all remote evpn discovered tunnels. VxLANOrch creates a new instance of remote tunnel when it receives the remote IMET/MAC/IP. It maintains the ref count of all 3 types of the routes. It deletes the corresponding tunnel instance when the ref count of all 3 types of routes are 0. Observe the imr, ip & fdbcount for the corresponding tunnel.

```
## Orchagent - FdbOrch (Local/Remote Macs) 
### FdbOrch Information  
```
show debug fdborch counters
FdbOrch: Rcvd field DETAIL, Value FULL
FDB ASIC Event Counters
-----------------------
Learn Events received from ASIC DB : 1
Aged Events received from ASIC DB  : 0
Move Events received from ASIC DB  : 0
Flush Events received from ASIC DB : 0
FDB APP Event Counters
----------------------
Add request Events received from APP DB      : 1
Delete request Events received from APP DB   : 0
VLAN Add request Events received from APP DB : 0
VLAN Del request Events received from APP DB : 0
FDB SYNCD Event Counters
------------------------
Add request Events sent to SYNCD    : 0
Delete request Events sent to SYNCD : 0
FDB per-entry Counters
----------------------
Total FDB Count                         : 2
Total FDB Count                         : 2
FDB Ref Count
-------------------
Ethernet46:1 (Summary of mac count per port & per remote tunnel. These macs are configured in ASIC_DB and hw.)
Port_EVPN_15.15.100.15:1
Vlan102:2
Saved FDB Count
-------------------
Summary of pending mac count per port & per remote tunnel. For instance when the mac is learnt before the vlan membership or delete pending events et al. These macs are not configured in the ASIC_DB

FDB Entries
-------------------
00:15:00:00:00:00-Vlan102(0x26000000000cf4)-Port_EVPN_15.15.100.15(0x3a000000000d51)-dynamic
00:16:00:00:00:00-Vlan102(0x26000000000cf4)-Ethernet46(0x3a000000000d38)-dynamic
Detailed list of mac information of local/remote macs. These macs are configured in ASIC_DB and hw.

Saved FDB Entries
-------------------
Detailed list of mac information of local/remote macs in pending state. These macs are not configured in ASIC_DB and hw.


```

## SAI debugsh commands 
### SAI VLAN Information 
```
show system internal sai vlan sw dump
This command displays the hw entities of the VLAN like VFI, IPMC Group as well as VLAN membership of both local ports and the VxLAN tunnel. This will be handy to dump the corresponding hw information like IPMC members for debugging BUM/flooding related issues on a specific VLAN.

|Vlan|     VFI-MCG      |Member_Count|(type:tid : Bridge-Port-OID : Vlan-Member-OID :   VPort  )|

|   1|0x7002 -0xf000002 |        None|

| 101|0x7003 -0xf000003 |           3|( ETH:74  :0x1003a0000004a  :0x4a012700000065 :0xb0000001)|
|                                    |( ETH:72  :0x1003a00000048  :0x48012700000065 :0xb0000002)|
|                                    |( TNL:2   :0x2a043a00000002 :0x22a2700000065  :0xb0000005)|

| 102|0x7004 -0xf000004 |           3|( ETH:74  :0x1003a0000004a  :0x4a012700000066 :0xb0000003)|
|                                    |( ETH:72  :0x1003a00000048  :0x48012700000066 :0xb0000004)|
|                                    |( TNL:2   :0x2a043a00000002 :0x22a2700000066  :0xb0000005)|

```
```
show system internal sai vlan hw dump
|Vlan|Member_Count|(port_tid:Tag_type)|

|   1|        None|

| 101|           2|(      72:T       )|
|                 |(      74:T       )|

| 102|           2|(      72:T       )|
|                 |(      74:T       )|

T: Tagged
U: Untagged

```
### SAI MPTnl Global Information 
It gives global view of all the hw resources/operations of the tunnel. Typically, with this command, it will be easy to deduce the number of vxlan tunnels, vlans extended over the tunnels et al. It also gives detailed debug counters of every hw calls with success/failure counters. This is very handy for debugging any sdk errors arise out of misprogramming, out of sequence et al. It can also deduce network flaps and removal/reprogramming of all tunnel hw resources like sip, dip, nh, ecmp, tnl vlan membership. All the fail counters of create/delete must be 0. Otherwise, it indicates of sdk h/w programming errors.

```
show system internal sai mptnl global detail
 Tunnel Global Information
 vxlan_flow_handle(1) vxlan_rsvd_vpn(28673) 
lag_nh_del_track_cnt(0) nh_hwid_mismatch(0)
 Scaling Information
 tnl(curr:2::max:513) tnlmap(max(8192) vlan(curr:2::max:4096) 
vrf(curr:0::max:4096))
 Debug Counters
 Generic type(    vni_map_entry) (crea_succ:2::crea_fail:0::del_succ:0::del_fail:0)
 Generic type(   vlan_map_entry) (crea_succ:2::crea_fail:0::del_succ:0::del_fail:0)
     SIP type(     sip_tnl_term) (crea_succ:1::crea_fail:0::del_succ:0::del_fail:0)
      NH type(            uc_nh) (crea_succ:2::crea_fail:0::del_succ:0::del_fail:0)
     DIP type(     dip_tnl_init) (crea_succ:1::crea_fail:0::del_succ:0::del_fail:0)
     DIP type(     dip_tnl_term) (crea_succ:1::crea_fail:0::del_succ:0::del_fail:0)
     DIP type(     dip_tnl_ecmp) (crea_succ:1::crea_fail:0::del_succ:0::del_fail:0)
     DIP type(    dip_tnl_encap) (crea_succ:1::crea_fail:0::del_succ:0::del_fail:0)
     DIP type(dip_tnl_flow_port) (crea_succ:1::crea_fail:0::del_succ:0::del_fail:0)
     DIP type(    dip_tnl_mc_nh) (crea_succ:1::crea_fail:0::del_succ:0::del_fail:0)
     DIP type(  dip_tnl_ecmp_nh) (crea_succ:2::crea_fail:0::del_succ:0::del_fail:0)
     DIP type(     dip_tnl_vlan) (crea_succ:2::crea_fail:0::del_succ:0::del_fail:0)
=======================================================
VLAN Tunnel membership debug counters
    VLAN type(    vlan_phy_port) (crea_succ:0::crea_fail:0::del_succ:0::del_fail:0)
    VLAN type(   vlan_trunk_mbr) (crea_succ:4::crea_fail:0::del_succ:0::del_fail:0)
    VLAN type(  vlan_cre_add_nh) (crea_succ:1::crea_fail:0::del_succ:0::del_fail:0)
    VLAN type(  vlan_del_rem_nh) (crea_succ:0::crea_fail:0::del_succ:0::del_fail:0)
    VLAN type(  vlan_cre_rem_nh) (crea_succ:0::crea_fail:0::del_succ:0::del_fail:0)
    VLAN type( vlan_cre_add_vid) (crea_succ:1::crea_fail:0::del_succ:0::del_fail:0)
    VLAN type( vlan_del_rem_vid) (crea_succ:0::crea_fail:0::del_succ:0::del_fail:0)
    VLAN type(  vlan_cre_upd_nh) (crea_succ:0::crea_fail:0::del_succ:0::del_fail:0)
    VLAN type(  vlan_del_upd_nh) (crea_succ:0::crea_fail:0::del_succ:0::del_fail:0)
    VLAN type( vlan_del_down_nh) (crea_succ:0::crea_fail:0::del_succ:0::del_fail:0)
=======================================================

```
### SAI MPTnl DIP Information 
This command displays detailed information on a specific tunnels like list of underlay next-hops (picking one of them as BUM next-hop), list of vlan membership. Additionally, it displays hw information which can be correlated with the brcm diag shell commands and check if hw is programmed.
pd_vp - Overlay nexthop and macs will point to this VP. 
pd_ecmp - Known unicast traffic will use this ecmp group. It will have all the corresponding underlay next-hop in the ecmp group
pd_mc_nh_id/pd_mc_nh_egid - The multicast next-hop of this tunnel will be the BUM next-hop which will be part of all the IPMC_group of evert tnl-vlan membership.
It has detailed nhinfo, vlan membeship & debug counters for hw resources used by this tunnel
```
show system internal sai mptnl dip detail
 Tunnel DIP Information
=======================================================
 PI Information
 dst_tnl(0x2::af:v4 addr:15.15.100.15) src_tnl(0x1::af:v4 addr:16.16.100.16) status(Up::2)
 nhg(0x30d40::200000) flag(0x12) nh_cnt(2) vlan_cnt(2)

 PD Information
 pd_vp(0xb0000005) pd_ecmp(0x31640::202304) pd_init(0x4c000005)
 pd_mc_nh_id(0x69a87::432775) pd_mc_nh_egid(0xc000000) tnl_rsc_bitmap(0x7e)
 RSC init(yes) term(yes) ecmp(yes) encap(yes) flow_port(yes) mc_nh(yes)

 List of Next-hops num(2)
 tnl_nh_id(0x1) nh_ip(af:v4 addr:10.8.8.8) added_to_ecmp(yes) bum(yes)
 tnl_nh_id(0x2) nh_ip(af:v4 addr:11.8.8.8) added_to_ecmp(yes) bum(no

Debug Counters
 DIP type(     dip_tnl_init) (crea_succ:1::crea_fail:0::del_succ:0::del_fail:0)
 DIP type(     dip_tnl_term) (crea_succ:1::crea_fail:0::del_succ:0::del_fail:0)
 DIP type(     dip_tnl_ecmp) (crea_succ:1::crea_fail:0::del_succ:0::del_fail:0)
 DIP type(    dip_tnl_encap) (crea_succ:1::crea_fail:0::del_succ:0::del_fail:0)
 DIP type(dip_tnl_flow_port) (crea_succ:1::crea_fail:0::del_succ:0::del_fail:0)
 DIP type(    dip_tnl_mc_nh) (crea_succ:1::crea_fail:0::del_succ:0::del_fail:0)
 DIP type(  dip_tnl_ecmp_nh) (crea_succ:2::crea_fail:0::del_succ:0::del_fail:0)
 DIP type(     dip_tnl_vlan) (crea_succ:2::crea_fail:0::del_succ:0::del_fail:0)

 List of VLANs num(2)
 tnl_vlan_id(102::added_to_vlan(yes))  tnl_vlan_id(101::added_to_vlan(yes))

```
### SAI MPTnl nh Information 
The PD Information gives the hw next-hop information which will be part of the Tunnel’s ECMP Group for known unicast traffic. This is reused by multiple tunnels if the underlay next-hop is part of the ECMP group. The PI information gives the list of tunnels using this next-hop/
The underlay rif/vid/mac/egid is used to program this tunnel next-hop.
```
show system internal sai mptnl nh detail
 Tunnel NH Information
=======================================================
 PI Information
 id(0x1) ip(af:v4 addr:10.8.8.8) flags(0x6) t_cnt(0x1)

 List of Tunnels num(1)
 nh_tnl_id(0x2)

 PD Information
 pdid(0x206a6::132774) rif (0x1002) rsc(0x6)
 RSC uc_nh(yes) is_trunk(yes) trunk_id(0)

 Underlay Information
 nh_ul_info egr(0x206a4::132772) rif (4098) vid(4095) mac(80:a2:35:f2:8b:4c) is_t(yes) port(0x0)

 Debug Counters
 NH type(uc_nh) (crea_succ:1::crea_fail:0::del_succ:0::del_fail:0)
=======================================================

```
## Brcm Diag Shell Commands 
### PortChannel/Trunk Information 
```
show interfaces portchannel
Flags: A - active, I - inactive, Up - up, Dw - Down, N/A - not available, S - selected, D - deselected
  No.  Team Dev         Protocol     Ports
-----  ---------------  -----------  ---------------------------
 0001  PortChannel0001  LACP(A)(Up)  Ethernet60(S) Ethernet61(S)
 0002  PortChannel0002  LACP(A)(Up)  Ethernet63(S) Ethernet62(S)
```
```
trunk show
Device supports 2112 trunk groups:
  2048 front panel trunks (0..2047), 256 ports/trunk
  64 fabric trunks (2048..2111), 64 ports/trunk
trunk 0: (front panel, 2 ports)=xe60,xe61 dlf=any mc=any ipmc=any psc=portflow (0x9)
trunk 1: (front panel, 2 ports)=xe62,xe63 dlf=any mc=any ipmc=any psc=portflow (0x9)
```
“trunk show” command shows all the trunk interfaces with the corresponding trunk-id as well as the trunk members which are part of the each of the corresponding trunk.
This information will be handy if tunnel next-hop is over PortChannel and it is selected for BUM.

### Nexthop Information  
From the “show system internal sai mptnl nh” command, check if corresponding entry exist with proper vlan/mac/outgoing port as part of next-hop.
These are the tunnel next-hop (Unicast & BUM NH). Unicast NH is shared across tunnels. BUM NH is per tunnel. Both Unicast and BUM NH will be part of this list.
132774 is unicast next-hop
132775 is BUM next-hop
Correlate this info with the “show system internal sai mptnl dip” command (for BUM)
```
l3 egress show
Entry  Mac                 Vlan INTF PORT MOD MPLS_LABEL ToCpu Drop RefCount L3MC
132772  80:a2:35:f2:8b:4c 4095 4098     0t   0        -1   no   no    2   no
132773  80:a2:35:f2:8b:4c 4095 4099     1t   0        -1   no   no    2   no
132774  80:a2:35:f2:8b:4c 4095 4098     0t   0        -1   no   no    1   no
132775  80:a2:35:f2:8b:4c 4095 4098     0t   0        -1   no   no    0  yes
132776  80:a2:35:f2:8b:4c 4095 4099     1t   0        -1   no   no    1   no
132843  80:a2:35:81:ca:f0    1 4097     0    0        -1   no  yes    2   no
```
### ECMP Information 
For each tunnel, ecmp group is created. Use “show system internal sai mptnl dip” to get the ecmp group of the corresponding tunnel.
In this output, for the corresponding ecmp group, all the next-hop part of the corresponding tunnel (correlate using “show system internal sai mptnl nh”) will be part of the ecmp group.
202304 - ecmp group from the dip output
2 nexthop as part of dip output. Get the next-hop id from the tnl nh output and verify they are part of this ecmp group. 
In this case 132774 & 132776 is part of the ecmp group 202304.

```
l3 ecmp egress show
ECMP Egress Object 200000
Interfaces: 132772 132773
Reference count: 3
ECMP Egress Object 202304
Interfaces: 132774 132776
Reference count: 1

```
### IPMC Group Information (Tunnel BUM NH)
From the SAI Vlan output, get the IPMC Group and use it as an input for this command.
Since the tunnel next-hop is on trunk 0 (correlate from tnl nh output and tnl dip output to find the BUM next-hop of the tunnel). The corresponding tunnel BUM Next-hop is replicated for each of the trunk member (correlate the trunk member from the trunk show command).
In this case, xe60/xe61 (trunk members), the corresponding tunnel BUM nexthop 432775 is part of the corresponding VLAN’s IPMC Group.
```
multicast show group
multicast show group=0x3000003
Group 0x3000003 (VPLS)
    port xe47, encap id 432769
    port xe46, encap id 432768
    port xe60, encap id 432775
    port xe61, encap id 432775
```
### Unicast Mac
“l2 show” will display the mac, VFI (get vfi from vlan using show system sai internal vlan sw dump command) and outgoing port. For remote mac, it will be the VP of the tunnel (get the pd_vp of the tunnel using the show system internal sai mptnl dip command). The entry must be added as type Mesh indicating that it will not “age out” but it can move if mac is learnt locally on the physical/portchannel interface.
```
show mac
  No.    Vlan  MacAddress         Port                     Type
-----  ------  -----------------  -----------------------  -------
    1     102  00:15:00:00:00:00  VxLAN DIP: 15.15.100.15  Dynamic
    2     102  00:16:00:00:00:00  Ethernet46               Dynamic
```
```
bridge fdb show | grep “vlan 102”
00:16:00:00:00:00 dev Ethernet46 vlan 102 offload master Bridge
00:15:00:00:00:00 dev vtep1-102 vlan 102 offload master Bridge
```
```
l2 show
mac=00:15:00:00:00:00 vlan=28676 GPORT=0xb0000005 port=0xb0000005(flow) Hit Mesh

```
## Troubleshooting of common issues 
### Tracking the Local VLAN/VNI mapping across modules
- Check local VLAN/VNI config is present in CONFIG_DB of redis (redis-cli -n 4 - keys *TUNNEL_MAP*)
- Check if it is present in VxlanMgrd using debugsh “show system internal vxlanmgr global”
- Check if it is present in kernel using “ip link show type vxlan”
- Check if it is present in FRR/BGP using “show evpn vni detail”
- Check if it is present in APP_DB of redis (redis-cli -n 0 - keys *TUNNEL_MAP*)
- Check if it is present in VxlanOrch using debugsh “show system internal orchagent vxlanorch global”
- Check if it is present in ASIC_DB of redis (redis-cli -n 1 - keys *TUNNEL*)
- Check if it is present in SAI using debugsh “show system internal sai mptnl mapentry detail”)
- Check if it is present in HW using brcm diag shell “d chg VLAN_XLATE_1_DOUBLE” and “d chg EGR_VLAN_XLATE_1_SINGLE”

### Tracking the remote VLAN/VNI mapping across modules
- Check if it is present in FRR/BGP using “show evpn vni detail”
- Check if it is present in the Linux Kernel using “bridge fdb show” command (look for all 0’s mac on corresponding vtep and vlan with corresponding remote evpn ip address)
- Check if it is present in the fdbsyncd module using debugsh “show system internal fdbsyncd imet”
- Check if it is present in the APP_DB of redis (redis-cli -n 0 - keys *REMOTE*)
- Check if it is present in the VxlanOrch using debugsh “show system internal orchagent vxlanorch global”
- Check if it is present SAI using “show system internal sai vlan sw” and “show system internal sai mptnl dip”
- Check if it is programmed in hw using brcm shell “multicast show group=gid” command

### Tracking the Local mac across modules
- Check mac is learnt in hw using brcm shell “l2 show” command
- Check mac is present in the fdbOrch using “show debug fdborch counters” command
- Check mac is present in the STATE_DB of redis (redis-cli -n 6 - keys *FDB*)
- Check mac is present in the fdbsyncd module using debugsh “show system internal fdbsyncd local_fdb)
- Check mac is present in the Linux Kernel using “bridge fdb show” command
- Check mac is present in the FRR/BGP using “show show bgp l2vpn evpn route type macip”
### Tracking the remote mac across modules
- Check mac is present in the FRR/BGP using “show show bgp l2vpn evpn route type macip”
- Check mac is present in the Linux Kernel using “bridge fdb show” command
- Check mac is present in the fdbsyncd module using debugsh “show system internal fdbsyncd vxlan_fdb)
- Check mac is present in the APP_DB of redis (redis-cli -n 0 - keys *FDB*)
- Check mac is present in the fdbOrch using “show debug fdborch counters” command
- Check mac is present in the ASIC_DB of redis using “show mac”
- Check mac is programmed in hw using brcm shell “l2 show” command

### Tracking the Tunnel Application user 
Why is the Tunnel not created/deleted with overlay routes/nexthop/IMET/mac-ip route exchanges?

- Check the local/remote VNI, local/remote mac as described in previous slides
- Check the Tunnel Application Users using the “show system internal orchagent vxlanorch global”. For every discovered EVPN tunnel created, it maintains the refCount for the overlay next-hop, IMET and mac count. When any of them becomes non-zero, tunnel is created. When all of them becomes zero, the tunnel is deleted.
- Typically the tunnel does not get created when the application user (route/nexthop - RouteOrch/NeighOrch), mac (FdbOrch), IMET (VxlanOrch) does not notify the create the tunnel.
- Similarly, the tunnel does not get deleted, if the application user does not notify the tunnel module and hence there is non-zero ref count.

### Why is the Tunnel Oper Down? 

- Check MpTnl SAI module “show system internal sai mptnl dip”.
- Check the number of next-hop for the corresponding tunnel. If the number of next-hop is zero, the oper status of the tunnel will be down. 
- Further check the “l3 def ip show”, “l3 egress show” & “l3 ecmp egress show” to determine the underlay next-hop for the corresponding tunnel destination. Most likely the underlay next-hop for tunnel destination is not yet there and hence tunnel oper status is down.




## VxlanMgrd debugsh command 

```
show system internal vxlanmgr global
VxlanHwCapability Enable
Feature Capability: Vxlan(Enable) Vlan_Vni_Num(4096)
 VTEP Name:vtep1 SIP:16.16.100.16 isActive:1 vnicount:2

 ============== Pending Request Count===============
 tunnel_map:0 nvo:0 tunnel:0 vnet:0

```
- Currently only TD3 supports single-pass RIOT. Hence only TD3 platfrom has got HwCapability to support VxLAN. This will be disable for all the other platforms.
Even for TD3, VxLAN is enabled only for L3 profile. Hence, for L2 profile (TD3 platfrom, this would be disable)

- VxLAN is enabled only for Enterprise Base/Advanced packages. This would be disable for the Cloud Base/advanced package
- VxLANMgrd will process the configuration only for TD3 platfrom on L3 profile with Enterprise Base/Advanced package. It will not process the configuration if any of the above condition is false and will not write the config to Linux kernel as well as appDB.
- It has the configured src-vtep-ip as well as all the Vlan/Vni mappings. Vnicount indicates the number of Vlan/Vni mappings configured locally on the system.
- In usual scenarios, there must not be any pending request count. While debugging large scale setups with multiple remote tunnels and scaled vlan/vni mappings, few config/network events can result in pending events. Eventually, they must be cleared in a steady state

## Linux - VxLAN information 
### VxLAN netdevice - Linux Kernel
```
ip link show type vxlan
87: vtep1-101: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master Bridge state UNKNOWN mode DEFAULT group default qlen 1000
link/ether 80:a2:35:81:ca:f0 brd ff:ff:ff:ff:ff:ff promiscuity 1
    vxlan id 101 local 16.16.100.16 srcport 0 0 dstport 4789 nolearning ageing 300 udpcsum noudp6zerocsumtx noudp6zerocsumrx
    bridge_slave state forwarding priority 4 cost 100 hairpin off guard off root_block off fastleave off learning off flood on port_id 0x8004 port_no 0x4 designated_port 32772 designated_cost 0 designated_bridge 8000.80:a2:35:81:ca:f0 designated_root 8000.80:a2:35:81:ca:f0 hold_timer    0.00 message_age_timer    0.00 forward_delay_timer    0.00 topology_change_ack 0 config_pending 0 proxy_arp off proxy_arp_wifi off mcast_router 1 mcast_fast_leave off mcast_flood on addrgenmode eui64 numtxqueues 1 numrxqueues 1 gso_max_size 65536 gso_max_segs 65535

```
For each VLAN/VNI mapping, VxLAN netdevice is created in linux kernel. Name of device will be as “vtep-name”-”vlan-id”. It will have the src-vtep-ip as local ip. This net-device will also be part of the bridge-member to the corresponding VLAN. Learning is disabled on this netdevice.
FRR gets notification when the VxLAN netdevice is created/deleted. This helps it to advertise/withdraw the IMET route to the remote BGP evpn peers.

### Linux - Verify Remote IMET route 
```
bridge fdb show | grep “00:00:00:00:00:00”
00:00:00:00:00:00 dev vtep1-101 dst 15.15.100.15 self permanent
00:00:00:00:00:00 dev vtep1-102 dst 15.15.100.15 self permanent
```

## Redis DB - VxLAN Configuration Tables 

The src-vtep-ip and the vlan/vni mapping flows through from cfgDB(vxlanmgrd) to appDB(vxlanchagent) to asicDB

### CONFIG DB  
``` 
hgetall VXLAN_TUNNEL|vtep1
1) "src_ip"
2) "16.16.100.16"
hgetall VXLAN_TUNNEL_MAP|vtep1|map_101_Vlan101
1) "vlan"
2) "Vlan101"
3) "vni"
4) "101"
``` 
### APP DB 
```
- hgetall VXLAN_TUNNEL_TABLE:vtep1
1) "src_ip"
2) "16.16.100.16"
- hgetall VXLAN_TUNNEL_MAP_TABLE:vtep1:map_101_Vlan101
1) "vlan"
2) "Vlan101"
3) "vni"
4) "101"
```
### ASIC DB  
```
- hgetall ASIC_STATE:SAI_OBJECT_TYPE_TUNNEL:oid:0x2a000000000d34
 1) "SAI_TUNNEL_ATTR_TYPE"
 2) "SAI_TUNNEL_TYPE_VXLAN"
 3) "SAI_TUNNEL_ATTR_UNDERLAY_INTERFACE"
 4) "oid:0x6000000000c99"
 5) "SAI_TUNNEL_ATTR_DECAP_MAPPERS"
 6) "2:oid:0x29000000000d30,oid:0x29000000000d32"
 7) "SAI_TUNNEL_ATTR_ENCAP_MAPPERS"
 8) "2:oid:0x29000000000d31,oid:0x29000000000d33"
 9) "SAI_TUNNEL_ATTR_ENCAP_SRC_IP"
10) "16.16.100.16"
- hgetall ASIC_STATE:SAI_OBJECT_TYPE_TUNNEL_MAP_ENTRY:oid:0x3b000000000d36
1) "SAI_TUNNEL_MAP_ENTRY_ATTR_TUNNEL_MAP_TYPE"
2) "SAI_TUNNEL_MAP_TYPE_VNI_TO_VLAN_ID"
3) "SAI_TUNNEL_MAP_ENTRY_ATTR_TUNNEL_MAP"
4) "oid:0x29000000000d30"
5) "SAI_TUNNEL_MAP_ENTRY_ATTR_VLAN_ID_VALUE"
6) "101"
7) "SAI_TUNNEL_MAP_ENTRY_ATTR_VNI_ID_KEY"
8) "101"

```
## FRR COMMANDS 
FRR - Verify Local/Remote IMET (L2 VNI)
```
- show evpn vni
VNI        Type VxLAN IF              # MACs   # ARPs   # Remote VTEPs  Tenant VRF
101        L2   vtep1-101             0        0        1               default
102        L2   vtep1-102             1        0        1               default
```
```
- show evpn vni detail
VNI: 101
 Type: L2
 Tenant VRF: default
 VxLAN interface: vtep1-101
 VxLAN ifIndex: 87
 Local VTEP IP: 16.16.100.16
 Mcast group: 0.0.0.0
 Remote VTEPs for this VNI:
  15.15.100.15 flood: HER
 Number of MACs (local and remote) known for this VNI: 0
 Number of ARPs (IPv4 and IPv6, local and remote) known for this VNI: 0

```






