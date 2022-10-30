terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 3.9.0"
    }
    azapi = {
      source  = "azure/azapi"
      version = "~> 0.2.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "__terraformstoragerg__"
    storage_account_name = "__terraformstorageaccount__"
    container_name       = "__containername__"
    key                  = "__storagekey__"
    subscription_id      = "__automationsubscriptionid__"
    tenant_id            = "__tenantid__"
  }

  required_version = ">= 0.15"

}

provider "azurerm" {
  features {}
}


provider "azurerm" {
  alias           = "shared_infrastructure"
  tenant_id       = var.tenant_id
  subscription_id = var.shared_infrastructure_id
  features {
    key_vault {
      recover_soft_deleted_key_vaults = false
      purge_soft_delete_on_destroy    = false
    }
  }
}


data "azurerm_client_config" "current" {}

module "shared_infra_resource_groups_r_a" {
  source   = "../lbckyndryl_coremodule/resource_group"
  for_each = try(var.shared_infra_rg_r_a, {})
  name     = each.value.name
  region   = var.settings.region_a
  tags     = var.tags
  providers = {
    azurerm = azurerm.shared_infrastructure
  }
}


module "shared_infrastructure_virtual_network_r_a" {
  source = "../lbckyndryl_coremodule/virtual_network"
  depends_on = [
    module.shared_infra_resource_groups_r_a
  ]
  for_each = try(var.shared_infrastructure_vnets_r_a, {})
  region = var.settings.region_a
  vnet   = each.value.vnet
  providers = {
    azurerm = azurerm.shared_infrastructure
  }
}

module "private_dns_zone" {
 source = "../lbckyndryl_coremodule/private-dns"
  depends_on = [
    module.shared_infra_resource_groups_r_a
  ]
  for_each = try(var.dns_zones, {})
  name = each.value.details.name
  resource_group_name = each.value.details.resource_group_name
  tags = var.tags
  soa_record = each.value.details.soa_record
  providers = {
    azurerm = azurerm.shared_infrastructure
  }
}


// resource "azurerm_private_dns_zone_virtual_network_link" "hub_network_link_r_a" {
//   for_each = try(var.dns_zones,{})
//     name                  = "${module.private_dns_zone[each.key].name}-${module.network_virtual_network_r_a["vnet01"].name}"
//     resource_group_name   = module.private_dns_zone[each.key].resource_group_name
//     private_dns_zone_name = module.private_dns_zone[each.key].name
//     virtual_network_id    = module.network_virtual_network_r_a["vnet01"].id
//     provider = azurerm.shared_infrastructure
// }


module "shared_infra_key_vault"{
  source = "../lbckyndryl_coremodule/keyvault"
  depends_on = [
    module.shared_infra_resource_groups_r_a,
    module.shared_infrastructure_virtual_network_r_a,
  ]
  for_each = try(var.shared_infrastructure_akv, {})
    name = each.value.details.name
    location = each.value.details.location
    resource_group_name = each.value.details.resource_group_name
    tags = each.value.details.tags
    sku_name = try(each.value.details.sku_name, "standard")
    enabled_for_disk_encryption = try(each.value.details.enabled_for_disk_encryption, false)
    purge_protection_enabled    = try(each.value.details.purge_protection_enabled, false)
    #private_endpoints =  each.value.details.private_endpoints
    virtual_network_subnet_ids = [
      module.shared_infrastructure_virtual_network_r_a["vnet02"].subnets["subnet01"].id,
 
    ]
    providers = {
      azurerm = azurerm.shared_infrastructure
    }
}

module "shared_infra_storage_account" {
  source = "../lbckyndryl_coremodule/storage_account"
  depends_on = [
    module.shared_infra_resource_groups_r_a,
 
  ]
  for_each = try(var.shared_infrastructure_sa, {})
  location = each.value.details.location
  storage_account = each.value.details
  providers = {
    azurerm = azurerm.shared_infrastructure
  }
}

resource "azurerm_key_vault_access_policy" "spn_user_shared_infra_akv_r_a" {
  key_vault_id = module.shared_infra_key_vault["kv1"].id
  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = data.azurerm_client_config.current.object_id

  key_permissions = [
    "Create",
    "Delete",
    "Get",
    "Purge",
    "Recover",
    "Update",
    "List",
    "Decrypt",
    "Sign",
    "WrapKey",
    "UnwrapKey"
  ]

  secret_permissions = [
    "Delete",
    "Get",
    "List",
    "Purge",
    "Recover",
    "Restore",
    "Set"
  ]
  provider = azurerm.shared_infrastructure
}

// resource "azurerm_key_vault_access_policy" "spn_user_shared_infra_akv_r_b" {
//   key_vault_id = module.shared_infra_key_vault["kv2"].id
//   tenant_id = data.azurerm_client_config.current.tenant_id
//   object_id = data.azurerm_client_config.current.object_id

//   key_permissions = [
//     "Create",
//     "Delete",
//     "Get",
//     "Purge",
//     "Recover",
//     "Update",
//     "List",
//     "Decrypt",
//     "Sign",
//     "WrapKey",
//     "UnwrapKey"
//   ]

//   secret_permissions = [
//     "Delete",
//     "Get",
//     "List",
//     "Purge",
//     "Recover",
//     "Restore",
//     "Set"
//   ]
//   provider = azurerm.shared_infrastructure
// }
