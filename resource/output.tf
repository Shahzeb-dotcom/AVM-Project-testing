output "resource_group_names" {
  description = "Names of all resource groups"
  value = { for k, rg in module.resource_group : k => rg.name }
}

output "resource_group_ids" {
  description = "IDs of all resource groups"
  value = { for k, rg in module.resource_group : k => rg.resource_id }
}

output "vnet_ids" {
  description = "IDs of all created VNets"
  value       = { for k, v in module.vnet : k => v.resource_id }
}

output "subnets" {
  description = "All subnets with their names"
  value = {
    for k, v in module.vnet : k => v.subnets
  }
}