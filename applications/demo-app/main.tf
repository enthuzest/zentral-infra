locals {
  application_name                      = "demofaraz841"
  application_name_with_sub_environment = "${local.application_name}-${var.sub_environment}"
  server_name                           = "zentral-${var.environment}"

  app_settings = {
    APPINSIGHTS_INSTRUMENTATIONKEY = azurerm_application_insights.appi.instrumentation_key
    WEBSITE_RUN_FROM_PACKAGE       = 1
  }

}

data "azurerm_app_service_plan" "primary-asp" {
  name                = "zentral-${var.environment}-asp"
  resource_group_name = "zentral-${var.environment}-rg"
}

data "azurerm_mssql_server" "sql" {
  name                = "${local.server_name}-server"
  resource_group_name = "zentral-sql-${var.environment}-rg"
}

resource "azurerm_resource_group" "primary_rg" {
  name     = "${local.application_name_with_sub_environment}-rg"
  location = var.location
}

resource "azurerm_application_insights" "appi" {
  name                = "${local.application_name_with_sub_environment}-appi"
  location            = azurerm_resource_group.primary_rg.location
  resource_group_name = azurerm_resource_group.primary_rg.name
  application_type    = "web"
}
