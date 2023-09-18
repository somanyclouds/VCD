

data "vcd_org_vdc" "startVdc" {
  org  = var.vcd_orgsname
  name = var.vcd_custorgvdcname_orgvdc01
  depends_on = [vcd_org_vdc.tenantvdc]
}

data "vcd_org_vdc" "additionalVdc" {
  org  = var.vcd_orgsname
  name = var.vcd_custorgvdcname_orgvdc02
  depends_on = [vcd_org_vdc.tenantvdcbat]
}

resource "vcd_vdc_group" "new-vdc-group" {
  org                   = var.vcd_orgsname
  name                  = var.vcd_dcgrp_name
  description           = var.vcd_dcgrp_desc
  starting_vdc_id       = data.vcd_org_vdc.startVdc.id
  participating_vdc_ids = [data.vcd_org_vdc.startVdc.id, data.vcd_org_vdc.additionalVdc.id]
  dfw_enabled           = var.vcd_dcgrp_dfw_enabled
  default_policy_status = var.vcd_dcgrp_default_Policy_enabled
  
  depends_on = [vcd_org_vdc.tenantvdc,vcd_org_vdc.tenantvdcbat]

}