tenant_id                 = "af522924-ada5-40a3-b9ee-144a66ae316a"
shared_infrastructure_id  = "c149b096-a7b6-4ea7-ad20-0ca3d31031ba"

shared_infra_rg_r_a = {
  rg1 = {
    name = "rg-caea-inf-net-01"
  }
  rg2 = {
    name = "rg-caea-inf-net-02"
  }
  rg3 = {
    name = "rg-caea-inf-akv-01"
  }
  rg4 = {
    name = "rg-caea-inf-sac-01"
  }
  rg5 = {
    name = "rg-caea-inf-dns-01"
  }
  rg6 = {
    name = "rg-caea-inf-mgt-01"
  }
  
 
}


tags = {
  Environment = "Foundation Platform"
  Project     = "lbckyndryl"
  Department  = "Infrastructure"
  Owner       = "lbckyndryl"
  Cost_Center = "to be filled"
}

settings = {
  region_a = "canadaeast"

}

shared_infrastructure_vnets_r_a = {
  vnet01 = {
    vnet = {
      name = "vnet-caea-sinf-01"
      //dns = [""]
      address_space  = ["10.240.1.0/24"]
      specialsubnets = {}
      subnets = {
        subnet01 = {
          nsg_name = "nsg-caea-sinf-snet-01"
          nsg_key  = "nsg-caea-sinf-snet-01"
          name     = "subnet01"
          cidr     = ["10.240.1.0/25"]
          route_table = {
            route_table_name = "rt-caea-net01-s01-01"
            resource_group_name = "rg-caea-inf-net-01"
            routes = [
                {
                    name = "egress-all-via-ftg"
                    address_prefix = "0.0.0.0/0"
                    next_hop_type = "VirtualAppliance"
                    next_hop_in_ip_address = "10.240.0.132"
                }
            ]
          }
        }
        subnet02 = {
          nsg_name = "nsg-caea-sinf-snet-02"
          nsg_key  = "nsg-caea-sinf-snet-02"
          name     = "subnet02"
          cidr     = ["10.240.1.128/25"]
          route_table = {
            route_table_name = "rt-caea-net01-s02-01"
            resource_group_name = "rg-caea-inf-net-01"
            routes = [
                {
                    name = "egress-all-via-ftg"
                    address_prefix = "0.0.0.0/0"
                    next_hop_type = "VirtualAppliance"
                    next_hop_in_ip_address = "10.240.0.132"
                }
            ]
          }
        }
      }
      network_security_group_definition = {
        nsg-caea-sinf-snet-01 = {
          nsg = []
        },
        nsg-caea-sinf-snet-02 = {
          nsg = []
        }
      }
      ddos_id             = ""
      resource_group_name = "rg-caea-inf-net-01"
      tags = {
        Environment = "Foundation Platform"
        Project     = "lbckyndryl"
        Department  = "Infrastructure"
        Owner       = "lbckyndryl"
        Cost_Center = "to be filled"
      }
      diagnostics         = {}
      diagnostic_profiles = null
    }
  }
  vnet02 = {
    vnet = {
      name = "vnet-caea-sinf-02"
      //dns = [""]
      address_space  = ["10.240.2.0/24"]
      specialsubnets = {}
      subnets = {
        subnet01 = {
          nsg_name = "nsg-caea-sinf-snet-03"
          nsg_key  = "nsg-caea-sinf-snet-03"
          name     = "subnet01"
          cidr     = ["10.240.2.0/24"]
          route_table = {
            route_table_name = "rt-caea-net02-s01-01"
            resource_group_name = "rg-caea-inf-net-02"
            routes = [
                {
                    name = "egress-all-via-ftg"
                    address_prefix = "0.0.0.0/0"
                    next_hop_type = "VirtualAppliance"
                    next_hop_in_ip_address = "10.240.0.132"
                }
            ]
          }
          service_endpoints = [
            "Microsoft.KeyVault",
            "Microsoft.Storage"
          ]
        }
      }
      network_security_group_definition = {
        nsg-caea-sinf-snet-03 = {
          nsg = []
        }
      }
      ddos_id             = ""
      resource_group_name = "rg-caea-inf-net-02"
      tags = {
        Environment = "Foundation Platform"
        Project     = "lbckyndryl"
        Department  = "Infrastructure"
        Owner       = "lbckyndryl"
        Cost_Center = "to be filled"
      }
      diagnostics         = {}
      diagnostic_profiles = null
    }
  }
 
  vnet03 = {
    vnet = {
      name = "vnet-caea-mgt-02"
      //dns = [""]
      address_space  = ["10.240.1.0/24"]
      specialsubnets = {}
      subnets = {
        subnet01 = {
          nsg_name = "nsg-caea-sinf-snet-04"
          nsg_key  = "nsg-caea-sinf-snet-04"
          name     = "subnet01"
          cidr     = ["10.240.1.0/24"]
          route_table = {
            route_table_name = "rt-caea-net02-s01-01"
            resource_group_name = "rg-caea-inf-mgt-01"
            routes = [
                {
                    name = "egress-all-via-ftg"
                    address_prefix = "0.0.0.0/0"
                    next_hop_type = "VirtualAppliance"
                    next_hop_in_ip_address = "10.240.0.132"
                }
            ]
          }
          service_endpoints = [
            "Microsoft.KeyVault",
            "Microsoft.Storage"
          ]
        }
      }
      network_security_group_definition = {
        nsg-caea-sinf-snet-04 = {
          nsg = []
        }
      }
      ddos_id             = ""
      resource_group_name = "rg-caea-inf-mgt-01"
      tags = {
        Environment = "Foundation Platform"
        Project     = "lbckyndryl"
        Department  = "Infrastructure"
        Owner       = "lbckyndryl"
        Cost_Center = "to be filled"
      }
      diagnostics         = {}
      diagnostic_profiles = null
    }
  }
 
}


