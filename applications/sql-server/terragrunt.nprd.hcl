locals {
    workspace       = "stellar"
    sub_environment = "dev"
    environment     = "nprd"
    location        = "australiasoutheast"
    tags            = {
        "BusinessOwner"  = "alpha pandey"
        "CostCode"       = "C4-420"
        "TechnicalOwner" = "beta biswas"
    }
}

inputs = {
    tags            = local.tags
    environment     = local.environment
    sub_environment = local.sub_environment
    location        = local.location
}

remote_state {
    backend = "azurerm"
    config  = {
        resource_group_name  = "state-${local.environment}-rg"
        storage_account_name = "zentraltfstate${local.environment}"
        container_name       = "state"
        key                  = "${local.workspace}/${local.sub_environment}/terraform.tfstate"
    }
}