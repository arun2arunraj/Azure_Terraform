provider "avi" {
 avi_username = "arunraj_r"
 avi_tenant = "Cloud Services"
 avi_password = "SANGAVI!@12nura"
 avi_controller = "avi-west-nonprod.np.norton.com"
}

resource "avi_pool" "terraform_pool" {
	name= "test_terraform",
	#health_monitor_refs= ["${avi_healthmonitor.terraform-health.id}"]
	tenant_ref= "${data.avi_tenant.default_tenant.id}"
	cloud_ref= "${data.avi_cloud.default_cloud.id}"
	#application_persistence_profile_ref= "${avi_applicationpersistenceprofile.test_applicationpersistenceprofile.id}"
	servers {
		ip= {
			type= "V4",
			addr= "10.90.64.66",
		}
		port= 8080
	}
	fail_action= {
		type= "FAIL_ACTION_CLOSE_CONN"
	}
}

data "avi_tenant" "default_tenant" {
	name= "Cloud Services"
}

data "avi_cloud" "default_cloud" {
	name= "Default-Cloud"
}

data "avi_healthmonitor" "terraform-health-check" {
	name= "terraform-health"
}

data "avi_applicationprofile" "system_http_profile" {
	name= "System-HTTP"
}
#data "avi_applicationpersistenceprofile" "test_applicationpersistenceprofile" {
#	name= "terraform-persistence"
#}
