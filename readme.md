# Network Bootcamp

## IP Handling

This section provides an overview of IP address management, its importance, and practical applications across various environments, including on-premises, cloud, and virtualized systems.

---

### Key Topics

#### **Introduction to IP Management**
- Assigning unique IP addresses is fundamental for networking.
- Covers basic IP management on:
  - **Windows**
  - **Ubuntu Linux**
  - **Red Hat**

#### **Use Cases**
- Examples include:
  - LAN parties
  - Cloud virtual machines
  - Training setups
- Cloud providers allocate IPv4 and IPv6 addresses for internet connectivity.

#### **IPv4 and IPv6**
- **IPv6** enables dual-stack functionality, allowing communication over both IPv4 and IPv6 networks.

#### **DHCP and IP Allocation**
- **DHCP** automates IP allocation but has limitations, such as lease expiration.
- Amazon VPCs use a built-in DHCP server unless explicitly disabled.

#### **Manual IP Configuration**
- Requires knowledge of:
  - Subnet masks
  - Default gateways
  - DNS
- Preferred for critical servers to ensure reliability and avoid DHCP dependency.

#### **AWS-Specific Details**
- Default gateway and DNS server IPs are typically the first and second IPs in a subnet.
- CIDR blocks determine subnet masks (e.g., `/28` maps to `255.255.255.240`).

#### **Elastic Network Interfaces (ENI)**
- ENIs are detachable network interfaces that can be moved between instances.
- Subnet placement and configuration are critical for ENI setup.

---

### Troubleshooting

#### **Using `ipconfig`**
- The `ipconfig` command provides network details for troubleshooting.
- Use `ipconfig /all` for more detailed information, including MAC addresses.

#### **Windows Subsystem for Linux (WSL)**
- WSL has its own network interface, managed separately from the host machine.

---

### Summary
Understanding IP management is crucial for both on-premises and cloud environments. This section highlights the trade-offs between manual configuration and DHCP automation, emphasizing the importance of proper IP handling for reliable networking.

---

## Windows Networking Tools

### **IP Config**
The `ipconfig` command is used for IP configurations in Windows. Below are its common options:
- `ipconfig`: Lists adapters, IP addresses, default gateway, subnet mask, and other basic information.
- `ipconfig /all`: Displays detailed network information, including MAC addresses.
- `ipconfig /release`: Releases the current IP address.
- `ipconfig /renew`: Renews the IP address.
- `ipconfig /flushdns`: Clears the DNS resolver cache.
- `ipconfig /registerdns`: Registers the DNS with the server.

### **Ping Command**
The `ping` command tests network connectivity. Common options include:
- `ping -t`: Persistent pinging.
- `ping -a`: Resolves an address to a hostname.
- `ping -l <size>`: Specifies the buffer size.
- `ping -i <TTL>`: Sets the time-to-live value.
- `ping -f`: Sets the "do not fragment" flag to test packet fragmentation.

### **Time to Live (TTL)**
The TTL option tests the number of hops between a source and destination:
- Sending packets with a low TTL can help identify network connectivity issues.

### **Trace Route Tool**
The `tracert` command maps the path between a machine and its destination:
- Sends packets with increasing TTL values to identify bottlenecks.
- Options include specifying source address and timeout.

### **NS Lookup**
The `nslookup` tool is DNS-based and used for troubleshooting:
- Look up DNS information.
- Change DNS servers.
- Compare results between different DNS servers (e.g., Google's DNS).

### **Netstat**
The `netstat` tool shows active connections on a computer:
- Helps troubleshoot open and established connections.
- Options include filtering by protocol and displaying routing tables.

### **Public IP**
The public IP interface sends traffic to the internet, while the private interface is used internally.

### **Automatic Private IP Addressing (APIPA)**
APIPA assigns an IP address when DHCP fails:
- Results in an IP address like `169.254.x.x`.

### **Persistent Routes**
Persistent routes can be added using the `-p` option:
- Saves the route across reboots.
- Useful for private services reachable only on private networks.

### **Adding Routes**
Adding a route can redirect traffic to a private network instead of the default internet interface:
- Example: `route add <destination> MASK <subnet_mask> <gateway> -p`

---

## Additional Notes
- Ensure proper IP configuration for critical servers to avoid dependency on DHCP.
- Use tools like `ping`, `tracert`, and `netstat` for troubleshooting network issues.
- Persistent routes are especially useful for maintaining connectivity to private services after system reboots.

---

## Cleanup
To destroy the infrastructure, run:
```bash
terraform destroy
```