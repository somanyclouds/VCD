provider "vcd" {
#####Configuration options#####
user = var.vcd_user
password = var.vcd_pass
org = "System"
url = var.vcd_url
max_retry_timeout = var.vcd_max_retry_timeout
allow_unverified_ssl = var.vcd_allow_unverified_ssl
}