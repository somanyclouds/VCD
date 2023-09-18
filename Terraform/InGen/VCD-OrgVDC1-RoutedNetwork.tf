

data "vcd_nsxt_edgegateway" "t1" {
  org         = var.vcd_orgsname
  owner_id    = data.vcd_org_vdc.vdc1.id
  name = var.vcd_edgename

  depends_on = [vcd_nsxt_edgegateway.nsxt-edge]
}

resource "vcd_network_routed_v2" "nsxt-backed" {
  org         = var.vcd_orgsname
  #vdc         = var.vcd_custorgvdcname_orgvdc01
  name        = var.vcd_routed_net_name
  description = var.vcd_routed_net_desc

  edge_gateway_id = data.vcd_nsxt_edgegateway.t1.id

  gateway       = var.vcd_routed_net_gw
  prefix_length = 24

  static_ip_pool {
    start_address = var.vcd_routed_net_start_ip
    end_address   = var.vcd_routed_net_end_ip
  }

}