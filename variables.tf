variable "resource_group" {
  description = "Resource group for storage account."
}

variable "storage_account_name" {
  description = "Name of storage account."
}

variable "region" {
  description = "Region of storage account."
  default     = "eastus"
}

variable "account_tier" {
  description = "Tier of the storage account."
  default     = "Standard"
}

variable "enable_https_traffic_only" {
  description = "Enable https-only traffic."
  default     = false
}

variable "account_replication_type" {
  description = "Replication type of account."
  default     = "LRS"
}

variable "containers" {
  description = "Containers to create into storage account"
  default     = []
}

variable "allow_blob_public_access" {
  description = "Allow public access to blobs inside the account"
  default     = false
}
variable "account_kind" {
  description = "Kind of account."
  default     = "Storage"
}

variable "is_hns_enabled" {
  description = "Enable/disable hierarchical namespace (true for datalake)."
  default     = false
}

variable "containers_datalake_gen2" {
  description = "List of containers to create into gen2 format."
  default     = []
}

variable "tags" {
  description = "(Optional) Map of tags and values to apply to the resource"
  type        = map
  default     = {}
}

variable "enable_static_website"{
  description = "Enable static website for storage account"
  type = bool
  default = false
}
variable "index_document" {
  description = "(Optional) index page for static websites served in storageaccount"
  type = string
  default = "index.html"
}

variable "error_404_document" {
  description = "(Optional) Error page for static websites served in storageaccount"
  type = string
  default = "index.html"
}