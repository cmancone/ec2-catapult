variable "name" {
  type        = string
  description = "The name for the infrastructure"
  default     = "makers-breakers"
}

variable "region" {
  type        = string
  description = "The AWS region to deploy to"
  default     = "us-east-1"
}
