variable "environment" {}
variable "sub_environment" {}
variable "location" {}

variable "tags" {
  type = map(string)
  description = "Tags"
}

variable "subscription_id" {
  default     = "fe790859-8eda-4568-b4d4-07fca54605e4"
  description = "subscription id"
}

variable "tenant_id" {
  default     = "78ca5159-6d10-4edb-b73b-9ed9b98fd637"
  description = "tenant id"
}
