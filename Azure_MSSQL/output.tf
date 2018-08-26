output "msql_instance_password" {
	value = "${azurerm_sql_server.terraform_stage_test_mssql.administrator_login_password}"
}
