terraform {
  required_version = "~>1.12.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.3.0"
    }
  }
  backend "azurerm" {}
}

provider "azurerm" {
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  features {}
}

module "base" {
  source = "github.com/enthuzest/zentral//modules/base"
}