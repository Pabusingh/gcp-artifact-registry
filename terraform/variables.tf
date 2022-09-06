variable "project_name" {
  description = "Name of the GCP Project"
  type        = string
  default     = "rare-mechanic-358909"
}

variable "external_ip_address" {
  description = "External IP used in Load balancer"
  type        = string
  default     = "mam-frontend-dev-external-ip-address"
}

variable "cloud_armor_policy" {
  description = "Cloud armor policy"
  type        = string
  default     = "mam-frontend-dev-policy"
}