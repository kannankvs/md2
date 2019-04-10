# SONiC USER MANUAL

Table of Contents
=================

 

# Introduction
SONiC is an open source network operating system based on Linux that runs on switches from multiple vendors and ASICs. SONiC offers a full-suite of network functionality, like BGP and RDMA, that has been production-hardened in the data centers of some of the largest cloud-service providers. It offers teams the flexibility to create the network solutions they need while leveraging the collective strength of a large ecosystem and community.

SONiC software shall be loaded in these [supported devices](https://github.com/Azure/SONiC/wiki/Supported-Devices-and-Platforms) and this User guide explains the basic steps for using the SONiC in those platforms.

Connect the console port of the device and use the 9600 baud rate to access the device. Follow the [Quick Start Guide](https://github.com/Azure/SONiC/wiki/Quick-Start) to boot the device in ONIE mode and install the SONiC software using the steps specified in the document and reboot the device. In some devices that are pre-loaded with SONiC software, this step can be skipped. 
Users shall use the default username/password "admin/YourPaSsWoRd" to login to the device through the console port.

After logging into the device, SONiC software can be configured in following three methods.
 1) [Command Line Interface](https://github.com/Azure/SONiC/wiki/Command-Reference)
 2) [config_db.json](https://github.com/Azure/SONiC/wiki/Configuration) 
 3) [minigraph.xml](https://github.com/Azure/SONiC/wiki/Configuration-with-Minigraph-(~Sep-2017))
 
Users can use all of the above methods or choose either one method to configure and to view the status of the device.
This user manual explains the common commands & related configuration/show examples on how to use the SONiC device. Refer the above documents for more detailed information.


**Scope Of The Document**  
Information in this manual is based on the SONiC software version 201811 (build#32).


This manual provides information related to the following points.
1) How to login, how to configure management interface, loopback address configuration -  Repeat from CLIGuide.
2) How to check the software version running on the device? And, how to check the list of features available in this software version? How to upgrade to new software version? - Repeatt from CLIGuide.
3) How to check the default startup configuration with which the device is currently running?, How to load a new configuration to this device? - some part repeat from CLIGuide. Extra info about minigraph.xml and config_db.json, which is a repeat from correponding documents
4) How to check the interface/link/port status, basic cable connectivity status, port speed, etc.,? - Repeat from CLIGuide.
5) How to check the BGP protocol status? - Repat from CLIGuide.
6) Steps to configure Interface - will be repetitive of CLIGuide
7) Steps to configure BGP- will be repetitive of CLIGuide
8) Steps to configure ACL- will be repetitive of CLIGuide
9) Steps to configure COPP- will be repetitive of CLIGuide
10) Steps to configure Mirroring feature- will be repetitive of CLIGuide
11) Example configuration for T0 topology.
12) Basic troubleshooting
	(a) Check the Link down/Up status - Repeat of Point4.
	(b)	Check if device is in Inoperable state, check if all services are running. 
    (c) Check High CPU/Memory usage - Copy & paste "show processes" command.
	(d) check basic ping
	(e) Check packet drop percentage - need more info
	(f) Check the BGP neighbor state - will be repeat of BGP 
	(g) check for packet corruption - need more info.


# CLI Tips
All the configuration commands need root privileges to execute them. Note that show commands can be executed by all users without the root privileges.
Root privileges can be obtained either by using "sudo" keyword in front of all config commands, or by going to root prompt using "sudo -i".
Note that all commands are case sensitive.


# 1) How to login, how to configure management interface, loopback address configuration


## Login (Repeat from CLIGuide)

All SONiC devices support both the serial console based login and the SSH based login by default.
The default credential (if not modified at image build time) for login is admin/YourPaSsWoRd.
In case of SSH login, users can login to the management interface (eth0) IP address after configuring the same using serial console. 
Refer the next section for configuring the IP address for management interface.

  - Example:
  ```
  At Console:
  Debian GNU/Linux 9 sonic ttyS1

  sonic login: admin
  Password: YourPaSsWoRd

  SSH from any remote server to sonic can be done by connecting to SONiC IP
  user@debug:~$ ssh admin@sonic_ip_address(or SONIC DNS Name)
  admin@sonic's password:
  ```

By default, login takes the user to the default prompt from which all the show commands can be executed.  

