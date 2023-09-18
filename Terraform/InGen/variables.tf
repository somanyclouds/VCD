################################# Platform #################################
##########################################################################
##VCD Connection
variable "vcd_user" {default="admin"}
variable "vcd_pass" {default="<VCDPassword>"}
variable "vcd_url" {default="https://vcd01.ssdom.com/api"}
variable "vcd_max_retry_timeout" { default="360" }
variable "vcd_allow_unverified_ssl" { default="true" }
##VCD Configs 
variable "vcd_providervdcname" { default="VCD-Provider"}
variable "vcd_storageprofile" { default="VCD-Storage" }
variable "vcd_nsxtmgmt" { default="nsx-tmgmt-01.ssdom.com" }
variable "vcd_networkpool" { default="VCD-NET-Pool" }
variable "vcd_externalnetworktype" { default="DV_PORTGROUP" }
variable "vcd_custorgvdcdesc" { default="Terraform Created Test Virtual Datacenter" }
variable "vcname" {default="ssdom.com"}
variable "dns" { default="192.168.1.30"}
variable "vcd_Provider_Org" { default="Provider"}
variable "vcd_Provider_catalog" { default="Provider-Catalog"}

##########################################################################
##NSX-T Connection
variable "nsx-t_mgmt_ip" { default="192.168.10.21" }
variable "nsx-t_mgmt_user" { default="admin" }
variable "nsx-t_mgmt_pwd" { default="<NSX-T-Password>"}
##NSX-T Configs
variable "nsx-t_mgmt_tz" { default="Overlay"}
variable "nsx-t_mgmt_tz_vlan" { default="VLAN"}
##########################################################################
##vSphere Connection
variable "vsphere_vc" { default="vc01.ssdom.com"}
variable "vsphere_user" { default="administrator@vsphere.local"}
variable "vsphere_pwd" { default="<VC-Password>"}
##vSphere Configs
variable "vsphereVDC" { default="NZDC01"}
variable "vsphere_vswitch" { default="SSDOM-VDS01"}
##########################################################################
################################# ORG #################################

##ORG
variable "vcd_orgsname" { default="InGen" }
variable "vcd_orglname" { default="InGen" }
variable "vcd_orgdesc" { default="International Genetic Technologies Inc Bioengineering the Future" }
##Org Admin
variable "vcd_orgadmin" { default="johnh" }
variable "vcd_orgadminname"{ default="John" }
variable "vcd_orgadmindesc"{ default="Hammond" }
variable "vcd_orgadminemail"{ default="johnh@ingen.com" }
##Customer Tenant Admin Users
variable "vcd_custorgadmin" { default="agrant" }
variable "vcd_custorgadminname" { default="Alan Grant" }
variable "vcd_custorgadmindesc" { default="paleontologist" }
variable "vcd_custorgadminemail" { default="agreant@ingen.com" }
variable "vcd_custorgadminchat" { default="@customer" }
variable "vcd_custorgadminphone" { default="0212032357" }

################################ OrgVDC ####################################
###### OrgVDC01 ######
variable "vcd_custorgvdcname_orgvdc01" { default="T-Rex" }
variable "vcd_custorgvdcname_allocation_model_orgvdc01" { default="AllocationVApp"}
##vSphere External Network Port Group
variable "vcd_externalnetworkname_orgvdc01" { default="T-Rex-External"} 
variable "vcd_externalnetworkvlan_orgvdc01"{ default="301" }
variable "vcd_externalnetworkdesc_orgvdc01" { default="External Network for T-Rex"}

variable "externalsubnetmask_orgvdc01" { default="255.255.255.0"}
variable "externalstartip_orgvdc01" { default="172.168.3.1"}
variable "externalendip_orgvdc01" { default="172.168.3.255"}

###### Org Networking ######
#### External interface used on VRF Lite ##### - NSX-T-Create Segment.tf
variable "ExtInt_VRF_name" { default="InGen-Ext"}
variable "ExtInt_VRF_name_Desc" { default="InGen-Ext VLAN Segment"}
variable "ExtInt_VRF_vlan_id" { default="212"}
variable "ExtInt_VRF_cidr" { default="172.168.4.10/24"}
variable "ExtInt_VRF_subnet_ip" { default="172.168.4.10/24"}
##T0#
variable "vcd_parentT0" { default="Parent-T0"}
#VRF/T1#
variable "vcd_vrfname" { default="Ingen-VRF"}
variable "vcd_vrf_description" { default="InGen-VRF-Terraform"}
variable "vcd_vrfa_allocated_ip_primary" { default="172.168.4.11"}
#IP Allocation#
variable "vcd_vrfa_allocated_ip_start" { default="172.168.4.200"}
variable "vcd_vrfa_allocated_ip_end" { default="172.168.4.255"}
variable "vcd_external_vrf_subnet_ip" { default="172.168.4.10/24"}
variable "vcd_vrf_display_name_uplink1" { default="InGen-Ext Uplink"}
variable "externalgw_orgvdc01" { default="172.168.4.1"}
variable "externalgw_orgvdc01_prefix" { default="24"}
#
variable "vcd_vrf_start_address" { default="172.168.4.10"}
variable "vcd_vrf_end_address" { default="172.168.4.255"}

##Edge### - NSX-T-VRF.tf
variable "vcd_edgename" { default="InGen-Edge"}
variable "nsxt_policy_edge_cluster" { default="Edge-Cluster-01"}
variable "nsx-t_HA_mode" {default="ACTIVE_STANDBY"}

#Routed Network##
variable "vcd_routed_net_name" { default="WebServers"}
variable "vcd_routed_net_desc" { default="Web Servers Network"}
variable "vcd_routed_net_gw" { default="10.10.100.1"}
variable "vcd_routed_net_start_ip" { default="10.10.100.100"}
variable "vcd_routed_net_end_ip" { default="10.10.100.200"}

##vApp-OrgVDC01##
variable "vcd_vapp_name_orgvdc01" { default="WebServersT-InGen" }
variable "vcd_vapp_costaccount_orgvdc01" { default="Marketing Department"}
variable "vcd_vapp_vappname"{ default="WebServers"}
variable "vcd_vapp_vappvm1_name_orgvdc01"{ default="Web01"}
variable "vcd_vapp_vappvm2_name_orgvdc01"{ default="Web02"}
variable "vcd_vapp_catalog_name" { default="Provider Server Catalog"}
variable "vcd_vapp_template_name" { default = "Photon OS 5.0"}
variable "vcd_vapp_vappvm2_ipallmode_orgvdc01"{ default="POOL"}
variable "vcd_vapp_vappvm2_iptype_orgvdc01"{ default="org"}

###### OrgVDC02 ######
variable "vcd_custorgvdcname_orgvdc02" { default="Velociraptor" }
variable "vcd_custorgvdcname_allocation_model_orgvdc02" { default="AllocationVApp"}
