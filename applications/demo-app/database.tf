module "demo-app-db" {
  source        = "github.com/faraz841/Zentral//modules/database"
  database_name = local.application_name_with_sub_environment
  server_id     = data.azurerm_mssql_server.sql.id
  tags          = var.tags
}
