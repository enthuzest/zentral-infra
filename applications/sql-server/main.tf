locals {
  application_name = "zentral"
  server_name      = "zentral-${var.sub_environment}"
}

resource "azurerm_resource_group" "sql-server-rg" {
  name     = "${local.application_name}-sql-${var.sub_environment}-rg"
  location = var.location
  tags     = var.tags
}

resource "azurerm_mssql_server" "sql_server" {
  name                = local.server_name
  resource_group_name = azurerm_resource_group.sql-server-rg.name
  location            = azurerm_resource_group.sql-server-rg.location
  version             = "12.0"
  minimum_tls_version = "1.2"

  azuread_administrator {
    login_username              = "SRE"
    object_id                   = "8f3be7c8-e44f-4419-b2bb-ff32d6932f60"
    azuread_authentication_only = true
  }

  tags = var.tags
}

resource "azurerm_mssql_firewall_rule" "allow_azure_resources" {
  name             = "AllowAzureResources"
  server_id        = azurerm_mssql_server.sql_server.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}

resource "azurerm_mssql_firewall_rule" "network_rules" {
  count            = length(module.base.trusted_ip_ranges)
  name             = module.base.trusted_ip_ranges[count.index].name
  server_id        = azurerm_mssql_server.sql_server.id
  start_ip_address = module.base.trusted_ip_ranges[count.index].network
  end_ip_address   = module.base.trusted_ip_ranges[count.index].network
}
