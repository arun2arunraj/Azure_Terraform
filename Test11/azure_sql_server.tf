resource "azurerm_resource_group" "terraform_stage_test_mssql" {
	name	= "${var.resource_group_name}"
	location = "${var.location}"
}

resource "random_string" "system_generated_password" {
	length = 32
	special = true
	override_special = "/@\" "
}

resource "azurerm_sql_server" "terraform_stage_test_mssql" {
	name	= "muw1-support-vss-prod-mssql"
	resource_group_name = "${var.resource_group_name}"
	location = "${var.location}"
	version = "${var.ms_sql_version}"
	administrator_login = "${var.admin_username}"
	administrator_login_password = "${random_string.system_generated_password.result}"

	tags {
		Platform = "${var.tag_platform_name}"
		AppName = "${var.tag_app_name}"
		SXAPPID = "${var.tag_sxapp_id}"
		BusinessUnit = "${var.tag_business_unit}"
		Environment = "${var.tag_environment}"
		CostCenter = "${var.tag_cost_center}"
		OwnerEmail = "${var.tag_owner_email}"
	}
}

resource "azurerm_sql_firewall_rule" "terraform_stage_test_mssql" {
	name = "Admin VPN East"
	resource_group_name = "${var.resource_group_name}"
	server_name = "${azurerm_sql_server.terraform_stage_test_mssql.name}"
	start_ip_address = "155.64.38.0"
	end_ip_address = "155.64.38.255"
}

resource "azurerm_sql_virtual_network_rule" "stage_test_sqlvnetrule" {
	name = "sql-app-net-rule"
	resource_group_name = "${var.resource_group_name}"
	server_name = "${azurerm_sql_server.terraform_stage_test_mssql.name}"
	#subnet_id   = "/subscriptions/ddc8a925-a11f-47ed-a226-2ecf7d90611f/resourceGroups/MUSW1-NN01-N001/providers/Microsoft.Network/networkSecurityGroups/App-NSG"
	subnet_id  = "/subscriptions/bb85c717-5fcd-4e76-9fc5-b2b1c1c05809/resourceGroups/MUSW1-NP02-N001/providers/Microsoft.Network/networkSecurityGroups/App-NSG"
}

resource "azurerm_sql_database" "terraform_stage_test_mssql" {
	name = "vss"
	resource_group_name = "${var.resource_group_name}"
	location = "${var.location}"
	server_name = "${azurerm_sql_server.terraform_stage_test_mssql.name}"
}
