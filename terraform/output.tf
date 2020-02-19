output "resource_group_name" {
  value = "${azurerm_resource_group.jmeter_rg.name}"
}

output "storage_account_name" {
  value = "${azurerm_storage_account.jmeter_storage.name}"
}

output "storage_account_key" {
  value     = "${azurerm_storage_account.jmeter_storage.primary_access_key}"
  sensitive = true
}

output "storage_file_share_name" {
  value = "${azurerm_storage_share.jmeter_share.name}"
}

output "storage_file_share_url" {
  value = "${azurerm_storage_share.jmeter_share.url}"
}

output "jmeter_master_name" {
  value = "${azurerm_container_group.jmeter_master.name}"
}

output "jmeter_master_ip" {
  value = "${azurerm_container_group.jmeter_master.ip_address}"
}

output "jmeter_slaves_ip_list" {
  value = ["${azurerm_container_group.jmeter_slaves.*.ip_address}"]
}

output "jmeter_slaves_ips" {
  value = "${join(",", "${azurerm_container_group.jmeter_slaves.*.ip_address}")}"
}

output "jmeter_results_file" {
  value = "${var.JMETER_RESULTS_FILE}"
}

output "jmeter_dashboard_folder" {
  value = "${var.JMETER_DASHBOARD_FOLDER}"
}
