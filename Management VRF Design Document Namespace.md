# Management VRF Design Document

## Introduction
Management VRF is a subset of Virtual Routing and Forwarding (VRF), and provides a separation between the management network traffic and the data plane network traffic. For all VRFs the main routing table is the default table for all data plane ports. With management VRF a second routing table "management", is used for routing through the management ethernet ports of the switch. 

The design for Management VRF leverages Linux Stretch kernel(4.9) Namespace concept for implementing management VRF on SONiC. 

## Requirements
| Req. No | Description                                                                                                | Priority | Comments |
|---:     |---                                                                                                         |---       |---       |
| 1       | Develop and implement a separate Management VRF that provide management plane and Data Plane Isolation
| 2       | Management VRF should be associated with a separate L3 Routing table and the management interface
| 3       | Management VRF and Default VRF should support IP services like `ping` and `traceroute` in its context
| 4       | Management VRF should provide the ability to be polled via SNMP both via Default VRF and Management VRF
| 5       | Management VRF will provide the ability to send SNMP traps both via the Management VRF and Default VRF
| 7       | Dhcp Relay  - Required on Default VRF
| 8       | Dhcp Client - Required on both default VRF and management VRF
| 9       | SSH services should work in both the Management VRF context and Default VRF context
| 10      | TFTP services should work in both the Management VRF context and Default VRF context
| 11      | NTP service should work in Management VRF context.
| 12      | `wget`, `cURL` and HTTPS services should work in both Management VRF context and Default VRF context.
| 13      | `apt-get` package managers should be supported in Management VRF context.
| 14      | TACACS+ should be supported in Management VRF.

The Scope of this design document is only limited to management VRF. "eth0" is the only port that is part of management VRF; Front Panel Ports (shortly called FPP) are not part of management VRF; design can be extended in future if required.

Note that the document uses the words VRF and Namespace interchangeably, both meaning the VRF.

## Design
Namespaces are a feature of the Linux kernel that partitions kernel resources such that one set of processes sees one set of resources while another set of processes sees a different set of resources. 
Without namespace (NS), the set of network interfaces and routing table entries are shared across the linux operating system. Network namespaces virtualize these shared resources by providing different and separate instances of network interfaces and routing tables that operate independently of each other, thereby providing the required isolation for management traffic & data traffic.

By default, linux comes up with the default namespace, all interfaces will be part of this default namespace. Whenever management VRF support is required, a new namespace by name "management" is created and the management interface "eth0" is moved to this namespace. Rest of the ports remain in the default VRF. Following linux commands shall be internally used for creating the same. Commands used in this document are numbered as C1, C2, C3, etc., that are referred in other sub-sections of this document.

    C1: ip netns add management
    C2: ip link set dev eth0 netns management

The default namespace (also called default VRF) enables access to the front panel ports (FPP) and the the management namespace (also called management VRF) enables access to the management interface.
Each new VRF created will map to a corresponding Linux namespace of the same name. After creating the namespace is created, all the configuration related to the namespace happens using the "ip netns exec <vrfname>" command of linux. 
For example, IP address for the management port eth0 is assigned using the command "ip netns exec management ifconfig eth0 10.11.150.19/24" and the default route is added to the management routing table using "ip netns exec management ip route add default via 10.11.150.1". When interfaces are moved from one namespace to another namespace, previously configured IP address & related routes are removed by linux. Design takes care of reconfiguring them using the "ip netns exec" command.
 
     C3: ip netns exec management ifconfig eth0 <eth0_ip/mask>
     C4: ip netns exec management ip route add default via <def_gw_ip_addr>

All the application daemons like SSHD,SNMPD,etc., are running in the default namespace context.
In order to make the applications to handle packets arriving in both management VRF and in default VRF, these applications use the following "veth pair" solution. The veth devices are virtual Ethernet devices that act as tunnels between network namespaces to create a bridge to a physical network device in another namespace. Logical representation of the default VRF, management VRF and the way they talk to each other using veth pair is shown in the following diagram.

![VethPair](Management%20VRF%20Design%20Document%20NS%20VethPair.svg "VRF Representation with Veth Pair") 

