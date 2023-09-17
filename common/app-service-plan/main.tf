locals {
  application_name = "zentral"
  asp_name         = "zentral-${var.environment}"
}

resource "azurerm_resource_group" "primary_asp_rg" {
  name     = "${local.application_name}-${var.environment}-rg"
  location = var.location
}

resource "azurerm_service_plan" "asp" {
  name                = "${local.asp_name}-asp"
  location            = azurerm_resource_group.primary_asp_rg.location
  resource_group_name = azurerm_resource_group.primary_asp_rg.name
  os_type             = "Windows"
  sku_name            = "S1"
}
