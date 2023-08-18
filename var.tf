variable "vpc_name" {
  type        = string
  description = "name of vpc to be created"
  default     = ""
}
variable "aws_region" {
  type        = string
  description = "The AWS region where the resources will be created."
  default     = "us-west-2"
}
variable "vpc_cidr" {
  type        = string
  description = "The vpc cidr to be created."
  default     = ""
}
variable "az1" {
  type        = string
  description = "The availability region where the resources will be created."
  default     = ""
}
variable "az2" {
  type        = string
  description = "The availability region where the resources will be created."
  default     = ""
}
variable "az3" {
  type        = string
  description = "The availability region where the resources will be created."
  default     = ""
}
variable "pub-sub-1" {
  type        = string
  description = "The public subnets to be created."
  default     = ""
}
variable "pub-sub-2" {
  type        = string
  description = "The public subnets to be created."
  default     = ""
}
variable "pub-sub-3" {
  type        = string
  description = "The public subnets to be created."
  default     = ""
}
 variable "priv-sub-1" {
  type        = string
  description = "The private subnets to be created."
  default     = ""
}
variable "priv-sub-3" {
  type        = string
  description = "The private subnets to be created."
  default     = ""
}
variable "priv-sub-3" {
  type        = string
  description = "The private subnets to be created."
  default     = ""
}
variable "instance_type" {
  type        = string
  description = "The instance_type to be created."
  default     = ""
}
variable "key_name" {
  type        = string
  description = "The key name to be created."
  default     = ""
}

