terraform {
  required_version = "1.5.7"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.73.0"
    }
  }
  backend "azurerm" {}
}
provider "azurerm" {
  subscription_id = "fe790859-8eda-4568-b4d4-07fca54605e4"
  features {}
  alias = "user"
}

data "azurerm_key_vault" "automation" {
  name                = "automata-kv"
  resource_group_name = "automata"
  provider            = azurerm.user
}

data "azurerm_key_vault_secret" "arm_secret" {
  name         = "arm-client-secret"
  key_vault_id = data.azurerm_key_vault.automation.id
  provider     = azurerm.user
}

provider "azurerm" {
  client_id       = "5103dd4a-faad-4fc7-b96b-6f10cb7bbc66"
  client_secret   = data.azurerm_key_vault_secret.arm_secret
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  features {}
}

module "base" {
  source = "github.com/enthuzest/zentral//modules/base"
}
