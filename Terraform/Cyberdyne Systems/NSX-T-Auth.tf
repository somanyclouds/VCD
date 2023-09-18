provider "nsxt" {
  host                  = var.nsx-t_mgmt_ip
  username              = var.nsx-t_mgmt_user
  password              = var.nsx-t_mgmt_pwd
  allow_unverified_ssl  = true
  max_retries           = 10
  retry_min_delay       = 500
  retry_max_delay       = 5000
  retry_on_status_codes = [429]

}