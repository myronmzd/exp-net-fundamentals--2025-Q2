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