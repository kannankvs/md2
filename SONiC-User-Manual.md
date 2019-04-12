# SONiC USER MANUAL

Table of Contents
=================

   * [SONiC USER MANUAL](#sonic-user-manual)
   * [Table of Contents](#table-of-contents)
   * [Introduction](#introduction)
   * [CLI Tips](#cli-tips)
   * [1) How to login, how to configure management interface, loopback address configuration](#1-how-to-login-how-to-configure-management-interface-loopback-address-configuration)
      * [Login (Repeat from CLIGuide)](#login-repeat-from-cliguide)
      * [Username &amp; Password](#username--password)
      * [Configuring Management Interface and Loopback Interface (Repeat from CLIGuide)](#configuring-management-interface-and-loopback-interface-repeat-from-cliguide)
   * [2) How to check the software version running on the device? And, how to check the list of features available in this software version? How to upgrade to new software version?](#2-how-to-check-the-software-version-running-on-the-device-and-how-to-check-the-list-of-features-available-in-this-software-version-how-to-upgrade-to-new-software-version)
      * [Show Versions (Repeat from CLIGuide)](#show-versions-repeat-from-cliguide)
      * [check the list of features available in this software version](#check-the-list-of-features-available-in-this-software-version)
      * [How to upgrade to new software version?](#how-to-upgrade-to-new-software-version)
      * [SONiC Installer (Repeated from CLIGuide)](#sonic-installer-repeated-from-cliguide)
   * [3) How to check the default startup configuration with which the device is currently running? How to load a new configuration to this device?](#3-how-to-check-the-default-startup-configuration-with-which-the-device-is-currently-running-how-to-load-a-new-configuration-to-this-device)
      * [Modify Startup Configuration](#modify-startup-configuration)
         * [Modify config_db.json](#modify-config_dbjson)
         * [Modify minigrpah.xml](#modify-minigrpahxml)
   * [4) How to check the interface/link/port status, basic cable connectivity status, port speed, etc.,?](#4-how-to-check-the-interfacelinkport-status-basic-cable-connectivity-status-port-speed-etc)
   * [5) How to check the BGP protocol status?](#5-how-to-check-the-bgp-protocol-status)
   * [11) Example Configuration](#11-example-configuration)
   * [12) Troubleshooting](#12-troubleshooting)
      * [Basic Troubleshooting Commands](#basic-troubleshooting-commands)
      * [How to troubleshoot the port up/down status?](#how-to-troubleshoot-the-port-updown-status)
      * [Investigating Packet Drops (Repeat from Troubleshooting Guide)](#investigating-packet-drops-repeat-from-troubleshooting-guide)
      * [Physical Link Signa>l (Repeat from Troubleshooting Guide)](#physical-link-signal-repeat-from-troubleshooting-guide)
      * [Isolate SONiC Device from the Ne<200b>twork (Repeat from Troubleshooting Guide)](#isolate-sonic-device-from-the-network-repeat-from-troubleshooting-guide)

 

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
11) Example configuration for T0 topology - Need to confirm whether it is good to explain this. We can explain each of the configuration example given in minigraph.xml, we can explain the equivalent config_db.json for each of those configurations, we can also give CLI commands (if exist) for each of those configuration.
12) Basic troubleshooting - We can get some example trouble shooting commands/steps for specific issues, but providing a generic guide will be repeatitive of the commands.

TBD: Choose which of the following options shall we used for the guide.

In addition, we shall explain about "show techsupport", about "syslogs" (local logging, remote logging), about "snmp traps" & "tcpdump".

**Option1:Give example problems and steps/tips/suggestions**  
1) How to debug/troubleshoot if the port is down? Explain what to check in application level, what to check in configDB, what to check in APP_DB, what to check in ASIC_DB, what to check in SAI and what to check in chip?
2) How to debug/troubleshoot if the routing does not happen as expected?
3) How to debug/troubleshoot if ECMP does not happen?
4) How to debug/troubleshoot if QoS is dropping lot of packets?
5) How to debug/troubleshoot platform issues?
6) How to debug/troubleshoot mirroring issues?
7) How to debug//troubleshoot ACL issues?
8) How to debug/troubleshoot Everflow issues? 
9) what are the dockers & services that are running in SONiC? how to debug a particular docker and its state/status? can we restart a docker if it is not running? can we restart a docker if it had crashed earlier?
10) What are the mandatory configurations required to bring up the SONiC?

**Option2:Give generic commands that are commonly used to debug various problems**  
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

## Username & Password  

There is no separate CLI for adding users and for changing passwords. Users shall use the linux commands "useradd" command to add new users and use the command "passwd <username>" to change the password for the specific username.



## Configuring Management Interface and Loopback Interface (Repeat from CLIGuide)

The management interface (eth0) in SONiC is configured (by default) to use DHCP client to get the IP address from the DHCP server. Connect the management interface to the same network in which your DHCP server is connected and get the IP address from DHCP server.
The IP address received from DHCP server can be verified using the "/sbin/ifconfig eth0" linux command.

SONiC does not provide a CLI to configure the static IP for the management interface. There are few alternate ways by which a static IP address can be configured for the management interface.  
   1) use "ifconfig eth0" linux command (example: ifconfig eth0 10.11.12.13/24). This configuration won't be preserved across reboot.
   2) use config_db.jsob and configure the MGMT_INTERFACE key with the appropriate values. Refer [here](https://github.com/Azure/SONiC/wiki/Configuration#Management-Interface) 
   3) use minigraph.xml and configure "ManagementIPInterfaces" tag inside "DpgDesc" tag as given at the [page](https://github.com/Azure/SONiC/wiki/Configuration-with-Minigraph-(~Sep-2017))
   
Once the IP address is configured, the same can be verified using "/sbin/ifconfig eth0" linux command.
Users can SSH login to this management interface IP address from their management network.

  - Example:
   ```
   admin@sonic:~$ /sbin/ifconfig eth0
   eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
         inet 10.11.11.13  netmask 255.255.255.0  broadcast 10.11.12.255
   ```
   
The same method shall be used to configure the loopback interface address as follows.
1) "/sbin/ifconfig lo" linux command shall be used, OR,
2) Add the key LOOPBACK_INTERFACE & value in config_db.json and load it, OR,
3) use minigraph.xml and configure LoopbackIPInterfaces tag inside the "DpgDesc" tag.

   
Go Back To [Beginning of the document](#SONiC-COMMAND-LINE-INTERFACE-GUIDE) or [Beginning of this section](#Basic-Configuration-And-Show)



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

[SONiC roadmap planning](https://github.com/Azure/SONiC/wiki/Sonic-Roadmap-Planning) explains the various features that are added in every software release.
TBD: Is this enough? Need information from Xin.


## How to upgrade to new software version? 

SONiC software can be installed in two methods, viz, using "ONIE Installer" or by using "sonic_installer tool".
"ONIE Installer" shall be used as explained in the [QuickStartGuide](https://github.com/Azure/SONiC/wiki/Quick-Start)
"sonic_installer" shall be used as given below.


## SONiC Installer (Repeated from CLIGuide)
This is a command line tool available as part of the SONiC software; If the device is already running the SONiC software, this tool can be used to install an alternate image in the partition.
This tool has facility to install an alternate image, list the available images and to set the next reboot image.
 
**sonic_installer install**  

This command is used to install a new image on the alternate image partition.  This command takes a path to an installable SONiC image or URL and installs the image.

  - Usage:    
    sonic_installer install <path>  


- Example:
  ```	 
  admin@sonic:~$ sonic_installer install https://sonic-jenkins.westus.cloudapp.azure.com/job/xxxx/job/buildimage-xxxx-all/xxx/artifact/target/sonic-xxxx.bin
  New image will be installed, continue? [y/N]: y
  Downloading image...
  ...100%, 480 MB, 3357 KB/s, 146 seconds passed
  Command: /tmp/sonic_image
  Verifying image checksum ... OK.
  Preparing image archive ... OK.
  ONIE Installer: platform: XXXX
  onie_platform: 
  Installing SONiC in SONiC
  Installing SONiC to /host/image-xxxx
  Directory /host/image-xxxx/ already exists. Cleaning up...
  Archive:  fs.zip
     creating: /host/image-xxxx/boot/
    inflating: /host/image-xxxx/boot/vmlinuz-3.16.0-4-amd64  
    inflating: /host/image-xxxx/boot/config-3.16.0-4-amd64  
    inflating: /host/image-xxxx/boot/System.map-3.16.0-4-amd64  
    inflating: /host/image-xxxx/boot/initrd.img-3.16.0-4-amd64  
     creating: /host/image-xxxx/platform/
   extracting: /host/image-xxxx/platform/firsttime  
    inflating: /host/image-xxxx/fs.squashfs  
    inflating: /host/image-xxxx/dockerfs.tar.gz  
  Log file system already exists. Size: 4096MB
  Installed SONiC base image SONiC-OS successfully

  Command: cp /etc/sonic/minigraph.xml /host/

  Command: grub-set-default --boot-directory=/host 0

  Done
  ```

**sonic_installer list**  

This command displays information about currently installed images. It displays a list of installed images, currently running image and image set to be loaded in next reboot.

  - Usage:  
    sonic_installer list

- Example:  
   ```
  admin@sonic:~$ sonic_installer list 
  Current: SONiC-OS-HEAD.XXXX
  Next: SONiC-OS-HEAD.XXXX
  Available: 
  SONiC-OS-HEAD.XXXX
  SONiC-OS-HEAD.YYYY
  ```

**sonic_installer set_default**  

This command is be used to change the image which can be loaded by default in all the subsequent reboots.

  - Usage:  
    sonic_installer set_default <image_name>

- Example:
  ```   
  admin@sonic:~$ sonic_installer set_default SONiC-OS-HEAD.XXXX
  ```

**sonic_installer set_next_boot**  

This command is used to change the image that can be loaded in the *next* reboot only. Note that it will fallback to current image in all other subsequent reboots after the next reboot.

  - Usage:  
    sonic_installer set_next_boot <image_name>

- Example:
  ```
  admin@sonic:~$ sonic_installer set_next_boot SONiC-OS-HEAD.XXXX
  ```

**sonic_installer remove**  

This command is used to remove the unused SONiC image from the disk. Note that it's *not* allowed to remove currently running image.

  - Usage:  
    sonic_installer remove <image_name>

- Example:
  ```
  admin@sonic:~$ sonic_installer remove SONiC-OS-HEAD.YYYY
  Image will be removed, continue? [y/N]: y
  Updating GRUB...
  Done
  Removing image root filesystem...
  Done
  Command: grub-set-default --boot-directory=/host 0

  Image removed
  ```
 
Go Back To [Beginning of the document](#SONiC-COMMAND-LINE-INTERFACE-GUIDE) or [Beginning of this section](#Software-Installation-Commands)



# 3) How to check the default startup configuration with which the device is currently running? How to load a new configuration to this device?  

Users shall use the "show runningconfiguration" command to check the current running configuration. 
If users had not done any configuration change after the reboot, this will be same as the default startup configuration.
SONiC device contains the startup configuration in the file /etc/sonic/config_db.json. During reboot, this configuration will be loaded by default. 
Following are some of the keys that are configured by default in the config_db.json.
1) DEVICE_METADATA
2) MAP_PFC_PRIORITY_TO_QUEUE
3) QUEUE
4) PORT
5) CRM
6) PORT_QOS_MAP
7) NTP_SERVER
8) BUFFER_QUEUE
9) WRED_PROFILE
10) TC_TO_PRIORITY_GROUP_MAP
11) BUFFER_PROFILE
12) DEVICE_NEIGHBOR
13) DSCP_TO_TC_MAP
14) TC_TO_QUEUE_MAP
15) CABLE_LENGTH
16) SCHEDULER
17) BUFFER_POOL


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