shared_infrastructure_akv = {
  kv1 = {
    details = {
      name = "akv-cace-inf-akv2910"
      resource_group_name = "rg-caea-inf-akv-01"
      location = "canadaeast"
      tags = {
        Environment = "Foundation Platform"
        Project     = "lbckyndryl"
        Department  = "Infrastructure"
        Owner       = "lbckyndryl"
        Cost_Center = "to be filled"
      }
      sku_name       = "standard"
      enabled_for_disk_encryption = true
      purge_protection_enabled    = true

    }
  }

}


shared_infrastructure_sa = {
  sa1 = {
    details = {
      resource_group_name = "rg-caea-inf-sac-01"
      name =  "sacaeainfsin0228"
      account_tier = "Standard"
      account_replication_type = "LRS"
      location = "canadaeast"
      blob_properties = true
      network = {
          default_action = "Deny"
          ip_rules       = []
          subnet_ids = []
          bypass = ["AzureServices"]
      }
      blob_properties = {
        delete_retention_policy = true
        delete_retention_policy = {
            days = 30
        }
      }
    
    }
  }
  sa2 = {
    details = {
      resource_group_name = "rg-caea-inf-sac-01"
      name =  "sacaceinfsin0230"
      account_tier = "Standard"
      location = "canadaeast"
      account_replication_type = "LRS"
      blob_properties = true
      network = {
          default_action = "Deny"
          ip_rules       = []
          subnet_ids = []
          bypass = ["AzureServices"]
      }
      blob_properties = {
        delete_retention_policy = true
        delete_retention_policy = {
            days = 30
        }
      }
      

    }
  }
}


