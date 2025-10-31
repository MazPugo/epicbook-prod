variable "prefix" {
  default = "my"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "vpc_security_group_id" {
  description = "Security group ID for the instance"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for the instance"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for Ubuntu 22.04"
  type        = string
  default     = "ami-0850ab57897dcaa32" # EU-WEST-2 (London)
}

variable "ssh_key_pair" {
  description = "SSH key configuration map"
  type = map(string)
  default = {
    ssh_username = "epicbook-key"
    ssh_key_path = "~/.ssh/id_rsa.pub"
  }
}

variable "user_data_path" {
  description = "Optional user data script"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags to assign to AWS resources"
  type        = map(string)
  default = {
    Project = "EpicBook"
    Env     = "Prod"
  }
}
