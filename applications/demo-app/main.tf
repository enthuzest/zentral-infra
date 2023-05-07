locals {
  application_name                      = "demofaraz841"
  application_name_with_sub_environment = "${local.application_name}-${var.sub_environment}"

  app_settings = {
    APPINSIGHTS_INSTRUMENTATIONKEY = azurerm_application_insights.appi.instrumentation_key
    WEBSITE_RUN_FROM_PACKAGE       = 1
  }

}

resource "azurerm_resource_group" "primary_rg" {
  name     = "${local.application_name_with_sub_environment}-rg"
  location = var.location
}
