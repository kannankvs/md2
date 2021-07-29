#Steps in debugging LACP issue

## Step 1 - General Steps
1) Verify the OS version running on the switch.
Command - show version
2) Ensure that the "Admin" and "Oper" status of the ports used in a port-channel are UP.
Command - show interface status
3) Check if the peer end of the link is also UP.

## Step 2 - Verify the LACP configuration
1) Verify if the member interfaces of port-channel are of same speed and type.
Example : For a port-channel having 2 member interfaces, if the speed of the member interface 1 is 40G, then the speed of the member interface 2 should also be 40G.
Port-channel won't come Up if member interfaces are operating in different speeds.
Command - show interface PortChannel <port-channel-number>

2) Verify if the LACP mode of the port-channel is same on both the ends of the link.
LACP mode should be active/active or on/on for both the ends of the link.
Command - show interface PortChannel <port-channel-number>
If there is a mismatch in LACP mode, then change it using the following command.
Command - interface PortChannel 1 mode <active/on>

3) Check if the mininum links required to bring the port-channel UP has been added to PortChannel.
Command - show interface PortChannel <port-channel-number>
By default, the min-links to bring the port-channel UP is 1. If the default value is changed ensure that the configured min-links are added to port-channel.
To add an interface to port-channel :
configure terminal
interface Ethernet xx
channel-group <PortChannel_number>

4) Ensure that the LACP interval is same on both ends of the port-channel.
LACP interval can be FAST or SLOW. By default LACP interval is SLOW. 
Command - show interface PortChannel <port-channel-number>
LACP interval can be changed to FAST using the following command:
configure terminal
interface PortChannel 1 fast_rate


## PortChannel configuration commands
interface Ethernet xx
channel-group <PortChannel_number>
exit
interface PortChannel <PortChannel_number> mode <active/on>
no shutdown
exit

interface PortChannel <PortChannel_number> mode <active/on> min-links <1..255>
no shutdown
exit

interface PortChannel <PortChannel_number> mode <active/on> min-links <1..255> fast_rate
no shutdown
exit

interface PortChannel <PortChannel_number> mode <active/on> min-links <1..255> fast_rate fallback
no shutdown
exit

## PortChannel show command
show interface PortChannel <PortChannel_number>
show interface status