# 11) Example Configuration



# 12) Troubleshooting

For troubleshooting and debugging purposes, users shall use the following commands and methods to isolate the problem.
They can use "show techsupport" to collect the information from the device, shall use syslog to view the syslogs printed by the services, shall use the linux utitlies like "ping", "tcpdump", etc., to check the connectivity and packet tracing.

## Basic Troubleshooting Commands

**show techsupport**  
This command gathers pertinent information about the state of the device; information is as diverse as syslog entries, database state, routing-stack state, etc., It then compresses it into an archive file. This archive file can be sent to the SONiC development team for examination.
Resulting archive file is saved as `/var/dump/<DEVICE_HOST_NAME>_YYYYMMDD_HHMMSS.tar.gz`
Few details that the dump includes are given below: 
-	Interface details  
-	Platform  details
-	Machine.conf 
-	Vlan configs
-	Routes
-	Sensor , transceiver details 
-	Syslog
-	Ip configs 
-	Bgp details 
-	Device Configs  (json/ minigraph) 


  - Usage:  
    show techsupport


- Example:
  ```	
  admin@sonic:~$ show techsupport
  ```

**syslog**  
  
-	System logs and event messages  from all dockers are captured via rsyslog  and saved in /var/log/syslog 
-	Console logs can be viewed using "show logging" command also. This command prints the information in syslog in console .
-	Show logging -f  will tail the output of syslogs in  console/ssh session.