Two new internal interfaces "if1" and "if2" are created and they are attached to the veth pair as peers. "if1" is attached to management NS and "if2" is attached to default NS. Internal IP addresses "ip_addr1" and "ip_addr2" are confgiured to them for internal communication. These internal IP addresses ip_addr1 & ip_addr2 are set to 127.100.100.1 & 127.100.100.2 as an example after reordering the already available DOCKER rules in iptables. Following linux commands are internally used for creating the configuring the veth pair and the related internal interfaces.

    C5: Create if2 & have it in veth pair with peer interface as if1
        ip link add name if2 type veth peer name if1
    
    C6: Configure "if2" as UP.
        ip link set if2 up

    C7: Attach if1 to management namespace
        ip link set dev if1 netns management

    C8: Configure an internal IP address for if1 that is part of management namespace
        ip netns exec management ifconfig if1 127.100.100.1/24

    C9: Configure an internal IP address for if2
        ifconfig if2 127.100.100.2/24



### INCOMING PACKET ROUTING

Packets arriving via the front panel ports are routed using the default routing table as part of default NS and hence they work normally without any design change.
Packets arriving on management interface need the following NAT based design. By default, such packets are routed using the linux stack running in management NS which is unaware of the applications running in default NS. DNAT & SNAT rules are used for internally routing the packets between the management NS and default NS and viceversa. Default iptables rules shall be added in the management NS in order to route those packets to internal IP of default VRF "ip_address2".

Following diagram explains the internal packet flow for the packets that arrive in management interface eth0.
![Eth0 Incoming Packet Flow](Management%20VRF%20Design%20Document%20NS%20Eth0%20Incoming%20Pkt.svg "Eth0 Incoming Packets Control Flow") 

Following diagram explains the internal packet flow for the packets that arrive in Front Panel Ports (FPP).
![FPP Incoming Packet Flow](Management%20VRF%20Design%20Document%20NS%20FPP%20Incoming%20Pkt.svg "Front Panel Ports Incoming Packets Control Flow") 

**Step1:** 
For all packets arriving on management interface, change the destination IP address to "ip_address2" and route it. This is achieved by creating a new iptables chain "MgmtVrfChain", linking all incoming packets to this chain lookup and then doing DNAT to change the destination IP as given in the following example. Similarly, add rules for each application destination port numbers (SSH, SNMP, FTP, HTTP, NTP, TFTP, NetConf) as required. Rule C12 is just an example for SSH port 22.

    C10: Create the Chain "MgmtVrfChain": 
         ip netns exec management iptables -t nat -N MgmtVrfChain

    C11: Link all incoming packets to the chain lookup: 
         ip netns exec management iptables -t nat -A PREROUTING -i eth0 -j MgmtVrfChain

    C12: Create DNAT rule to change destination IP to ip_address2 (ex: for SSH packets with destination port 22): 
         ip netns exec management iptables -t nat -A MgmtVrfChain -p tcp --dport 22 -j DNAT --to-destination 127.100.100.2   

Using these rules, the destination IP is changed to ip_address2 before it is routed by management namespace. Management VRF routing instance routes these packets via the outport iif1. Original destination IP will be saved & tracked using the linux conntrack table for doing the appropriate reverse NAT for reply packets. 
When user wants to run any new application, a new rule with the appropriate dport should be added similar to the SSH dport 22 used in the above example C12. This solution of adding application specific dport rule is to restrict and accept only the incoming packets for the applications that are supported in SONiC.

**Step2:** 
After routing, use POST routing SNAT rule to change the source IP address to ip_address1 as given in the following example.

    C13: Add a post routing SNAT rule to change Source IP address:
         ip netns exec management iptables -t nat -A POSTROUTING -o if1 -j SNAT --to-source 127.100.100.1:62000-65000

This rule does source NAT for all packets that are routed through if1 and changes the source IP to ip_address1 and source port to a port number between 62000 and 65000. This source port translation is required to handle the usage of same source port number by two different external sources. Original source IP & port will be saved & tracked using the linux conntrack table for doing the appropriate reverse NAT for reply packets. After changing the source IP  & source port, packets are sent out of iif1 and received in iif2 by the default namespace. All packets are then routed using the default routing instance. These packets with destination IP ip_address2 are self destined packets and hence they will be handed over to the appropriate application deamons running in the default namespace.


### OUTGOING PACKET ROUTING

Packets that are originating from application deamons running in default namespace will be routed using the default routing table. Applications that need to operate on front panel ports work normally without any design change. Applications that need to operate on management namespace need the following design using DNAT & SNAT rules.

**Applications Spawned From Shell:**

