# TECHNICAL FAQ DOCUMENT

Table of Contents
=================

   * [Document History](#document-history)
   * [ACL](#ACL)
   * [CONTAINERS AND DOCKERS](#CONTAINERS-AND-DOCKERS)
   * [DATABASE](#DATABASE)
   * [INTERFACE AND PORTS](#INTERFACE-AND-PORTS)
   * [PYTHON](#PYTHON)
   * [ROUTING AND SWITCHING](#ROUTING-AND-SWITCHING)
   * [SNMP](#SNMP)
   * [SONIC](#SONIC)
   * [SWSS](#SWSS)
   * [SYNCD](#SYNCD)

## Document History

| #   | Date         |  Document Version | Details |
| --- | ---          | ---               | ---     |
| 1   |  Jul-26-2019 |Technical_FAQ_v1   | Collated the FAQs between 8th March-2016 and 25th July-2019. For further details refer [here](https://groups.google.com/forum/#!forum/sonicproject) |


## ACL

### Q: How to create an ACL_RULE to drop all the packets in specified ports?

**A**: First configure an ACL_TABLE specifying the ports and then configure an ACL_RULE to drop all the packets as shown below  

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

------------------------------------------------------
### Q: What is "bind point" with respect to ACL?

**A**: A bind point is an ACL table group consisting of a table that is bound to a switch, port and vlan  

------------------------------------------------------
### Q: What are the difference ACL group types?

**A**: There are two primary types of ACL groups introduced in this specification - sequential and parallel. The ACL group type configuration is per group object attribute and it defines the packet matching behavior across the ACL tables within a specific ACL group  

`Sequential` - Each ACL table is assigned with a unique priority within that group. With a packet matching multiple ACL entries within the ACL group, only one with the highest table priority within the group and highest entry priority within the acl table wins  
`Parallel` - All ACL tables are matched and non-conflicting actions are executed  

------------------------------------------------------------------------------------------------

## CONTAINERS AND DOCKERS

### Q: How to update a docker container in sonic?

**A**: The procedure to update a docker container in SONiC is as follows
	   <ol> 
		  <li> Execute: sudo systemctl stop swss </li>
		  <li> Remove the container: docker rm ... </li>
		  <li> Replace the image: docker rmi ... </li>
		  <li> Execute: sudo systemctl start swss </li>
	   </ol>

------------------------------------------------
### Q: How to resolve "user 'root' already exists" build error?

**A**: To resolve the error, a different user name needs to be added to the docker group under `/etc/group` 

------------------------------------------------

### Q: Where does the configuration from "teamd" has been moved to?  

**A**: All the configuration from "/etc/teamd" config file has been moved to "teammgrd"  

------------------------------------------------
### Q: What is the relationship between the containers and network stack?

**A**: All the SONiC processes running inside the containers share the same network stack; linux IP stack in most cases. Kernel sends netlink events to any process that has subscribed to a netlink group.  

------------------------------------------------
### Q: How to see 'telemetry binary' after building the Debian package?
    
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

-----------------------------------------------
### Q: How to connect 2 sonic-vs containers via virtual Ethernet link?

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

------------------------------------------


## DATABASE

### Q: Why does the Dynamic entry is not removed from the APP DB, even after the entry ages out in ASIC DB?

**A**: Even-though the entry is configured as "dynamic" it is still a configured entry and not learned one. Hence this will be unaffected by the aging mechanism and will not be removed from APP_DB even after the aging counter expires  

------------------------------------------------
### Q:How to print all the keys in a database?

**A**: Execute the command "redis-cli -n 4 keys "MGMT_INTERFACE*""
   This will print all keys in the database number 4. Chage the number according to the database that is required  
   
------------------------------------------------
### Q: What are the different database counters?  

**A**: The list of database counters is mentioned below  
```
	APPL_DB 	- 0
	ASIC_DB 	- 1
	COUNTERS_DB - 2
	LOGLEVEL_DB - 3
	CONFIG_DB 	- 4
	PFC_WD_DB 	- 5
	FLEX_COUNTER_DB - 5
	STATE_DB 	- 6
```

--------------------------------------------------
### Q: How to get the value for a particular key?

**A**: To get value for the particular key, for example, the management interface; give the following command   
         
   ``` redis-cli -n 4 HGETALL "MGMT_INTERFACE|eth0|10.11.12.13/24" ```

--------------------------------------------------
### Q: Are there any reference documents to configure RDMA features in SONiC?

**A**: For sample configuration of RDMA features refer [here](https://github.com/Azure/sonic-swss/tree/master/swssconfig/sample). To see which platform has enabled rmda, refer [here](https://www.google.com/url?q=https%3A%2F%2Fgithub.com%2FAzure%2Fsonic-buildimage%2Fblob%2Fmaster%2Fdockers%2Fdocker-orchagent%2Fswssconfig.sh&sa=D&sntz=1&usg=AFQjCNEp8i8-5ms9iHjgKyBBD2iQcXNABQ)

--------------------------------------------------
### Q: Where is the switch state info stored?

**A**: Switch state info is stored centrally in the redis database. However,a reliable message passing mechanism based on the redis sub/pub interface-the producer and consumer table is designed so that all messages are explicitly stored in the redis database by the producer, and the consumer has to explicitly remove the message from the queue ensuring a reliable message passage  
   
---------------------------------------------------
### Q: Does the Redis operate in persistent state?

**A**: Sonic runs redis in memory only  
   
----------------------------------------------------
### Q: In the redis database VLAN configuration from the python cli results in a change, but not in the kernel level. Why?

**A**: Interfaces of a switch  stick to their startup configuration no matter what changes are made dynamically from the python cli. Vlanmgrd needs to be restarted for the kernel to know about the change.  
   
--------------------------------------------------
### Q: What is the main task of a daemon?

**A**: The main task of a daemon is to post device data to DB. Currently, to fetch switch peripheral devices related data SONiC will directly access hardware through platform pluggins

--------------------------------------------------
### Q: Where does the syslog messages stored when SONiC is run inside a docker container?

**A**: SONiC daemons use syslog for errors and traces logging and the syslog from inside the containers will be redirected to the host (physical switch, ie. outside any containers)  

--------------------------------------------------
### Q: What are the different types of PMON container daemons?

**A**: PMON container has the following daemons.  

```
   xcvrd for transceivers/SFPs 
   ledd  for front panel LEDs  
   psud  for PSUs

```

-------------------------------
### Q: Does FAN unit has a daemon?

**A**: Currently there is no daemon for FAN unit  

------------------------------------------------


## INTERFACE AND PORTS

### Q: How to configure muti-IP addresses on a interface in Minigraph?

**A**: For multiple IP address configuration on one interface, refer [here](https://github.com/Azure/sonic-buildimage/blob/master/src/sonic-config-engine/tests/t0-sample-graph.xml)

-----------------------------------------------
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

-------------------------------------------------
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

NOTE:  Notice the change in the interface names under the "Interface" coloumn in the above two examples   

--------------------------------------------
### Q: How to execute interface incremental configuration design?

**A**: For interface incremental configuration design spec, refer [here](https://github.com/Azure/SONiC/blob/7ae7106fd3106cfc9a6a60a81d3b8f5ebd9ebab5/doc/Incremental%20IP%20LAG%20Update.md)

--------------------------------------------
### Q: How to check if the link status is up or down?

**A** : Link status can be known by referring the linux netdev interface status. Note that the host interfaces are essentially netdev interfaces in kernel. You can view it by executing "ip link show" command   

--------------------------------------------
### Q: How to check the bandwidth of a link?

**A**: To check the bandwidth of a link use the command "portstat -p 1"  

--------------------------------------------
### Q: Does Sonic support to configure interface description?

**A** : SONiC does not support interface description. Alternatively in "/etc/network/interfaces" file alias names to the interfaces can be added  

--------------------------------------------
### Q: How to set the LLDP port description?

**A**: The default LLDP port description is configured by "lldpmgrd". To change the description dynamically refer the following steps  

``` 
   "docker exec -it lldp bash"  # Enter the LLDP container and execute this command

   "lldpcli"                    # lldpcli command is organized in "generate_pending_lldp_config_cmd_for_port"

   [lldpcli] # configure ports Ethernet49 lldp portidsubtype local Ethernet49 description xxxx
  
```

Port Ethernet49 can be replaed with any other port as required.  'xxxx' is the description that can be added  

To change the configured port description in LLDP , the file "dockers/docker-lldp-sv2/lldpmgrd" needs to be modified  

--------------------------------------------
### Q: How to view the switch port's current speed?

**A**: Port's current speed can be viewed using "redis-cli". One example is shown below  

```
   $# redis-cli
   127.0.0.1:6379>
   127.0.0.1:6379> select 0
   OK

   127.0.0.1:6379> keys PORT_TABLE*
   1) "PORT_TABLE:Ethernet56"
   ...
   34) "PORT_TABLE:Ethernet124"

   127.0.0.1:6379> HGETALL "PORT_TABLE:Ethernet0"

```

------------------------------------------
### Q: How to configure the speed of a front panel port?

**A**: Port speed can be configured in two ways, using interface speed or  portconfig commands based on the SONiC version that is being used      
- config interface speed
 - Usage: config interface speed [OPTIONS] <interface_name> <interface_speed>

- portconfig -p Ethernet0 -s 40

------------------------------------------
### Q: How to set the MTU size?

**A**: To set the MTU size make an entry in the "configb_db.json" using the below configuration    
  
Example:
 ```
    "PORT": {
        “Ethernet0”: {
                             "mtu" : "9100"
                            }
        ...............
 ```
 
--------------------------------------------------
### Q: Where can the lower level network interface statistics be found?

**A**: Please refer the below mentioned example to view the information  

``` 
   For search engine posterity (and others just learning), the data can be found:
   127.0.0.1:6379> select 2 # COUNTERS_DB
   OK
   127.0.0.1:6379[2]>
   127.0.0.1:6379[2]> HGETALL COUNTERS_PORT_NAME_MAP
   1) "Ethernet112"
   2) "oid:0x1000000000002"
   3) "Ethernet116"
   4) "oid:0x1000000000003"
   5) "Ethernet120"
   6) "oid:0x1000000000004”
   ^^ port to counter table mapping.

   127.0.0.1:6379[2]> HGETALL COUNTERS:oid:0x100000000000e
   1) "SAI_PORT_STAT_IF_IN_OCTETS"
   2) “3194020"
 
```

--------------------------------------------
### Q: How many ports does teamd support in LAG?

**A**: Teamd supports not more than one port in LAG with fallback configuration  

-----------------------------------------
### Q: How is VRF configured in Linux kernel?  

**A**: VRF is configured though the CLI wrapper but eventually SONiC uses the linux NetLink calls  

------------------------------------------
### Q: Does VRF design support later versions of Linux Kernel 4.9?  

**A**: Yes. VRF design supports later versions of Linux kernel 4.9    

----------------------------------------
### Q: How does SONiC support link aggregation?

**A**: SONiC supports link aggregation using "teamd" container. SONiC uses [libteam](http://libteam.org/) as the LACP implementation.The configuration is stored in the configuration database. Please refer to the [configuration](https://github.com/Azure/SONiC/wiki/Configuration) samples here to configure the port-channels.  

----------------------------------------
### Q: What should be the state of the port to add it to LAG?

**A**: The state of the port should be in "shutdown" state in order to add it to a team device or to an LAG  

-----------------------------------------
### Q: Can a NTP server be run through a network port?

**A**: The sonic ntp config listens only on management interface and loopback back port

---------------------------------------------------
### Q: Where to find the "port stat" definition?

**A**: In the source code "port stat" conditions are mentioned  

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
   
-------------------------------------------------------------------------------------------------

## PYTHON

### Q: What is the difference between a "pytest" and "unit test"?

**A**: Pytests are like acceptance test that are done when coding is completed. Unit tests are done in development phase to check the status of the local variable / pointer in different stack frames  

--------------------------------------------
### Q: Where do the python bindings, to program the switch's control plane are copied?

**A**: The python bindings to program the switch's control plane are copied in an empty directory "switch_sai_thrift".  

-----------------------------------------------------------------------------------


## ROUTING AND SWITCHING

### Q:How to add static routes in SONiC using config_db.json?

**A**:	Static route addition is not supported in SONiC at present. It can be added via linux ```ip route add``` command but it will not be retained after reboot.  

----------------------------------------------
### Q: Where is the MAC address stored in SONiC?

**A**: Device MAC address is usually saved in EEPROM  

----------------------------------------------
### Q: How is the MAC address updated?

**A**: Any new MAC address learned by HW/SDK will be automatically added to ASIC_DB by the "on_fdb_event" callback from SAI  

---------------------------------------------
### Q: Does each front panel port in a device have a unique MAC address?

**A**: No. All the front panel ports can have the same MAC address  

--------------------------------------------
### Q:What is the maximum rate for ARP/ND?

**A**: Currently the max rate for ARP/ND is 600 packets. It will be increased to higher number(8000) in CoPP file  to improve the learning time.

--------------------------------------------
### Q: What is the maximum aging of ARP entries?

**A**: SONiC uses Linux Kernel ARP Age time and the default value is available in the file "/proc/sys/net/ipv4/neigh/default/base_reachable_time" and the value can be changed as per requirement  

-------------------------------------------------
### Q: How to use a virtual switch and the docker in SONiC?

**A**: To use the virtual switch refer [here](https://github.com/Azure/sonic-buildimage/blob/master/platform/vs/README.vsvm.md). To use virtual switch docker refer [here](https://github.com/Azure/sonic-buildimage/blob/master/platform/vs/README.vsdocker.md)  

--------------------------------------------------
### Q: How to check the count of pause frames generated by an interface during congestion in PFC?

**A**: To get the count of pause frames, give the command "pfcstat"  

--------------------------------

### Q: How to dump and analyse segmentation fault in SONiC SWSS?

**A**: The segmentation fault in SONiC can be analysed using "gdb". Open a console and give the follwing commands  

```
   docker exec -it swss bash
   apt-get install gdb
   gdb attach $(pidof orchagent) -ex cont

```

In a separate console do the action which causes the fault/crash. The collected log dump can then be analysed  

--------------------------------
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
	
-------------------------------------------------
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

---------------------------------------------------
### Q: How to configure BGP in SONiC?

**A**: BGP can be configured in two ways. 
- Modify /etc/sonic/minigraph.xml
- Enter bgp container and use command vtysh

---------------------------------------------------
### Q: What are the steps in learning a new route from BGP?

**A**: The steps in learning a new route from BGP are mentioned below  

```
- During bgp’s container initialization, zebra connects to fpmsyncd through a regular TCP socket. In a stable/non-transient conditions, the routing -state held within zebra, the linux kernel, APPL_DB and ASIC_DB is expected to be fully consistent/equivalent.
- A new TCP packet arrives at bgp’s socket in kernel space. Kernel’s network-stack eventually delivers the associated payload to bgpd process.
- Bgpd parses the new packet, process the bgp-update and notifies zebra of the existence of this new prefix and its associated protocol next-hop.
- Upon determination by zebra of the feasibility/reachability of this prefix (e.g. existing forwarding nh), zebra generates a route-netlink message to inject this new state in kernel.
- Zebra makes use of the FPM interface to deliver this netlink-route message to fpmsyncd.
- Fpmsyncd processes the netlink message and pushes this state into APPL_DB.
- Being orchagentd an APPL_DB subscriber, it will receive the content of the information previously pushed to APPL_DB.
- After processing the received information, orchagentd will invoke sairedis APIs to inject the route information into ASIC_DB.
- Being syncd an ASIC_DB subscriber, it will receive the new state generated by orchagentd.
- Syncd will process the information and invoke SAI APIs to inject this state into the corresponding asic-driver
- New route is finally pushed to hardware.

``` 

-------------------------------------
### Q: Can BGP timers be configured through config_db.json?

**A**: BGP timers are hardcoded (keepalive is set to 60 seconds and the holdtime is set to 180 seconds) and can not be configured through config_db.json. Even if the timers are changed directly to Quagga’s config-mode (vtysh), these settings will not persist once the bgp docker container is rebooted  

-------------------------------------------------------
### Q: What is the benefit of using Quagga fpm API instead of monitoring kernel routing table using Netlink?

**A**: Choosing user space fpm has an advantage as it is easier to add any new functions in the future. For example, it is feasible and easier to give bgp stack feedback on whether the route has been installed in the asic or not  

-------------------------------------------------------
### Q: What is the significance of DEVICE_ROLE and difference between ToRRouter & LeafRouters. Why is radvd configured and started only when Sonic DEVICE_ROLE is set to "ToRRouter"?

**A**: DEVICE_ROLE signifies the role of the device(switch) in the DC network. ToRRouter meaning "Top of the Rack Router/Switch", LeafRouter is the middle device between ToRRouter and Spine. The radv is the IPv6 ND protocol part feature, used by routers to advertise their router-role information to the shared-link devices. The ToRs often directly connect to the Servers(host), so ToRs need the radvd function to spread the router-link informations. But radvd function should not be enabled for the LeafRouter as it is not directly connected to the servers(hosts).   

--------------------------------------------------------
### Q: Why does an IPv6 address is assigned by default when an L2 VLAN is created?

**A**: SONiC supports IPv6 forwarding and a link local address is added by the Kernel. When L2 VLAN is created that IP address is assigned to it by default.  
   If required it can be disabled by adding a line in /etc/sysctl.conf  on switch.
   
   ```
     #  Uncomment the next line to enable packet forwarding for IPv6
	 #  Enabling this option disables Stateless Address Autoconfiguration
	 #  based on Router Advertisements for this host
	 #net.ipv6.conf.all.forwarding=1
	
	 net.ipv6.conf.all.disable_ipv6=1  <<<<<<<<<<<
   ```

---------------------------------------------------
### Q: How VLANs can be created in Linux?

**A**: VLANs could be created in Linux via brctl command  
Use `brctl addbr Vlan1000` to create a VLAN and  
Use `brctl addif Vlan1000 Ethernet0` to add an interface into the VLAN  

---------------------------------------------------
### Q: When creating a VLAN entry from where the VLAN attributes are derived from?

**A**: VLAN attributes are derived from the RIF  

---------------------------------------------------
### Q: How to store management route in Kernel?

**A**: A default route that is configured via "eth0" will not be persistent when the minigraph is loaded. Alteratively a session "ForcedMgmtRoutes" has to be added to the DeviceMetadata section of minigraph to store the route permanently. For reference click [here](https://github.com/Azure/sonic-buildimage/blob/f4e37a66f92099cc5d3bbde33823cd38b30a48a8/src/sonic-config-engine/tests/t1-sample-graph-mlnx.xml)  

--------------------------------------------------
### Q: How to configure ecmp in config_db.json? 

**A**: ECMP is enabled by default and the routes are learned via BGP. There is currently no static support for this via config_db. Moreover SONiC doesn't have a limitation on multi-path routing ECMP  

-----------------------------------------------------------------------------------

## SNMP

### Q: How to confirm if SONiC supports SNMP or not?

**A**: SNMP is supportrd by SONIC. One way to see what is supported is to check the list of OIDs being tested in the SNMP test in sonic-mgmt  

------------------------------------
### Q: How to configure SNMP set processing in SONiC?

**A**: Snmpagent does not implement 'set' primitives. It only allows for gets  

-----------------------------------------------------------------------------------


## SONIC

### Q: How to contribute to SONiC? 

**A**. SONiC welcomes collaboration within the community in many different capacities.  Please check the contributor's guide for details: https://github.com/Azure/SONiC/wiki

---------------------------------------
### Q: What is the CPU configuration that SONiC currently supports?

**A**: SONiC currently supports x86_64 CPU. For more information refer this [link](https://github.com/Azure/SONiC/wiki/Supported-Devices-and-Platforms).

---------------------------------------
### Q: Can SONiC image be run on x86 platform?

**A**: Yes. Sonic image can be run on x86 platform and the built images are primarily dependent on ASIC type/vendor and SAI implementation  

---------------------------------------
### Q: How to build a SONiC image without the default IP address configured on each port?  

**A**: During the initial install and boot process, Sonic creates the IPs for each interface and stores this in the config_db.json file (in /etc/sonic).  These interfaces can either be deleted or replaced in the file and can then be reapplied in the configuration.  Also replacing the config_db.json can be a part of the deployment strategy.  

-----------------------------------------
### Q: How to resolve "No space left on device" error while installing SONiC on a VM?

**A**: Please check the disk space and clear the memory as even a disk space of 20GB is not enough to build SONiC   

-----------------------------------------
### Q: What package does SONiC use?

**A**: SONiC uses the "click Python package" in order to expose the available APIs.

-----------------------------------------
### Q: Does SSH public key change after using sonic_installer to upgrade?

**A**: Yes. SSH public key changes after using sonic_installer command to upgrade the switch from version 'x' to version 'y'. The reason is because the sshd.service in sonic, first checks if there are key files, if not it will automatically generate new keys. To use existing key, current key files need to be copied to the new location as shown below  

 - xxx@sonic:~/sonic-buildimage$ git grep host-ssh-keygen.sh
 - files/sshd/sshd.service:ExecStartPre=-/usr/local/bin/host-ssh-keygen.sh

-----------------------------------------
### Q: What is the difference between "Sonic utilities" & "SWSS daemons"?

**A**: Sonic utilities are mostly Python scripts which read something from the DB and print whereas SWSS daemons save results and status to the DB  

-----------------------------------------
### Q: How to add a new device to the list of platforms that support SONiC?

**A**: Plese refer the porting guide [here](https://github.com/Azure/SONiC/wiki/Porting-Guide) to add a new device to the SONiC platform list  

-----------------------------------------
### Q:How many host entries does SONiC support?

**A**: SONiC currently supports around 2400 host entries

------------------------------------------
## Where does SONiC store the user reboot time?

**A**: SONiC stores the user reboot time in the file "/usr/bin/reboot script"  

----------------------------------------------
### Q: How to view the current SONiC images in the device?

**A**: SONiC images can be viewed using the command "sonic_installer list"

----------------------------------------------
### Q: Does SONiC support TACACS and TACACS accounting? How to configure it?

**A**: SONiC supports TACACS. For configuration refer [here](https://github.com/Azure/SONiC/blob/d478050569ba7a77140e084f8ea5bb28d54fe316/doc/TACACS%2B%20Authentication.md). But TACACS accounting is not supported in SONiC  

----------------------------------------------
### Q: Does SONiC support flow control?

**A**: SONiC supports only priority flow control  

----------------------------------------------
### Q: Does SONiC support NAT?

**A**: As Generic NAT APIs are not available in SAI, SONiC does not support NAT. Many ASICs do not have NAT capability either  

----------------------------------------------
### Q: What is the prerequisite to set the time zone in SONiC?

**A** : To set the time zone "dbus" package is a prerequisite. It is to be appended in the NTP which will be in the host OS. Time zone and date can be viewed with the below mentioned commands  
- root@sonic:/home/admin# timedatectl
- root@sonic:/home/admin# date 

-----------------------------------------------
### Q: How to configure CoPP in SONiC?

**A**: To configure CoPP in SONiC, refer the sample COPP configuration JSON file [here](https://github.com/Azure/sonic-swss/blob/master/swssconfig/sample/00-copp.config.json)  

------------------------------------------------
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

-----------------------------------------------
### Q:Does SONIC support CPU controlled fdb learning?

**A**: Sonic supports hardware based fdb learning. The events of learning/aging/move is notified by hardware/SAI to Orchagent.  

-----------------------------------------------
### Q: How does SONiC populate the table entries?

**A**: SONiC populates the table entries in the two ways as mentioned below   

```
   1. config channel: config command --- config db --> xxxmgrd --> linux command --> linux kernel --> netlink--> xxxsyncd --> app db --> orchagent --> sai db (a.k.a asic db)--> syncd --> asic
   2. Protocol produces table entries: linux kernel --> netlink--> xxxsyncd --> app db--> orchagent --> sai db (a.k.a asic db)--> syncd --> asic
```

-----------------------------------------------
### Q: How to clear the configuration in SONic?

**A**: The config_db.json file is a textual representation of the current configuration that resides in the redis db, which is the actual config of the switch. In order to clear the configuration you have to clear the contents of the redis -db. One way would be to clear your config_db.json file - though it is safe to keep the DEVICE_METADATA section and change the hostname to "sonic". Then reboot the device but ensure the availability of console access. Refer the steps mentioned below  

- If there is /etc/sonic/minigraph.xml on your box, you can do config load_minigraph  
- If there is no minigraph, you can first clear the config db with the command "redis-cli -n 4 flushdb" and then  
- load /etc/sonic/init_cfg.db into the config db with the command "sudo sonic-cfggen -H -j /etc/sonic/init_cfg.json --write-to-db"  

-----------------------------------------------------------------------------------


## SWSS

### Q: Which library does orchagent use?  

**A**: Orchagent uses "libsairedis" library  

-------------------------------
### Q: How to check if the 'orchagent' is running?

**A**: To check if the 'orchagent' is running, give the command "ps -aux | grep orch". Replace the process name to know the corresponding process status  

-------------------------------
### Q: What is the relationship between orchagent and syncd?  

**A**: Orchagent depends on syncd to get started

-------------------------------
### Q: What is the difference between "libsairedis-dev" and "libsairedis" package?  

**A**: Libsairedis-dev only contains sai header files. It is not needed to be deployed in orchagent container whereas the libsairedis package is needed in orchagent container

-------------------------------------------
### Q: Is it possible to reload only the ASIC SDK without rebooting the whole switch ?

**A**: Yes, SWSS service can be restarted by using "sudo systemctl restart swss" command  

-------------------------------------------
### Q: What is the significance of "portsycd" in SONiC?

**A**: The ports are managed by the portsyncd application in the SoNIC project. It uses SAI APIs to configure ports based on the capabilities presented by the switch  

--------------------------------------------
### Q: Can SONiC be installed in a virtual machine?

**A**: One could install sonic into a virtual machine running Linux on top of a Widows 8 or 10, but would be unable to exercise one of the key components of SONiC, the Switch State Service (SwSS) which programs network ASIC that supports the SAI SDK  

-------------------------------------------


## SYNCD

### Q: How to install SAI headers in SONiC?  

**A**: SAI headers can be installed with the combination of Debian package and SAI header file. Refer [here](https://github.com/Azure/sonic-buildimage/blob/master/src/mlnx-sdk/filelist.txt) for an example. The SAI mentioned in the example "mlnx-sai_1.mlnx.160712_amd64.deb" can be replaced with any other SAI file as per the requirement  

------------------------------------------
### Q: What are the get attributes for switch in SAI for table size?  

**A**: Following are the get attributes for switch in SAI for table size.
   ```
      SAI_SWITCH_ATTR_FDB_TABLE_SIZE  
      SAI_SWITCH_ATTR_L3_NEIGHBOR_TABLE_SIZE  
      SAI_SWITCH_ATTR_L3_ROUTE_TABLE_SIZE 
	  
   ```   
------------------------------------------
### Q: How to change the default config.bcm and how to restart syncd and its related modules?

**A**: With the new config.bcm, a systemctl restart swss should be executed in the base image. This command will restart both swss and syncd docker. When syncd starts, it will re-init the asic with new config.bcm. It can be verified through the syslog to check if syncd is indeed using the new config.bcm or not   

------------------------------------------
### Q: What is the difference between platform modules and SAI?

**A**: Platform modules are device drivers that support the switch hardware LEDs,fans,transceiver communication,power supplies. SAI is the support for the ASIC  

------------------------------------------
### Q: Where should the config.bcm file be placed while porting SONiC to Broadcom TH platform?

**A**: Config.bcm file should be placed in the "sai.profile", part of the porting guide in the "syncd" docker  

------------------------------------------
### Q: What to check if "bcmcm" command doesn't work?

**A**: Sometimes "bcmcm" command does not work and the device may show only the folloiwng message   

```
   root@switch1:~# bcmcmd ps
   polling socket timeout: Success
```

Normally it happens because the "syncd" is dead and needs to be checked if it is still live in the "syncd" docker with the followig commands  

```
  admin@switch1:~$ docker exec -it syncd bash
  root@switch1:/# ps -aux

``` 
-------------------------------------------------------------------------------------------------







