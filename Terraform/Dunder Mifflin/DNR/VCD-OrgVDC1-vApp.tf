

data "vcd_catalog" "my-catalog" {
  org  = var.vcd_Provider_Org
  name = var.vcd_Provider_catalog
}

data "vcd_catalog_vapp_template" "photon-os" {
  org        = var.vcd_Provider_Org
  catalog_id = data.vcd_catalog.my-catalog.id
  name       = var.vcd_vapp_template_photon_os
}

resource "vcd_vapp" "web" {
  name = var.vcd_vapp_vappname
  org  = var.vcd_orgsname
  vdc  = var.vcd_custorgvdcname_orgvdc01

depends_on =[vcd_network_routed_v2.nsxt-backed,vcd_org_vdc.tenantvdc]
}

resource "vcd_vapp_org_network" "routed-net" {
  vapp_name        = vcd_vapp.web.name
  org  = var.vcd_orgsname
  vdc  = var.vcd_custorgvdcname_orgvdc01
  org_network_name = vcd_network_routed_v2.nsxt-backed.name
}

resource "vcd_vapp_vm" "web1" {
  vapp_name = vcd_vapp.web.name
  name      = var.vcd_vapp_vappvm1_name_orgvdc01
  org  = var.vcd_orgsname
  vdc  = var.vcd_custorgvdcname_orgvdc01
  vapp_template_id = data.vcd_catalog_vapp_template.photon-os.id
  memory = 256
  cpus   = 1

  network {
    type               = var.vcd_vapp_vappvm2_iptype_orgvdc01
    name               = vcd_vapp_org_network.routed-net.org_network_name
    ip_allocation_mode = var.vcd_vapp_vappvm2_ipallmode_orgvdc01
  }


depends_on =[vcd_network_routed_v2.nsxt-backed,vcd_org_vdc.tenantvdc]
}

resource "vcd_vapp_vm" "web2" {
  vapp_name = vcd_vapp.web.name
  name      = var.vcd_vapp_vappvm2_name_orgvdc01
  org  = var.vcd_orgsname
  vdc  = var.vcd_custorgvdcname_orgvdc01
  vapp_template_id = data.vcd_catalog_vapp_template.photon-os.id
  memory = 256
  cpus   = 1

  network {
    type               = var.vcd_vapp_vappvm2_iptype_orgvdc01
    name               = vcd_vapp_org_network.routed-net.org_network_name
    ip_allocation_mode = var.vcd_vapp_vappvm2_ipallmode_orgvdc01
  }

depends_on =[vcd_network_routed_v2.nsxt-backed,vcd_org_vdc.tenantvdc]
}