Whenever user wants the applications like "Ping", "Traceroute", "apt-get", "ssh", "scp", etc., to run on management network, "ip netns exec management <actual command>" should be used.

    C14: Execute ping in management VRF
         ip netns exec management ping 10.16.208.58

This command will be executed in the management namespace (VRF) context and hence all packets will be routed using the management routing table and management interface. 

**Applications triggered internally:**

This section explains the flow for internal applications like DNS, TACACS, SNMP trap, that are used by the application daemons like SSH (uses TACACS), Ping (uses DNS), SNMPD (sends traps). Daemons use the internal POSIX APIs of internal applications to generate the packets. If such packets need to travel via the management namespace, user should configure "--use-mgmt-vrf" as part of the server  address configuration.
These application modules use the following DNAT & SNAT iptables rules to send the packets from default VRF context to the management VRF context and to route them through management namespace via management interface. Application specific design enhancement is explained below in the appropriate sections.

   1) Destination IP address of packet is changed to "ip_address1". This results in default VRF routing instance to send all the packets to veth pair, resulting in reaching management namespace. This is an example for tacacs that uses the port number 62000 for the tacacs server, which is explained in detail in tacacs implementation section.

    C15: Create DNAT rule for tacacs server IP address
         ip netns exec management iptables -t nat -A PREROUTING -i if1 -p tcp --dport 62000 -j DNAT --to-destination <actual_tacacs_server_ip>:<dport_of_tacacs_server>

   2) Destination port number of packet is changed to an internal port number. This will be used by management namespace for finding the appropriate DNAT rule in management VRF iptables that is requried to identify the actual destiation IP to which the packet has to be sent.

    C16: Create SNAT rule for source IP masquerade
         ip netns exec management iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
   
When Ping is executed using "ip netns exec management", the namespace context is implicit and hence no user configuration is required to specify the VRF. i.e. when user executes "ip netns exec management ping abcd.com", the ping application is spawned in the management namespace context. This application calls the DNS name resolution API in the management namespace context. DNS in turn uses the management namespace specific configuration file (/etc/netns/management/resolv.conf) if exists, or the default configuration file (/etc/resolv.conf) and sends the packet to the nameserver IP address using the management namespace routing table.
When the same ping is executed in default VRF context without "ip netns", same happens through the default namespace context.
Hence, no changes are required in DNS application.


## Implementation

Implementation of namespace based solution using Linux 4.9 kernel involves the following key design points.
1. Management VRF Creation
2. Applications/services to work on both management network and data network.

### Management VRF Creation
#### Initialization Sequence & Default Behavior
This section describes the default behavior and configuration of management VRF for static IP and dhcp scenarios. After upgrading to this management VRF supported SONiC image, the binary boots in normal mode with no management VRF created. Customers can either continue to operate in normal mode without any management VRF, or, they can run a config command to enable management VRF. 

    C16: config vrf enable-mgmt-vrf
    
This command configures the tag "MANAGEMENT_VRF_CONFIG" in the ConfigDB (given below) and it restarts the "interfaces-config" service. The existing jinja template file "interfaces.j2" is enhanced to check this configuration and create the /etc/network/interfaces file with or without the "eth0" in the configuration. When management VRF is enabled, it does not add the "eth0" interface in this /etc/network/interfaces file. Instead, the service uses a new jinja template file "interfaces_mgmt.j2" and creates a new VRF specific configuration file /etc/network/interfaces.management.
This solution is based on the netns solution proposed at https://github.com/m0kct/debian-netns 
As specified in the solution, additional scripts are added, viz,  "/etc/network/if-pre-up.d/netns", "/etc/network/if-up.d/netns" and "/etc/network/if-down.d/netns. These scripts use the configuration files and follows the sequence of steps explained in the design section that takes care of the following.

    1. Creates the management namespace using command C1
    2. Attaches eth0 to the management namespace using command C2
    3. Configures IP address for eth0 in management namespace and adds the default route in management namespace using commands C3 & C4. This happens only when user had already configured the eth0 IP address and default gateway address using the MGMT_INTERFACE configuration. If this is not configured, it defaults to "dhcp".
    4. Creates the veth pair with two interfaces (if1 & if2) using commands C5, C6, C7
    5. Configures IP addresses for if1 and if2 using commands C8 & C9 
    6. Adds iptables DNAT & SNAT rules as given in C10, C11, C12, C13 & C16. 
    7. As part of DNAT rules, port numbers corresponding to the application deamons SSH, FTP, HTTP, HTTPS, SNMP, TFTP are added to accept packets from those applications. If any other application port number should be accepted in management interface, correponding DNAT rule should be added using the command C12 in linux shell.
    


