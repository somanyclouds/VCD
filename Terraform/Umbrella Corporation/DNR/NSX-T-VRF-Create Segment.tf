
data "nsxt_policy_transport_zone" "vlan_transport_zone" {
  display_name = var.nsx-t_mgmt_tz 
}


####External interface used on VRF Lite#####
resource "nsxt_policy_vlan_segment" "vlansegment1" {
  display_name        = var.ExtInt_VRF_name
  description         = var.ExtInt_VRF_name_Desc
  transport_zone_path = data.nsxt_policy_transport_zone.vlan_transport_zone.path
  vlan_ids            = [var.ExtInt_VRF_vlan_id]

  subnet {
    cidr        = var.ExtInt_VRF_cidr
            }

}


