# SONiC Source Repositories

# Imaging and Building tools
- https://github.com/Azure/sonic-buildimage
	- Source to build an installable SONiC image

# SAI, Switch State Service  

## sonic-swss  
- https://github.com/Azure/sonic-swss
	- Switch State Service - Core component of SONiC which processes network switch data - The SWitch State Service (SWSS) is a collection of software that provides a database interface for communication with and state representation of network applications and network switch hardware.

	- This repository contains the source code for the swss container shown in the [architecture diagram](https://github.com/Azure/SONiC/blob/master/images/sonic_user_guide_images/section4_images/section4_pic1_high_level.png "High Level Component Interactions")

  SWWS repository contains the source code for the following.
  - cfgmgr - This directory contains the code to build the following processes that run inside swss container. More details about each deamon is available in the [architecture document](https://github.com/Azure/SONiC/wiki/Architecture).
	- nbrmgrd - manager for neighbor management - Listens to neighbor-related changes in STATE_PORT_TABLE_NAME,STATE_LAG_TABLE_NAME, STATE_VLAN_TABLE_NAME & STATE_INTERFACE_TABLE_NAME and then uses netlink to program the neighbors in linux kernel. 
	- portmgrd - manager for Port management - Listens to port-related changes in CFG_PORT_TABLE_NAME, CFG_LAG_MEMBER_TABLE_NAME, STATE_PORT_TABLE_NAME and APP_PORT_TABLE_NAME and sets the MTU or AdminState , physical port information, pushes port state to APP_DB, etc.,
	- buffermgrd - manager for buffer management - Listens to buffer profile related changes in CFG_PORT_TABLE_NAME, CFG_PORT_CABLE_LEN_TABLE_NAME, CFG_BUFFER_PROFILE_TABLE_NAME, CFG_BUFFER_PG_TABLE_NAME and CFG_BUFFER_POOL_TABLE_NAME and sets the cable length and speed in TBD (where?)
	- teammgrd - team/portchannel management - Listens to portchannel related changes in the application (CFG_DEVICE_METADATA_TABLE_NAME, CFG_PORT_TABLE_NAME, CFG_LAG_TABLE_NAME, CFG_LAG_MEMBER_TABLE_NAME, APP_PORT_TABLE_NAME, APP_LAG_TABLE_NAME, STATE_PORT_TABLE_NAME & STATE_LAG_TABLE_NAME) and  runs the teamd process for each port channel
	  TBD - is teammgrd part of swss container or teamd container?
	- intfmgrd - manager for interfaces - Listens for IP address changes and VRF name changes for the interfaces and programs the same in linux using "/sbin/ip" command.
    - vlanmgrd - manager for VLAN - Listens for VLAN related changes and programs the same in linux using "bridge" & "ip" commands. 
    - vrfmgrd - manager for VRF - Listens for VRF changes and programs the same in linux.
	
  - fpmsyncd - this folder contains the code to build the "fpmsynd" process. Listens for netlink message from linux for route add & delete. It also waits for clients to connect to it and then provides the route updates to those clients. TBD. 
  - neighsyncd - this folder contains the code to build the "neighsyncd" process. Listens for ARP/ND specific netlink messages and programs the APP_DB with the ARP/ND data.
  - portsyncd - this folder contains the code to build the "portsyncd" process. It first reads port list from configDB/ConfigFile and adds them to APP_DB. Once if the ports are created in linux, this process receives netlink messages from linux and it empties its port list.
  - doc - This folder contains the swss_schema.md that gives the complete database schemas related to all keys
  - config, debian - compilation and debian packaging related folders
	
## sonic-swss-common  	
- https://github.com/Azure/sonic-swss-common
	- Switch State Service common library - Common library for Switch State Service
	
## SAI  	
- https://github.com/opencomputeproject/SAI
	- Switch Abstraction Interface standard headers
- https://github.com/Azure/sonic-sairedis
	- C++ library for interfacing to SAI objects in Redis
	
## sonic-dbsyncd  

- https://github.com/Azure/sonic-dbsyncd
	- Python Redis common functions for LLDP
- https://github.com/Azure/sonic-py-swsssdk
	- Python switch state service library
- https://github.com/Azure/sonic-quagga
	- Fork of Quagga Software Routing Suite for use with SONiC
	
## Monitoring and management tools
- https://github.com/Azure/sonic-mgmt
	- Management and automation code used for build, test and deployment automation
- https://github.com/Azure/sonic-utilities
	- Various command line utilities used in SONiC
- https://github.com/Azure/sonic-snmpagent
	- A net-snmpd agentx subagent

## Switch hardware drivers
- https://github.com/Azure/sonic-linux-kernel
	- Kernel patches for various device drivers
- https://github.com/Azure/sonic-platform-common
	- API for implementing platform-specific functionality in SONiC
- https://github.com/Azure/sonic-platform-daemons
	- Daemons for controlling platform-specific functionality in SONiC
- https://github.com/celestica-Inc/sonic-platform-modules-cel
- https://github.com/edge-core/sonic-platform-modules-accton
- https://github.com/Azure/sonic-platform-modules-s6000
- https://github.com/Azure/sonic-platform-modules-dell
- https://github.com/aristanetworks/sonic
- https://github.com/Ingrasys-sonic/sonic-platform-modules-ingrasys

