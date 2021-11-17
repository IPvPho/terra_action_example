lab_sub_id = "36da3bc2-eb83-40a4-af64-1a82600d830f"

rg = {
  name = "rg-hc-demo-westus2-alpha"
  location = "westus2"
  tags = {
    Owner = "Azure DevOps"
  }
}

rgs = {
  rg_one = {
    name     = "rg-demo-iac-westus2-01"
    location = "westus2"
    tags = {
      ApplicationName     = "ACETECHWEEK"
      AppTypeRole         = "RG"
      DataProtection      = "NotProtected"
      DRTier              = "None"
      Environment         = "ATS"
      Location            = "USW2Z"
      NotificationContact = "johhess@cdw.com"
      ProductCostCenter   = "ATS"
      SupportResponseSLA  = "None"
      WorkloadType        = "WebServer"
      Owner               = "John Hession"
    }
  }
  rg_two = {
    name     = "rg-demo-iac-westus2-02"
    location = "westus2"
    tags = {
      ApplicationName     = "ACETECHWEEK"
      AppTypeRole         = "RG"
      DataProtection      = "NotProtected"
      DRTier              = "None"
      Environment         = "ATS"
      Location            = "USW2Z"
      NotificationContact = "johhess@cdw.com"
      ProductCostCenter   = "ATS"
      SupportResponseSLA  = "None"
      WorkloadType        = "WebServer"
      Owner               = "John Hession"
    }
  }
  rg_three = {
    name     = "rg-demo-iac-westus2-03"
    location = "westus2"
    tags = {
      ApplicationName     = "ACETECHWEEK"
      AppTypeRole         = "RG"
      DataProtection      = "NotProtected"
      DRTier              = "None"
      Environment         = "ATS"
      Location            = "USW2Z"
      NotificationContact = "johhess@cdw.com"
      ProductCostCenter   = "ATS"
      SupportResponseSLA  = "None"
      WorkloadType        = "WebServer"
      Owner               = "John Hession"
    }
  }
}

vnets = {
  vnet_alpha = {
    name                = "vnet-alpha"
    location            = "westus2"
    resource_group_name = "rg-demo-iac-westus2-01"
    address_space       = ["10.0.0.0/16"]
    subnets = {
      subnet_one = {
        name           = "dev"
        address_prefix = "10.0.1.0/24"
      }
      subnet_two = {
        name           = "test"
        address_prefix = "10.0.2.0/24"
      }
      subnet_three = {
        name           = "prod"
        address_prefix = "10.0.3.0/24"
      }
    }
  }
  vnet_bravo = {
    name                = "vnet-bravo"
    location            = "westus2"
    resource_group_name = "rg-demo-iac-westus2-02"
    address_space       = ["192.168.0.0/16"]
    dns_servers         = ["192.168.0.6", "192.168.0.7"]
    subnets = {
      subnet_one = {
        name           = "dev"
        address_prefix = "192.168.0.0/24"
      }
      subnet_two = {
        name           = "test"
        address_prefix = "192.168.1.0/24"
      }
      subnet_three = {
        name           = "prod"
        address_prefix = "192.168.2.0/24"
      }
    }
  }
  vnet_charlie = {
    name                = "vnet-charlie"
    location            = "westus2"
    resource_group_name = "rg-demo-iac-westus2-03"
    address_space       = ["172.16.0.0/16"]
    dns_servers         = ["172.16.0.6", "172.16.0.7"]
    subnets = {
      subnet_one = {
        name           = "dev"
        address_prefix = "172.16.0.0/24"
      }
      subnet_two = {
        name           = "test"
        address_prefix = "172.16.1.0/24"
      }
      subnet_three = {
        name           = "prod"
        address_prefix = "172.16.2.0/24"
      }
    }
  }
}

peers = {
  alpha_to_bravo = {
    name           = "alpha-to-bravo"
    rg_name        = "rg-demo-iac-westus2-01"
    vnet_name      = "vnet-alpha"
    remote_vnet_id = "/subscriptions/36da3bc2-eb83-40a4-af64-1a82600d830f/resourceGroups/rg-demo-iac-westus2-02/providers/Microsoft.Network/virtualNetworks/vnet-bravo"
  }
  bravo_to_alpha = {
    name           = "bravo-to-alpha"
    rg_name        = "rg-demo-iac-westus2-02"
    vnet_name      = "vnet-bravo"
    remote_vnet_id = "/subscriptions/36da3bc2-eb83-40a4-af64-1a82600d830f/resourceGroups/rg-demo-iac-westus2-01/providers/Microsoft.Network/virtualNetworks/vnet-alpha"
  }
  alpha_to_charlie = {
    name           = "alpha-to-charlie"
    rg_name        = "rg-demo-iac-westus2-01"
    vnet_name      = "vnet-alpha"
    remote_vnet_id = "/subscriptions/36da3bc2-eb83-40a4-af64-1a82600d830f/resourceGroups/rg-demo-iac-westus2-03/providers/Microsoft.Network/virtualNetworks/vnet-charlie"
  }
  charlie_to_alpha = {
    name           = "charlie-to-alpha"
    rg_name        = "rg-demo-iac-westus2-03"
    vnet_name      = "vnet-charlie"
    remote_vnet_id = "/subscriptions/36da3bc2-eb83-40a4-af64-1a82600d830f/resourceGroups/rg-demo-iac-westus2-01/providers/Microsoft.Network/virtualNetworks/vnet-alpha"
  }
}

stgaccounts = {
  account_alpha = {
    accntname = "stgdevshowdemo001"
    rgname    = "rg-demo-iac-westus2-01"
    location  = "eastus"
    tier      = "Standard"
    repl_type = "LRS"
  }
}

containers = {
  container_alpha = {
    name           = "democontainer01"
    stg_accnt_name = "stgdevshowdemo001"
    access_type    = "private"
  }
}
