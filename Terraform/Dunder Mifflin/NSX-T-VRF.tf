data "nsxt_policy_edge_cluster" "ec" {
  display_name = var.nsxt_policy_edge_cluster
}

data "nsxt_policy_tier0_gateway" "parent" {
  display_name = var.vcd_parentT0
}

data "nsxt_policy_edge_node" "node1" {
  edge_cluster_path = data.nsxt_policy_edge_cluster.ec.path
  member_index      = 0
}

data "vcd_nsxt_manager" "main" {
  name = var.vcd_nsxtmgmt
}

data "vcd_nsxt_tier0_router" "router" {
  name            = var.vcd_vrfname
  nsxt_manager_id = data.vcd_nsxt_manager.main.id

  depends_on = [nsxt_policy_tier0_gateway.vrf-blue]
}

###Create VRF in NSX-T#### 
resource "nsxt_policy_tier0_gateway" "vrf-blue" {
  description              = var.vcd_vrf_description
  display_name             = var.vcd_vrfname
  default_rule_logging     = false
  enable_firewall          = true
  ha_mode                  = var.nsx-t_HA_mode
  internal_transit_subnets = ["102.64.0.0/16"]
  transit_subnets          = ["101.64.0.0/16"]
  edge_cluster_path        = data.nsxt_policy_edge_cluster.ec.path

  bgp_config {
    ecmp = false

    route_aggregation {
      prefix = "12.10.10.0/24"
    }
  }

  vrf_config {
    gateway_path        = data.nsxt_policy_tier0_gateway.parent.path
       
  }
}

####Interface#####
resource "nsxt_policy_tier0_gateway_interface" "red_vrf_uplink1" {
  display_name   = var.vcd_vrf_display_name_uplink1
  type           = "EXTERNAL"
  edge_node_path = data.nsxt_policy_edge_node.node1.path
  gateway_path   = nsxt_policy_tier0_gateway.vrf-blue.path
  segment_path   = nsxt_policy_vlan_segment.vlansegment1.path
  subnets        = [var.ExtInt_VRF_subnet_ip]
  mtu            = 1500

  depends_on = [nsxt_policy_vlan_segment.vlansegment1,nsxt_policy_tier0_gateway.vrf-blue]


}

###Adding VRF to VCD######
resource "vcd_external_network_v2" "ext-net-nsxt-t0" {
  name        = var.vcd_vrfname
  description = "First NSX-T Tier 0 router backed network"

  nsxt_network {
    nsxt_manager_id      = data.vcd_nsxt_manager.main.id
    nsxt_tier0_router_id = data.vcd_nsxt_tier0_router.router.id
  }

  ip_scope {
    enabled       = true
    gateway       = var.externalgw_orgvdc01
    prefix_length = "24"

    static_ip_pool {
      start_address = var.vcd_vrf_start_address
      end_address   = var.vcd_vrf_end_address
    }
  }

depends_on = [nsxt_policy_tier0_gateway.vrf-blue]

}