#### Show Commands
Following show commands need to be implemented to display the VRF configuration.

| SONiC wrapper command             | Linux command                             | Description
|---                                |---                                        |---
| `show mgmt-vrf`                   | `ip netns show`                           | Read & display management VRF configuration
| `show mgmt-vrf interfaces `       | `ip netns exec management ifconfig'       | Displays VRF detailed info
| `show mgmt-vrf route`             | `ip netns exec management ip route show`  | Displays the default VRF routes
| `show vrf address <vrfname>`      | `ip netns exec management ip address show'| Displays IP related info for VRF

### IP Application Design
This section explains the behavior of each application on the default VRF and management VRF. Application functionality differs based on whether the application is used to connect to the application daemons running in the device or the application is originating from the device.

#### Application Daemons In The Device
All application daemons run in the default namespace. All packets arriving in FPP are handled by default namespace.
All packets arriving in the management ports will be routed to the default VRF using the prerouting DNAT rule and post routing SNAT rule. Appropriate conntract entries will be created.
All reply packets from application daemons use the conntrack entries to do the reverse routing from default namespace to management namespace and then routing through the management port eth0.

#### Applications Originating From the Device
Applications originating from the device need to know the VRF in which it has to run. "ping", "traceroute","dhcclient", "apt-get", "curl" & "ssh" can be executed in management namespace using "ip netns exec management <command_to_execute>", hence these applications continue to work on both management and default VRF's without any change. Applications like TACACS & DNS are used by other applications using the POSIX APIs provided by them. Additional iptables rules need to be added (as explained in following sub-sections) to make them work through the management VRF. 


##### TACACS Implementation
TACACS is a library function that is used by applications like SSHD to authenticate the users. When users connect to the device using SSH and if the "aaa" authentication is configured to use the tacacs+, it is expected that device shall connect to the tacacs+ server via management VRF (or default VRF) and authenticate the user. TACACS implementation contains two sub-modules, viz, NSS and PAM. These module code is enhanced to support an additional parameter "--use-mgmt-vrf" while configuring the tacacs+ server IP address. When user specifies the --use-mgmt-vrf as part of "config tacacs add --use-mgmt-vrf <tacacs_server_ip>" command, this is passed as an additional parameter to the config_db's TACPLUS_SERVER tag. This additional parameter is read using the script files/image_config/hostcfgd. This script is enhanced to add/delete the following rules as and when the tacacs server IP address is added or deleted.

If the tacacs server is part of management network, following command should be executed to inform the tacacs module to use the management VRF.

    C17: Configure tacacs to use management VRF to connect to the server
         config tacacs add --use-mgmt-vrf <tacacs_server_ip>

As part of this enhancement, TACACS module maintains a pool of 10 internal port numbers 62000 to 62009 for configuring upto to 10 tacacs server in the device.
During initialization, module maintains this pool of 10 port numbers as "free" and it maintains the next available free port number for tacacs client to use.
It updates the tacacs configuration file /etc/pam.d/common-auth-sonic using the following configuration.

Ex: When user configures "config tacacs  add --use-mgmt-vrf 10.11.55.40", it fetches the next available free port (ex: 62000) and configures the destination IP for tacacs packet as "ip_address1" (ex: 127.100.100.1) with the next available free port (62000) as destination port as follows.

    auth    [success=done new_authtok_reqd=done default=ignore]     pam_tacplus.so server=127.100.100.1:62000 secret= login=pap timeout=5 try_first_pass

With this tacacs configuration, when user connects to the device using SSH, the tacacs application will generate an IP packet with destination IP as ip_address1 (127.100.100.1) and destination port as "dp1" (62000).
This packet is then routed in default namespace context, which results in sending this packet throught the veth pair to management namespace.
Such packets arriving in if1 will then be processed by management VRF (namespace). Using the PREROUTING rule specified below, DNAT will be applied to change the destination IP to the actual tacacs server IP address and the destination port to the actual tacacs server destination port number.

    C12: Create DNAT rule for tacacs server IP address
         ip netns exec management iptables -t nat -A PREROUTING -i if1 -p tcp --dport 62000 -j DNAT --to-destination <actual_tacacs_server_ip>:<dport_of_tacacs_server>
         Ex: ip netns exec management iptables -t nat -A PREROUTING -i if1 -p tcp --dport 62000 -j DNAT --to-destination 10.11.55.40:49

