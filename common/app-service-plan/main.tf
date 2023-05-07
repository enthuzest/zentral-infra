locals {
  application_name = "zentral"
  asp_name         = "zentral-${var.environment}"
}

resource "azurerm_resource_group" "example" {
  name     = "${local.application_name}-asp-${var.environment}-rg"
  location = var.location
}

resource "azurerm_app_service_plan" "example" {
  name                = "${local.asp_name}-asp"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}
