# tenant
variable "tenant_id" {
  type        = string
  description = "This variable defines the Azure Tenant"
  default     = null
}

# governance subscriptionID
variable "governance_id" {
  type        = string
  description = "This variable defines the Governance Subscription ID"
  default     = null
}

# management subscriptionID
variable "management_id" {
  type        = string
  description = "This variable defines the Management Subscription ID"
  default     = null
}

# shared infrastructure subscriptionID
variable "shared_infrastructure_id" {
  type        = string
  description = "This variable defines the Shared Infrastructure Subscription ID"
  default     = null
}

# automation subscriptionID
variable "automation_id" {
  type        = string
  description = "This variable defines the Automation Subscription ID"
  default     = null
}

# Identity subscriptionID
variable "identity_id" {
  type        = string
  description = "This variable defines the Identity Subscription ID"
  default     = null
}

# Network subscriptionID
variable "network_id" {
  type        = string
  description = "This variable defines the Network Subscription ID"
  default     = null
}

# Shared Services subscriptionID
variable "shared_services_id" {
  type        = string
  description = "This variable defines the Shared Services Subscription ID"
  default     = null
}

# Prod Audit subscriptionID
variable "audit_prod_id" {
  type        = string
  description = "This variable defines the production Audit Subscription ID"
  default     = null
}

# Non Prod Audit subscriptionID
variable "audit_non_prod_id" {
  type        = string
  description = "This variable defines the non prod Audit Subscription ID"
  default     = null
}

# environment
variable "environment" {
  type        = string
  description = "This variable defines the environment to be built"
  default     = "core foundation infrastructure"
}

# azure region
variable "location" {
  type        = string
  description = "Azure region where the resource group will be created"
  default     = "can-east"
}

# azure region A
variable "region_a" {
  type        = string
  description = "First Azure region where the resource group will be created"
  default     = "canadaeast"
}
# azure region B
variable "region_b" {
  type        = string
  description = "Second Azure region where the resource group will be created"
  default     = "canadacentral"
}

variable "tags" {
  description = "Tags to set for all resources"
  type        = map(any)
  default = {
    Environment = "Foundation Platform"
    Project     = "Targray CAF"
    Department  = "Infrastructure"
    Owner       = "Roustam T"
    Cost_Center = "to be filled"
  }
}

variable "settings" {}

variable "shared_infra_rg_r_a" {}
// variable "shared_infra_rg_r_b" {}
// variable "governance_rg_r_a" {}
// variable "governance_rg_r_b" {}
// variable "management_rg_r_a" {}
// variable "management_rg_r_b" {}
// variable "automation_rg_r_a" {}
// variable "automation_rg_r_b" {}
// variable "identity_rg_r_a" {}
// variable "identity_rg_r_b" {}
// variable "network_rg_r_a" {}
// variable "network_rg_r_b" {}
// variable "shared_services_rg_r_a" {}
// variable "shared_services_rg_r_b" {}
// variable "audit_prod_rg_r_b" {}
// variable "audit_non_prod_rg_r_b" {}

variable "network_vnets_r_a" {
  description = "vnet details to be created"
  default = {}
}

// variable "network_vnets_r_b" {
//   description = "vnet details to be created"
//   default = {}
// }

variable "shared_infrastructure_vnets_r_a" {
  description = "vnet details to be created"
  default = {}
}

// variable "shared_infrastructure_vnets_r_b" {
//   description = "vnet details to be created"
//   default = {}
// }

// variable "identity_vnets_r_a" {
//   description = "List of vnets to be created in idenity subscription"
// }

// variable "identity_vnets_r_b" {
//   description = "List of vnets to be created in idenity subscription"
// }

// variable "management_vnets_r_a" {
//   description = "List of vnets to be created in management subscription"
// }

// variable "management_vnets_r_b" {
//   description = "List of vnets to be created in management subscription"
// }

// variable "shared_services_vnets_r_a" {
//   description = "List of vnets to be created in shared services subscription"
// }

