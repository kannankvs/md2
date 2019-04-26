SONiC is managing configuration in a single source of truth - a redisDB instance that we refer as ConfigDB. Applications subscribe to ConfigDB and generate their running configuration correspondingly.

(Before Sep 2017, we were using an XML file named minigraph.xml to configure SONiC devices. For historical documentation, please refer to [Configuration with Minigraph](https://github.com/Azure/SONiC/wiki/Configuration-with-Minigraph-(~Sep-2017)))

# Config Load and Save

In current version of SONiC, ConfigDB is implemented as database 4 of local redis. When system boots, configurations will be loaded from `/etc/sonic/config_db.json` file into redis. Please note that ConfigDB content won't be written back into `/etc/sonic/config_db.json` file automatically. In order to do that, a `config save` command need to be manually executed from CLI. Similarly, `config load` will trigger a force load of json file into DB. Generally, content in `/etc/sonic/config_db.json` can be considered as starting config, and content in redisDB running config.

We keep a way to load configuration from minigraph and write into ConfigDB for backward compatibility. To do that, run `config load_minigraph`.

### Incremental Configuration

The design of ConfigDB supports incremental configuration - application could subscribe to changes in ConfigDB and response correspondingly. However, this feature is not implemented by all applications yet. By Sep 2017 now, the only application that supports incremental configuration is BGP (docker-fpm-quagga). For other applications, a manual restart is required after configuration changes in ConfigDB.

# Redis and Json Schema
ConfigDB uses a table-object schema that is similar with [AppDB](https://github.com/Azure/sonic-swss/blob/4c56d23b9ff4940bdf576cf7c9e5aa77adcbbdcc/doc/swss-schema.md), and `config_db.json` is a straight-forward serialization of DB. As an example, the following fragments could be BGP-related configuration in redis and json, correspondingly:

```
    127.0.0.1:6379[4]> keys BGP_NEIGHBOR:*
     1) "BGP_NEIGHBOR:10.0.0.31"
     2) "BGP_NEIGHBOR:10.0.0.39"
     3) "BGP_NEIGHBOR:10.0.0.11"
     4) "BGP_NEIGHBOR:10.0.0.7"
     ...

    127.0.0.1:6379[4]> hgetall BGP_NEIGHBOR:10.0.0.3
    1) "admin_status"
    2) "up"
    3) "peer_addr"
    4) "10.0.0.2"
    5) "asn"
    6) "65200"
    7) "name"
    8) "ARISTA07T2"
```

```
    "BGP_NEIGHBOR": {
        "10.0.0.61": {
            "local_addr": "10.0.0.60",
            "asn": 64015,
            "name": "ARISTA15T0"
        },
        "10.0.0.49": {
            "local_addr": "10.0.0.48",
            "asn": 64009,
            "name": "ARISTA09T0"
        },
       ...
    }
```

Full sample config_db.json files are availables at [here](https://github.com/Azure/SONiC/blob/gh-pages/doc/config_db.json)
 and [here](https://github.com/Azure/SONiC/blob/gh-pages/doc/config_db_t0.json).

### Device Metadata
The **DEVICE_METADATA** table contains only one object named _localhost_. In this table the device metadata such as hostname, hwsku, deployment envionment id and deployment type are specified. BGP local AS number is also specified in this table as current only single BGP instance is supported in SONiC.

```
    "DEVICE_METADATA": {
        "localhost": {
            "bgp_asn": 65100,
            "deployment_id": null,
            "hostname": "switch1",
            "type": "LeafRouter",
            "hwsku": "Force10-S6000",
            "mac": ""90:b1:1c:f4:a8:51"
        }
    },
```

### Port
In this table the physical port configurations are defined. Each object will have port name as its key, and port name alias and port speed as optional attributes.
```
    "PORT": {
        "Ethernet0": {
            "alias": "fortyGigE0/0",
            "speed": "40000"
        },
        "Ethernet4": {
            "alias": "fortyGigE0/4"
        },
        "Ethernet8": {
            "alias": "fortyGigE0/8"
        },
        ...
    }
```

### Port Channel
Port channels are defined in **PORTCHANNEL** table with port channel name as object key and member list as attribute.
```
    "PORTCHANNEL": {
        "PortChannel02": {
            "members": [
                "Ethernet116"
            ]
        }, 
        "PortChannel01": {
            "members": [
                "Ethernet112"
            ]
        }, 
    },
```

### VLAN 
This table is where VLANs are defined. VLAN name is used as object key, and member list as well as an integer id are defined as attributes. If a DHCP relay is required for this VLAN, a `dhcp_servers` attribute must be specified for that VLAN, the value of which is a list that must contain the domain name or IP address of one or more DHCP servers.
```
    "VLAN": {
        "Vlan1000": {
            "dhcp_servers": [
                "192.0.0.1", 
                "192.0.0.2", 
                "192.0.0.3", 
                "192.0.0.4" 
            ],
            "members": [
                "Ethernet0", 
                "Ethernet4", 
                "Ethernet8", 
                "Ethernet12"
            ], 
            "vlanid": "1000"
        }
    }, 
```

### VLAN_MEMBER 
VLAN member table has Vlan name together with physical port or port channel name as object key, and tagging mode as attributes.
```
    "VLAN_MEMBER": {
        "Vlan1000|PortChannel47": {
            "tagging_mode": "untagged"
        }, 
        "Vlan1000|Ethernet8": {
            "tagging_mode": "untagged"
        }, 
        "Vlan2000|PortChannel47": {
            "tagging_mode": "tagged"
        }
    }, 
```
### Data Plane L3 Interfaces
IP configuration for data plane are defined in **INTERFACE**, **PORTCHANNEL_INTERFACE**, and **VLAN_INTERFACE** table. The objects in all three tables have the interface (could be physical port, port channel, or vlan) that IP address is attached to as first-level key, and IP prefix as second-level key. IP interface objects don't have any attributes.

```
    "INTERFACE": {
        "Ethernet0|10.0.0.0/31": {},
        "Ethernet4|10.0.0.2/31": {},
        "Ethernet8|10.0.0.4/31": {},
        ...
    },
    "PORTCHANNEL_INTERFACE": {
        "PortChannel01|10.0.0.56/31": {}, 
        "PortChannel01|FC00::71/126": {}, 
        "PortChannel02|10.0.0.58/31": {}, 
        "PortChannel02|FC00::75/126": {}
        ...
    }, 
    "VLAN_INTERFACE": {
        "Vlan1000|192.168.0.1/27": {}
    }, 
```

### Loopback Interface
Loopback interface configuration lies in **LOOPBACK_INTERFACE** table and has similar schema with data plane interfaces. The loopback device name and loopback IP prefix act as multi-level key for loopback interface objects.
```
    "LOOPBACK_INTERFACE": {
        "Loopback0|10.1.0.32/32": {}, 
        "Loopback0|FC00:1::32/128": {}
    }, 
```

### Management Interface 
Management interfaces are defined in **MGMT_INTERFACE** table. Object key is composed of management interface name and IP prefix. Attribute **_gwaddr_** specify the gateway address of the prefix. **_forced_mgmt_routes_** attribute can be used to specify addresses / prefixes traffic to which are forced to go through management network instead of data network.
```
    "MGMT_INTERFACE": {
        "eth0|10.3.100.3/23": {
            "forced_mgmt_routes": [
                "10.0.10.0/29", 
                "10.0.20.5" 
            ], 
            "gwaddr": "10.3.100.1"
        }
    }, 
```

### BGP Sessions
BGP session configuration is defined in **BGP_NEIGHBOR** table. BGP neighbor address is used as key of bgp neighbor objects. Object attributes include remote AS number, neighbor router name, and local peering address. Dynamic neighbor is also supported by defining peer group name and IP ranges in **BGP_PEER_RANGE** table.
```
    "BGP_NEIGHBOR": {
        "10.0.0.61": {
            "local_addr": "10.0.0.60",
            "asn": 64015,
            "name": "ARISTA15T0"
        },
        "10.0.0.49": {
            "local_addr": "10.0.0.48",
            "asn": 64009,
            "name": "ARISTA09T0"
        },
        ...
    },
    "BGP_PEER_RANGE": {
        "PeerGroup": {
            "name": "PeerGroup", 
            "ip_range": [
                "192.168.0.0/27"
            ]
        } 
    }, 
```

### L2 Neighbors
The L2 neighbor and connection information can be configured in **DEVICE_NEIGHBOR** table. Those information are used mainly for LLDP. While mandatory fields include neighbor name acting as object key and remote port / local port information in attributes, optional information about neighbor device such as device type, hwsku, management address and loopback address can also be defined.
 
```
    "DEVICE_NEIGHBOR": {
        "ARISTA04T1": {
            "mgmt_addr": "10.20.0.163", 
            "hwsku": "Arista", 
            "lo_addr": null, 
            "local_port": "Ethernet124", 
            "type": "LeafRouter", 
            "port": "Ethernet1"
        }, 
        "ARISTA03T1": {
            "mgmt_addr": "10.20.0.162", 
            "hwsku": "Arista", 
            "lo_addr": null, 
            "local_port": "Ethernet120", 
            "type": "LeafRouter", 
            "port": "Ethernet1"
        }, 
        "ARISTA02T1": {
            "mgmt_addr": "10.20.0.161", 
            "hwsku": "Arista", 
            "lo_addr": null, 
            "local_port": "Ethernet116", 
            "type": "LeafRouter", 
            "port": "Ethernet1"
        }, 
        "ARISTA01T1": {
            "mgmt_addr": "10.20.0.160", 
            "hwsku": "Arista", 
            "lo_addr": null, 
            "local_port": "Ethernet112", 
            "type": "LeafRouter", 
            "port": "Ethernet1"
        }
    }, 
```


### NTP and SYSLOG servers 
These information are configured in individual tables. Domain name or IP address of the server is used as object key. Currently there are no attributes in those objects.
```
    "NTP_SERVER": {
        "2.debian.pool.ntp.org": {},
        "1.debian.pool.ntp.org": {},
        "3.debian.pool.ntp.org": {},
        "0.debian.pool.ntp.org": {}
    },
    "SYSLOG_SERVER": {}，
```

### ACL and Mirroring
ACL and mirroring related configuration are defined in **MIRROR_SESSION**, **ACL_TABLE** and **ACL_RULE** tables. Those tables are in progress of migrating from APPDB. Please refer to their schema in APPDB [here](https://github.com/Azure/sonic-swss/blob/4c56d23b9ff4940bdf576cf7c9e5aa77adcbbdcc/doc/swss-schema.md) and migration plan [here](https://github.com/Azure/SONiC/wiki/ACL-Configuration-Requirement-Description).

```
    "MIRROR_SESSION": {
        "everflow0": {
            "src_ip": "10.1.0.32",
            "dst_ip": "2.2.2.2"
        }
    },
    "ACL_TABLE": {
         "DATAACL": {
            "policy_desc" : "data_acl",
            "type": "l3",
            "ports": [
                "Ethernet0", 
                "Ethernet4", 
                "Ethernet8", 
                "Ethernet12"
            ] 
        }
    },
```

### Virtual router
The virtual router table allows to insert or update a new virtual router instance. The key of the instance is its name. The attributes in the table allow to change properties of a virtual router.
Attributes:
* 'v4' contains boolean value 'true' or 'false'. Enable or disable IPv4 in the virtual router
* 'v6' contains boolean value 'true' or 'false'. Enable or disable IPv6 in the virtual router
* 'src_mac' contains MAC address. What source MAC address will be used for packets egressing from the virtual router
* 'ttl_action' contains packet action. Defines the action for packets with TTL == 0 or TTL == 1
* 'ip_opt_action' contains packet action. Defines the action for packets with IP options
* 'l3_mc_action' contains packet action. Defines the action for unknown L3 multicast packets

The packet action could be:
* 'drop'
* 'forward'
* 'copy'
* 'copy_cancel'
* 'trap'
* 'log'
* 'deny'
* 'transit'
```
    'VRF:rid1': {
        'v4': 'true',
        'v6': 'false',
        'src_mac': '02:04:05:06:07:08',
        'ttl_action': 'copy',
        'ip_opt_action': 'deny',
        'l3_mc_action': 'drop'
    }
```

# For Developers
## Generating Application Config by Jinja2 Template
To be added.

## Incremental Configuration by Subscribing to ConfigDB
Detail instruction to be added. A sample could be found in this [PR](https://github.com/Azure/sonic-buildimage/pull/861) that implemented dynamic configuration for BGP.

