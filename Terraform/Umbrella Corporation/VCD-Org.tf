
#####Create a new Org#####
resource "vcd_org" "tenantorg" {
 name             = var.vcd_orgsname
 full_name        = var.vcd_orglname
 description      = var.vcd_orgdesc
 is_enabled       = "true"
 delete_recursive = "true"
 delete_force     = "true"
}

#####Administrator User#####
resource "vcd_org_user" "orgadmin" {
  org 		          = var.vcd_orgsname
  name              = var.vcd_orgadmin
  password_file     = "pwd.txt"
  full_name         = var.vcd_orgadmin
  description       = var.vcd_orgadmindesc
  role              = "Organization Administrator"
  enabled           = true
  take_ownership    = true
  provider_type     = "INTEGRATED"
  stored_vm_quota   = 20
  deployed_vm_quota = 20
  email_address     = var.vcd_orgadminemail
  
  depends_on = [vcd_org.tenantorg]
}

#####Customer Administrator User#####
resource "vcd_org_user" "custorgadmin" {
  org 		          = var.vcd_orgsname
  name              = var.vcd_custorgadmin
  password_file     = "pwd.txt"
  full_name         = var.vcd_custorgadminname
  description       = var.vcd_custorgadmindesc
  role              = "Organization Administrator"
  enabled           = true
  take_ownership    = true
  provider_type     = "INTEGRATED"
  stored_vm_quota   = 20
  deployed_vm_quota = 20

  depends_on = [vcd_org.tenantorg]
}
