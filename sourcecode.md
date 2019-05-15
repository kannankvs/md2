# SONiC Source Repositories

# Imaging and Building tools
- https://github.com/Azure/sonic-buildimage
	- Source to build an installable SONiC image

# SAI, Switch State Service  

## sonic-swss  
- https://github.com/Azure/sonic-swss
	- Switch State Service - Core component of SONiC which processes network switch data - The SWitch State Service (SWSS) is a collection of software that provides a database interface for communication with and state representation of network applications and network switch hardware.

	- This repository contains the source code for the swss container, teamd container & bgp container shown in the [architecture diagram](https://github.com/Azure/SONiC/blob/master/images/sonic_user_guide_images/section4_images/section4_pic1_high_level.png "High Level Component Interactions")

  SWWS repository contains the source code for the following.
  - cfgmgr - This directory contains the code to build the following processes that run inside swss container. More details about each deamon is available in the [architecture document](https://github.com/Azure/SONiC/wiki/Architecture).
	- nbrmgrd - manager for neighbor management - Listens to neighbor-related changes in NEIGH_TABLE in ConfigDB for static ARP/ND configuration and then uses netlink to program the neighbors in linux kernel. 
	- portmgrd - manager for Port management - Listens to port-related changes in ConfigDB and sets the MTU and/or AdminState in kernel using "ip" commands and also pushes the same to APP_DB.
	- buffermgrd - manager for buffer management - Reads buffer profile config file and programs it in ConfigDB and then listens (at runtime) for cable length change and speed change in ConfigDB, and sets the same into buffer profile table ConfigDB.
	- teammgrd - team/portchannel management - Listens to portchannel related changes in the application and  runs the teamd process for each port channel. Note that teammgrd will be executed inside teamd container (not inside swss container).
	- intfmgrd - manager for interfaces - Listens for IP address changes and VRF name changes for the interfaces and programs the same in linux using "/sbin/ip" command.
    - vlanmgrd - manager for VLAN - Listens for VLAN related changes and programs the same in linux using "bridge" & "ip" commands. 
    - vrfmgrd - manager for VRF - Listens for VRF changes and programs the same in linux.
	
  - fpmsyncd - this folder contains the code to build the "fpmsynd" process that runs in bgp container. This process runs a TCP server and listens for messages from Zebra for route changes (in the form of netlink messages) and it writes the routes to APP_DB. It also waits for clients to connect to it and then provides the route updates to those clients.
  - neighsyncd - this folder contains the code to build the "neighsyncd" process. Listens for ARP/ND specific netlink messages from kernel for dynamically learnt ARP/ND and programs the same into APP_DB.
  - portsyncd - this folder contains the code to build the "portsyncd" process. It first reads port list from configDB/ConfigFile and adds them to APP_DB. Once if the port init process is completed, this process receives netlink messages from linux and it programs the same in APP_DB/STATE_DB (TBD).
  - swssconfig - TBD
  - teamsyncd - allows the interaction between “teamd” and south-bound subsystems. TBD.

	
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

