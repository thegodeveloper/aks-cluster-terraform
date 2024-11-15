# Azure Subscription ID
variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}

# Azure Location
variable "location" {
  description = "Azure Region where all these resources will be provisioned"
  type        = string
  default     = "Central US"
}

# Azure Resource Group Name
variable "resource_group_name" {
  description = "This variable defines the Resource Group"
  type        = string
  default     = "terraform-aks"
}

# Azure AKS Environment Name
variable "environment" {
  description = "This variable defines the Environment"
  type        = string
  default     = "dev"
}