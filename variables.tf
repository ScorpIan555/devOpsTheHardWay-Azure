variable "name" {
  type        = string
  default     = "iandevopsthehardway"
  description = "Name for resources"
}

variable "location" {
  type        = string
  default     = "centralindia"
  description = "Azure Location of resources"
}

variable "network_address_space" {
  type        = string
  description = "Azure VNET Address Space"
}

variable "aks_subnet_address_name" {
  type        = string
  description = "AKS Subnet Address Name"
}

variable "aks_subnet_address_prefix" {
  type        = string
  description = "AKS Subnet Address Space"
}

variable "subnet_address_name" {
  type        = string
  description = "Subnet Address Name"
}

variable "subnet_address_prefix" {
  type        = string
  description = "Subnet Address Space"
}

# # # variable "addons" {
# # #   description = "Defines which addons will be activated."
# # #   type = object({
# # #     oms_agent                   = bool
# # #     ingress_application_gateway = bool
# # #   })
# # # }

# # variable "addons" {
# #   description = "Defines which addons will be activated."
# #   type = object({
# #     oms_agent                   = bool
# #     ingress_application_gateway = bool
# #   })
# # }

# # # per docs, this is now a default setting
# # # variable "kubernetes_cluster_rbac_enabled" {
# # #   default = "true"
# # # }

variable "kubernetes_version" {
}

variable "agent_count" {
}

variable "vm_size" {
}

variable "ssh_public_key" {
}

# # # variable "aks_admins_group_object_id" {
# # # }"network_address_space" {
# #   type        = string
# #   description = "Azure VNET Address Space"
# # }

# # variable "aks_subnet_address_name" {
# #   type        = string
# #   description = "AKS Subnet Address Name"
# # }

# # variable "aks_subnet_address_prefix" {
# #   type        = string
# #   description = "AKS Subnet Address Space"
# # }

# # variable "subnet_address_name" {
# #   type        = string
# #   description = "Subnet Address Name"
# # }

# # variable "subnet_address_prefix" {
# #   type        = string
# #   description = "Subnet Address Space"
# # }

# # # variable "addons" {
# # #   description = "Defines which addons will be activated."
# # #   type = object({
# # #     oms_agent                   = bool
# # #     ingress_application_gateway = bool
# # #   })
# # # }

# # variable "addons" {
# #   description = "Defines which addons will be activated."
# #   type = object({
# #     oms_agent                   = bool
# #     ingress_application_gateway = bool
# #   })
# # }

# # # per docs, this is now a default setting
# # # variable "kubernetes_cluster_rbac_enabled" {
# # #   default = "true"
# # # }

# # variable "kubernetes_version" {
# # }

# # variable "agent_count" {
# # }

# # variable "vm_size" {
# # }

# # variable "ssh_public_key" {
# # }

# # # variable "aks_admins_group_object_id" {
# # # }