# exp-net-fundamentals--2025-Q2
Network Bootcamp


# Network setup in AWS 


# teraform setup

# terraform graph setup

sudo apt update && sudo apt install graphviz -y

terraform init 

terraform graph | dot -Tpng > graph.png


terraform graph | grep -v 'aws_route_table_association' | grep -v 'aws_security_group_rule' | dot -Tpng -o graph-no-assoc.png

