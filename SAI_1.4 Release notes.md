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
