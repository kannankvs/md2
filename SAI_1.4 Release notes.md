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

## Revert commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/62921d245dbdcfdbbcd4e1c9ea36c66817817a1f)

## Revert PR related to this commit

[866](https://github.com/opencomputeproject/SAI/pull/866)
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

- Metadata attributes such as "LoadCapabilities, CheckCapabilities()" added  

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/ca5006112d4fa64747a848ef85fd4194f26a3df8)

## PRs related to this commit

[794](https://github.com/opencomputeproject/SAI/pull/794)

------------------------------------------------------------------------------------------------------------------------------------------

# 5. Add license information to metadata source files

## Description

- Add check for non ascii characters in metadata files

- Add C files check

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/92e54170f17ccc0881832eea4e93114ba8fd1e79)

## PRs related to this commit

[799](https://github.com/opencomputeproject/SAI/pull/799)

------------------------------------------------------------------------------------------------------------------------------------------
# 6. Fix inout param declaration in functions

## Description

- To replace parameter "out" with "inout" in the file "inc/saiacl.h"  

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/0443856640d078c6faaa8cbbb23d8751d56831fd)

## PRs related to this commit

[805](https://github.com/opencomputeproject/SAI/pull/805)

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
# 8. Add support for experimental attributes

## Description

- To add support for experimental attributes  

- To Remove example fpga extensions (TBD: In the link it seems FPGA is added)  

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/fef8717822dffdb466263fc4d9fa2a6a9b21ecbf)

## PRs related to this commit

[807](https://github.com/opencomputeproject/SAI/pull/807)

------------------------------------------------------------------------------------------------------------------------------------------
# 9. Fix out parameter prefixes

## Description

-  To replace the parameter "out" with "inout" in the "inc/saiobject.h" file  

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/e1a50ed0ab44c19bec7ce6d069b539b5b7b30ff2)

## PRs related to this commit

[809](https://github.com/opencomputeproject/SAI/pull/809)

------------------------------------------------------------------------------------------------------------------------------------------
# 10. Refactor parser for auto serialize and deserialize

## Description

- 

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/2bd3dfadccd5a8e01e83b7604cb8ca281a56eec9)

## PRs related to this commit

[804](https://github.com/opencomputeproject/SAI/pull/804)

------------------------------------------------------------------------------------------------------------------------------------------

# 11. Refactor generated metadata style

## Description

- Multiple parameters incorporated  

- Multiple indentation changes implemented  

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/8fbda3a29cfc2835ec99c3280af4338ca19ea56c)

## PRs related to this commit

[810](https://github.com/opencomputeproject/SAI/pull/810)

------------------------------------------------------------------------------------------------------------------------------------------
# 12. Add mirror session congestion mode

## Description

- Controls whether mirroring traffic can cause back pressure and packet drop of the original traffic  

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/07c23b3f95cb8034a5ee2bd9baf6815be3eb7324)

## PRs related to this commit

[786](https://github.com/opencomputeproject/SAI/pull/786)

------------------------------------------------------------------------------------------------------------------------------------------
# 13. Add HostIf traps for CISCO MCAST packet types

## Description

- To add CISCO MCast types other than UDLD to SAI header, so we can trap individual types to CPU  

- Common Mcast DMAC trap is added to use a single trap for CISCO Mcast DMAC (01-00-0c-cc-cc-cc)  

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/9b169454b277f26664f52464184a80b0ff4f202b)

## PRs related to this commit

[819](https://github.com/opencomputeproject/SAI/pull/819)

------------------------------------------------------------------------------------------------------------------------------------------
# 14. Add a new DTel attribute

## Description

- To provide fine-grained control while enabling drop reports  

- To selectively enables/disables queue tail drop reporting when drop reporting is enabled

- If the new attribute is disabled, all other drops are still reported

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/fb8cd257f2a5c7d880b40ab39a95ec3dcc6f9ac5)

## PRs related to this commit

