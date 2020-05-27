variable "environment" {
  type = string
  description = "Environment"
}

variable "domain_name" {
  type = string
  description = "Domain name"
}

variable "subject_alternative_names" {
  type = list
  description = "Subject alternative names"
  default = []
}

variable "zone_id" {
  type = string
  description = "Zone ID"
}
