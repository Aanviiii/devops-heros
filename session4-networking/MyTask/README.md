# Networking Homework

## Commands Practiced

### 1. ping

```bash
ping google.com
```

**Purpose:** Checks network connectivity and measures the time taken for packets to reach a destination and return.

**Output/Screenshot:** 

Pinging google.com [142.250.207.174] with 32 bytes of data:
Reply from 142.250.207.174: bytes=32 time=21ms TTL=117
Reply from 142.250.207.174: bytes=32 time=22ms TTL=117
Reply from 142.250.207.174: bytes=32 time=22ms TTL=117
Reply from 142.250.207.174: bytes=32 time=21ms TTL=117

Ping statistics for 142.250.207.174:
    Packets: Sent = 4, Received = 4, Lost = 0 (0% loss),
Approximate round trip times in milli-seconds:
    Minimum = 21ms, Maximum = 22ms, Average = 21ms


---

### 2. traceroute / tracert

```bash
traceroute google.com
```

**Purpose:** Shows the path (hops) that packets take from your device to the destination server.

**Output/Screenshot:** 

Tracing route to google.com [142.250.207.174]
over a maximum of 30 hops:

  1    12 ms     4 ms     3 ms  wifi.height8tech.com [10.114.0.1] 
  2     7 ms     5 ms     4 ms  202.131.133.17.convergentindia.com [202.131.133.17] 
  3     9 ms     9 ms    24 ms  115.117.125.189.static-mumbai.vsnl.net.in [115.117.125.189] 
  4     *        *        *     Request timed out.
  5    10 ms     9 ms    92 ms  115.112.15.114.static-chennai.vsnl.net.in [115.112.15.114] 
  6     9 ms    12 ms    10 ms  216.239.43.135 
  7    20 ms    13 ms    10 ms  142.251.50.58 
  8    65 ms    22 ms    21 ms  142.251.252.95 
  9    36 ms    24 ms    27 ms  192.178.254.230 
 10    24 ms    24 ms    23 ms  142.250.209.71 
 11    35 ms    20 ms    21 ms  142.250.214.113 
 12    23 ms    22 ms    22 ms  pnbomb-bl-in-f14.1e100.net [142.250.207.174] 

Trace complete.

---

### 3. ifconfig / ip addr

```bash
ifconfig
```

or

```bash
ip addr
```

**Purpose:** Displays network interface information, including IP addresses.

**Output/Screenshot:** 

Windows IP Configuration


Wireless LAN adapter Local Area Connection* 1:

   Media State . . . . . . . . . . . : Media disconnected
   Connection-specific DNS Suffix  . : 

Wireless LAN adapter Local Area Connection* 2:

   Media State . . . . . . . . . . . : Media disconnected
   Connection-specific DNS Suffix  . : 

Wireless LAN adapter Wi-Fi:

   Connection-specific DNS Suffix  . : 
   Link-local IPv6 Address . . . . . : fe80::e494:53e1:e20b:30f4%14
   IPv4 Address. . . . . . . . . . . : 10.114.2.185
   Subnet Mask . . . . . . . . . . . : 255.255.248.0
   Default Gateway . . . . . . . . . : fe80::f61e:57ff:fe3d:aedf%14
                                       10.114.0.1

Ethernet adapter Ethernet:

   Media State . . . . . . . . . . . : Media disconnected
   Connection-specific DNS Suffix  . : 


---

### 4. nslookup

```bash
nslookup google.com
```

**Purpose:** Queries DNS servers to obtain the IP address associated with a domain name.

**Output/Screenshot:** 

Server:  wifi.height8tech.com
Address:  10.114.0.1

Non-authoritative answer:
Name:    google.com
Addresses:  2404:6800:4000:101f::64
          2404:6800:4000:101f::65
          2404:6800:4000:101f::66
          2404:6800:4000:101f::8a
          142.250.207.174

---

### 5. telnet

```bash
telnet google.com 80
```

**Purpose:** Tests TCP connectivity to a remote host and port.

**Output/Screenshot:** 

ComputerName     : google.com                                                                                                                 
RemoteAddress    : 192.178.174.113                                                                                                            
RemotePort       : 80                                                                                                                         
InterfaceAlias   : Wi-Fi                                                                                                                      
SourceAddress    : 10.114.2.185                                                                                                               
TcpTestSucceeded : True

---

## Concepts Learned

### IP Address

A unique address used to identify a device on a network.

### Subnetting & CIDR

Subnetting divides a network into smaller networks. CIDR provides flexible IP address allocation.

### DHCP

Automatically assigns IP addresses to devices on a network.

### NAT

Allows multiple devices to share a single public IP address.

### DNS

Converts domain names into IP addresses.

### OSI Model

A 7-layer model that explains how network communication works.

### TCP vs UDP

| TCP                 | UDP                   |
| ------------------- | --------------------- |
| Reliable            | Faster                |
| Connection-oriented | Connectionless        |
| Guarantees delivery | No delivery guarantee |

### HTTP vs HTTPS

* HTTP: Transfers web data.
* HTTPS: HTTP with encryption using TLS/SSL.

### Network Security

* Use HTTPS instead of HTTP.
* Use firewalls to restrict unnecessary traffic.
* Use VPNs for secure remote access.
* TLS certificates encrypt communication between client and server.