[813](https://github.com/opencomputeproject/SAI/pull/813)

------------------------------------------------------------------------------------------------------------------------------------------
# 15. Make log level easier to be changed for all SAI APIs

## Description

- To make log level easier to be changed for all SAI APIs

- "SAI_LOG_LEVEL_NOTICE" attribute changed to "log_level"


## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/3627c42d676af897be10cbcb741bd80ab32aa91e)

## PRs related to this commit

[831](https://github.com/opencomputeproject/SAI/pull/831)

------------------------------------------------------------------------------------------------------------------------------------------

# 16. Create fdb using vlan object id instead of vlan id

## Description

- "vlan_oid" is used instead of "vlan_id" in the file "test/saithrift/tests/saimirror.py"  

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/95eb274c2c4ecfe4213b6ad695d45769ae460313)

## PRs related to this commit

[829](https://github.com/opencomputeproject/SAI/pull/829)

------------------------------------------------------------------------------------------------------------------------------------------
# 17. Update saihostif test

## Description

- Add support for create/remove hostif_table_entry  

- Change policer meter type from bytes to packets

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/9f380f1cabd614ddabf0229196c7d7445aa93037)

## PRs related to this commit

[830](https://github.com/opencomputeproject/SAI/pull/830)

------------------------------------------------------------------------------------------------------------------------------------------
# 18. IP in IP tunnel ptf tests

## Description

- Changes made for new SAI header. Local routes are used to simplify the tests

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/9583b410903bffc0aa29f57a81ddd418e40867da)

## PRs related to this commit

[833](https://github.com/opencomputeproject/SAI/pull/833)  [385](https://github.com/opencomputeproject/SAI/pull/385)  [SAITUNNEL](https://github.com/opencomputeproject/SAI/blob/v0.9.4/test/saithrift/tests/saitunnel.py)

------------------------------------------------------------------------------------------------------------------------------------------
# 19. Add 3 new L2FDB tests

## Description

- Add tests L2FDBMissUnicastTest, L2FDBMissBroadcastTest, L2FDBFloodRoutingNoVlan in the file "test/saithrift/tests/saifdb.py"  

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/4007d3aa1534450ed80ebfd978a29c74a3244999)

## PRs related to this commit

[838](https://github.com/opencomputeproject/SAI/pull/838)

------------------------------------------------------------------------------------------------------------------------------------------
# 20. Added P4 Behavioral Model

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
# 21. Add meta data attribute support to SAI extensions

## Description

- Process incorporated for adding SAI extensions and attributes  

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/0115c7c67d95ca492da467a99f7e0975a5954066)

## PRs related to this commit

[835](https://github.com/opencomputeproject/SAI/pull/835) 

------------------------------------------------------------------------------------------------------------------------------------------
# 22. Add new flush type for clearing both static and dynamic entries

## Description

- "SAI_FDB_FLUSH_ENTRY_TYPE_STATIC_DYNAMIC" flush type added for clearing all FDB entries

- Need to mention either of the two to remove one of the entries or mention both to remove both the entries 
  

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/1334f2632ca18630c77cb26b40efdf9905ae880d)

## PRs related to this commit

[845](https://github.com/opencomputeproject/SAI/pull/845) 

------------------------------------------------------------------------------------------------------------------------------------------
# 23. Add port attibute to pause and unpause the egress of a port

## Description

- Add rpc support to parse port attribute of pausing and unpausing a port egress  

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/2fc95990b245c769723214dd7adca93f988bdb05)

## PRs related to this commit

[840](https://github.com/opencomputeproject/SAI/pull/840) 

------------------------------------------------------------------------------------------------------------------------------------------
# 24. Add RIF counters

## Description

- Router InterFace error packets and error octets counters added in the file "inc/sairouterinterface.h"  

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/631e03bf5760ea643faa765ed7a5fe13c50514a7)

## PRs related to this commit

[836](https://github.com/opencomputeproject/SAI/pull/836) 

------------------------------------------------------------------------------------------------------------------------------------------
# 25. Add p4_compiler submodule

## Description

- Moved p4 backed submoduile to flexsai/p4 and compiler from submodule to SAI repo  

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/d8b638a6ed1cbd5875253a392ded589546b9f297)

## PRs related to this commit

[837](https://github.com/opencomputeproject/SAI/pull/837) 

------------------------------------------------------------------------------------------------------------------------------------------
# 26. Add PTP support

## Description

- PTP support "PTP traps + RX/TX meatadata" added

- Modified struct definitions

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/a3211b66d32a36975e0cb0bafe5325baedd46e1c)

## PRs related to this commit

[841](https://github.com/opencomputeproject/SAI/pull/841)

------------------------------------------------------------------------------------------------------------------------------------------
# 27. changed aux to P4_aux (reserved name)

## Description

- Changed aux.py to P4_aux.py (reserved name)

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/4fce82c469021ca9b5e8d6e301647bea7f989d3c)

## PRs related to this commit

[852](https://github.com/opencomputeproject/SAI/pull/852)

------------------------------------------------------------------------------------------------------------------------------------------
# 28. Add new IP in IP decap PTF tests

## Description

- Add parameter to "sai_thrift_create_tunnel" and "sai_thrift_create_tunnel_term_table_entry"   

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/2d3e56a4d98a3cdc310e808aba7767c8da23f167)

## PRs related to this commit

[853](https://github.com/opencomputeproject/SAI/pull/853) 

------------------------------------------------------------------------------------------------------------------------------------------
# 29. Port isolation group enhancement

## Description

- Add SAI_OBJECT_TYPE_ISOLATION_GROUP_MEMBER

- Correct the SAI_ACL_ENTRY_ATTR_ACTION_END value

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/9cca39366b052894d8091814fa3dee9288c089c6)

## PRs related to this commit

[818](https://github.com/opencomputeproject/SAI/pull/818) 

------------------------------------------------------------------------------------------------------------------------------------------
# 30. Make code compatible with python3

## Description

- Code written in the "flexsai/p4/backend/json_stage/sai.cpp" file to be Python compatible

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/807e9880ed6867b5326fd66e2a4536abf0e6120d)

## PRs related to this commit

[857](https://github.com/opencomputeproject/SAI/pull/857) 

------------------------------------------------------------------------------------------------------------------------------------------
# 31. Add warm boot recover attribute

## Description

- Currently the existing attribute SAI_SWITCH_ATTR_RESTART_WARM serves as a hint that warm restart procedure is restarting. After such boot, on some ASICs, SAI is reinitialized from scratch and SAI_KEY_BOOT_TYPE has the value of the boot type done. On other ASICs, SAI is not reinitialized from scratch, rather the process is resumed. A hint that the process is resumed is needed, and the current new attribute gives that hint.  

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/22c4bb997d25b3b6c87eb306a17befea9edcd021)

## PRs related to this commit

[854](https://github.com/opencomputeproject/SAI/pull/854) 

------------------------------------------------------------------------------------------------------------------------------------------
# 32. Add vxlan tunnel as possible condition for underlay interface attribute

## Description

- Added vxlan tunnel to SAI_TUNNEL_ATTR_UNDERLAY_INTERFACE condition

- RIF in which routing happens after encap needs to be specified when creating VxLAN tunnel

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/6e3ec78c76f64494cc38a2b8eb6c2b18d873e19b)

## PRs related to this commit

[870](https://github.com/opencomputeproject/SAI/pull/870) 

------------------------------------------------------------------------------------------------------------------------------------------
# 33. Add watermark stat for headroom pool

## Description

- Changed the title "Add watermark attribute for headroom pool" to "Add watermark stat for headroom pool"  

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/0a83b1c44c2bd61876084d14453d3a210d7ac056)

## PRs related to this commit

[871](https://github.com/opencomputeproject/SAI/pull/871) 

------------------------------------------------------------------------------------------------------------------------------------------
# 34. SAI Get Stats function counter_id data-type

## Description

- "Stat_id_t" is the data-type defined to uint32_t  

- API implementation is just made uniform with a single data-type for all objects  

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/ada8d9ecb50a6c1b76b584795ac814ae6106ee98)

## PRs related to this commit

[869](https://github.com/opencomputeproject/SAI/pull/869) 

------------------------------------------------------------------------------------------------------------------------------------------
# 35. Add support SAI attribute

## Description

- Add support "SAI_OBJECT_TYPE_LAG" to "SAI_ACL_ENTRY_ATTR_FIELD_IN/OUT_PORT"  

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/b0d364374e85e62c8409da346a38dcb48edf6030)

## PRs related to this commit

[864](https://github.com/opencomputeproject/SAI/pull/864) 

------------------------------------------------------------------------------------------------------------------------------------------
# 36. Allow object list on mandatory_on_create for mirror session

## Description

- Case "SAI_ATTR_VALUE_TYPE_OBJECT_LIST" created to allow "SAI_OBJECT_TYPE_MIRROR_SESSION" object

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/20199036a9031a71f7f27c1e4c9c48718e1fc124)

## PRs related to this commit

[875](https://github.com/opencomputeproject/SAI/pull/875) 

------------------------------------------------------------------------------------------------------------------------------------------
# 37. Allow mixed object type on mirror session

## Description

- 

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/4980664ecc60a1f6d7bb9dbd40e2dd02a04a4851)

## PRs related to this commit

[876](https://github.com/opencomputeproject/SAI/pull/876) 

------------------------------------------------------------------------------------------------------------------------------------------
# 38. Next Hop(NH) Attribute change

## Description

- Modified the condition to accept Tunnel Encap and MPLS Nexthop types.

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/f6c9b0064752b4f8661011d0a38a612413765daf)

## PRs related to this commit

[877](https://github.com/opencomputeproject/SAI/pull/877) 

------------------------------------------------------------------------------------------------------------------------------------------
# 39. Add stat enum pointer to object type info metadata

## Description

- 

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/acc83933ff21c68e8ef10c9826de45807fdc0438)

## PRs related to this commit

[881](https://github.com/opencomputeproject/SAI/pull/881) 

------------------------------------------------------------------------------------------------------------------------------------------
# 40. Add stats function param types check

## Description

- "CheckStatsFunction" function added

- "fnparams" parameter added in the function.

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/1d2f40db22049ae316308cc73c9673d276f0e0eb)

## PRs related to this commit

[882](https://github.com/opencomputeproject/SAI/pull/882) 

------------------------------------------------------------------------------------------------------------------------------------------
# 41. Add struct member offset and size to metadata

## Description

- "offsetof" and "sizeof" parameters added

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/9c40afebe3223a0f2bb77bd95980da0d42bb7f65)

## PRs related to this commit

[883](https://github.com/opencomputeproject/SAI/pull/883) 

------------------------------------------------------------------------------------------------------------------------------------------
# 42. Add stat enum defined test

## Description

- "statenum_defined" test case added

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/9781df8d45b5b29bd0826a445b8523b5a1041d7d)

## PRs related to this commit

[885](https://github.com/opencomputeproject/SAI/pull/885) 

------------------------------------------------------------------------------------------------------------------------------------------
# 43. Add attr bridge id for bridge router interface

## Description

- To add the bridge id attribute for router interface of type SAI_ROUTER_INTERFACE_TYPE_BRIDGE.

- A bridge router interface can be connected only to one bridge. Adding bridge id attribute in bridge router interface would ensure that a bridge router interface can be connected only one bridge. If this attribute is not present, the bridge router interface can be connected to multiple bridges which is invalid.

- All the router interfaces type have a key which need to be given during creation. Ex: For VLAN router interface, VLAN object ID is the key. For Port router interface, Port/LAG object ID is the key. However for bridge router interface, currently there is no key. So bridge id is added as a key attribute for bridge router interface. This makes creation of all router interface types consistent.

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/55ccf885371c0b62b5c3ea1a62781c4ebe60b1d9)

## PRs related to this commit

[868](https://github.com/opencomputeproject/SAI/pull/868) 

------------------------------------------------------------------------------------------------------------------------------------------
# 44. Change SAI_MIRROR_SESSION_ATTR_VLAN_HEADER_VALID to CREATE_AND_SET

## Description

- Because SAI_MIRROR_SESSION_ATTR_VLAN_ID is no longer set as mandatory on create, user needs to set this VLAN ID specifically when creating an RSPAN session. Otherwise, the default value 0 will be used.  

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/842bc881cc5c536a8fede8f42566e32bcd1d9102)

## PRs related to this commit

[879](https://github.com/opencomputeproject/SAI/pull/879) 

------------------------------------------------------------------------------------------------------------------------------------------
# 45. Build saiserver and saiserver-dbg packages

## Description

- Packages: "aiserver" and "saiserver-dbg" added

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/13d8b4468fe5f71a10da0663bacc19908c7c2927)

## PRs related to this commit

[888](https://github.com/opencomputeproject/SAI/pull/888) 

------------------------------------------------------------------------------------------------------------------------------------------
# 46. Clarifications for SAI thrift test setup

## Description

- Add meta data attribute support to SAI extensions

- Clarify SAI thrift test setup instructions

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/9d003649c1cfc4f66691ab767db4c3510b7a6379)

## PRs related to this commit

[860](https://github.com/opencomputeproject/SAI/pull/860) 

------------------------------------------------------------------------------------------------------------------------------------------
# 47. Add switch notification attributes list to metadata

## Description

- Add define and sanity checks  

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/b8f6ba8b986b4460ad42141b3cc9181e9171a19e)

## PRs related to this commit

[886](https://github.com/opencomputeproject/SAI/pull/886) 

------------------------------------------------------------------------------------------------------------------------------------------
# 48. Add SAI_SWITCH_ATTR_CURRENT_TEMP to get average temperature from sensors

## Description

- To get average temperature from sensors  

- Added new sensor attributes. Change SAI_SWITCH_ATTR_MAX_NUMBER_OF_TEMP_SENSORS to U8  

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/be1fe4c53428f8872801bcc70e643ec2ba49a753)

## PRs related to this commit

[880](https://github.com/opencomputeproject/SAI/pull/880) 

------------------------------------------------------------------------------------------------------------------------------------------
# 49. Force stat functions to be consistent across all SAI

## Description

- Force stat functions to be consistent across all SAI  

- Fix object name  

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/7bab22c8ccc430f5ea0d295dc31aa603d4e89eee)

## PRs related to this commit

[884](https://github.com/opencomputeproject/SAI/pull/884) 

------------------------------------------------------------------------------------------------------------------------------------------
# 50. Add binary check in meta Makefile

## Description

- 

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/d839b8b46094dd27de5c7a9d01e8cfdc0c2af9c7)

## PRs related to this commit

[891](https://github.com/opencomputeproject/SAI/pull/891) 

------------------------------------------------------------------------------------------------------------------------------------------
# 51. Define SAI_SWITCH_ATTR_PRE_SHUTDOWN for warm shutdown

## Description

- 

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/0027019e185a8c02fb706cdeaae662741ea6bdbb)

## PRs related to this commit

[890](https://github.com/opencomputeproject/SAI/pull/890) 

------------------------------------------------------------------------------------------------------------------------------------------
# 52. Add quote for serialized pointer

## Description

- Add unittests and Update unittests  

- Add support for 32 bit pointer and Use macro for platform detect  

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/9e82be491f2dc3a5a8f75f58c01c09d09e6152eb)

## PRs related to this commit

[893](https://github.com/opencomputeproject/SAI/pull/893) 

------------------------------------------------------------------------------------------------------------------------------------------
# 53. Add check for params prefixed sai

## Description

- "_In_ sai_api_t sai_api_id" is now referred as "_In_ sai_api_t api"  

- Entire header style is to name parameters after type. So if type is sai_zzz_t parameter is named as zzz  

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/0bca0adfecd2bfe44f778e4df4d2157476282757)

## PRs related to this commit

[894](https://github.com/opencomputeproject/SAI/pull/894)

------------------------------------------------------------------------------------------------------------------------------------------
# 54. Add proper handle of pointer serialize

## Description

- "_In_ sai_pointer_t" pointer modified into "_In_ const sai_pointer_t"

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/647d10e8b67b623a58743df5d9622356dfcbd874)

## PRs related to this commit

[895](https://github.com/opencomputeproject/SAI/pull/895) 

------------------------------------------------------------------------------------------------------------------------------------------
# 55. Add BMToR extension module

## Description

- Extension module is temporarily stored under experimental till the infrastructure for integrating P4 autogenerated headers during build will be available  

- Update for new pipeline  

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/ed7cdb140704a33534308790bdc18b99c81471e3)

## PRs related to this commit

[873](https://github.com/opencomputeproject/SAI/pull/873) 

------------------------------------------------------------------------------------------------------------------------------------------
# 56. Add SAI_MIRROR_SESSION_ATTR_POLICER to mirror session attributes

## Description

- Enable the ability to attach a policer to the mirror session to throttle the mirrored packets without affecting the original traffic  

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/0deb247ec039d06e32d289f52740781d6bf61bd9)

## PRs related to this commit

[899](https://github.com/opencomputeproject/SAI/pull/899) 

------------------------------------------------------------------------------------------------------------------------------------------
# 57. Add oper speed

## Description

- Current port speed attribute means configured speed  

- Added new read only attribute for operational speed, which is the actual speed the port is working, depending on configuration, peer, cable, and can be zero if port is down  

- Update saiport.h  

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/d1a27da2f12519d25a0c93949120408ace6dbfe0)

## PRs related to this commit

[898](https://github.com/opencomputeproject/SAI/pull/898) 

------------------------------------------------------------------------------------------------------------------------------------------
# 58. Add RDMA related matching fileds to ACL

## Description

- Added OpCode field in Base Transport Header (BTH)  

- Added Syndrome field in The ACK Extended Transport Header (AETH)  

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/80e973314dca5aa61604ed57b142e7e379999981)

## PRs related to this commit

[878](https://github.com/opencomputeproject/SAI/pull/878) 

------------------------------------------------------------------------------------------------------------------------------------------
# 59. Remove duplicate bm entry

## Description

- Removed duplicate behavioral model entry  

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/40be269b17889e9030c08a9303cf1d90d080cc3c)

## PRs related to this commit

[902](https://github.com/opencomputeproject/SAI/pull/902) 

------------------------------------------------------------------------------------------------------------------------------------------
# 60. Add ICMP match type/code for IPv6

## Description

- ICMP changes for IPv6 implemented in the file /inc/saiacl.h under the "SAI_ACL_TABLE_ATTR_FIELD_ICMP_CODE" section

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/70131243cf3bc4075eb48e6258ab7e9dec855409)

## PRs related to this commit

[901](https://github.com/opencomputeproject/SAI/pull/901) 

-----------------------------------------------------------------------------------------------------------------------------------------
# 61. Change tunnel route attr to next hop

## Description

- Change "SAI_TABLE_TUNNEL_ROUTE_ENTRY_ATTR_NEXT_HOP_GROUP" to "SAI_TABLE_TUNNEL_ROUTE_ENTRY_ATTR_NEXT_HOP"  

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/dd910e5cee64006a0f5f47fbec46fae5b8652466)

## PRs related to this commit

[903](https://github.com/opencomputeproject/SAI/pull/903) 

-----------------------------------------------------------------------------------------------------------------------------------------
# 62. Create saibmtor.md

## Description

- Create and update saibmtor.md  

- Add pipeline view  

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/642d00966da88bb6ddd781544f5d535dcc6847a0)

## PRs related to this commit

[904](https://github.com/opencomputeproject/SAI/pull/904) 

-----------------------------------------------------------------------------------------------------------------------------------------
# 63. Add PTF test for setting ERSPAN vlan header

## Description

- Add PTF test for setting ERSPAN vlan header  

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/2165dbf11368f089cb030d20713d103c12b95803)

## PRs related to this commit

[905](https://github.com/opencomputeproject/SAI/pull/905) 

-----------------------------------------------------------------------------------------------------------------------------------------
# 64. Allow PORT attribute lists to be set to internal

## Description

- PORT non object list attributes is set to internal switch values in the object type "SAI_OBJECT_TYPE_PORT"  

- Allow non object lists on PORT to be set to internal default value in the object type "SAI_DEFAULT_VALUE_TYPE_SWITCH_INTERNAL"  

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/937515a6a61093e499936b2f9e10f690f6713eb0)

## PRs related to this commit

[908](https://github.com/opencomputeproject/SAI/pull/908) 

-----------------------------------------------------------------------------------------------------------------------------------------
# 65. SAI library compilation fixes

## Description

- Add booldata to ACL parameter union  

- Use EXTENSIONS_MAX as sai object type array size  

- Fix rpc_server compilation  

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/f9bedb1dc880c0b3667c5977458b11807e57ae1b)

## PRs related to this commit

[909](https://github.com/opencomputeproject/SAI/pull/909) 

-----------------------------------------------------------------------------------------------------------------------------------------
# 66. Update API[saiexperimentalbmtor]

## Description

- Rename APIs to bitmap_classification_table and bitmap_router.Rename action to_tunnel -> to_nexthop  

- Use in_rif metadata as a bitvector  

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/6ad3382217ec22f64cd268faefcbc2ff7caba4fd)

## PRs related to this commit

[913](https://github.com/opencomputeproject/SAI/pull/913) 

-----------------------------------------------------------------------------------------------------------------------------------------
# 67. SAI Port attributes for preemphasis setting

## Description

- Defined SAI Port attributes for setting preemphasis and other serdes driver settings   

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/5b5954f8324009c97fc7d03851309d3954ca01e0)

## PRs related to this commit

[907](https://github.com/opencomputeproject/SAI/pull/907) 

-----------------------------------------------------------------------------------------------------------------------------------------
# 68. Relax metadata symbols placement in data section

## Description

- 

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/8a292593269bc4375450d8b6ef310fd7661bc208)

## PRs related to this commit

[918](https://github.com/opencomputeproject/SAI/pull/918) 

-----------------------------------------------------------------------------------------------------------------------------------------
# 69. Fix saithrift compilation with newer thrift [saithrift]

## Description

- 

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/1d42f1218ad537e37fac84aadb7f6232472bdd58)

## PRs related to this commit

[923](https://github.com/opencomputeproject/SAI/pull/923) 

-----------------------------------------------------------------------------------------------------------------------------------------
# 70. Update saitam.h

## Description

- Added Legacy Device Example  

- IOAM and IFA INT APIs

- Removed TAM INT API from this PR  

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/79babb0dc421c4de25d078010bd72f26caa57f74)

## PRs related to this commit

[874](https://github.com/opencomputeproject/SAI/pull/874) 

-----------------------------------------------------------------------------------------------------------------------------------------
# 71. Add META_TUNNEL table[bmtor]

## Description

- "sai_table_meta_tunnel_entry_action_t" function defined  

## Commit

[Link to the commit](https://github.com/opencomputeproject/SAI/commit/4887c361e1d7f6f4e440f00da2b80ef8d54f2866)

## PRs related to this commit

[941](https://github.com/opencomputeproject/SAI/pull/941)  [446](https://github.com/Azure/sonic-sairedis/pull/446)

------------------------------------------------------------------------------------------------------------------------------------------
