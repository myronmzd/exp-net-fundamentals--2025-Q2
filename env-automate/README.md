# exp-net-fundamentals--2025-Q2
Network Bootcamp


# Network setup in AWS 


# teraform setup

# terraform graph setup

sudo apt update && sudo apt install graphviz -y

terraform init 

terraform graph | dot -Tpng > graph.png


terraform graph | grep -v 'aws_route_table_association' | grep -v 'aws_security_group_rule' | grep -v 'aws_route_table.public'|grep -v 'data.http.my_ip'| dot -Tpng -o graph-no-assoc.png