**tcpdump**  

-	tcpdump is a common packet analyzer that runs under the sonic command line . It allows the user to display TCP/IP and other packets being transmitted or received over a network
ex: tcpdump -i Ethernet0 

## How to troubleshoot the port up/down status?  

All port related configuration done using CLI/ConfigDB/Minigraph are saved in the redis config database. Such configuration is handled by the appropriate modules and the result of such operation might be stored in the application database (APP_DB).
Once if the modules complete their operation, if the result needs to be programmed into the ASIC, same will be synchronized by syncd service and the result is stored in the ASIC_DB.

When user need to debug/troubleshoot any issue, the best is to verify all of these databases as explained below.
1) Check the configuration in the CONFIG_DB and status using "show" commands.
2) Check the application status of the application in APP_DB.
3) Check the ASIC related programming state and the status in ASIC_DB.
4) Check the actual ASIC.

1) How to check the configuration & status of ports?

Following "show" commands can be used to check the port status.

-	Show interface status ( up/down)
-	Show interface transceiver  presence 

Following "redis-dump" command can be used to dump the port configuraiton from the ConfigDB.

Example : 
```
root@sonic-z9100-02:~# redis-dump -d 4 -k  "PORT|Ethernet4" -y
{
  "PORT|Ethernet4": {
    "type": "hash",
    "value": {
      "admin_status": "up",
      "alias": "fiftyGigE1/2/1",
      "description": "Servers1:eth0",
      "index": "2",
      "lanes": "53,54",
      "mtu": "9100",
      "pfc_asym": "off",
      "speed": "50000"
    }
  }
  
```

