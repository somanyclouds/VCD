data "vcd_external_network_v2" "nsxt-ext-net" {
  name = var.vcd_vrfname
  depends_on = [vcd_external_network_v2.ext-net-nsxt-t0]
  }

data "vcd_org_vdc" "vdc1" {
  org  = var.vcd_orgsname 
  name = var.vcd_custorgvdcname_orgvdc01

  depends_on = [vcd_org_vdc.tenantvdc]
}

data "vcd_vdc_group" "group1" {
  name = var.vcd_dcgrp_name
depends_on = [vcd_vdc_group.new-vdc-group]
}

resource "vcd_nsxt_edgegateway" "nsxt-edge" {
  org         = var.vcd_orgsname
  owner_id    = data.vcd_vdc_group.group1.id
  ##vdc         = var.vcd_custorgvdcname_orgvdc01
  name        = var.vcd_edgename
  description = "Description"

  external_network_id = data.vcd_external_network_v2.nsxt-ext-net.id

  subnet {
    gateway       = var.externalgw_orgvdc01
    prefix_length = "24"
    # primary_ip should fall into defined "allocated_ips" range as otherwise
    # next apply will report additional range of "allocated_ips" with the range
    # containing single "pr3edrimary_ip" and will cause non-empty plan.
    primary_ip = var.vcd_vrfa_allocated_ip_primary
    allocated_ips {
      start_address = var.vcd_vrfa_allocated_ip_start
      end_address   = var.vcd_vrfa_allocated_ip_end

    }
  }
}