This packet will then be routed using the management routing table in management VRF through the management port.
When the packet egress out of eth0, POSTROUTING maseuerade rule will be applied to change the source IP address to the eth0's IP address.

    C13: Create SNAT rule for source IP masquerade
         ip netns exec management iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

With these rules, tacacs packet is then routed by the management namespace through the management interface eth0. While routing the packet, appropraite conntract entries are created by linux, which in turn will be used for doing the reverse NAT for the reply packets arriving from the tacacs server.
Following diagram explains the internal packet flow for the tacacs packets that are expected to be sent out of management interface.

![Outgoing_Packet_Flow](Management%20VRF%20Design%20Document%20NS%20Eth0%20Outgoing%20Pkt.svg "TACACS+ Outgoing Packets Control Flow") 

#### SNMP
The net-snmp daemon runs on the default namespace. SNMP request packets coming from FPP are directly handed over using default namespace. SNMP requests from management interfaces are routed to default namespace using the DNAT & SNAT (and conntrack entries for reply packets) similar to other applications like SSH.
W.r.t. SNMP traps originated from the device, the design similar to tacacs will be implemented to route them through management namespace.
 
#### DHCP Client 
DHCP client is triggered internally as part of restarting the networking service. When management VRF is enabled and if the user has not configured a static IP address for the interface, the script "/etc/if-up.d/netns" takes care of executing "ip netns exec management ifup -i /etc/network/interfaces.management" that triggers the DHCP in the management namespace context. 

#### DHCP Relay 
DHCP relay is expected to work via the default VRF. DHCP Relay shall receive the DHCP requests from servers via the front-panel ports and it will send it to DHCP server through front-panel ports. No changes are reqiured.

#### DNS
DNS being a POSIX API library funntion, it is always executed in the context of the application that calls this.
DNS uses the common configuration file /etc/resolv.conf for all namespaces and it also has facility to have namespace specific configuration file. 
Whenever users wants DNS through management VRF (namespace), user should create the management namespace specific configuration file "/etc/netns/<namespace_name>]/resolv.conf" and configure the nameserver IP address in it.
When applications like Ping are triggered in the management namespace using "ip netns exec management <command>" (ex: "ip netns exec management ping google.com"), it uses the DNS POSIX API that is executed in the management namespace context which uses the configuration file "/etc/netns/management/resolv.conf" specific to the namespace. When namespace specific resolv.conf file does not exist, it uses the common configuration file /etc/resolv.conf.
Similarly when DHCP automatically fetches the domain-name-server IP address from DHCP server, it will udpate the appropriate resolv.conf file based on the context in which the DHCP client is executed.


#### Other Applications
Applications like "apt-get", "ntp", "scp", "sftp", "tftp", "wget" are expected to work via both default VRF & management VRF when users connect from external device to the respective deamons running in the device using the same DNAT & SNAT rules explained earlier.
When these applications are triggered from the device, use "ip netns exec management <command>" to run them in management VRF context. 


## Management VRF Configuration

This section explains the new set of configuration required for management VRF.
ConfigDB schema is enhanced to create a new tag "MANAGEMENT_VRF_CONFIG" where the management VRF specific configuration parameters are stored.

### Mangement VRF ConfigDB Schema
The upgraded config_db.json schema to store the flag for enabling/disabling management VRF is as follows.

```
"MANAGEMENT_VRF_CONFIG": {
    "vrf_global": {
        "enable_mgmt_vrf": "false" 
        "mgmt_vrfname": "management"
     }
}
```
Default value for "enabled_mgmt_vrf" is "false" and the default value for "mgmt_vrfname" is "management".
Users shall enable the management VRF by setting the "enable_mgmt_vrf" to "true". Users can also modify the default name for the management VRF.

### Management VRF Config Commands
Following config command are provided to enable or disable the management VRF and to configure the management vrfname.

```
   config vrf enable-mgmt-vrf
   config vrf disable-mgmt-vrf
   config vrf mgmt-vrfname <mgmt_vrfname>
```   
A new module "vrf configuration manager" is added to listen for the configuration changes that happen in ConfigDB for "MANAGEMENT_VRF_CONFIG".
Its implemented as part of the python script /usr/bin/vrfcfgd.
This subscribes for the MANAGEMENT_VRF_CONFIG with the ConfigDB and listens for ConfigDB events that are triggered as and when the configuration is modified. 