Following redis-dump can be used to check the port status in the APP_DB.

Example:
```
root@sonic-z9100-02:~# redis-dump -d 0 -k *PORT_TABLE:Ethernet62* -y
{
  "PORT_TABLE:Ethernet62": {
    "type": "hash",
    "value": {
      "admin_status": "down",
      "alias": "fiftyGigE1/16/2",
      "description": "fiftyGigE1/16/2",
      "index": "16",
      "lanes": "95,96",
      "mtu": "9100",
      "oper_status": "down",
      "pfc_asym": "off",
      "speed": "50000"
    }
  }
```

Following redis-dump can be used to check the port status in the ASIC_DB.

Example:
```
root@sonic-z9100-02:~# redis-dump -d 1 -k  "ASIC_STATE:SAI_OBJECT_TYPE_PORT:oid:0x1000000000014"  -y
{
  "ASIC_STATE:SAI_OBJECT_TYPE_PORT:oid:0x1000000000014": {
    "type": "hash",
    "value": {
      "NULL": "NULL",
      "SAI_PORT_ATTR_ADMIN_STATE": "true",
      "SAI_PORT_ATTR_INGRESS_ACL": "oid:0xb000000000a61",
      "SAI_PORT_ATTR_MTU": "9122",
      "SAI_PORT_ATTR_PORT_VLAN_ID": "1000",
      "SAI_PORT_ATTR_PRIORITY_FLOW_CONTROL": "24",
      "SAI_PORT_ATTR_QOS_DSCP_TO_TC_MAP": "oid:0x14000000000a34",
      "SAI_PORT_ATTR_QOS_PFC_PRIORITY_TO_QUEUE_MAP": "oid:0x14000000000a35",
      "SAI_PORT_ATTR_QOS_TC_TO_PRIORITY_GROUP_MAP": "oid:0x14000000000a38",
      "SAI_PORT_ATTR_QOS_TC_TO_QUEUE_MAP": "oid:0x14000000000a39",
      "SAI_PORT_ATTR_SPEED": "50000"
    }
  }
```
  
Following is an example for checking the port status for Broadcom ASICs.
From command line, enter "bcmsh" to enter into Broadcom shell. Users can use "Ctrcl c" to come out of Broadcom shell.
In the broadcom shell, users shall use "ps" command to check the port state.

Example:
```
BCM : bcmcmd “ps”
       port      ena/link  Lanes  Speed Duplex   LinkScan  AutoNeg?   STPstate    pause  discrd  LrnOps   Interface MaxFrame  CutThru?  Loopback
       xe0( 50)  down      2      50G   FD       SW        No         Forward            None    FA       KR2       9122      No
       xe1( 51)  down      2      50G   FD       SW        No         Forward            None    FA       KR2       9122      No
       xe2( 54)  up        2      50G   FD       SW        No         Forward            None    FA       KR2       9122      No

```

## ​Investigating Packet Drops (Repeat from Troubleshooting Guide)
Packet drops can be investigated by viewing counters using the `show interfaces counters` command.

- **RX_ERR/TX_ERR** includes all physical layer (layer-2) related drops, such as FCS error, RUNT frames. If there is RX_ERR or TX_ERR, it usually indicates some physical layer link issues.

- **RX_DRP** include all layer-2, layer-3, ACL related drops in the switch ingress pipeline, drops due to insufficient ingress buffer.

- **TX_DRP** include mainly the egress buffer related drop due to congestion, including WRED drop.

