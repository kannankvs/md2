# SONiC 202006 Release Notes

This document captures the new features added and enhancements done on existing features/sub-features for the SONiC 202012 release.



# Table of Contents

 * [Branch and Image Location](#branch-and-image-location)
 * [Dependency Version](#dependency-version)
 * [Security Updates](#security-updates)
 * [Feature List](#feature-list)
 * [SAI APIs](#sai-apis)
 * [Contributors](#contributors)


# Branch and Image Location  

Branch : https://github.com/Azure/sonic-buildimage/tree/202012 <br>
Image  : https://sonic-jenkins.westus2.cloudapp.azure.com/  (Example - Image for Broadcom based platforms is [here]( https://sonic-jenkins.westus2.cloudapp.azure.com/job/broadcom/job/buildimage-brcm-202012/lastSuccessfulBuild/artifact/target/))

# Dependency Version

|Feature                    | Version  |
| ------------------------- | --------------- |
| Linux kernel version      | linux_4.9.0-11-2 (4.9.189-3+deb9u2)   |
| SAI   version             | SAI v1.6.3    |
| FRR                       | 7.2    |
| LLDPD                     | 0.9.6-1    |
| TeamD                     | 1.28-1    |
| SNMPD                     | 5.7.3+dfsg-1.5    |
| Python                    | 3.6.0-1    |
| syncd                     | 1.0.0    |
| swss                      | 1.0.0    |
| radvd                     | 2.17-2~bpo9+1    |
| isc-dhcp                  | 4.3.5-2 ([PR2946](https://github.com/Azure/sonic-buildimage/pull/2946) )   |
| sonic-telemetry           | 0.1    |
| redis-server/ redis-tools | 5.0.3-3~bpo9+2    |


# Security Updates

1. Kernel upgraded from 4.9.110-3deb9u6 (SONiC Release 201904) to 4.9.168-1+deb9u5 in this SONiC release. 
   Change log: https://tracker.debian.org/media/packages/l/linux/changelog-4.9.168-1deb9u5
2. Docker upgraded from 18.09.2\~3-0\~debian-stretch to 18.09.8\~3-0\~debian-stretch. 
   Change log: https://docs.docker.com/engine/release-notes/#18098 

# Feature List

#### Consistent ECMP support (fine grain ECMP)

<br> **Pull Requests** :  [1315](https://github.com/Azure/sonic-swss/pull/1315), [623](https://github.com/Azure/SONiC/pull/623), [1788](https://github.com/Azure/sonic-mgmt/pull/1788), [4985](https://github.com/Azure/sonic-buildimage/pull/4985), [374](https://github.com/Azure/sonic-swss-common/pull/374), [659](https://github.com/Azure/SONiC/pull/659), [1056](https://github.com/Azure/sonic-utilities/pull/1056), [5518](https://github.com/Azure/sonic-buildimage/pull/5518), [5198](https://github.com/Azure/sonic-buildimage/pull/5198), [693](https://github.com/Azure/SONiC/pull/693). 

#### Container warm restart (BGP/TeamD/SWSS/SyncD)
The goal of SONiC warm reboot is to be able restart and upgrade SONiC software without impacting the data plane. Warm restart of each individual process/docker is also part of the goal. Except for syncd and database docker, it is desired for all other network applications and dockers to support un-planned warm restart.

<br> **Pull Requests** :  [392](https://github.com/Azure/sonic-buildimage/pull/3992), [1036](https://github.com/Azure/sonic-utilities/pull/1036/files), [5223](https://github.com/Azure/sonic-buildimage/pull/5233),[5163](https://github.com/Azure/sonic-buildimage/pull/5163/files), [5108](https://github.com/Azure/sonic-buildimage/pull/5108/files) & [1036](https://github.com/Azure/sonic-utilities/pull/1036/files).
#### CoPP Config/Management
<br> **Pull Requests** :

#### Console Support for SONiC (Hardware)
<br> **Pull Requests** :

#### Console Support for SONiC (SSH forwarding)
<br> **Pull Requests** :

#### Dynamic headroom calculation
<br> **Pull Requests** :

#### Enable synchornous SAI APIs (error handling)
<br> **Pull Requests** :

#### EVPN/VXLAN
<br> **Pull Requests** :

#### SONiC entity MIB extensions
<br> **Pull Requests** :

#### FRR BGP NBI
<br> **Pull Requests** :

#### Gearbox
<br> **Pull Requests** :

#### Kubernetes (docker to be controlled by Kubernetes)
<br> **Pull Requests** :

#### MACSec support in Chassis
<br> **Pull Requests** :

#### MC-LAG (L2)
<br> **Pull Requests** :

#### Merge common lib for C++ and python (SWSS common lib)
<br> **Pull Requests** :

#### Move from Python2->python3
<br> **Pull Requests** :

#### Multi-ASIC 202006
<br> **Pull Requests** :

#### Multi-DB enhancement-Part 2
<br> **Pull Requests** :

#### ONIE FW tools
<br> **Pull Requests** :

#### PDDF advance to SONiC Platform 2.0, BMC
<br> **Pull Requests** :

#### PDK - Platform Development Environment
<br> **Pull Requests** :

#### SONiC app extension (w/o orchagent)
<br> **Pull Requests** :

#### Support hardware reboot/reload reason (Streaming Telemetry)
<br> **Pull Requests** :

#### System health and system LED
<br> **Pull Requests** :

#### PCIe Monitoring
<br> **Pull Requests** :

#### Distributed forwarding in a VOQ architecture HLD
<br> **Pull Requests** :

#### Distributed VOQ architecture HLD
<br> **Pull Requests** :

#### Platform Monitoring for Chassis systems
<br> **Pull Requests** :

#### Routing/BGP for Chassis
<br> **Pull Requests** :

#### Fabric Port support for SONiC
<br> **Pull Requests** :

#### LAG Support for Chassis
<br> **Pull Requests** :

#### Chassis infrastructure, T2 topologies and sample Testcases converted
<br> **Pull Requests** :

#### Inband port support for Chassis
<br> **Pull Requests** :

#### Everflow Support
<br> **Pull Requests** :







<br>


# SAI APIs

Please find the list of API's classified along the newly added SAI features. For further details on SAI API please refer [SAI_1.6.3 Release Notes](https://github.com/opencomputeproject/SAI/blob/master/doc/SAI_1.6.3_ReleaseNotes.md)

| S.No | Feature                     | 
| ---- | --------------------------- |
| 1    | MACSEC                      |
| 2    | System Port API             |


# Contributors 

SONiC community would like to thank all the contributors from various companies and the individuals who has contributed for the release. Special thanks to the major contributors - Microsoft, Broadcom, DellEMC, Mellanox, Alibaba, Linkedin, Nephos & Aviz. 

<br>



