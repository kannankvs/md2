# SONiC Source Repositories

# Imaging and Building tools
- https://github.com/Azure/sonic-buildimage
	- Source to build an installable SONiC image
	
# SONiC Repositories Summary  

| # | Repository   | Information |
|---: |---       |---       |
| 1   | [sonic-buildimage](https://github.com/Azure/sonic-buildimage) |  |
| 2   | [sonic-utilities](https://github.com/Azure/sonic-utilities/tree/09806b861486091d9db5cb75bdd2cc9428e46844) | Use this for all CLI config commands, clear commands and show commands add/modify/delete. Most of the CLI commands uses the scripts present in the sub-directories present in this repository |
| 3   | [sonic-swss](https://github.com/Azure/sonic-swss/tree/ee4992665b94566936340d32d8d96f8dd038ed75) | Use code inside "cfgmgr" for all applications to listen to configuration changes in ConfigDB and take action. Use code inside orchagent to sync up the application output into ASIC. Use code inside "ModulenameSyncd" to listen for output from application and program the same into APP_DB. Use "warmerestart-assist" for handling warmrestart restore functionality|
| 4   | [sonic-swss-common](https://github.com/Azure/sonic-swss-common/tree/8af58ad80df531fc7fe1fa197a1caf2c5520dbb3) |  |
| 5   | [sonic-sairedis](https://github.com/Azure/sonic-sairedis/tree/1b0d609c6f9acd1cb868898f019eaade071c85ee) |  |
| 6   | [sonic-linux-kernel](https://github.com/Azure/sonic-linux-kernel/tree/69ba0c13f6b984b554dd83fadfaace4e856239ae) |  |
| 7   | [sonic-platform-common](https://github.com/Azure/sonic-platform-common/tree/92b54b1984db0b71196e4fe68cc5a09796fd185c) |  |
| 8   | [sonic-platform-daemons](https://github.com/Azure/sonic-platform-daemons/tree/c8931f30a0068e5f6c432ce5c428dbe0c8976c23) |  |
| 9   | [sonic-py-swsssdk](https://github.com/Azure/sonic-py-swsssdk/tree/4cee38534919e34f407363ac3ab5f31b4d09be6d) |  |
| 10  | [sonic-quagga](https://github.com/Azure/sonic-quagga/tree/2e192c06b8f526cab6fce710ab5da0223b0ba2b1) |  |
| 11  | [sonic-snmpagent](https://github.com/Azure/sonic-snmpagent/tree/70a6c7dad4fcfa750fb4d4efbf267842d19ca8ef) |  |
| 12  | [sonic-dbsyncd](https://github.com/Azure/sonic-dbsyncd/tree/fe60afa7e24a7053a7bd9d7084268c1bbd203208) |  |


# SONiC Repositories Details  

## sonic-swss  
- https://github.com/Azure/sonic-swss
	- Switch State Service - Core component of SONiC which processes network switch data - The SWitch State Service (SWSS) is a collection of software that provides a database interface for communication with and state representation of network applications and network switch hardware.

	- This repository contains the source code for the swss container, teamd container & bgp container shown in the [architecture diagram](https://github.com/Azure/SONiC/blob/master/images/sonic_user_guide_images/section4_images/section4_pic1_high_level.png "High Level Component Interactions")
	- When swss container is started, start.sh starts the processes like rsyslogd, orchagent, restore_neighbors, portsyncd, neighsyncd, swssconfig, vrfmgrd, vlanmgrd, intfmgrd, portmgrd, buffermgrd, enable_counters, nbrmgrd, vxlanmgrd & arp_update.

  SWWS repository contains the source code for the following.
  - cfgmgr - This directory contains the code to build the following processes that run inside swss container. More details about each deamon is available in the [architecture document](https://github.com/Azure/SONiC/wiki/Architecture).
	- nbrmgrd - manager for neighbor management - Listens to neighbor-related changes in NEIGH_TABLE in ConfigDB for static ARP/ND configuration and then uses netlink to program the neighbors in linux kernel. 
	- portmgrd - manager for Port management - Listens to port-related changes in ConfigDB and sets the MTU and/or AdminState in kernel using "ip" commands and also pushes the same to APP_DB.
	- buffermgrd - manager for buffer management - Reads buffer profile config file and programs it in ConfigDB and then listens (at runtime) for cable length change and speed change in ConfigDB, and sets the same into buffer profile table ConfigDB.
	- teammgrd - team/portchannel management - Listens to portchannel related config changes in ConfigDB and  runs the teamd process for each port channel. Note that teammgrd will be executed inside teamd container (not inside swss container).
	- intfmgrd - manager for interfaces - Listens for IP address changes and VRF name changes for the interfaces in ConfigDB and programs the same in linux using "/sbin/ip" command.
    - vlanmgrd - manager for VLAN - Listens for VLAN related changes in ConfigDB and programs the same in linux using "bridge" & "ip" commands. 
    - vrfmgrd - manager for VRF - Listens for VRF changes in ConfigDB and programs the same in linux.
	
  - fpmsyncd - this folder contains the code to build the "fpmsynd" process that runs in bgp container. This process runs a TCP server and listens for messages from Zebra for route changes (in the form of netlink messages) and it writes the routes to APP_DB. It also waits for clients to connect to it and then provides the route updates to those clients.
  - neighsyncd - this folder contains the code to build the "neighsyncd" process. Listens for ARP/ND specific netlink messages from kernel for dynamically learnt ARP/ND and programs the same into APP_DB.
  - portsyncd - this folder contains the code to build the "portsyncd" process. It first reads port list from configDB/ConfigFile and adds them to APP_DB. Once if the port init process is completed, this process receives netlink messages from linux and it programs the same in APP_DB/STATE_DB (TBD).
  - swssconfig - this folder creates two executables, viz, swssconfig and swssplayer. 
     - "swssconfig" runs during boot time only. It restores FDB and ARP table during fast reboot. It takes the port config, copp config, IP in IP (tunnel) config and switch (switch table) config from the ConfigDB and loads them into APP_DB.
	 - "swssplayer" - this records all the programming that happens via the SWSS which can be played back to simulate the sequence of events for debugging or simulating an issue.
  - teamsyncd - allows the interaction between “teamd” and south-bound subsystems. It listens for messages from teamd software and writes the output into APP_DB.
  - orchagent - The most critical component in the Swss subsystem. Orchagent contains logic to extract all the relevant state injected by *syncd daemons, process and massage this information accordingly, and finally push it towards its south-bound interface. This south-bound interface is yet again another database within the redis-engine (ASIC_DB), so as we can see, Orchagent operates both as a consumer (for example for state coming from APPL_DB), and also as a producer (for state being pushed into ASIC_DB).

	
## sonic-swss-common  	
- https://github.com/Azure/sonic-swss-common
	- Switch State Service common library - Common library for Switch State Service

## sonic-utilities  
- https://github.com/Azure/sonic-utilities
  - This repository contains the code for Command Line Interfaces for SONiC. 
  - Folders like "config", "show", "clear" contain the CLI commands 
  - Folders like "scripts", "sfputil", "psuutil" & "acl_loader" contain the scripts that are used by the CLI commands. These scripts are not supposed to be directly called by user. All these scripts are wrapped under the "config" and "show" commands.
  - "connect" folder and "consutil" folder is used for scripts to connec to other SONiC devices and manage them from this device.
  - crm folder contains the scripts for CRM configuration and show commands. These commands are not wrapped under "config" and "show" commands. i.e. users can use the "crm" commands directly.
  - pfc folder contains script for configuring and showing the PFC parameters for the interface
  - pfcwd folder contains the PFC watch dog related configuration and show commands.
  - utilities-command folder contains the scripts that are internally used by other scripts.

	
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