- **RX_OVR/TX_OVR** counts the oversized packets.

- Example:
  ```
  admin@sonic:~$ show interfaces counters
        Iface            RX_OK      RX_RATE    RX_UTIL    RX_ERR    RX_DRP    RX_OVR            TX_OK      TX_RATE    TX_UTIL    TX_ERR    TX_DRP    TX_OVR
  -----------  ---------------  -----------  ---------  --------  --------  --------  ---------------  -----------  ---------  --------  --------  --------
    Ethernet0  471,729,839,997  653.87 MB/s     12.77%         0    18,682         0  409,682,385,925  556.84 MB/s     10.88%         0         0         0
    Ethernet4  453,838,006,636  632.97 MB/s     12.36%         0     1,636         0  388,299,875,056  529.34 MB/s     10.34%         0         0         0
    Ethernet8  549,034,764,539  761.15 MB/s     14.87%         0    18,274         0  457,603,227,659  615.20 MB/s     12.02%         0         0         0
   Ethernet12  458,052,204,029  636.84 MB/s     12.44%         0    17,614         0  388,341,776,615  527.37 MB/s     10.30%         0         0         0
   Ethernet16   16,679,692,972   13.83 MB/s      0.27%         0    17,605         0   18,206,586,265   17.51 MB/s      0.34%         0         0         0
   Ethernet20   47,983,339,172   35.89 MB/s      0.70%         0     2,174         0   58,986,354,359   51.83 MB/s      1.01%         0         0         0
   Ethernet24   33,543,533,441   36.59 MB/s      0.71%         0     1,613         0   43,066,076,370   49.92 MB/s      0.97%         0         0         0
  ```

## Physical Link Signa​​l (Repeat from Troubleshooting Guide)

Use the following command to get optical signal strength. Note: not all types of links have such channel monitor values. The AOC and DAC cables do not have such values.

Generally, optical power should be greater than -10dBm.

- Example:
  ```
  admin@sonic:~$ show interfaces transceiver eeprom Ethernet12 --dom
  Ethernet12: SFP detected
  
          Connector : Unknown
          EncodingCodes : Unspecified
          ExtIdentOfTypeOfTransceiver : GBIC def not specified
          LengthOM3(UnitsOf10m) : 144
          RateIdentifier : Unspecified
          ReceivedPowerMeasurementType : Avg power
          TransceiverCodes :
                  10GEthernetComplianceCode : 10G Base-SR
                  InfinibandComplianceCode : 1X Copper Passive
          TypeOfTransceiver : QSFP
          VendorDataCode(YYYY-MM-DD Lot) : 2013-11-29 
          VendorName : MOLEX
          VendorOUI : MOL
          VendorPN : 1064141400
          VendorRev : E th
          VendorSN : G13474P0120
          ChannelMonitorValues :
                  RX1Power : -5.7398dBm
                  RX2Power : -4.6055dBm
                  RX3Power : -5.0252dBm
                  RX4Power : -12.5414dBm
                  TX1Bias : 19.1600mA
                  TX2Bias : 19.1600mA
                  TX3Bias : 19.1600mA
                  TX4Bias : 19.1600mA
          ChannelStatus :
                  Rx1LOS : Off
                  Rx2LOS : Off
                  Rx3LOS : Off
                  Rx4LOS : Off
                  Tx1Fault : Off
                  Tx1LOS : Off
                  Tx2Fault : Off
                  Tx2LOS : Off
                  Tx3Fault : Off
                  Tx3LOS : Off
                  Tx4Fault : Off
                  Tx4LOS : Off
          ModuleMonitorValues :
                  Temperature : 23.7500C
                  Vcc : 3.2805Volts
          StatusIndicators :
                  DataNotReady : Off
  ```


## Isolate SONiC Device from the Ne​twork (Repeat from Troubleshooting Guide)

When there is suspicion that a SONiC device is dropping traffic and behaving abnormally, you may want to isolate the device from the network. Before isolating the device, please generate SONiC tech-support first.

You can shut down BGP sessions to neighbors using a form of the `config bgp shutdown` command. There are a few variations of this command, examples follow.

- Shutdown BGP session with neighbor by neighbor's hostname:
- Example:
  ```
  admin@sonic:~$ sudo config bgp shutdown neighbor SONIC02SPINE
  ```

- Shutdown BGP session with neighbor by neighbor's IP address:
- Example:
  ```
  admin@sonic:~$ sudo config bgp shutdown neighbor 192.168.1.124
  ```

- Shutdown BGP sessions with all neighbors:
- Example:
  ```
  admin@sonic:~$ sudo config bgp shutdown all
  ```
