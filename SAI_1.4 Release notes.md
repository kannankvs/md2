# SAI 1.4 Release Notes

# 1. Added SAI_OBJECT_TYPE_BRIDGE_PORT support in ACL

## Description

Below mentioned are some of the sub-items related to this change  
  
- Removing condition in bridge port bridge id attribute (#706) (#707)   
- add SAI_SWITCH_ATTR_AVAILABLE_ACL_{TABLE,TABLE_GROUP} (#721)  
- add SAI_SWITCH_ATTR_AVAILABLE_NEXT_HOP_GROUP_ENTRY (#722)  

## Commit  

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/e472cc22654c388e56d749464bde7462bc9d8bda)

## PRs related to this commit

[756](https://github.com/opencomputeproject/SAI/pull/756)  [706](https://github.com/opencomputeproject/SAI/pull/706)  [707](https://github.com/opencomputeproject/SAI/pull/707)  [717](https://github.com/opencomputeproject/SAI/pull/717)  [721](https://github.com/opencomputeproject/SAI/pull/721)  [722](https://github.com/opencomputeproject/SAI/pull/722)  [731](https://github.com/opencomputeproject/SAI/pull/731)  [733](https://github.com/opencomputeproject/SAI/pull/733)  [725](https://github.com/opencomputeproject/SAI/pull/725)  [745](https://github.com/opencomputeproject/SAI/pull/745)  [752](https://github.com/opencomputeproject/SAI/pull/752)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# 2. Uninitialize data plane ON removal of switch object

## Description

Below mentioned are some of the sub-items related to this change

- Controls whether data plane is unitialized upon removal of switc object as leaving traffic running without control is not recommended  
- However, on some scenarios, such as fast boot, it is needed to leave the data plane running  
- Host adapter will call this attribute if needed, and then call remove the switch  

## Commit 

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/c26fb2657a7b246548d10458a542ea5fa2d23cd5)

## PRs related to this commit

[795](https://github.com/opencomputeproject/SAI/pull/795)

------------------------------------------------------------------------------------------------------------------------------------------

# 3. Add SAI_PORT_ATTR_EYE_VALUES

## Description

- "sai_port_lane_eye_values" name changed to "SAI_PORT_ATTR_EYE_VALUES"

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/829250450f2ff8a38e895413ccd85d92935acbbc)


## PRs related to this commit

[777](https://github.com/opencomputeproject/SAI/pull/777)

------------------------------------------------------------------------------------------------------------------------------------------

# 4. Add capability metadata for attributes

## Description

- 

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/ca5006112d4fa64747a848ef85fd4194f26a3df8)

## 5. PRs related to this commit

[794](https://github.com/opencomputeproject/SAI/pull/794)

------------------------------------------------------------------------------------------------------------------------------------------

# 6. Add license information to metadata source files

## Description

- 

- 


## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/92e54170f17ccc0881832eea4e93114ba8fd1e79)

## PRs related to this commit

[799](https://github.com/opencomputeproject/SAI/pull/799)

------------------------------------------------------------------------------------------------------------------------------------------
# 7. VRRP support in RIF create call

## Description

- To fix meta checker

- To update VRRP PR with review comments

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/362659154965f46f84b70f5f55f2dc79f7234e68)

## PRs related to this commit

[792](https://github.com/opencomputeproject/SAI/pull/792)

------------------------------------------------------------------------------------------------------------------------------------------
# 8. Refactor parser for auto serialize and deserialize

## Description

- 

- 

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/2bd3dfadccd5a8e01e83b7604cb8ca281a56eec9)

## PRs related to this commit

[804](https://github.com/opencomputeproject/SAI/pull/804)

------------------------------------------------------------------------------------------------------------------------------------------
# 9. Add mirror session congestion mode

## Description

- 

- 

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/07c23b3f95cb8034a5ee2bd9baf6815be3eb7324)

## PRs related to this commit

[786](https://github.com/opencomputeproject/SAI/pull/786)

------------------------------------------------------------------------------------------------------------------------------------------
# 10. Add HostIf traps for CISCO MCAST packet types

## Description

- To add CISCO MCast types other than UDLD to SAI header, so we can trap individual types to CPU  

- Common Mcast DMAC trap is added to use a single trap for CISCO Mcast DMAC (01-00-0c-cc-cc-cc)  

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/9b169454b277f26664f52464184a80b0ff4f202b)

## PRs related to this commit

[819](https://github.com/opencomputeproject/SAI/pull/819)

------------------------------------------------------------------------------------------------------------------------------------------
# 11. Add a new DTel attribute to provide fine-grained control while enabling drop reports

## Description

- To selectively enables/disables queue tail drop reporting when drop reporting is enabled  

- If the new attribute is disabled, all other drops are still reported 

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/fb8cd257f2a5c7d880b40ab39a95ec3dcc6f9ac5)

## PRs related to this commit

[813](https://github.com/opencomputeproject/SAI/pull/813)

------------------------------------------------------------------------------------------------------------------------------------------
# 12. Create fdb using vlan object id instead of vlan id

## Description

-   

- 

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/95eb274c2c4ecfe4213b6ad695d45769ae460313)

## PRs related to this commit

[829](https://github.com/opencomputeproject/SAI/pull/829)

------------------------------------------------------------------------------------------------------------------------------------------
# 13. IP in IP tunnel ptf tests

## Description

-   

- 

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/9583b410903bffc0aa29f57a81ddd418e40867da)

## PRs related to this commit

[833](https://github.com/opencomputeproject/SAI/pull/833)  [385](https://github.com/opencomputeproject/SAI/pull/385)  [SAITUNNEL](https://github.com/opencomputeproject/SAI/blob/v0.9.4/test/saithrift/tests/saitunnel.py)

------------------------------------------------------------------------------------------------------------------------------------------
# 14. Added P4 Behavioral Model

## Description

- A general switch P4 behavioral model.
- Implementation of the SAI API over the P4 BM.
- unit test example for the sai api usage.
- Thirft sai server implementation and ptf tests. (currently only L2 (1D,1Q) flows are supported)

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/09d8c749dac0e990e64c2090af93faa69f37b001)

## PRs related to this commit

[492](https://github.com/opencomputeproject/SAI/pull/492) 

------------------------------------------------------------------------------------------------------------------------------------------
# 15. Add meta data attribute support to SAI extensions

## Description

-   

- 

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/0115c7c67d95ca492da467a99f7e0975a5954066)

## PRs related to this commit

[835](https://github.com/opencomputeproject/SAI/pull/835) 

------------------------------------------------------------------------------------------------------------------------------------------
# 16. Add new flush type for clearing both static and dynamic entries

## Description

- To clear either static or dynamic or both entries in FDB  

- Need to mention either of the two entries to remove one of the entries or mention both to remove both  
  -  Ex: SAI_FDB_FLUSH_ATTR_ENTRY_TYPE = SAI_FDB_FLUSH_ENTRY_TYPE_STATIC_DYNAMIC  

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/1334f2632ca18630c77cb26b40efdf9905ae880d)

## PRs related to this commit

[845](https://github.com/opencomputeproject/SAI/pull/845) 

------------------------------------------------------------------------------------------------------------------------------------------
# 17. Add port attibute to pause and unpause the egress of a port

## Description

- Add rpc support to parse port attribute of pausing and unpausing a port egress  

- 

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/2fc95990b245c769723214dd7adca93f988bdb05)

## PRs related to this commit

[840](https://github.com/opencomputeproject/SAI/pull/840) 

------------------------------------------------------------------------------------------------------------------------------------------
# 18. Add RIF counters

## Description

-   

- 

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/631e03bf5760ea643faa765ed7a5fe13c50514a7)

## PRs related to this commit

[836](https://github.com/opencomputeproject/SAI/pull/836) 

------------------------------------------------------------------------------------------------------------------------------------------
# 19. Add p4_compiler submodule

## Description

- Moved p4 backed submoduile to flexsai/p4

- Moved p4 backend compiler from submodule to SAI repo

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/d8b638a6ed1cbd5875253a392ded589546b9f297)

## PRs related to this commit

[837](https://github.com/opencomputeproject/SAI/pull/837) 

------------------------------------------------------------------------------------------------------------------------------------------
# 20. Add new IP in IP decap PTF tests

## Description

- Add parameter to sai_thrift_create_tunnel and sai_thrift_create_tunnel_term_table_entry  

- 

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/2d3e56a4d98a3cdc310e808aba7767c8da23f167)

## PRs related to this commit

[853](https://github.com/opencomputeproject/SAI/pull/853) 

------------------------------------------------------------------------------------------------------------------------------------------
# 21. Add warm boot recover attribute

## Description

- Currently the existing attribute SAI_SWITCH_ATTR_RESTART_WARM serves as a hint that warm restart procedure is restarting. After such boot, on some ASICs, SAI is reinitialized from scratch and SAI_KEY_BOOT_TYPE has the value of the boot type done. On other ASICs, SAI is not reinitialized from scratch, rather the process is resumed. A hint that the process is resumed is needed, and the current new attribute gives that hint.

- 

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/22c4bb997d25b3b6c87eb306a17befea9edcd021)

## PRs related to this commit

[854](https://github.com/opencomputeproject/SAI/pull/854) 

------------------------------------------------------------------------------------------------------------------------------------------
# 22. Add vxlan tunnel as possible condition for underlay interface attribute

## Description

- 

- 

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/6e3ec78c76f64494cc38a2b8eb6c2b18d873e19b)

## PRs related to this commit

[870](https://github.com/opencomputeproject/SAI/pull/870) 

------------------------------------------------------------------------------------------------------------------------------------------
# 23. Add watermark stat for headroom pool

## Description

- Changed the title "Add watermark attribute for headroom pool" to "Add watermark stat for headroom pool"

- 

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/0a83b1c44c2bd61876084d14453d3a210d7ac056)

## PRs related to this commit

[871](https://github.com/opencomputeproject/SAI/pull/871) 

------------------------------------------------------------------------------------------------------------------------------------------
# 24. Add stat enum pointer to object type info metadata

## Description

- 

- 

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/acc83933ff21c68e8ef10c9826de45807fdc0438)

## PRs related to this commit

[881](https://github.com/opencomputeproject/SAI/pull/881) 

------------------------------------------------------------------------------------------------------------------------------------------
# 25. Add stats function param types check

## Description

- 

- 

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/1d2f40db22049ae316308cc73c9673d276f0e0eb)

## PRs related to this commit

[882](https://github.com/opencomputeproject/SAI/pull/882) 

------------------------------------------------------------------------------------------------------------------------------------------
# 26. Add struct member offset and size to metadata

## Description

- 

- 

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/9c40afebe3223a0f2bb77bd95980da0d42bb7f65)

## PRs related to this commit

[883](https://github.com/opencomputeproject/SAI/pull/883) 

------------------------------------------------------------------------------------------------------------------------------------------
# 27. Add attr bridge id for bridge router interface

## Description

- To add the bridge id attribute for router interface of type SAI_ROUTER_INTERFACE_TYPE_BRIDGE.

- A bridge router interface can be connected only to one bridge. Adding bridge id attribute in bridge router interface would ensure that a bridge router interface can be connected only one bridge. If this attribute is not present, the bridge router interface can be connected to multiple bridges which is invalid.

- All the router interfaces type have a key which need to be given during creation. Ex: For VLAN router interface, VLAN object ID is the key. For Port router interface, Port/LAG object ID is the key. However for bridge router interface, currently there is no key. So bridge id is added as a key attribute for bridge router interface. This makes creation of all router interface types consistent.

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/55ccf885371c0b62b5c3ea1a62781c4ebe60b1d9)

## PRs related to this commit

[868](https://github.com/opencomputeproject/SAI/pull/868) 

------------------------------------------------------------------------------------------------------------------------------------------
# 28. Change SAI_MIRROR_SESSION_ATTR_VLAN_HEADER_VALID to CREATE_AND_SET

## Description

- Because SAI_MIRROR_SESSION_ATTR_VLAN_ID is no longer set as mandatory on create, user needs to set this VLAN ID specifically when creating an RSPAN session. Otherwise, the default value 0 will be used.  

- 

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/842bc881cc5c536a8fede8f42566e32bcd1d9102)

## PRs related to this commit

[879](https://github.com/opencomputeproject/SAI/pull/879) 

------------------------------------------------------------------------------------------------------------------------------------------
# 29. Uild saiserver and saiserver-dbg packages

## Description

- 

- 

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/13d8b4468fe5f71a10da0663bacc19908c7c2927)

## PRs related to this commit

[888](https://github.com/opencomputeproject/SAI/pull/888) 

------------------------------------------------------------------------------------------------------------------------------------------
# 30. Add switch notification attributes list to metadata

## Description

- Add define and sanity checks  

- 

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/b8f6ba8b986b4460ad42141b3cc9181e9171a19e)

## PRs related to this commit

[886](https://github.com/opencomputeproject/SAI/pull/886) 

------------------------------------------------------------------------------------------------------------------------------------------
# 31. Add SAI_SWITCH_ATTR_CURRENT_TEMP to get average temperature from sensors

## Description

- To get average temperature from sensors  

- Added new sensor attributes. Change SAI_SWITCH_ATTR_MAX_NUMBER_OF_TEMP_SENSORS to U8  

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/be1fe4c53428f8872801bcc70e643ec2ba49a753)

## PRs related to this commit

[880](https://github.com/opencomputeproject/SAI/pull/880) 

------------------------------------------------------------------------------------------------------------------------------------------
# 32. Define SAI_SWITCH_ATTR_PRE_SHUTDOWN for warm shutdown

## Description

-   

- 

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/0027019e185a8c02fb706cdeaae662741ea6bdbb)

## PRs related to this commit

[890](https://github.com/opencomputeproject/SAI/pull/890) 

------------------------------------------------------------------------------------------------------------------------------------------
# 33. Add SAI_MIRROR_SESSION_ATTR_POLICER to mirror session attributes

## Description

- Enable the ability to attach a policer to the mirror session to throttle the mirrored packets without affecting the original traffic  

- 

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/0deb247ec039d06e32d289f52740781d6bf61bd9)

## PRs related to this commit

[899](https://github.com/opencomputeproject/SAI/pull/899) 

------------------------------------------------------------------------------------------------------------------------------------------
# 34. Add ICMP match type/code for IPv6

## Description

- 

- 

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/70131243cf3bc4075eb48e6258ab7e9dec855409)

## PRs related to this commit

[901](https://github.com/opencomputeproject/SAI/pull/901) 

------------------------------------------------------------------------------------------------------------------------------------------
# 35. Update API[saiexperimentalbmtor]

## Description

- Rename APIs to bitmap_classification_table and bitmap_router.Rename action to_tunnel -> to_nexthop  

- Use in_rif metadata as a bitvector  

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/6ad3382217ec22f64cd268faefcbc2ff7caba4fd)

## PRs related to this commit

[913](https://github.com/opencomputeproject/SAI/pull/913) 

------------------------------------------------------------------------------------------------------------------------------------------
# 36. Add META_TUNNEL table[bmtor]

## Description

- 

- 

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/4887c361e1d7f6f4e440f00da2b80ef8d54f2866)

## PRs related to this commit

[941](https://github.com/opencomputeproject/SAI/pull/941)  [446](https://github.com/Azure/sonic-sairedis/pull/446)

------------------------------------------------------------------------------------------------------------------------------------------
