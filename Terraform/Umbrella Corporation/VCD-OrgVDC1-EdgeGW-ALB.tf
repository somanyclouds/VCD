

##data "vcd_org_vdc" "vdc11" {
##  org  = var.vcd_orgsname 
##  name = var.vcd_custorgvdcname_orgvdc01

##  depends_on = [vcd_org_vdc.tenantvdc]
##}

#### Enable NSX-ALB on Edge - ######
#### General Settings ######
data "vcd_nsxt_edgegateway" "existing" {
  org = var.vcd_orgsname
  owner_id = data.vcd_vdc_group.group1.id

  name = var.vcd_edgename

depends_on = [vcd_nsxt_edgegateway.nsxt-edge,vcd_vdc_group.new-vdc-group]
}

resource "vcd_nsxt_alb_settings" "org1" {
  org = var.vcd_orgsname

  edge_gateway_id = data.vcd_nsxt_edgegateway.existing.id
  is_active       = true

  # service_network_specification      = "10.10.255.225/27"
  # ipv6_service_network_specification = "2001:0db8:85a3:0000:0000:8a2e:0370:7334/120"
  # is_transparent_mode_enabled        = true

depends_on = [vcd_nsxt_edgegateway.nsxt-edge]
}