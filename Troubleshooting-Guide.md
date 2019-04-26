## ​Investigating Packet Drops
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

## Physical Link Signa​​l
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

## SONiC Tech-Support​​ Dump
Generate a dump of troubleshooting data. This is similar to a "show tac" command on other devices. An archive file containing the dump will be saved to the device which can be sent to the SONiC development team for troubleshooting.

- Example:
  ```
  admin@sonic:~$ show techsupport
  ```

## Isolate SONiC Device from the Ne​twork
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