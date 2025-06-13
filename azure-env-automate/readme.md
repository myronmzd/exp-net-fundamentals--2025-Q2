# azure setup

Region Name	Location Code
Central India	Central India
South India	South India
West India (Mumbai)	West India


AS the security group is attached to subnet1 so to rdp to work


This attaches both NICs to the VM:

nic1 → subnet1

nic2 → subnet2

But Azure uses the first NIC (nic1) as the primary NIC by default.

✅ So the VM is in:
Primary subnet = subnet1 (because nic1 is first)

Secondary subnet = subnet2 (attached as secondary NIC)