### Confguring Management Interface Eth0

There is no config command available to configure the parameters related to MGMT_INTERFACE present in ConfigDB. Minigraph.xml is the alternate way using which the MGMT_INTERFACE parameters can be configured.
This is enhanced to provide the following config commands to configure the eth0 IP address and the associated default route. If IP address have to be obtained via DHCP, this static IP address configuration is not required. This configuration is independent of management VRF configuration.

#### MGMT_INTERFACE ConfigDB Schema
The  existing config_db.json schema for the MGMT_INTERFACE related attributes shown below is reused without any change.

```
"MGMT_INTERFACE": {
    "eth0|ip_address/prefix": {
        "forced_mgmt_routes": {
        },
        "gwaddr": "<gw_ip_addr>" 
    }
}
```
#### MGMT_INTERFACE Config Commands
To configure the management interface IP and the associated default gateway address, following new config commands are added.

```
   config managementip add <ip_address/prefix> <default_gw_addr>
   config managementip del <ip_address/prefix>
```   
This configuration is independent of the management VRF configuration. 

### Configuration Sequence
When user upgrades to the new SONiC software with management VRF support, the images comes up as usual without management VRF enabled. Users shall follow the following steps to enable & use the management VRF.

**Step1**
If static IP address is required for the management interface eth0, users shall first configure the MGMT_INTERFACE attributes using the commands given above. If DHCP is required, this configuration can be skipped.
Example: config managementip add 10.16.206.92/24 10.16.206.1

**Step2**
Enable management vrf.
Example: config vrf enable-mgmt-vrf.
When management vrf is enabled, the VRF configuration manager "vrfcfgd" module listens for this configuration changes and does the following.

1. If the management vrf is enabled from the default disabled state, it restarts the "config-interfaces" service.
2. If the management vrf is disabled from the previous enabled state, it first deletes the previous created management namespace and then it restarts the "interfaces-config" service.

"interfaces-config" service is enhanced to create the required debian configuration files "/etc/network/interfaces" and '/etc/network/interfaces.management" using the jinja templates. It then restarts the networking service that takes care of bringing up the interfaces in appropriate namespaces. The newly added scripts "/etc/network/if-pre-up.d/netns" and "/etc/netns/if-up.d/netns" takes care of executing the management namespace linux commands and configures the eth0 interface accordingly. In case if management VRF is disabled, all these changes are reverted back to move the eth0 back to default VRF; this is taken care by linux when the management namespace is deleted.


## Appendix

### Alternate Solution Options for Bootup Sequence
There are multiple ways in which the management namespace can be created in SONiC. The chosen solution explained in Design section is based on the solution provided at https://github.com/m0kct/debian-netns 
Following alternate solutions were also considered and dropped due to the reasons given below.

**Option1: Use only /etc/network/interfaces**
Understand the current SONiC (Debian) control flow on how the restarting of networking service uses the /etc/network/interfaces and find out how the IP address is configured for the interfaces and how the ifup/ifdown is being called. Find out where the linux commands are called/used and change them to use  “ip netns exec management” in such places based on the namespace to which the interface belongs to. For example, use "ip netns exec" for eth0 specific operations and dont use the same for interfaces that belong to default VRF. Linux configuration always happens in the default VRF context using the debian package “ifupdown”; this code flow will result in modifying this debian package. Instead, since there is an alternate solution without changing debian package, this option is dropped.

**Option2: Avoid the usage of /etc/network/interfaces**
This option is to use “ip netns exec” linux calls instead of following the networking service restart flow. i.e. Modify the existing SONiC control flow and avoid the usage of /etc/network/interfaces and "ifupdown" package to configure the interfaces. Solution is to modify the bootup sequence script “interfaces_config.sh” and make the direct linux shell commands to configure the management VRF and the required DNAT & SNAT rules. Comment out the "systemctl restart networking" so that the control flow that uses the /etc/network/interfaces is avoided. This means that  the existing SONiC solution that is based on /etc/network/interfacecs and networking restart is not used. 
**Disadvantages:** 

1. Current SONiC solution that uses the /etc/network/interfaces and networking restart will be deviating, which is not required in other options
2. If user explicitly executes the "systemctl restart networking" command directly from linux shell, the  VRF configuration will be lost. This needs further investigation on solving all such cases. 

Due to the reasons given above, the solution given at https://github.com/m0kct/debian-netns is chosen and explained earlier in design section.
