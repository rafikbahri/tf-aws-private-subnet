variable "name" {
  description = "Subnet name"
  type        = string
  default     = ""
}

variable "vpc_id" {
  description = "VPC ID where the subnet will be created"
  type        = string
  default     = ""
}

variable "availability_zone" {
  description = "Availability zone of the subnet"
  type        = string
  default     = "eu-west-3a"
}

variable "cidr_block" {
  description = "IPv4 CIDR block for the subnet"
  type        = string
  default     = "10.0.10.0/24"
}

variable "has_internet_access" {
  description = "Whether this network has internet access"
  type        = bool
  default     = false
}

variable "ngw_id" {
  description = "NAT Gateway ID for internet access"
  type        = string
  default     = ""
}

variable "tags" {
  description = "A map of tags to add to all resources in the subnet"
  type        = map(string)
  default     = {}
}