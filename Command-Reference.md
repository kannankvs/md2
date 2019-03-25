# SONiC COMMAND LINE INTERFACE GUIDE

# Introduction
SONiC is an open source network operating system based on Linux that runs on switches from multiple vendors and ASICs. SONiC offers a full-suite of network functionality, like BGP and RDMA, that has been production-hardened in the data centers of some of the largest cloud-service providers. It offers teams the flexibility to create the network solutions they need while leveraging the collective strength of a large ecosystem and community.

SONiC software can be configured in following three methods.
 1) Command Line Interface (CLI)
 2) [config_db.json](https://github.com/Azure/SONiC/wiki/Configuration) 
 3) [minigraph.xml](https://github.com/Azure/SONiC/wiki/Configuration-with-Minigraph-(~Sep-2017))

This document explains the first method and gives the complete list of commands that are supported in SONiC 201811 version (build#32).
Note that the command list is just a subset of the configurations that are possible in SONiC. 
Please follow config_db.json based configuration for all complete list of configuration options.

# Basic Configuration And Show
This section covers the basic configurations related to the following
 1) [SSH login](#SSH-Login), 
 2) [configuring the management interface](#Configuring-Management-Interface), 
 3) [Help for Config Commands](#Config-Help),
 4) [show version](#Show-Versions),
 5) [Help For Show Commands](#Show-Help), 
 6) [Show System Status](#Show-System-Status) and 
 7) [Show Hardware Platform](#Show-Hardware-Platform).

## SSH Login
- All SONiC devices support both the serial console based login and the SSH based login by default.
- The default credential (if not modified at image build time) for login is admin/YourPaSsWoRd.
- In case of SSH login, users can login to the management interface (eth0) IP address after configuring the same using serial console. Refer the following section for configuring the IP address for management interface.

- Example:
```
At Console:
Debian GNU/Linux 9 sonic ttyS1

sonic login: admin
Password: YourPaSsWoRd

user@debug:~$ ssh admin@sonic (TBD)
admin@sonic's password:
```
Go Back To [Beginning of the document](#SONiC-COMMAND-LINE-INTERFACE-GUIDE) or [Beginning of this section](#Basic-Configuration-And-Show)

## Configuring Management Interface
- By default, the management interface (eth0) is configured to use DHCP to get the IP address from the DHCP server. Connect the management interface to the same network in which your DHCP server is connected and get the IP address from DHCP server.
- Verify the IP address obtained from DHCP server using the "/sbin/ifconfig eth0" linux command.
- In case if you want to use static IP for the interface, SONiC does not provide a CLI for this. There are few ways in which the IP address can be configured.
   (1) use "ifconfig eth0" command (example: ifconfig eth0 10.11.12.13/24). This configuration won't be preserved across reboot.
   (2) use config_db.jsob and configure the MGMT_INTERFACE key with the appropriate values. Refer [here](https://github.com/Azure/SONiC/wiki/Configuration#Management-Interface) 
   (3) use minigraph.xml and configure "ManagementIPInterfaces" tag inside "DpgDesc" tag as given at the [page](https://github.com/Azure/SONiC/wiki/Configuration-with-Minigraph-(~Sep-2017))
- Once if the IP address is configured, verify the same using "/sbin/ifconfig eth0" linux command.
- Users can SSH login to this management interface IP address from their management network.

- Example:
```
admin@sonic:~$ /sbin/ifconfig eth0
eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 10.11.11.13  netmask 255.255.255.0  broadcast 10.11.12.255
```
Go Back To [Beginning of the document](#SONiC-COMMAND-LINE-INTERFACE-GUIDE) or [Beginning of this section](#Basic-Configuration-And-Show)

## Config Help
- List all the possible configuration commands at the top level. The exact command syntax is as follows; all commands are case sensitive
 admin$ config --help

- Example:

```
admin@sonic:~$ config --help
Usage: config [OPTIONS] COMMAND [ARGS]...

  SONiC command line - 'config' command

Options:
  --help  Show this message and exit.

Commands:
  aaa                    AAA command line
  acl                    ACL-related configuration tasks
  bgp                    BGP-related configuration tasks
  ecn                    ECN-related configuration tasks
  interface              Interface-related configuration tasks
  interface_naming_mode  Modify interface naming mode for interacting...
  load                   Import a previous saved config DB dump file.
  load_mgmt_config       Reconfigure hostname and mgmt interface based...
  load_minigraph         Reconfigure based on minigraph.
  mirror_session
  platform               Platform-related configuration tasks
  portchannel
  qos
  reload                 Clear current configuration and import a...
  save                   Export current config DB to a file on disk.
  tacacs                 TACACS+ server configuration
  vlan                   VLAN-related configuration tasks
  warm_restart           warm_restart-related configuration tasks
  watermark              Configure watermark

```
Go Back To [Beginning of the document](#SONiC-COMMAND-LINE-INTERFACE-GUIDE) or [Beginning of this section](#Basic-Configuration-And-Show)

## Show Versions
- `show version`
  - Display software component versions of the currently running SONiC image. This includes the SONiC image version as well as Docker image versions. You can find details of the SONiC image version format [here](sonic-version).
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

## Show Help

To view a full list of available `show` subcommands, you can enter `show -?`, `show -h` or `show --help`
- Example:
```
admin@sonic:~$ show -?
Usage: show [OPTIONS] COMMAND [ARGS]...

  SONiC command line - 'show' command

Options:
  -?, -h, --help  Show this message and exit.

Commands:
  aaa                   Show AAA configuration
  acl                   Show ACL related information
  arp                   Show IP ARP table
  clock                 Show date and time
  ecn                   Show ECN configuration
  environment           Show environmentals (voltages, fans, temps)
  interfaces            Show details of the network interfaces
  ip                    Show IP (IPv4) commands
  ipv6                  Show IPv6 commands
  line                  Show all /dev/ttyUSB lines and their info
  lldp                  LLDP (Link Layer Discovery Protocol)...
  logging               Show system log
  mac                   Show MAC (FDB) entries
  mirror_session        Show existing everflow sessions
  mmu                   Show mmu configuration
  ndp                   Show IPv6 Neighbour table
  ntp                   Show NTP information
  pfc                   Show details of the priority-flow-control...
  platform              Show platform-specific hardware info
  priority-group        Show details of the PGs
  processes             Display process information
  queue                 Show details of the queues
  reboot-cause          Show cause of most recent reboot
  route-map             show route-map
  runningconfiguration  Show current running configuration...
  services              Show all daemon services
  startupconfiguration  Show startup configuration information
  system-memory         Show memory information
  tacacs                Show TACACS+ configuration
  techsupport           Gather information for troubleshooting
  uptime                Show system uptime
  users                 Show users
  version               Show version information
  vlan                  Show VLAN information
  warm_restart          Show warm restart configuration and state
  watermark             Show details of watermark

```

The same syntax applies to all subgroups of `show` which themselves contain subcommands, and subcommands which accept options/arguments.
- Example:
```
user@debug:~$ show interfaces -?

  Show details of the network interfaces

Options:
  -?, -h, --help  Show this message and exit.

Commands:
  counters     Show interface counters
  description  Show interface status, protocol and...
  naming_mode  Show interface naming_mode status
  neighbor     Show neighbor related information
  portchannel  Show PortChannel information
  status       Show Interface status information
  transceiver  Show SFP Transceiver information
```

Go Back To [Beginning of the document](#SONiC-COMMAND-LINE-INTERFACE-GUIDE) or [Beginning of this section](#Basic-Configuration-And-Show)
  
## Show System Status

- `show clock`
  - Display the current date and time configured on the system
  - Example:
  ```
  admin@sonic:~$ show clock
  Mon Mar 25 20:25:16 UTC 2019

  ```
  
- `show environment`
  - Display platform environmentals, such as voltages, temperatures and fan speeds
  - Example: Note that the show output has got lot of information; only the sample output is given in the below example
  ```
  admin@sonic:~$ show environment
  coretemp-isa-0000
  Adapter: ISA adapter
  Core 0:       +28.0 C  (high = +98.0 C, crit = +98.0 C)
  Core 1:       +28.0 C  (high = +98.0 C, crit = +98.0 C)
  Core 2:       +28.0 C  (high = +98.0 C, crit = +98.0 C)
  Core 3:       +28.0 C  (high = +98.0 C, crit = +98.0 C)
  SMF_Z9100_ON-isa-0000
  Adapter: ISA adapter
  CPU XP3R3V_EARLY:              +3.22 V  
  <... few more things ...>
  
  Onboard Temperature Sensors:
  CPU:                             30 C
  BCM56960 (PSU side):             35 C
  <... few more things ...>
  
  Onboard Voltage Sensors:
    CPU XP3R3V_EARLY                 3.22 V
  <... few more things ...>
  
  Fan Trays:
  Fan Tray 1:
    Fan1 Speed:     6192 RPM
    Fan2 Speed:     6362 RPM
    Fan1 State:        Normal
    Fan2 State:        Normal
    Air Flow:            F2B
  <... few more things ...>
  
  PSUs:
    PSU 1:
      Input:           AC
  <... few more things ...>

  ```

- `show reboot-cause`
  - Display the cause of the previous reboot
  - Example:
  ```
  admin@sonic:~$ show reboot-cause
  User issued reboot command [User: admin, Time: Mon Mar 25 01:02:03 UTC 2019]
  ```
 
- `show uptime`
  - Display the current system uptime
  - Example:
  ```
  admin@sonic:~$ show uptime
  up 2 days, 21 hours, 30 minutes
  ```

- `show logging ([<process-name>] [-l lines] | [-f])`
  - Display the all currently stored log messages
  - Example:
  ```
  admin@sonic:~$ show logging
  ```
  - It can be useful to pipe the output from `show logging` to the command `more` in order to examine one screenful of log messages at a time
  - Example:
  ```
  admin@sonic:~$ show logging | more
  ```
  - Optionally, you can specify a process name in order to display only log messages mentioning that process
  - Example:
  ```
  admin@sonic:~$ show logging sensord
  ```
  - Optionally, you can specify a number of lines to display using the `-l' or `--lines` option. Only the most recent N lines will be displayed. Also note that this option can be combined with a process name.
  - Examples:
  ```
  admin@sonic:~$ show logging --lines 50
  ```
  ```
  admin@sonic:~$ show logging sensord --lines 50
  ```
  - Optionally, you can follow the log live as entries are written to it by specifying the `-f` or `--follow` flag
  - Example:
  ```
  admin@sonic:~$ show logging --follow
  ```

- `show users`
  - Display a list of users currently logged in to the device
  - Examples:
  ```
  admin@sonic:~$ show users
  admin    pts/9        Mar 25 20:31 (100.127.20.23)
  
  admin@sonic:~$ show users
  admin    ttyS1        2019-03-25 20:31

  ```
Go Back To [Beginning of the document](#SONiC-COMMAND-LINE-INTERFACE-GUIDE) or [Beginning of this section](#Basic-Configuration-And-Show)

## Show Hardware Platform

- `show platform summary`
  - Display a summary of the device's hardware platform
  - Example:
  ```
  admin@sonic:~$ show platform summary
  Platform: x86_64-dell_s6000_s1220-r0
  HwSKU: Force10-S6000
  ASIC: broadcom
  ```

- `show platform syseeprom`
  - Display information stored on the system EEPROM.
  - Example:
  ```
  admin@sonic:~$ show platform syseeprom
  lsTLV Name             Len Value
  -------------------- --- -----
  PPID                  20 XX-XXXXXX-00000-000-0000
  DPN Rev                3 XXX
  Service Tag            7 XXXXXXX
  Part Number           10 XXXXXX
  Part Number Rev        3 XXX
  Mfg Test Results       2 FF
  Card ID                2 0x0000
  Module ID              2 0
  Base MAC Address      12 FE:EC:BA:AB:CD:EF
  (checksum valid)
  ```

- `show platform psustatus`
  - Display a status of the device's power supply units
  - Example:
  ```
  admin@sonic:~$ show platform psustatus
  PSU    Status
  -----  --------
  PSU 1  OK
  PSU 2  OK
  ```

### Transceivers

- `show interfaces transceiver [eeprom [-d | --dom] | lpmode | presence] [<interface-name>]`

  - Example (Decode and display information stored on the SFP EEPROM):
  ```
  admin@sonic:~$ show interfaces transceiver eeprom --dom Ethernet0
  Ethernet0: SFP detected
          Connector : No separable connector
          Encoding : Unspecified
          Extended Identifier : Unknown
          Extended RateSelect Compliance : QSFP+ Rate Select Version 1
          Identifier : QSFP+
          Length Cable Assembly(m) : 1
          Specification compliance :
                  10/40G Ethernet Compliance Code : 40GBASE-CR4
                  Fibre Channel Speed : 1200 Mbytes/Sec
                  Fibre Channel link length/Transmitter Technology : Electrical inter-enclosure (EL)
                  Fibre Channel transmission media : Twin Axial Pair (TW)
          Vendor Date Code(YYYY-MM-DD Lot) : 2015-10-31
          Vendor Name : XXXXX
          Vendor OUI : XX-XX-XX
          Vendor PN : 1111111111
          Vendor Rev :
          Vendor SN : 111111111
          ChannelMonitorValues:
                RX1Power: -1.1936dBm
                RX2Power: -1.1793dBm
                RX3Power: -0.9388dBm
                RX4Power: -1.0729dBm
                TX1Bias: 4.0140mA
                TX2Bias: 4.0140mA
                TX3Bias: 4.0140mA
                TX4Bias: 4.0140mA
          ModuleMonitorValues :
                  Temperature : 1.1111C
                  Vcc : 0.0000Volts
  ```

- Example (Display status of low-power mode):
  ```
  admin@sonic:~$ show interfaces transceiver lpmode Ethernet100
  Port         Low-power Mode
  -----------  ----------------
  Ethernet100  On
  ```

- Example (Display SFP transceiver presence):
  ```
  admin@sonic:~$ show interfaces transceiver presence Ethernet100
  Port         Presence
  -----------  ----------
  Ethernet100  Present
  ```
Go Back To [Beginning of the document](#SONiC-COMMAND-LINE-INTERFACE-GUIDE) or [Beginning of this section](#Basic-Configuration-And-Show)

## Layer 2 Configuration & Show
#### ARP

- `show arp [<ip-address>]`
  - Display the entire ARP table
  - Example:
  ```
  admin@sonic:~$ show arp
  Address                  HWtype  HWaddress           Flags Mask            Iface
  192.168.1.183            ether   88:5a:92:fb:bf:41   C                     Ethernet44
  192.168.1.175            ether   88:5a:92:fc:95:81   C                     Ethernet28
  192.168.1.181            ether   e4:c7:22:c1:07:7c   C                     Ethernet40
  192.168.1.179            ether   88:5a:92:de:a8:bc   C                     Ethernet36
  192.168.1.118            ether   00:1c:73:3c:de:43   C                     Ethernet64
  192.168.1.11             ether   00:1c:73:3c:e1:38   C                     Ethernet88
  192.168.1.161            ether   24:e9:b3:71:3a:01   C                     Ethernet0
  192.168.1.189            ether   24:e9:b3:9d:57:41   C                     Ethernet56
  192.168.1.187            ether   74:26:ac:8b:8f:c1   C                     Ethernet52
  192.168.1.165            ether   88:5a:92:de:a0:7c   C                     Ethernet8
  ```

  - Optionally, you can specify an IP address in order to display only that particular entry
  - Example:
  ```
  admin@sonic:~$ show arp 192.168.1.181
  Address                  HWtype  HWaddress           Flags Mask            Iface
  192.168.1.181            ether   e4:c7:22:c1:07:7c   C                     Ethernet40
  ```

#### FDB

- `show mac [OPTIONS]`
  - Show MAC (FDB) entries
  - Example:
  ```
  admin@sonic:~$ show mac
  No.    Vlan  MacAddress         Port
  -----  ------  -----------------  -----------
    1    1000  E2:8C:56:85:4A:CD  Ethernet192
    2    1000  A0:1B:5E:47:C9:76  Ethernet192
    3    1000  AA:54:EF:2C:EE:30  Ethernet192
    4    1000  A4:3F:F2:17:A3:FC  Ethernet192
    5    1000  0C:FC:01:72:29:91  Ethernet192
    6    1000  48:6D:01:7E:C9:FD  Ethernet192
    7    1000  1C:6B:7E:34:5F:A6  Ethernet192
    8    1000  EE:81:D9:7B:93:A9  Ethernet192
    9    1000  CC:F8:8D:BB:85:E2  Ethernet192
   10    1000  0A:52:B3:9C:FB:6C  Ethernet192
   11    1000  C6:E2:72:02:D1:23  Ethernet192
   12    1000  8A:C9:5C:25:E9:28  Ethernet192
   13    1000  5E:CD:34:E4:94:18  Ethernet192
   14    1000  7E:49:1F:B5:91:B5  Ethernet192
   15    1000  AE:DD:67:F3:09:5A  Ethernet192
   16    1000  DC:2F:D1:08:4B:DE  Ethernet192
   17    1000  50:96:23:AD:F1:65  Ethernet192
   18    1000  C6:C9:5E:AE:24:42  Ethernet192
  Total number of entries 18 
  ```

  - Optionally, you can specify a VLAN ID or interface name in order to display only that particular entries
  - Example:
  ```
  admin@sonic:~$ show mac -v 1000
  No.    Vlan  MacAddress         Port
  -----  ------  -----------------  -----------
    1    1000  E2:8C:56:85:4A:CD  Ethernet192
    2    1000  A0:1B:5E:47:C9:76  Ethernet192
    3    1000  AA:54:EF:2C:EE:30  Ethernet192
    4    1000  A4:3F:F2:17:A3:FC  Ethernet192
    5    1000  0C:FC:01:72:29:91  Ethernet192
    6    1000  48:6D:01:7E:C9:FD  Ethernet192
    7    1000  1C:6B:7E:34:5F:A6  Ethernet192
    8    1000  EE:81:D9:7B:93:A9  Ethernet192
    9    1000  CC:F8:8D:BB:85:E2  Ethernet192
   10    1000  0A:52:B3:9C:FB:6C  Ethernet192
   11    1000  C6:E2:72:02:D1:23  Ethernet192
   12    1000  8A:C9:5C:25:E9:28  Ethernet192
   13    1000  5E:CD:34:E4:94:18  Ethernet192
   14    1000  7E:49:1F:B5:91:B5  Ethernet192
   15    1000  AE:DD:67:F3:09:5A  Ethernet192
   16    1000  DC:2F:D1:08:4B:DE  Ethernet192
   17    1000  50:96:23:AD:F1:65  Ethernet192
   18    1000  C6:C9:5E:AE:24:42  Ethernet192
  Total number of entries 18 

  admin@sonic:~$ show mac -p Ethernet192
  No.    Vlan  MacAddress         Port
  -----  ------  -----------------  -----------
    1    1000  E2:8C:56:85:4A:CD  Ethernet192
    2    1000  A0:1B:5E:47:C9:76  Ethernet192
    3    1000  AA:54:EF:2C:EE:30  Ethernet192
    4    1000  A4:3F:F2:17:A3:FC  Ethernet192
    5    1000  0C:FC:01:72:29:91  Ethernet192
    6    1000  48:6D:01:7E:C9:FD  Ethernet192
    7    1000  1C:6B:7E:34:5F:A6  Ethernet192
    8    1000  EE:81:D9:7B:93:A9  Ethernet192
    9    1000  CC:F8:8D:BB:85:E2  Ethernet192
   10    1000  0A:52:B3:9C:FB:6C  Ethernet192
   11    1000  C6:E2:72:02:D1:23  Ethernet192
   12    1000  8A:C9:5C:25:E9:28  Ethernet192
   13    1000  5E:CD:34:E4:94:18  Ethernet192
   14    1000  7E:49:1F:B5:91:B5  Ethernet192
   15    1000  AE:DD:67:F3:09:5A  Ethernet192
   16    1000  DC:2F:D1:08:4B:DE  Ethernet192
   17    1000  50:96:23:AD:F1:65  Ethernet192
   18    1000  C6:C9:5E:AE:24:42  Ethernet192
  Total number of entries 18 
  ```

- `sonic-clear fdb [OPTIONS]`
  - Clear FDB table
  - Example:
  ```
  admin@sonic:~$ sonic-clear fdb all
  FDB entries are cleared.
  ```

#### LAG

- `show interfaces portchannel`
  - Display information regarding port-channel interfaces
  - Example:
  ```
  admin@sonic:~$ show interfaces portchannel
  Flags: A - active, I - inactive, Up - up, Dw - Down, N/A - not available, S - selected, D - deselected
    No.  Team Dev       Protocol     Ports
  -----  -------------  -----------  ---------------------------
     24  PortChannel24  LACP(A)(Up)  Ethernet28(S) Ethernet24(S)
     48  PortChannel48  LACP(A)(Up)  Ethernet52(S) Ethernet48(S)
     16  PortChannel16  LACP(A)(Up)  Ethernet20(S) Ethernet16(S)
     32  PortChannel32  LACP(A)(Up)  Ethernet32(S) Ethernet36(S)
     56  PortChannel56  LACP(A)(Up)  Ethernet60(S) Ethernet56(S)
     40  PortChannel40  LACP(A)(Up)  Ethernet44(S) Ethernet40(S)
      0  PortChannel0   LACP(A)(Up)  Ethernet0(S) Ethernet4(S)
      8  PortChannel8   LACP(A)(Up)  Ethernet8(S) Ethernet12(S)
  ```

#### LLDP

- `show lldp table`
  - Display a summary of all LLDP neighbors in a pretty one-shot command.
  - Example:
  ```
  admin@sonic:~$ show lldp table
  Capability codes: (R) Router, (B) Bridge, (O) Other
  LocalPort    RemoteDevice            RemotePortID    Capability    RemotePortDescr
  -----------  ----------------------  --------------  ------------  ----------------------------------------
  Ethernet0    SONIC01MS               Ethernet1       BR            Ethernet0
  Ethernet4    SONIC02MS               Ethernet1       BR            Ethernet4
  Ethernet8    SONIC03MS               Ethernet1       BR            Ethernet8
  Ethernet12   SONIC04MS               Ethernet1       BR            Ethernet12
  --------------------------------------------------
  Total entries displayed:  4
  ```

- `show lldp neighbors [<interface-name>]`
  - Display more detail about all LLDP neighbors
  - Example:
  ```
  admin@sonic:~$ show lldp neighbors
  -------------------------------------------------------------------------------
  LLDP neighbors:
   -------------------------------------------------------------------------------
  Interface:    Ethernet96, via: LLDP, RID: 36, Time: 12 days, 00:30:13
    Chassis:     
      ChassisID:    mac 00:1c:73:3c:e1:36
      SysName:      SONIC01SPINE
      SysDescr:     Arista Networks EOS version 4.16.6M running on an Arista Networks DCS-7508
      TTL:          120
      MgmtIP:       192.168.1.139
      Capability:   Bridge, on
      Capability:   Router, on
    Port:        
      PortID:       ifname Ethernet4/24/1
      PortDescr:    SONIC01LEAF:Ethernet1/25
      MFS:          9236
  -------------------------------------------------------------------------------
  Interface:    Ethernet72, via: LLDP, RID: 42, Time: 10 days, 13:41:27
    Chassis:     
      ChassisID:    mac 00:1c:73:3c:e1:51
      SysName:      SONIC02SPINE
      SysDescr:     Arista Networks EOS version 4.16.6M running on an Arista Networks DCS-7508
      TTL:          120
      MgmtIP:       192.168.1.133
      Capability:   Bridge, on
      Capability:   Router, on
    Port:        
      PortID:       ifname Ethernet4/24/1
      PortDescr:    SONIC01LEAF:Ethernet1/19
      MFS:          9236
  -------------------------------------------------------------------------------
  ```
  - Optionally, you can specify an interface name in order to display only that particular interface
  - Example:
  ```
  admin@sonic:~$ show lldp neighbors Ethernet72
  ```

#### NDP

- `show ndp [OPTIONS] [IP6ADDRESS]`
  - Show IPv6 Neighbour table
  - Example:
  ```
  admin@sonic:~$ show ndp
  Address                   MacAddress         Iface    Vlan
  ------------------------  -----------------  -------  ------
  fe80::268a:7ff:fe07:ad88  24:8a:07:07:ad:88  eth0     -
  fe80::268a:7ff:fe16:c4a4  24:8a:07:16:c4:a4  eth0     -
  fe80::268a:7ff:fe32:76e6  24:8a:07:32:76:e6  eth0     -
  Total number of entries 3 

#### PFC
- `show pfc counters`
  - Show details of the priority-flow-control (pfc).
  - Example:
   ```
   admin@sonic:~$ show pfc counters
      Port Rx    PFC0    PFC1    PFC2    PFC3    PFC4    PFC5    PFC6    PFC7
    -----------  ------  ------  ------  ------  ------  ------  ------  ------
    Ethernet0       0       0       0       0       0       0       0       0
    Ethernet4       0       0       0       0       0       0       0       0
    Ethernet8       0       0       0       0       0       0       0       0
   Ethernet12       0       0       0       0       0       0       0       0

      Port Tx    PFC0    PFC1    PFC2    PFC3    PFC4    PFC5    PFC6    PFC7
    -----------  ------  ------  ------  ------  ------  ------  ------  ------
    Ethernet0       0       0       0       0       0       0       0       0
    Ethernet4       0       0       0       0       0       0       0       0
    Ethernet8       0       0       0       0       0       0       0       0
   Ethernet12       0       0       0       0       0       0       0       0
   ```

#### Queue
  
- `show queue counters [<interface-name>]`
  - Show details of the queues
  - Example:
  ```
    admin@sonic:~$ show queue counters 
         Port    TxQ    Counter/pkts    Counter/bytes    Drop/pkts    Drop/bytes
    ---------  -----  --------------  ---------------  -----------  ------------
    Ethernet0    UC0               0                0            0             0
    Ethernet0    UC1               0                0            0             0
    Ethernet0    UC2               0                0            0             0
    Ethernet0    UC3               0                0            0             0
    Ethernet0    UC4               0                0            0             0
    Ethernet0    UC5               0                0            0             0
    Ethernet0    UC6               0                0            0             0
    Ethernet0    UC7               0                0            0             0
    Ethernet0    UC8               0                0            0             0
    Ethernet0    UC9               0                0            0             0
    Ethernet0    MC0               0                0            0             0
    Ethernet0    MC1               0                0            0             0
    Ethernet0    MC2               0                0            0             0
    Ethernet0    MC3               0                0            0             0
    Ethernet0    MC4               0                0            0             0
    Ethernet0    MC5               0                0            0             0
    Ethernet0    MC6               0                0            0             0
    Ethernet0    MC7               0                0            0             0
    Ethernet0    MC8               0                0            0             0
    Ethernet0    MC9               0                0            0             0

         Port    TxQ    Counter/pkts    Counter/bytes    Drop/pkts    Drop/bytes
    ---------  -----  --------------  ---------------  -----------  ------------
    Ethernet4    UC0               0                0            0             0
    Ethernet4    UC1               0                0            0             0
    Ethernet4    UC2               0                0            0             0
    Ethernet4    UC3               0                0            0             0
    Ethernet4    UC4               0                0            0             0
    Ethernet4    UC5               0                0            0             0
    Ethernet4    UC6               0                0            0             0
    Ethernet4    UC7               0                0            0             0
    Ethernet4    UC8               0                0            0             0
    Ethernet4    UC9               0                0            0             0
    Ethernet4    MC0               0                0            0             0
    Ethernet4    MC1               0                0            0             0
    Ethernet4    MC2               0                0            0             0
    Ethernet4    MC3               0                0            0             0
    Ethernet4    MC4               0                0            0             0
    Ethernet4    MC5               0                0            0             0
    Ethernet4    MC6               0                0            0             0
    Ethernet4    MC7               0                0            0             0
    Ethernet4    MC8               0                0            0             0
    Ethernet4    MC9               0                0            0             0
  ```
  - Optionally, you can specify an interface name in order to display only that particular interface
  - Example:
  ```
  admin@sonic:~$ show queue counters Ethernet72
  ```
#### Queue watermarks
```
show queue  watermark -h
Usage: show queue watermark [OPTIONS] COMMAND [ARGS]...

  Show queue user WM

Options:
  -?, -h, --help  Show this message and exit.

Commands:
  multicast  Show user WM for multicast queues
  unicast    Show user WM for unicast queues
```

Example:
```
admin@sonic:~$ show queue  watermark unicast
Egress shared pool occupancy per unicast queue:
       Port    UC0    UC1    UC2    UC3    UC4    UC5    UC6    UC7
-----------  -----  -----  -----  -----  -----  -----  -----  -----
  Ethernet0      0      0      0      0      0      0      0      0
  Ethernet4      0      0      0      0      0      0      0      0
  Ethernet8      0      0      0      0      0      0      0      0
 Ethernet12      0      0      0      0      0      0      0      0
```

#### Priority Group watermarks
```
show priority-group  watermark -h
Usage: show priority-group watermark [OPTIONS] COMMAND [ARGS]...

  Show priority_group user WM

Options:
  -?, -h, --help  Show this message and exit.

Commands:
  headroom  Show user headroom WM for pg
  shared    Show user shared WM for pg
```
Example:
```
admin@sonic:~$ show priority-group  watermark shared
Ingress shared pool occupancy per PG:
       Port    PG0    PG1    PG2    PG3    PG4    PG5    PG6    PG7
-----------  -----  -----  -----  -----  -----  -----  -----  -----
  Ethernet0      0      0      0      0      0      0      0      0
  Ethernet4      0      0      0      0      0      0      0      0
  Ethernet8      0      0      0      0      0      0      0      0
 Ethernet12      0      0      0      0      0      0      0      0
```

In addition to user watermark("show queue|priority-group watermark ..."), a persistent watermark is available.
It hold values independently of user watermark. This way user can use "user watermark" for debugging, clear it, etc, but the "persistent watermark" will not be affected. 

Show persistent watermark example:
```
admin@sonic:~$ show queue persistent-watermark unicast

admin@sonic:~$ show queue persistent-watermark multicast

admin@sonic:~$ show priority-group persistent-watermark shared

admin@sonic:~$ show priority-group persistent-watermark headroom
```
Both "user watermark" and "persistent watermark" can be cleared by user: 
```
root@sonic:~# sonic-clear queue persistent-watermark unicast

root@sonic:~# sonic-clear queue persistent-watermark multicast

root@sonic:~# sonic-clear priority-group persistent-watermark shared

root@sonic:~# sonic-clear priority-group persistent-watermark headroom
```
#### VLAN

- `config vlan`
  - Add/del vlan
  - Add/del vlan member 
  - Example:
  ```
  root@sonic:/# config vlan 
  Usage: config vlan [OPTIONS] COMMAND [ARGS]...
 
    VLAN-related configuration tasks

  Options:
    -s, --redis-unix-socket-path TEXT
                                    unix socket path for redis connection
    --help                          Show this message and exit.

  Commands:
    add
    del
    member

  root@sonic:/# config vlan add 1200
  root@sonic:/# config vlan member add 1200 Ethernet1
  root@sonic:/# config vlan member add 1200 Ethernet9 -u
  root@sonic:/# config vlan member add 1200 Ethernet8
  ```
- `show vlan config`
  - Show vlan and vlan member configuration
  - Example:
  ```
  admin@sonic:/$ show vlan config
  Name        VID  Member     Mode
  --------  -----  ---------  --------
  Vlan1200   1200  Ethernet1  tagged
  Vlan1200   1200  Ethernet9  untagged
  Vlan1200   1200  Ethernet8  tagged
   ```

### Layer 3

- `show interfaces counters [-p <period>]`
  - Display packet counters for all interfaces since the last time the counters were cleared
  - Example:
  ```
  admin@sonic:~$ show interfaces counters
        IFACE    STATE            RX_OK       RX_BPS    RX_UTIL    RX_ERR    RX_DRP    RX_OVR            TX_OK       TX_BPS    TX_UTIL    TX_ERR    TX_DRP    TX_OVR
  -----------  -------  ---------------  -----------  ---------  --------  --------  --------  ---------------  -----------  ---------  --------  --------  --------
    Ethernet0        U  471,729,839,997  653.87 MB/s     12.77%         0    18,682         0  409,682,385,925  556.84 MB/s     10.88%         0         0         0
    Ethernet4        U  453,838,006,636  632.97 MB/s     12.36%         0     1,636         0  388,299,875,056  529.34 MB/s     10.34%         0         0         0
    Ethernet8        U  549,034,764,539  761.15 MB/s     14.87%         0    18,274         0  457,603,227,659  615.20 MB/s     12.02%         0         0         0
   Ethernet12        U  458,052,204,029  636.84 MB/s     12.44%         0    17,614         0  388,341,776,615  527.37 MB/s     10.30%         0         0         0
   Ethernet16        U   16,679,692,972   13.83 MB/s      0.27%         0    17,605         0   18,206,586,265   17.51 MB/s      0.34%         0         0         0
   Ethernet20        U   47,983,339,172   35.89 MB/s      0.70%         0     2,174         0   58,986,354,359   51.83 MB/s      1.01%         0         0         0
   Ethernet24        U   33,543,533,441   36.59 MB/s      0.71%         0     1,613         0   43,066,076,370   49.92 MB/s      0.97%         0         0         0
  ```
  - Optionally, you can specify a period (in seconds) with which to gather counters over. Note that this function will take `<period>` seconds to execute.
  - Example:
  ```
  admin@sonic:~$ show interfaces counters -p 5
        IFACE    STATE    RX_OK       RX_BPS    RX_UTIL    RX_ERR    RX_DRP    RX_OVR    TX_OK       TX_BPS    TX_UTIL    TX_ERR    TX_DRP    TX_OVR
  -----------  -------  -------  -----------  ---------  --------  --------  --------  -------  -----------  ---------  --------  --------  --------
  Ethernet0         U      515   59.14 KB/s      0.00%         0         0         0    1,305  127.60 KB/s      0.00%         0         0         0
  Ethernet4         U      305   26.54 KB/s      0.00%         0         0         0      279   39.12 KB/s      0.00%         0         0         0
  Ethernet8         U      437   42.96 KB/s      0.00%         0         0         0      182   18.37 KB/s      0.00%         0         0         0
  Ethernet12        U      284   40.79 KB/s      0.00%         0         0         0      160   13.03 KB/s      0.00%         0         0         0
  Ethernet16        U      377   32.64 KB/s      0.00%         0         0         0      214   18.01 KB/s      0.00%         0         0         0
  Ethernet20        U      284   36.81 KB/s      0.00%         0         0         0      138  8758.25 B/s      0.00%         0         0         0
  Ethernet24        U      173   16.09 KB/s      0.00%         0         0         0      169   11.39 KB/s      0.00%         0         0         0
  ```

- `show ip route [<ip-address>]`
  - Display the IP routing table
  - Example:
  ```
  admin@sonic:~$ show ip route
  Codes: K - kernel route, C - connected, S - static, R - RIP,
         O - OSPF, I - IS-IS, B - BGP, P - PIM, A - Babel,
         > - selected route, * - FIB route
  
  C>* 10.0.0.0/31 is directly connected, Ethernet0
  C>* 10.0.0.2/31 is directly connected, Ethernet4
  C>* 10.0.0.4/31 is directly connected, Ethernet8
  C>* 10.0.0.6/31 is directly connected, Ethernet12
  C>* 10.0.0.8/31 is directly connected, Ethernet16
  C>* 10.0.0.10/31 is directly connected, Ethernet20
  C>* 10.0.0.12/31 is directly connected, Ethernet24
  C>* 10.0.0.14/31 is directly connected, Ethernet28
  C>* 10.0.0.16/31 is directly connected, Ethernet32
  C>* 10.0.0.18/31 is directly connected, Ethernet36
  C>* 10.0.0.20/31 is directly connected, Ethernet40
  C>* 10.0.0.22/31 is directly connected, Ethernet44
  C>* 10.0.0.24/31 is directly connected, Ethernet48
  C>* 10.0.0.26/31 is directly connected, Ethernet52
  C>* 10.0.0.28/31 is directly connected, Ethernet56
  C>* 10.0.0.30/31 is directly connected, Ethernet60
  C>* 10.0.0.32/31 is directly connected, Ethernet64
  ```
 - Optionally, you can specify an IP address in order to display only routes to that particular IP address
  - Example:
  ```
  admin@sonic:~$ show route 10.0.0.12
  ```

#### ACL

- `show acl table`
  - Show existing ACL tables
  - Example:
  ```
  admin@sonic:~$ show acl table
  Name      Type       Binding          Description
  --------  ---------  ---------------  -------------
  EVERFLOW  MIRROR     Ethernet64       EVERFLOW
                       Ethernet68
                       Ethernet72
                       Ethernet76
                       Ethernet80
                       Ethernet84
                       Ethernet88
                       Ethernet92
                       Ethernet96
                       Ethernet100
                       Ethernet104
                       Ethernet108
                       Ethernet112
                       Ethernet116
                       Ethernet120
                       Ethernet124
  SNMP_ACL  CTRLPLANE  SNMP             SNMP_ACL
  SSH_ONLY  CTRLPLANE  SSH              SSH_ONLY
  DATAACL   L3         Ethernet64       DATAACL
                       Ethernet68
                       Ethernet72
                       Ethernet76
                       Ethernet80
                       Ethernet84
                       Ethernet88
                       Ethernet92
                       Ethernet96
                       Ethernet100
                   
  ```

- `show acl rule`
  - Show existing ACL rule
  - Example:
  ```
  admin@sonic:~$ show acl rule
  Table    Rule    Priority    Action    Match
  -------  ------  ----------  --------  -------
                  
  ```

- `show mirror session`
  - Show existing everflow sessions
  - Example:
  ```
  admin@sonic:~$ show mirror session
  Name       Status    SRC IP     DST IP    GRE    DSCP    TTL    Queue
  ---------  --------  ---------  --------  -----  ------  -----  -------
  everflow0  active    10.1.0.32  10.0.0.7
                  
  ```

#### BGP

- `show ip bgp summary`
  - Display a summary of the status of all IPv4 Border Gateway Protocol (BGP) sessions
  - Example:
  ```
  admin@sonic:~$ show ip bgp summary
  BGP router identifier 1.2.3.4, local AS number 65061
  RIB entries 6124, using 670 KiB of memory
  Peers 16, using 143 KiB of memory
  
  Neighbor        V         AS MsgRcvd MsgSent   TblVer  InQ OutQ Up/Down  State/PfxRcd
  192.168.1.161    4 65501   88698  102781        0    0    0 08w5d14h        2
  192.168.1.163    4 65502   88698  102780        0    0    0 08w5d14h        2
  192.168.1.165    4 65503   88699  102781        0    0    0 08w5d14h        2
  192.168.1.167    4 65504   88698  102780        0    0    0 08w5d14h        2
  192.168.1.169    4 65505   88698  102781        0    0    0 08w5d14h        2
  192.168.1.171    4 65506   88698  102780        0    0    0 08w5d14h        2
  192.168.1.173    4 65507   88698  102780        0    0    0 08w5d14h        2
  192.168.1.175    4 65508   88698  102780        0    0    0 08w5d14h        2
  192.168.1.177    4 65509   88698  102781        0    0    0 08w5d14h        2
  192.168.1.179    4 65510   88698  102780        0    0    0 08w5d14h        2
  192.168.1.181    4 65511   88698  102780        0    0    0 08w5d14h        2
  192.168.1.183    4 65512   88698  102780        0    0    0 08w5d14h        2
  192.168.1.185    4 65513   88698  102781        0    0    0 08w5d14h        2
  192.168.1.187    4 65514   88698  102781        0    0    0 08w5d14h        2
  192.168.1.189    4 65515   88698  102781        0    0    0 08w5d14h        2
  192.168.1.191    4 65516   88698  102781        0    0    0 08w5d14h        2
  
  Total number of neighbors 16
  ```

- `show ip bgp neighbors [<ipv4-address> [advertised-routes | received-routes | routes]]`
  - Display details of IPv4 Border Gateway Protocol (BGP) neighbors
  - Example:
  ```
  admin@sonic:~$ show ip bgp neighbors
  BGP neighbor is 192.168.1.161, remote AS 65501, local AS 65061, external link
   Description: ARISTA01T0
    BGP version 4, remote router ID 1.2.3.4
    BGP state = Established, up for 08w5d14h
    Last read 00:00:46, hold time is 180, keepalive interval is 60 seconds
    Neighbor capabilities:
      4 Byte AS: advertised and received
      Dynamic: received
      Route refresh: advertised and received(old & new)
      Address family IPv4 Unicast: advertised and received
      Graceful Restart Capabilty: advertised and received
        Remote Restart timer is 120 seconds
        Address families by peer:
          IPv4 Unicast(not preserved)
    Graceful restart informations:
      End-of-RIB send: IPv4 Unicast
      End-of-RIB received: IPv4 Unicast
    Message statistics:
      Inq depth is 0
      Outq depth is 0
                           Sent       Rcvd
      Opens:                  1          1
      Notifications:          0          0
      Updates:            14066          3
      Keepalives:         88718      88698
      Route Refresh:          0          0
      Capability:             0          0
      Total:             102785      88702
    Minimum time between advertisement runs is 30 seconds
  
   For address family: IPv4 Unicast
    Community attribute sent to this neighbor(both)
    2 accepted prefixes
  
    Connections established 1; dropped 0
    Last reset never
  Local host: 192.168.1.160, Local port: 32961
  Foreign host: 192.168.1.161, Foreign port: 179
  Nexthop: 192.168.1.160
  Nexthop global: fe80::f60f:1bff:fe89:bc00
  Nexthop local: ::
  BGP connection: non shared network
  Read thread: on  Write thread: off
  ```
  - Optionally, you can specify an IP address in order to display only that particular neighbor. In this mode, you can optionally specify whether you want to display all routes advertised to the specified neighbor, all routes received from the specified neighbor or all routes (received and accepted) from the specified neighbor.
  - Example:
  ```
  admin@sonic:~$ show ip bgp neighbors 192.168.1.161

  admin@sonic:~$ show ip bgp neighbors 192.168.1.161 advertised-routes

  admin@sonic:~$ show ip bgp neighbors 192.168.1.161 received-routes

  admin@sonic:~$ show ip bgp neighbors 192.168.1.161 routes
  ```

- `show ipv6 bgp summary`
  - Display a summary of the status of all IPv6 Border Gateway Protocol (BGP) sessions
  - Example:
  ```
  admin@sonic:~$ show ipv6 bgp summary
  BGP router identifier 10.1.0.32, local AS number 65100
  RIB entries 12809, using 1401 KiB of memory
  Peers 8, using 36 KiB of memory

  Neighbor        V         AS MsgRcvd MsgSent   TblVer  InQ OutQ Up/Down  State/PfxRcd
  fc00::72        4 64600   12588   12591        0    0    0 06:51:17     6402
  fc00::76        4 64600   12587    6190        0    0    0 06:51:28     6402
  fc00::7a        4 64600   12587    9391        0    0    0 06:51:23     6402
  fc00::7e        4 64600   12589   12592        0    0    0 06:51:25     6402

  Total number of neighbors 4
  ```

- `show ipv6 bgp neighbors <ipv6-address> (advertised-routes | received-routes | routes)`
  - Display details of IPv6 Border Gateway Protocol (BGP) neighbors
  -  In this mode, you must specify the IPv6 address of a neighbor and choose whether you want to display all routes advertised to the specified neighbor, all routes received from the specified neighbor or all received and accepted routes from the specified neighbor.
  - Example:
  ```
  admin@sonic:~$ show ipv6 bgp neighbors fc00::72 advertised-routes

  admin@sonic:~$ show ipv6 bgp neighbors fc00::72 received-routes

  admin@sonic:~$ show ipv6 bgp neighbors fc00::72 routes
  ```

### Application Layer

#### NTP
- `show ntp`
  - Display a list of NTP peers known to the server as well as a summary of their state
  - Example:
  ```
  admin@sonic:~$ show ntp
       remote           refid      st t when poll reach   delay   offset  jitter
  ==============================================================================
  *ns2.example.com 10.193.2.20      2 u  936 1024  377   31.234    3.353   3.096
  ```

#### CRM
- `crm config polling interval <value>`
  - Configure CRM polling interval in seconds
  - Example:
```
  admin@sonic:~$ crm config polling interval 120
```
- `crm config thresholds [ipv4|ipv6] [route|neighbor|nexthop] type [percentage|used|free]`
- `crm config thresholds nexthop group [object|member] type [percentage|used|free]`
- `crm config thresholds acl [table|group [entry|counter]] type [percentage|used|free]`
- `crm config thresholds fdb type [percentage|used|free]`
  - Configure thresholds  type for each CRM resource
  - Example:
```
  admin@sonic:~$ crm config thresholds ipv4 route type percentage
  admin@sonic:~$ crm config thresholds acl table type used
  admin@sonic:~$ crm config thresholds fdb type free
```
- `crm config thresholds [ipv4|ipv6] [route|neighbor|nexthop] [low|high] <value>`
- `crm config thresholds nexthop group [object|member] [low|high] <value>`
- `crm config thresholds acl [table|group [entry|counter]] [low|high] <value>`
- `crm config thresholds fdb type [low|high] <value>`
  - Configure low and high threshold values for each CRM resource
  - Example:
```
  admin@sonic:~$ crm config thresholds ipv4 route low 60
  admin@sonic:~$ crm config thresholds ipv4 route high 80
```
- `crm show summary`
  - Show CRM general information
  - Example:
```
  admin@sonic:~$  crm show summary
  
  Polling Interval: 300 second(s)

```
- `crm show thresholds all`
- `crm show thresholds [ipv4|ipv6] [route|neighbor|nexthop]`
- `crm show thresholds nexthop group [member|object]`
- `crm show thresholds acl [table|group [entry|counter]]`
- `crm show thresholds fdb`
  - Show thresholds types and values for CRM resources
  - Example:
```
  admin@sonic:~$  crm show thresholds all
  
  Resource Name         Threshold Type      Low Threshold    High Threshold
  --------------------  ----------------  ---------------  ----------------
  ipv4_route            percentage                     70                85
  ipv6_route            percentage                     70                85
  ipv4_nexthop          percentage                     70                85
  ipv6_nexthop          percentage                     70                85
  ipv4_neighbor         percentage                     70                85
  ipv6_neighbor         percentage                     70                85
  nexthop_group_member  percentage                     70                85
  nexthop_group         percentage                     70                85
  acl_table             percentage                     70                85
  acl_group             percentage                     70                85
  acl_entry             percentage                     70                85
  acl_counter           percentage                     70                85
  fdb_entry             percentage                     70                85

```
- `crm show resources all`
- `crm show resources [ipv4|ipv6] [route|neighbor|nexthop]`
- `crm show resources nexthop group [member|object]`
- `crm show resources acl [table|group [entry|counter]]`
- `crm show resources fdb`
  - Show counter values for CRM resources
  - Example:
```
  admin@sonic:~$  crm show resources all
  
  Resource Name           Used Count    Available Count
  --------------------  ------------  -----------------
  ipv4_route                    6555              93342
  ipv6_route                    6554              93342
  ipv4_nexthop                    24              57218
  ipv6_nexthop                    24              57218
  ipv4_neighbor                   48              93342
  ipv6_neighbor                   48              22094
  nexthop_group_member            18              57218
  nexthop_group                    3              57218
  fdb_entry                        0              93342


  Stage    Bind Point    Resource Name      Used Count    Available Count
  -------  ------------  ---------------  ------------  -----------------
  INGRESS  PORT          acl_group                   0                368
  INGRESS  PORT          acl_table                   1                391
  INGRESS  LAG           acl_group                   0                368
  INGRESS  LAG           acl_table                   0                391
  INGRESS  VLAN          acl_group                   0                368
  INGRESS  VLAN          acl_table                   0                391
  INGRESS  RIF           acl_group                   0                368
  INGRESS  RIF           acl_table                   0                391
  INGRESS  SWITCH        acl_group                   0                368
  INGRESS  SWITCH        acl_table                   0                391
  EGRESS   PORT          acl_group                  32                368
  EGRESS   PORT          acl_table                   2                391
  EGRESS   LAG           acl_group                   0                368
  EGRESS   LAG           acl_table                   0                391
  EGRESS   RIF           acl_group                   0                368
  EGRESS   RIF           acl_table                   0                391
  EGRESS   SWITCH        acl_group                   0                368
  EGRESS   SWITCH        acl_table                   0                391


  Table ID         Resource Name      Used Count    Available Count
  ---------------  ---------------  ------------  -----------------
  0x70000000002bd  acl_entry                   1              13813
  0x70000000002bd  acl_counter                 1              13813

```

### System State

#### Processes
- `show processes cpu`
  - Display the current CPU usage by process
  - Example:
  ```
  admin@SONiC:~$ show processes cpu
  top - 23:50:08 up  1:18,  1 user,  load average: 0.25, 0.29, 0.25
  Tasks: 161 total,   1 running, 160 sleeping,   0 stopped,   0 zombie
  %Cpu(s):  3.8 us,  1.0 sy,  0.0 ni, 95.1 id,  0.1 wa,  0.0 hi,  0.0 si,  0.0 st
  KiB Mem:   8181216 total,  1161060 used,  7020156 free,   105656 buffers
  KiB Swap:        0 total,        0 used,        0 free.   557560 cached Mem
  
    PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND
   2047 root      20   0  683772 109288  39652 S  23.8  1.3   7:44.79 syncd
   1351 root      20   0   43360   5616   2844 S  11.9  0.1   1:41.56 redis-server
  10093 root      20   0   21944   2476   2088 R   5.9  0.0   0:00.03 top
      1 root      20   0   28992   5508   3236 S   0.0  0.1   0:06.42 systemd
      2 root      20   0       0      0      0 S   0.0  0.0   0:00.00 kthreadd
      3 root      20   0       0      0      0 S   0.0  0.0   0:00.56 ksoftirqd/0
      5 root       0 -20       0      0      0 S   0.0  0.0   0:00.00 kworker/0:0H
  ```

### Configuration
#### Startup Configuration

- `show startupconfiguration bgp`
  - Display the startup configuration for BGP
  - Example:
  ```
  admin@sonic:~$ show startupconfiguration bgp
  ```

#### Running Configuration

- `show runningconfiguration bgp`
  - Display the current running configuration for BGP
  - Example:
  ```
  admin@sonic:~$ show runningconfiguration bgp
  ```

- `show runningconfiguration interfaces`
  - Display the current running configuration for the interfaces
  - Example:
  ```
  admin@sonic:~$ show runningconfiguration interfaces
  ```

- `show runningconfiguration ntp`
  - Display the current running configuration for NTP
  - Example:
  ```
  admin@sonic:~$ show runningconfiguration ntp
  ```

- `show runningconfiguration snmp`
  - Display the current running configuration for SNMP
  - Example:
  ```
  admin@sonic:~$ show runningconfiguration snmp
  ```

- `sudo config interface shutdown <interface-name>`
  - Shut down the interface specified by \<interface-name\>
  - Examples:
  ```
  admin@sonic:~$ sudo config interface shutdown Ethernet0
  ```

- `sudo config interface startup <interface-name>`
  - Bring up the interface specified by \<interface-name\>
  - Examples:
  ```
  admin@sonic:~$ sudo config interface startup Ethernet0
  ```

- `sudo config bgp shutdown (<ip-address> | <hostname>)`
  - Shut down a BGP session with a neighbor by that neighbor's IP address or hostname
  - Examples:
  ```
  admin@sonic:~$ sudo config bgp shutdown neighbor 192.168.1.124
  ```
  ```
  admin@sonic:~$ sudo config bgp shutdown neighbor SONIC02SPINE
  ```

- `sudo config bgp shutdown all`
  - Shut down all BGP sessions
  - Examples:
  ```
  admin@sonic:~$ sudo config bgp shutdown all
  ```

- `sudo config bgp startup (<ip-address> | <hostname>)`
  - Start up a BGP session with a neighbor by that neighbor's IP address or hostname
  - Examples:
  ```
  admin@sonic:~$ sudo config bgp startup neighbor 192.168.1.124
  ```
  ```
  admin@sonic:~$ sudo config bgp startup neighbor SONIC02SPINE
  ```

- `sudo config bgp startup all`
  - Start up all BGP sessions
  - Examples:
  ```
  admin@sonic:~$ sudo config bgp startup all
  ```

#### AAA Authentication Configuration

- `show aaa`
  - Display AAA authentication configuration
  - Example:
  ```
  admin@sonic:~$ show aaa
  AAA authentication login local (default)
  AAA authentication failthrough True (default)
  AAA authentication fallback True (default)
  ```

#### Interface Naming Mode

- `sudo config interface_naming_mode (default | alias)`
  - Change the interface naming mode. Select between default mode (SONiC interface names) or alias mode (Hardware vendor names). The user must log out and log back in for changes to take effect. Note that the newly-applied interface mode will affect all interface-related show/config commands.

- `show interfaces naming_mode`
  - Display the current interface naming mode

  - Example:
    - Interface naming mode originally set to 'default'. Interfaces are referenced by default SONiC interface names:
    ```
    admin@sonic:~$ show interfaces naming_mode 
    default

    admin@sonic:~$ show interface status Ethernet0
      Interface     Lanes    Speed    MTU            Alias    Oper    Admin
    -----------  --------  -------  -----   --------------  ------  -------
      Ethernet0   101,102      40G   9100   fortyGigE1/1/1      up       up

    admin@sonic:~$ sudo config interface_naming_mode alias
    Please logout and log back in for changes take effect.
    ```

    - After user logs out and back in again, interfaces now referenced by hardware vendor aliases:
    ```
    admin@sonic:~$ show interfaces naming_mode 
    alias

    admin@sonic:~$ sudo config interface fortyGigE1/1/1 shutdown
    admin@sonic:~$ show interface status fortyGigE1/1/1
      Interface     Lanes    Speed    MTU            Alias    Oper    Admin
    -----------  --------  -------  -----   --------------  ------  -------
      Ethernet0   101,102      40G   9100   fortyGigE1/1/1    down     down
    ```

### Troubleshooting

- `show techsupport`
  - Gathers pertinent information about the state of the device and compresses it into an archive file. This archive file can be sent to the SONiC development team for examination.
  - Resulting archive file is saved as `/var/dump/<DEVICE_HOST_NAME>_YYYYMMDD_HHMMSS.tar.gz`
  - Example:
  ```
  admin@sonic:~$ show techsupport
  ```

### SONiC Installer

- `sonic_installer install`
  - Takes a path to an installable SONiC image or URL and installs the image.
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

- `sonic_installer list`
  - Display information about currently installed images. It displays a list of installed images, currently running image and image set to be loaded after reboot.
  - Example:
  ```
  admin@sonic:~$ sonic_installer list 
  Current: SONiC-OS-HEAD.XXXX
  Next: SONiC-OS-HEAD.XXXX
  Available: 
  SONiC-OS-HEAD.XXXX
  SONiC-OS-HEAD.YYYY
  ```

- `sonic_installer set_default`
  - Changes which image will be loaded by default after all subsequent reboots
  - Example:
  ```
  admin@sonic:~$ sonic_installer set_default SONiC-OS-HEAD.XXXX
  ```

- `sonic_installer set_next_boot`
  - Changes which image will be loaded after the *next* reboot only
  - Example:
  ```
  admin@sonic:~$ sonic_installer set_next_boot SONiC-OS-HEAD.XXXX
  ```

- `sonic_installer remove`
  - Removes an unused SONiC image from the disk. Note that it's *not* allowed to remove currently running image.
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