dns_zones = {
  blob = {
    details = {
      name = "privatelink.blob.core.windows.net"
      resource_group_name = "rg-caea-inf-dns-01"
      tags = {
        Environment = "Foundation Platform"
        Project     = "lbckyndryl"
        Department  = "Infrastructure"
        Owner       = "lbckyndryl"
        Cost_Center = "to be filled"
      }
      soa_record = {
        email = "azureprivatedns-host.microsoft.com"
      }
    }
  }
  postgres = {
    details = {
      name = "privatelink.postgres.database.azure.com"
      resource_group_name = "rg-caea-inf-dns-01"
      tags = {
        Environment = "Foundation Platform"
        Project     = "lbckyndryl"
        Department  = "Infrastructure"
        Owner       = "lbckyndryl"
        Cost_Center = "to be filled"
      }
      soa_record = {
        email = "azureprivatedns-host.microsoft.com"
      }
    }
  }
  vault = {
    details = {
      name = "privatelink.vaultcore.azure.net"
      resource_group_name = "rg-caea-inf-dns-01"
      tags = {
        Environment = "Foundation Platform"
        Project     = "lbckyndryl"
        Department  = "Infrastructure"
        Owner       = "lbckyndryl"
        Cost_Center = "to be filled"
      }
      soa_record = {
        email = "azureprivatedns-host.microsoft.com"
      }
    }
  }
  datafactory = {
    details = {
      name = "privatelink.datafactory.azure.net"
      resource_group_name = "rg-caea-inf-dns-01"
      tags = {
        Environment = "Foundation Platform"
        Project     = "lbckyndryl"
        Department  = "Infrastructure"
        Owner       = "lbckyndryl"
        Cost_Center = "to be filled"
      }
      soa_record = {
        email = "azureprivatedns-host.microsoft.com"
      }
    }
  }
  
 
  storagequeue = {
    details = {
      name = "privatelink.queue.core.windows.net"
      resource_group_name = "rg-caea-inf-dns-01"
      tags = {
        Environment = "Foundation Platform"
        Project     = "lbckyndryl"
        Department  = "Infrastructure"
        Owner       = "lbckyndryl"
        Cost_Center = "to be filled"
      }
      soa_record = {
        email = "azureprivatedns-host.microsoft.com"
      }
    }
  }
  servicebus = {
    details = {
      name = "privatelink.servicebus.windows.net"
      resource_group_name = "rg-caea-inf-dns-01"
      tags = {
        Environment = "Foundation Platform"
        Project     = "lbckyndryl"
        Department  = "Infrastructure"
        Owner       = "lbckyndryl"
        Cost_Center = "to be filled"
      }
      soa_record = {
        email = "azureprivatedns-host.microsoft.com"
      }
    }
  }
  file = {
    details = {
      name = "privatelink.file.core.windows.net"
      resource_group_name = "rg-caea-inf-dns-01"
      tags = {
        Environment = "Foundation Platform"
        Project     = "lbckyndryl"
        Department  = "Infrastructure"
        Owner       = "lbckyndryl"
        Cost_Center = "to be filled"
      }
      soa_record = {
        email = "azureprivatedns-host.microsoft.com"
      }
    }
  }
  dfs = {
    details = {
      name = "privatelink.dfs.core.windows.net"
      resource_group_name = "rg-caea-inf-dns-01"
      tags = {
        Environment = "Foundation Platform"
        Project     = "lbckyndryl"
        Department  = "Infrastructure"
        Owner       = "lbckyndryl"
        Cost_Center = "to be filled"
      }
      soa_record = {
        email = "azureprivatedns-host.microsoft.com"
      }
    }
  }
  datafactory-portal = {
    details = {
      name = "privatelink.adf.azure.com"
      resource_group_name = "rg-caea-inf-dns-01"
      tags = {
        Environment = "Foundation Platform"
        Project     = "lbckyndryl"
        Department  = "Infrastructure"
        Owner       = "lbckyndryl"
        Cost_Center = "to be filled"
      }
      soa_record = {
        email = "azureprivatedns-host.microsoft.com"
      }
    }
  }
 
  azuresqldatabase = {
    details = {
      name = "privatelink.database.windows.net"
      resource_group_name = "rg-caea-inf-dns-01"
      tags = {
        Environment = "Foundation Platform"
        Project     = "lbckyndryl"
        Department  = "Infrastructure"
        Owner       = "lbckyndryl"
        Cost_Center = "to be filled"
      }
      soa_record = {
        email = "azureprivatedns-host.microsoft.com"
      }
    }
  }
  synapseanalytics = {
    details = {
      name = "privatelink.sql.azuresynapse.net"
      resource_group_name = "rg-caea-inf-dns-01"
      tags = {
        Environment = "Foundation Platform"
        Project     = "lbckyndryl"
        Department  = "Infrastructure"
        Owner       = "lbckyndryl"
        Cost_Center = "to be filled"
      }
      soa_record = {
        email = "azureprivatedns-host.microsoft.com"
      }
    }
  }
  synapseanalyticsdev = {
    details = {
      name = "privatelink.dev.azuresynapse.net"
      resource_group_name = "rg-caea-inf-dns-01"
      tags = {
        Environment = "Foundation Platform"
        Project     = "lbckyndryl"
        Department  = "Infrastructure"
        Owner       = "lbckyndryl"
        Cost_Center = "to be filled"
      }
      soa_record = {
        email = "azureprivatedns-host.microsoft.com"
      }
    }
  }
  synapsestudio = {
    details = {
      name = "privatelink.azuresynapse.net"
      resource_group_name = "rg-caea-inf-dns-01"
      tags = {
        Environment = "Foundation Platform"
        Project     = "lbckyndryl"
        Department  = "Infrastructure"
        Owner       = "lbckyndryl"
        Cost_Center = "to be filled"
      }
      soa_record = {
        email = "azureprivatedns-host.microsoft.com"
      }
    }
  }
  storagetable = {
    details = {
      name = "privatelink.table.core.windows.net"
      resource_group_name = "rg-caea-inf-dns-01"
      tags = {
        Environment = "Foundation Platform"
        Project     = "lbckyndryl"
        Department  = "Infrastructure"
        Owner       = "lbckyndryl"
        Cost_Center = "to be filled"
      }
      soa_record = {
        email = "azureprivatedns-host.microsoft.com"
      }
    }
  }
 
  
 
}
