

resource "vcd_nsxt_ip_set" "set1" {
  org = var.vcd_orgsname

  edge_gateway_id = data.vcd_nsxt_edgegateway.existing.id

  name        = var.vcd_nsx_fw_ipset_name
  description = var.vcd_nsx_fw_ipset_desc

  ip_addresses = [
    var.vcd_nsx_fw_ipset_iprange,
  ]
}