output "infrastructure_details" {
  description = "Details of the created infrastructure"
  value = {
    vpc_id             = module.network.vpc_id
    public_subnet_id   = module.network.subnet_id_public
    private_subnet_id  = module.network.subnet_id_private
    instance_id        = module.compute.instance_id
    instance_public_ip = module.compute.public_ip
  }
}