Go Back To [Beginning of the document](#SONiC-COMMAND-LINE-INTERFACE-GUIDE) or [Beginning of this section](#Basic-Configuration-And-Show)

## Configuring Management Interface (Repeat from CLIGuide)

The management interface (eth0) in SONiC is configured (by default) to use DHCP client to get the IP address from the DHCP server. Connect the management interface to the same network in which your DHCP server is connected and get the IP address from DHCP server.
The IP address received from DHCP server can be verified using the "/sbin/ifconfig eth0" linux command.

SONiC does not provide a CLI to configure the static IP for the management interface. There are few alternate ways by which a static IP address can be configured for the management interface.  
   1) use "ifconfig eth0" linux command (example: ifconfig eth0 10.11.12.13/24). This configuration won't be preserved across reboot.
   2) use config_db.jsob and configure the MGMT_INTERFACE key with the appropriate values. Refer [here](https://github.com/Azure/SONiC/wiki/Configuration#Management-Interface) 
   3) use minigraph.xml and configure "ManagementIPInterfaces" tag inside "DpgDesc" tag as given at the [page](https://github.com/Azure/SONiC/wiki/Configuration-with-Minigraph-(~Sep-2017))
   
Once if the IP address is configured, the same can be verified using "/sbin/ifconfig eth0" linux command.
Users can SSH login to this management interface IP address from their management network.

  - Example:
   ```
   admin@sonic:~$ /sbin/ifconfig eth0
   eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
         inet 10.11.11.13  netmask 255.255.255.0  broadcast 10.11.12.255
   ```
Go Back To [Beginning of the document](#SONiC-COMMAND-LINE-INTERFACE-GUIDE) or [Beginning of this section](#Basic-Configuration-And-Show)

## Configuring Loopback Interface (Repeat from CLIGuide)
To be filled


# 2) How to check the software version running on the device? And, how to check the list of features available in this software version? How to upgrade to new software version?

## Show Versions (Repeat from CLIGuide)
 
**show version**  
This command displays software component versions of the currently running SONiC image. This includes the SONiC image version as well as Docker image versions.
This command displays relevant information as the SONiC and Linux kernel version being utilized, as well as the commit-id used to build the SONiC image. The second section of the output displays the various docker images and their associated id’s. 

- Usage:  
  show version  

- Example:
  ```
  admin@sonic:~$ show version
  SONiC Software Version: SONiC.HEAD.32-21ea29a
  Distribution: Debian 9.8
  Kernel: 4.9.0-8-amd64
  Build commit: 21ea29a
  Build date: Fri Mar 22 01:55:48 UTC 2019
  Built by: johnar@jenkins-worker-4

  Docker images:
  REPOSITORY                 TAG                 IMAGE ID            SIZE
  docker-syncd-brcm          HEAD.32-21ea29a     434240daff6e        362MB
  docker-syncd-brcm          latest              434240daff6e        362MB
  docker-orchagent-brcm      HEAD.32-21ea29a     e4f9c4631025        287MB
  docker-orchagent-brcm      latest              e4f9c4631025        287MB
  docker-lldp-sv2            HEAD.32-21ea29a     9681bbfea3ac        275MB
  docker-lldp-sv2            latest              9681bbfea3ac        275MB
  docker-dhcp-relay          HEAD.32-21ea29a     2db34c7bc6f4        257MB
  docker-dhcp-relay          latest              2db34c7bc6f4        257MB
  docker-database            HEAD.32-21ea29a     badc6fc84cdb        256MB
  docker-database            latest              badc6fc84cdb        256MB
  docker-snmp-sv2            HEAD.32-21ea29a     e2776e2a30b7        295MB
  docker-snmp-sv2            latest              e2776e2a30b7        295MB
  docker-teamd               HEAD.32-21ea29a     caf957cd2ad1        275MB
  docker-teamd               latest              caf957cd2ad1        275MB
  docker-router-advertiser   HEAD.32-21ea29a     b1a62023958c        255MB
  docker-router-advertiser   latest              b1a62023958c        255MB
  docker-platform-monitor    HEAD.32-21ea29a     40b40a4b2164        287MB
  docker-platform-monitor    latest              40b40a4b2164        287MB
  docker-fpm-quagga          HEAD.32-21ea29a     546036fe6838        282MB
  docker-fpm-quagga          latest              546036fe6838        282MB

  ```
Go Back To [Beginning of the document](#SONiC-COMMAND-LINE-INTERFACE-GUIDE) or [Beginning of this section](#Basic-Configuration-And-Show)

## check the list of features available in this software version
To be filled.
Provide link to roadmap or any document that captures the features corresponding to a particular release.
TBD: If such document is not available, either it can be prepared, or remove this section.


## How to upgrade to new software version? 
Explain how to do software upgrade. 
Give link to list of available software versions.
Give link to QuickStartGuide that explains the ONIE method to install a new software version.
Copy and paste the "sonic_installer" from CLIGuide to explain the alternate way to install new software version/


# 3) How to check the default startup configuration with which the device is currently running? How to load a new configuration to this device?  

Users shall use the "show runningconfiguration" command to check the current running configuration. 
If users had not done any configuration change after the reboot, this will be same as the default startup configuration.
SONiC device contains the startup configuration in the file /etc/sonic/config_db.json. During reboot, this configuration will be loaded by default. 

SONiC provides an alternate method for loading the startup configuration from minigraph.xml from a remote server when DHCP is used. SONiC contains a file /etc/sonic/updategraph.conf that contains a flag "enabled" which is set to "false" by default. Similarly, management interface is configured to use DHCP by default for getting the management interface IP address from the DHCP server. Users can modify this flag to "true" and then reboot the device. SONiC will use DHCP to get the management IP address as well as the details about the configuration file minigraph.xml (DHCP server should have been configured to provide the details like management interface IP address, default route, configuration file name and the server IP address from this the configuration file should be fetched). SONiC shall contact the remote server and get the minigraph.xml and loads the same.


## Modify Startup Configuration  

###  Modify config_db.json  
Users can directly edit & modify the file /etc/sonic/config_db.json or do a SCP and copy this file from a remote server. 
User can either do "config reload" command to load this new configuration, or users can simply reboot to make it effective.


### Modify minigrpah.xml  

Users can directly edit & modify the file /etc/sonic/mingraph.xml or do a SCP and copy this file from a remote server. 
User can either do "config load_minigraph" command to load this new configuration, or users can simply reboot to make it effective.
Or, users can modify the "enabled" flag in /etc/sonic/updategraph.conf to true and then reboot the device as explained above.


# 4) How to check the interface/link/port status, basic cable connectivity status, port speed, etc.,?
Users shall use the following commands to check the interface related parameters.
1) show interfaces status
2) show interfaces description
Basic cable connectivity shall be verified by configuring the IP address for the ports and by using the "ping" test.

# 5) How to check the BGP protocol status?
User shall use the following BGP commands to check the BGP neighbor status.
1) show ip bgp neighbors
2) show ipv6 bgp neighbors

