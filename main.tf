terraform {
  required_version = ">= 0.14.8"
  required_providers {
    azurerm = {
      source  = "registry.terraform.io/hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  cloud {
    organization = "insight"

    workspaces {
      name = "tngonephetsy-terraform-training"
    }
  }
}

provider "azurerm" {
  features {}
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "example" {
  name                     = "storageaccountname"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = local.tags
}