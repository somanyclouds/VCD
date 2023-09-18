
####Assigne SE Grp to Org######
data "vcd_nsxt_alb_service_engine_group" "first" {
  name = var.vcd_alb_se_name
}

resource "vcd_nsxt_alb_edgegateway_service_engine_group" "first" {
  edge_gateway_id         = data.vcd_nsxt_edgegateway.existing.id
  service_engine_group_id = data.vcd_nsxt_alb_service_engine_group.first.id

  ###Only use if Shared SE Group####
  #max_virtual_services      = 10
  #reserved_virtual_services = 10
}

#####Server Pool######

resource "vcd_nsxt_alb_pool" "pool" {
  org = var.vcd_orgsname 

  name            = var.vcd_alb_pool_name
  edge_gateway_id = data.vcd_nsxt_edgegateway.existing.id

  member {
    ip_address = "192.168.1.1"
  }
}
#####Virtual Service ######

resource "vcd_nsxt_alb_virtual_service" "test" {
  org = var.vcd_orgsname
  name = var.vcd_alb_vs_name
  edge_gateway_id = data.vcd_nsxt_edgegateway.existing.id
  pool_id = vcd_nsxt_alb_pool.pool.id
  service_engine_group_id  = data.vcd_nsxt_alb_service_engine_group.first.id
  virtual_ip_address       = tolist(data.vcd_nsxt_edgegateway.existing.subnet)[0].primary_ip
  application_profile_type = "HTTP"
  service_port {
    start_port = 80
    type       = "TCP_PROXY"
  }
}