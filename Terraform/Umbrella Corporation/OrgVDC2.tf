#####Create New Org VDC OrgVDC02#####
resource "vcd_org_vdc" "tenantvdcbat" {
  name        = var.vcd_custorgvdcname_orgvdc02
  description = var.vcd_custorgvdcdesc
  org         = var.vcd_orgsname

  allocation_model = var.vcd_custorgvdcname_allocation_model_orgvdc02
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


# resource "vcd_external_network" "exnet02" {
#   name        = var.vcd_externalnetworkname_orgvdc02
#   description = var.vcd_externalnetworkdesc_orgvdc02

#   ip_scope {
#     gateway    = var.externalgw_orgvdc02
#     netmask    = var.externalsubnetmask_orgvdc02
#     dns1       = var.dns
    
#     static_ip_pool {
#       start_address = var.externalstartip_orgvdc02
#       end_address   = var.externalendip_orgvdc02
#     }
#   }

  
#   vsphere_network {
#     name    = var.vcd_externalnetworkname_orgvdc02
#     type    = var.vcd_externalnetworktype
#     vcenter = var.vcname
#   }

  
#   retain_net_info_across_deployments = "false"


# depends_on = [vcd_org_vdc.tenantvdcbat,vsphere_distributed_port_group.pg2]
  
# }

 
# resource "vcd_edgegateway" "egw" {
#   org = var.vcd_orgsname
#   vdc = var.vcd_custorgvdcname_orgvdc02

#   name          = var.vcd_edgegwname_orgvdc02
#   description   = var.vcd_edgegwnamedesc_orgvdc02
#   configuration = var.vcd_edgegwnamesize_orgvdc02
#   lb_enabled = "true"
#   external_network {
#     name = var.vcd_externalnetworkname_orgvdc02

#     subnet {
#       ip_address            = var.vcd_edgegwip_address
#       gateway               = var.vcd_edgegwGatewatip
#       netmask               = var.vcd_edgegwnetmask
#       use_for_default_route = true
#     }
#   }

# depends_on = [vcd_external_network.exnet02]

# }


# resource "vcd_network_routed" "rnet1" {
#   name         = var.vcd_edgegwnetroutedname
#   org          = var.vcd_orgsname
#   vdc          = var.vcd_custorgvdcname_orgvdc02
#   edge_gateway = vcd_edgegateway.egw.name
#   gateway      = var.vcd_edgegwnetroutedgw

#   static_ip_pool {
#     start_address = var.vcd_edgegwnetroutedstartip
#     end_address   = var.vcd_edgegwnetroutedendip
#   }
# }



