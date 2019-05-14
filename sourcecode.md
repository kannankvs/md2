# SONiC Source Repositories

# Imaging and Building tools
- https://github.com/Azure/sonic-buildimage
	- Source to build an installable SONiC image

# SAI, Switch State Service  

## sonic-swss  
- https://github.com/Azure/sonic-swss
	- Switch State Service - Core component of SONiC which processes network switch data
	- This repository contains the source code for the swss container shown in the grey coloured rectangle in the following architecture diagram

![Sec4Img1](https://github.com/Azure/SONiC/blob/master/images/sonic_user_guide_images/section4_images/section4_pic1_high_level.png "High Level Component Interactions") 	

  SWWS repository contains the source code for the following.
  - cfgmgr - This directory contains the code to build the following deamons. More details about each deamon is available in the [architecture document](https://github.com/Azure/SONiC/wiki/Architecture).
	- "neighbor management" (neighsyncd) - Listens to neighbor-related netlink events triggered by newly discovered neighbors as a result of ARP processing.
	- "port management" (Portsyncd) - Listens to port-related netlink events, physical port information, pushes port state to APP_DB, etc.,
	- "" () - 

	
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

