provider "azurerm" {
	subscription_id = "${var.subscription_id}"
}

variable "subscription_id" {
	description ="Enter Subscription ID for provisioning resources in Azure"
}

#variable "client_id" {
#	description = "Enter Client ID for Applicaiton created in Azure AD"
#}

#variable "client_secret" {
#	description = "Enter Client secret for Application in Azure AD"
#}

#variable "tenant_id" {
#	description = "Enter Tenant ID / Directory ID of your Azure AD. Run Get-AzureSubsscription to know your Tenant ID"
#}

variable "location" {
	description = "The default Azure region for the resource provisioning"
}

variable "resource_group_name" {
	description = "Resource group name that will contain various resources"
}

variable "admin_username" {
	description = "Enter admin username for Admin access"
}

#variable "admin_password" {
#	description = "Enter admin password for Admin password"
#}

variable "ms_sql_version" {
	description = "Mention the ms sql server version"
}

variable "tag_environment" {
	description = "Enter environment name for tagging this resource"
}

variable "tag_application_id" {
	description = "Enter applicaiton id for tagging this resource"
}

variable "tag_app_name" {
	description = "Enter application name for tagging this resource"
}

variable "tag_platform_name" {
	description = "Enter platform name for tagging this resource"
}

variable "tag_business_unit" {
	description = "Enter business unit name for tagging this resource"
}

variable "tag_cost_center" {
	description = "Enter cost center name for tagging this resoure"
}

variable "tag_sxapp_id" {
	description = "Enter software application id for tagging this resource"
}

variable "tag_owner_email" {
	description = "Enter owner email for tagging this resource"
}
