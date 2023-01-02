variable "name" {
  type        = string
  description = "The name for the infrastructure"
}

variable "vpc_id" {
  type        = string
  description = "id of the vpc to launch instance"
}

variable "subnet_id" {
  type        = string
  description = "id of the subnet to launch instance"
}

variable "ami" {
  type        = string
  description = "ami for the instance"
}

variable "associate_public_ip_address" {
  type = bool
  default = true
}

variable "ssh_public_key" {
  type = string
  default = ""
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "type of instance"
}

variable "instance_profile_name" {
  type        = string
  default     = "SSMAccessForEc2"
}

variable "tags" {
  type        = map(any)
  default     = {}
  description = "Additional tags to apply to all resources"
}
