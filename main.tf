resource "azurerm_storage_account" "storage_account" {
  name                      = var.storage_account_name
  resource_group_name       = var.resource_group
  location                  = var.region
  account_tier              = var.account_tier
  account_kind              = var.account_kind
  account_replication_type  = var.account_replication_type
  is_hns_enabled            = var.is_hns_enabled
  enable_https_traffic_only = var.enable_https_traffic_only
  allow_blob_public_access  = var.allow_blob_public_access
  tags                      = var.tags

  dynamic "static_website" {
    #check if enable_static_website is true to set below block
    for_each = var.enable_static_website == true ? ["1"] : []
    content {
      index_document = var.index_document
      error_404_document = var.error_404_document
    }
  } 
}

resource "azurerm_storage_container" "container" {
  name                  = var.containers[count.index].name
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = var.containers[count.index].container_access_type

  count = length(var.containers) > 0 ? length(var.containers) : 0
  depends_on = [
    azurerm_storage_account.storage_account
  ]
}

resource "azurerm_storage_data_lake_gen2_filesystem" "datalake_gen2_filesystem" {
  name               = var.containers_datalake_gen2[count.index].name
  storage_account_id = azurerm_storage_account.storage_account.id
  count              = length(var.containers_datalake_gen2) > 0 ? length(var.containers_datalake_gen2) : 0
  depends_on = [
    azurerm_storage_account.storage_account
  ]
}