#####Create New Org VDC OrgVDC01#####
resource "vcd_org_vdc" "tenantvdc" {
  name        = var.vcd_custorgvdcname_orgvdc01
  description = var.vcd_custorgvdcdesc
  org         = var.vcd_orgsname

  allocation_model = var.vcd_custorgvdcname_allocation_model_orgvdc01
  network_pool_name = var.vcd_networkpool
  provider_vdc_name = var.vcd_providervdcname
  network_quota     = 10
  compute_capacity {
    cpu {
      allocated = 2048
    }

    memory {
      allocated = 2048
    }
  }

  storage_profile {
    name     = var.vcd_storageprofile
    limit    = 0
    default  = true    
  }
  
  enabled                  = true
  enable_thin_provisioning = true
  enable_fast_provisioning = true
  delete_force             = true
  delete_recursive         = true

depends_on = [vcd_org.tenantorg]
}
