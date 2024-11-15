# Azure Subscription ID
variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}

# Azure Location
variable "location" {
  type = string
  description = "Azure Region where all these resources will be provisioned"
  default = "Central US"
}

# Azure Resource Group Name
variable "resource_group_name" {
  description = "This variable defines the Resource Group"
  type        = string
  default     = "terraform-storage-rg"
}

# Azure Storage Account Definition
variable "storage_account_name" {
  description = "Storage Account Name"
  type        = string
  default     = "aksgodeveloperio"
}

variable "storage_account_tier" {
  description = "Storage Account Tier"
  type        = string
  default     = "Standard"
}

variable "storage_account_replication_type" {
  description = "Storage Account Replication Type"
  type        = string
  default     = "LRS"
}

variable "storage_container_name" {
  description = "Storage Container Name"
  type        = string
  default     = "tfstatefiles"
}

variable "storage_container_access_type" {
  description = "Storage Container Access Type"
  type        = string
  default     = "private"
}