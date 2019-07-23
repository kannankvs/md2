# FAQs

### Q: What is SONiC?

**A**: SONiC is a collection of networking software components required to have a fully functional L3 device. It is designed meet the requirements of a cloud data center. It is fully open-sourced at OCP.

----------

### Q: What is SAI? What's the relationship between SONiC and SAI?

**A**: SAI stands for "Switch Abstraction Interface". It is a common API that is supported by many switch ASIC vendors. SONiC uses SAI to program the ASIC. This enabled SONiC to work across multiple ASIC platforms naturally. 

----------

### Q: Is SONiC a Linux distribution?

**A**: No. SONiC is Linux-based, but is not a distribution by itself. Today, SONiC runs on Debian Jessie. SONiC has also been ported to Ubuntu (as a snap). 

----------

### Q: How can I get SONiC?

**A**: If you clone the [sonic-buildimage repo](https://github.com/Azure/sonic-buildimage) and follow the instructions there, you should be able to produce the SONiC image yourself. Our Jenkins server also produces a regular build. So you can download the image there as well. The list of supported devices and ASICs are maintained [here](https://github.com/Azure/SONiC/wiki/Supported-Devices-and-Platforms). 

----------

### Q: How can I get the SONiC source code?

**A**: SONiC is fully open-sourced on GitHub, and distributed under Apache License. It is maintained as multiple repositories instead of a single big repo for manageability reasons. The list of SONiC source code repos is maintained [here](https://github.com/Azure/SONiC/blob/gh-pages/sourcecode.md). 

----------

### Q: Why are certain SAI implementations only distributed in binary form?

**A**: SAI defines the common API supported by multiple ASIC vendors. The SAI implementation depends on each individual vendor's SDK, which may not be open-sourced itself. Therefore, depending on the vendor's license model, SONiC may or may not be allowed to open source the SAI implementation. 

----------

### Q: Does SONiC offer Linux options, and/or can it be customized?

**A**: Today (March, 2017) SONiC requires Linux kernel 3.16.  We built and tested on Debian Linux, but theoretically any distribution could be supported.  It is fully open sourced and can be customized by users.  A contributorâ€™s guide is posted to cover how to add documentation and code as well as report and fix bugs. 

----------

[comment]: Hardware

### Q: Which hardware platforms and ASIC chipsets are you running SONiC on?

**A**: SONiC supports all the ASICs that are supported by SAI. Those ASICs are available via various switch hardware through both ODMs and OEMs. Currently, SONiC focuses on single ASIC devices. 

   You can find a full list of supported devices and platforms [here](https://github.com/Azure/SONiC/wiki/Supported-Devices-and-Platforms). 

----------

### Q. Does SONiC have its own hardware?

**A**. No. SONiC is purely a software solution. 

----------

### Q. How can I port SONiC to a new device?

**A**. Please follow the [porting guide](https://github.com/Azure/SONiC/wiki/Porting-Guide). 

----------

### Q. Is SONiC deployed in Microsoft data centers today?

**A**. Yes, SONiC is deployed in Microsoft production data centers.

----------

### Q. How many devices are running SONiC?

**A**. The deployment is growing from one data center to cross regions.  We plan to rapidly expand SONiC deployment over the coming months. 

----------

### Q. How is SONiC supported?

**A**. SONiC is a community supported product.  Microsoft is committed to engage with the community to keep SONiC relevant, reliable and stable.  We use it in our own production network.
 
Microsoft has no plans to sell SONiC to customers or provide any network engineering or development support.

----------

### Q. What is the relationship between [Azure Cloud Switch](https://azure.microsoft.com/en-us/blog/microsoft-showcases-the-azure-cloud-switch-acs/) and SONiC? 

**A**. Azure Cloud Switch was the previous project name of SONiC. That name has been deprecated. 

----------

[comment]: Contribution

### Q. How can I contribute to SONiC? 

**A**. SONiC welcome collaboration with the community in many different capacities.  Please check the contributor's guide for details: https://github.com/Azure/SONiC/wiki

----------
### Q:How to find the current onie version?

**A**: In the Sonic device, enter **cat /host/machine.conf**  command. This will give the current ONIE version along with other details such as vendor id, platform id, kernet version etc  
  - Example:
  ```
    admin@sonic:~$ cat /host/machine.conf
    onie_version=3.20.1.3
    onie_vendor_id=674
    onie_platform=x86_64-dell_s6000_s1220-r0
    onie_machine=dell_s6000_s1220
    onie_machine_rev=0
    onie_arch=x86_64
    onie_config_version=1
    onie_build_date="2015-05-03T16:20-0700"
    onie_partition_type=gpt
    onie_kernel_version=3.2.35
  ```

----------------------------------------------------------------------------------------------------------------------------
### Q:How many host entries does SONiC support?

**A**: SONiC currently supports around 2400 host entries

----------------------------------------------------------------------------------------------------------------------------
### Q:What is the maximum rate for ARP/ND?

**A**: Currently the max rate for ARP/ND is 600 packets. It will be increased to higher number(8000) in CoPP file  to improve the learning time.

----------------------------------------------------------------------------------------------------------------------------
### Q:How to print all the keys in a database?

**A**: redis-cli -n 4 keys "MGMT_INTERFACE*"  
   This will print all keys in the database number 4  
   4 is the CONFIG_DB  
   6 is STATE_DB  
   0 is APP_DB  

----------------------------------------------------------------------------------------------------------------------------
### Q: How to get the value for a particular key?

**A**: To get value for the particular key, for example, the management interface; give the following command   
         
   ``` redis-cli -n 4 HGETALL "MGMT_INTERFACE|eth0|10.11.12.13/24" ```

----------------------------------------------------------------------------------------------------------------------------
### Q:How to add static routes in SONiC using config_db.json?

**A**:	Static route addition is not supported in SONiC at present. It can be added via linux ```ip route add``` command but it will not be retained after reboot.  

----------------------------------------------------------------------------------------------------------------------------
### Q:How to add static MAC  in SONiC using config_db.json?

**A**:	Static MAC configuration via config_db is not currently supported.  There is an alternate way by adding an FDB entry file.  
 ```
	[
      {
        "FDB_TABLE:Vlan1000:00-00-00-10-20-30": {
              "port": "Ethernet31",
              "type": "static"
          },
          "OP": "SET"
      }
    ]
	   
 ```
 
Later use swssconfig tool which is located in docker swss to load it into APP_DB. Alternatively entry to app_db can be added manually, but it is required to publish the event to the channel that is subscribed by fdborch.  
	
----------------------------------------------------------------------------------------------------------------------------
### Q:How to program FDB static/dynamic entries into ASIC?

**A**: FDB entries can be programmed into ASIC as static/dynamic. Please check this link [here](https://github.com/Azure/SONiC/issues/249). Give type as either "static" or "dynamic"
  
- Example:
  ```
     Update the “OP”: settting:
     “SET” is used to add
     [
          {
             "FDB_TABLE:Vlan1000:00-00-00-10-20-30": {
                    "port": "Ethernet16",
                    "type": "static"
                },
                "OP": “SET“
           }
     ]


     “DEL” is used to remove the static entry:
     [
          {
             "FDB_TABLE:Vlan1000:00-00-00-10-20-30": {
                    "port": "Ethernet16",
                    "type": "static"
                },
                "OP": “DEL”
           }
     ]
  ```

Enter into swss container  
```
   $ docker exec -it swss bash
```
Edit fdb.json  

   ```
      [
        {
           "FDB_TABLE:Vlan1000:00-00-00-10-20-30": {
                  "port": "Ethernet16",
                  "type": "static"
              },
              "OP": “SET“  --> “DEL”: remove
         }
      ]
   ```

Apply fdb.json  

   ``` swssconfig ./fdb.json ```  

NOTE:  
    a. The VLAN configuration should be correct and interface (Ethernet16 in this example) should be 'up'.  
    b. Config should NOT be reloaded because the static fdb configuration is not retained after reload.  

---------------------------------------------------------------------------------------------------------------------------- 
### Q:Does SONIC support CPU controlled fdb learning?

**A**: Sonic supports hardware based fdb learning. The events of learning/aging/move is notified by hardware/SAI to Orchagent.  

----------------------------------------------------------------------------------------------------------------------------
### Q:How to know the interface naming mode?

**A**: Enter the command "show interface naming_mode". Initially it will be "default".  

- Example:
  ```
     admin@sonic:~$ show interface naming_mode
     default
  
     admin@sonic:~$ show ip interfaces
     Interface    IPv4 address/mask    Admin/Oper
     -----------  -------------------  ------------
     Ethernet0    10.0.0.0/31          up/down
     Ethernet4    10.0.0.2/31          up/down
     Ethernet8    10.0.0.4/31          up/down
     ...
     docker0      240.127.1.1/24       up/down
     eth0         10.11.150.249/16     up/up
     lo           127.0.0.1/8          up/up
                  10.1.0.1/32

  ```

---------------------------------------------------------------------------------------------------------------------------- 
### Q:How to change the interface naming mode?

**A**: Enter the command -   
   **config interface_naming_mode alias**  `Root user`  
   
   Logout and login to the device for the change to take effect.
   
   - Example: 
  ```
  admin@sonic:~$ sudo config interface_naming_mode alias
  Please logout and log back in for changes to take effect.
  admin@sonic:~$ logout
  
  admin@sonic:~$ show interface naming_mode
  alias
  admin@sonic:~$ show ip interfaces
  Interface       IPv4 address/mask    Admin/Oper
  --------------  -------------------  ------------
  fortyGigE0/0    10.0.0.0/31          up/down
  fortyGigE0/4    10.0.0.2/31          up/down
  fortyGigE0/8    10.0.0.4/31          up/down
  ...
  docker0         240.127.1.1/24       up/down
  eth0            10.11.150.249/16     up/up
  lo              127.0.0.1/8          up/up
                  10.1.0.1/32
  ```

NOTE:  Notice the change in the interface names under the "Interface" coloumn in the above two examples.  

----------------------------------------------------------------------------------------------------------------------------
### Q:vlan configuration from the python cli results in a change in the redis database but not in the kernel level. Why?

**A**: Interfaces of a switch  stick to their startup configuration no matter what changes are made dynamically from the python cli. Vlanmgrd needs to be restarted for the kernel to know about the change.  
   
----------------------------------------------------------------------------------------------------------------------------
### Q:Where do the python bindings, to program the switch's control plane are copied?

**A**: The python bindings to program the switch's control plane are copied in an empty directory "switch_sai_thrift".  

----------------------------------------------------------------------------------------------------------------------------
### Q:How to see 'telemetry binary' after building the Debian package?
    
**A**: Telemetry runs on a docker and it is located in the path: /usr/bin/telemetry.sh.  
   An easy way is to include telemetry in sonic image itself. It is done by marking the parameter "ENABLE_SYSTEM_TELEMETRY=y"  on the "rules/config" file while building sonic image and the telemetry service gets started automatically.   

   Use the command "ps -elf | grep tel" to view the telemetry process currently running.  

Example:
 ```
    root@sonic:/home/admin# ps -elf | grep tel
    4 S admin     2401     1  0  80   0 -  2955 -      Nov05 ?        00:00:00 /bin/bash /usr/bin/telemetry.sh attach
    0 S admin     2403  2401  0  80   0 - 45153 SyS_ep Nov05 ?        00:00:00 docker attach --no-stdin telemetry
    4 S root      2761  2370  0  80   0 - 159110 -     Nov05 pts/5    00:29:09 /usr/sbin/telemetry -logtostderr --insecure --port 8080 --allow_no_client_auth -v=2
 ```

-------------------------------------------------------------------------------------------------------------------------------
### Q:What is the significance of DEVICE_ROLE and difference between ToRRouter & LeafRouters. Why is radvd configured and started only when Sonic DEVICE_ROLE is set to "ToRRouter"?

**A**: DEVICE_ROLE signifies the role of the device(switch) in the DC network. ToRRouter meaning "Top of the Rack Router/Switch", LeafRouter is the middle device between ToRRouter and Spine. The radv is the IPv6 ND protocol part feature, used by routers to advertise their router-role information to the shared-link devices. The ToRs often directly connect to the Servers(host), so ToRs need the radvd function to spread the router-link informations. But radvd function should not be enabled for the LeafRouter as it is not directly connected to the servers(hosts).   

-------------------------------------------------------------------------------------------------------------------------------
### Q:How to configure ecmp in config_db.json? 

**A**: ECMP routes are learned via BGP. There is currently no static support for this via config_db.  

----------------------------------------------------------------------------------------------------------------------------------------
### Q:How to set the MTU size?

**A**: To set the MTU size make an entry in the "configb_db.json" using the below configuration    
  
Example:
 ```
    "PORT": {
        “Ethernet0”: {
                             "mtu" : "9100"
                            }
        ...............
 ```
 
-----------------------------------------------------------------------------------------------------------------------------------
### Q:What is the CPU configuration that SONiC currently supports?

**A**: SONiC currently only supports x86_64 CPU. For more information refer this [link](https://github.com/Azure/SONiC/wiki/Supported-Devices-and-Platforms).

-------------------------------------------------------------------------------------------------------------------------------------
### Q:How to connect 2 sonic-vs containers via virtual Ethernet link?

**A**: Start two debian containers (sw0 and sw1) as shown below   

 ```	
	docker run -id --name sw0 debian bash
    docker run -id --name sw1 debian bash
 ```

   Create a virtual Ethernet link  
   
 ```
    sudo ip link add sw0vEthernet0 type veth peer name sw1vEthernet0
 ```
 
   Map the link endpoints to network namespace of respective containers where sw0_pid and sw1_pid are PIDs of sw0 and sw1 containers  
 
 ```
    sudo ip link set sw0vEthernet0 netns sw0_pid
    sudo ip link set sw1vEthernet0 netns sw1_pid
 ```

   Change names of the interfaces to vEthernet0 and bring them up

 ```
    nsenter -t sw0_pid -n ip link set dev sw0vEthernet0 name vEthernet0
    nsenter -t sw0_pid -n ip link set dev vEthernet0 up
 
    nsenter -t sw1_pid -n ip link set dev sw1vEthernet0 name vEthernet0
    nsenter -t sw1_pid -n ip link set dev vEthernet0 up

 ```
 
   Start two sonic-vs containers (vs0 and vs1)

 ```
   $ docker run --privileged --network container:sw0 --name vs0 -d docker-sonic-vs
   $ docker run --privileged --network container:sw1 --name vs1 -d docker-sonic-vs
 
 ```

   Configure Ethernet0 interface in each sonic-vs container to 10.0.0.0/31 (in vs0) and 10.0.0.1/31 (in vs1)

 ```

   $ docker exec -it vs0 bash
     ifconfig Ethernet0 10.0.0.0/31 up
	 
   $ docker exec -it vs1 bash
     ifconfig Ethernet0 10.0.0.1/31 up

 ```

Now run “show interfaces status” command in each sonic-vs container.  

 ```
    Interface       Lanes        Speed    MTU     Alias         Oper     Admin
  -----------  ---------------  -------  -----  --------------  ------  -------
  Ethernet0      29,30,31,32      N/A    N/A    fortyGigE0/0    down      N/A
  Ethernet4      25,26,27,28      N/A    N/A    fortyGigE0/4    down      N/A
  Ethernet8      37,38,39,40      N/A    N/A    fortyGigE0/8    down      N/A

 ```

If the output shows that operating status of Ethernet0 port is down, then bring up the vEthernet0 interface in each VS using "ifconfig" command.


After running the above sequence of commands, check the connectivity by pinging 10.0.0.1 address from vs0 and 10.0.0.0 from vs1 container.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### Q:What are the get attributes for switch in SAI for table size?  

**A**: Following are the get attributes for switch in SAI for table size.
   ```
      SAI_SWITCH_ATTR_FDB_TABLE_SIZE  
      SAI_SWITCH_ATTR_L3_NEIGHBOR_TABLE_SIZE  
      SAI_SWITCH_ATTR_L3_ROUTE_TABLE_SIZE 
	  
   ```   
------------------------------------------------------------------------------------------------------
### Q:After booting the SONiC switch, it always has default IP configured on each port. How to build an image without this default IP address configured on each port?  

**A**: During the initial install and boot process, Sonic creates the IPs for each interface and stores this in the config_db.json file (in /etc/sonic).  These interfaces can either be deleted or replaced in the file and can then be reapplied in the configuration.  Also replacing the config_db.json can be a part of the deployment strategy.  

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### Q:Which daemon writes to APP_DB?  

**A**: "fpmsyncd" daemon writes to APP_DB  

-------------------------------------------------------------------------------------
### Q:Where does the configuration from "teamd" has been moved to?  

**A**: All the configuration from "/etc/teamd" config file has been moved to "teammgrd"  

--------------------------------------------------------------------------------------------
### Q:How is VRF configured in Linux kernel?  

**A**: VRF is configured though the CLI wrapper but eventually SONiC uses the linux NetLink calls  

---------------------------------------------------------------------------------------------
### Q:Does VRF design support later versions of Linux Kernel 4.9?  

**A**: Yes. VRF design supports later versions of Linux kernel.  

-------------------------------------------------------------------------------------------
### Q:How does SONiC support link aggregation?

**A**: SONiC supports link aggregation usig "teamd" container. SONiC uses [libteam](http://libteam.org/) as the LACP implementation.The configuration is stored in the configuration database. Please refer to the [configuration](https://github.com/Azure/SONiC/wiki/Configuration) samples here to configure the port-channels.  

-------------------------------------------------------------------------------------------
### Q:What is the main task of a daemon?

**A**: The main task of a daemon is to post device data to DB. Currently, to fetch switch peripheral devices related data SONiC will directly access hardware through platform pluggins

-------------------------------------------------------------------------------------------
### Q:What are the different types of PMON container daemons?

**A**: PMON container has the following daemons.  

```
   xcvrd for transceivers/SFPs 
   ledd  for front panel LEDs  
   psud  for PSUs

```
-------------------------------------------------------------------------------------------
### Q:Does FAN unit has a daemon?

**A**: Currently there is no daemon for FAN unit  

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### Q:What package does SONiC use?

**A**: SONiC uses the "click Python package" in order to expose the available APIs.

-------------------------------------------------------------------------------------------------------------------------------------
### Q:Why does an IPv6 address is assigned by default when an L2 VLAN is created?

**A**: SONiC supports IPv6 forwarding and a link local address is added by the Kernel. When L2 VLAN is created that IP address is assigned to it by default.  
   If required it can be disabled by adding a line in /etc/sysctl.conf  on switch.
   
   ```
     # Uncomment the next line to enable packet forwarding for IPv6
	 #  Enabling this option disables Stateless Address Autoconfiguration
	 #  based on Router Advertisements for this host
	 #net.ipv6.conf.all.forwarding=1
	
	 net.ipv6.conf.all.disable_ipv6=1  <<<<<<<<<<<
   ```

--------------------------------------------------------------------------------------------------------------------------------------
### Q: Can a NTP server be run through a network port?

**A**: The sonic ntp config listens only on management interface and loopback back port

---------------------------------------------------------------------------------------------------------------------------------------
### Q: How to create an ACL_RULE to drop all the packets in specified ports?

**A**: First configure an ACL_TABLE specifying the ports and then configure and ACL_RULE to drop all the packets  

   ```
	   "ACL_TABLE":{
		     "DROP_ALL": {
             "policy_desc": "DROP_ALL_PACKETS",
             "type": "L3",
             "ports": [ "Ethernet0", "Ethernet4", "Ethernet8", "Ethernet12" ]
         }
       },
       "ACL_RULE":  {
             "DROP_ALL|1": {
             "PRIORITY": "100",
             "IP_TYPE": "ipv4any",
             "PACKET_ACTION": "drop"
         }
       }
   ```

---------------------------------------------------------------------------------------------------------------------------------------
### Q: Where to find the "port stat" definition?

**A** : In the source code "port stat" conditions are mentioned  

   ```
      /** SAI port stat if in discards */
      SAI_PORT_STAT_IF_IN_DISCARDS,

      /** SAI port stat if out discards */
      SAI_PORT_STAT_IF_OUT_DISCARDS, 
   ```

This is similar to the MIB definition which is mentioned below  

   ```
   
      ifInDiscards OBJECT-TYPE
      SYNTAX      Counter32
      MAX-ACCESS  read-only
      STATUS      current
      DESCRIPTION
              The number of inbound packets which were chosen to be
              discarded even though no errors had been detected to prevent

              their being deliverable to a higher-layer protocol.  One
              possible reason for discarding such a packet could be to
              free up buffer space.

              Discontinuities in the value of this counter can occur at
              re-initialization of the management system, and at other
              times as indicated by the value of
              ifCounterDiscontinuityTime."
      ::= { ifEntry 13 }
   
   ```
   
---------------------------------------------------------------------------------------------------------------





 















