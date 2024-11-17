# 1. Terraform Settings Block
terraform {
  # 1.1. Required Version Terraform
  required_version = ">= 1.9"

  # 1.2. Required Terraform Providers
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

# 2. Terraform Provider Block for AzureRM
provider "azurerm" {
  subscription_id = var.subscription_id
  features {
  }
}