// variable "shared_services_vnets_r_b" {
//   description = "List of vnets to be created in shared services subscription"
// }

// variable "governance_vnets_r_a" {
//   description = "List of vnets to be created in governance subscription"
// }

// variable "governance_vnets_r_b" {
//   description = "List of vnets to be created in governance subscription"
// }

variable "shared_infrastructure_akv" {
  description = "list of keyvaults to be created in shared infra subscriptions"
  default = {}
}

variable "identity_akv" {
  description = "list of keyvaults to be created in shared infra subscriptions"
  default = {}
}

variable "governance_akv" {
  description = "list of keyvaults to be created in shared infra subscriptions"
  default = {}
}

variable "shared_services_akv" {
  description = "list of keyvaults to be created in shared infra subscriptions"
  default = {}
}

variable "management_akv" {
  description = "list of keyvaults to be created in shared infra subscriptions"
  default = {}
}

variable "management_akv_l" {
  description = "list of keyvaults to be created in shared infra subscriptions"
  default = {}
}

variable "kvs" {
  description = "list of keyvaults to be created in shared infra subscriptions"
  default = {}
}

variable "storage_accounts" {
  description = "list of storage accounts"
  default = {}
}

variable "shared_infrastructure_sa" {
  description = "list of storage accounts"
  default = {}
}

variable "shared_services_sa" {
  description = "list of storage accounts"
  default = {}
}

variable "governance_sa" {
  description = "list of storage accounts"
  default = {}
}

variable "management_sa" {
  description = "list of storage accounts"
  default = {}
}

variable "dns_zones" {
  description = "list of private dns zones"
  default = {}
}

variable "adc_vms_r_a" {
  description = "List of the windows vms to be created in shared infra subscriptions"
  default = {}
}

variable "adc_vms_r_b" {
  description = "List of the windows vms to be created in shared infra subscriptions"
  default = {}
}

variable "mgt_vms_w_r_a" {
  description = "List of the windows vms to be created in shared infra subscriptions"
  default = {}
}

variable "mgt_vms_w_r_b" {
  description = "List of the windows vms to be created in shared infra subscriptions"
  default = {}
}

variable "mgt_vms_l_r_a" {
  description = "List of the windows vms to be created in shared infra subscriptions"
  default = {}
}

variable "mgt_vms_l_r_b" {
  description = "List of the windows vms to be created in shared infra subscriptions"
  default = {}
}

variable "gov_resource_groups" {
  description = "list of resource groups to be created in governance subscription"
  default = {}
}

variable "pvs" {
  description = "List of purview accounts to be created in governance subscription"
  default = {}
}

variable "lvms" {
  description = "List of the linux vms to be created"
  default = {}
}
variable "wvms" {
  description = "List of the windows vms to be created in shared infra subscriptions"
  default = {}
}
variable "postgre_servers" {
  description = "List of postgre servers to be created"
  default = {}
}
variable "kvs_gov" {
  description = "list of keyvaults in governance subscription"
  default = {}
}
variable "wvms_gov" {
  description = "List of the windows vms to be created in governance subscriptions"
  default = {}
}
variable "recv_svc" {
  description = "recovery service vault configuration"
  default = {}
}
variable "gov_vnets" {
  description = "recovery service vault configuration"
  default = {}
}

variable "ftgvm_a" {
  description = "recovery service vault configuration"
  default = {}
}

variable "ftgvm_b" {
  description = "recovery service vault configuration"
  default = {}
}

variable "public_subnet_id_a" {
  description = "recovery service vault configuration"
  default = {}
}

variable "private_subnet_id_a" {
  description = "recovery service vault configuration"
  default = {}
}

variable "public_subnet_id_b" {
  description = "recovery service vault configuration"
  default = {}
}

variable "private_subnet_id_b" {
  description = "recovery service vault configuration"
  default = {}
}

variable "law_prod_r_b" {
  description = "Log Analytics Prod Region B"
  default = {}
}

variable "law_non_prod_r_b" {
  description = "Log Analytics non Prod Region B"
  default = {}
}
