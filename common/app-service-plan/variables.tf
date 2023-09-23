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
  default     = "523ab593-8bae-485a-bde2-5fab077a0f92"
  description = "tenant id"
}
