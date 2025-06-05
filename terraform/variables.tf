variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
}

variable "vpc_cidr" {
  type        = string
  description = "The IPv4 CIDR block for the VPC"
  validation {
    error_message = "Enter valid CIDR Block"
    condition     = can(cidrsubnet(var.vpc_cidr, 8, 0))
  }
}

variable "instance_type" {
  type        = string
  description = "Instance type to use for the instance"
}

variable "docker_pass" {
  description = "The DockerHub password to connect to private repository"
  type        = string
  sensitive   = true
}

variable "docker_user" {
  description = "The DockerHub username"
  type        = string
  sensitive   = true
}

variable "docker_image" {
  description = "The Docker Image Name"
  type        = string
}