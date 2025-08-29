variable "env" {
    description = "Environment name"
    type        = string
}


variable "instance_count" {
    description = "Number of EC2 instances to create"
    type        = number
}

variable "aws_instance_type" {
    description = "The type of instance to create"
    type        = string
}

variable "ec2_ami_id" {
    description = "The AMI ID for the EC2 instance"
    type        = string
}

variable "root_volume_size" {
    description = "Root volume size in GB"
    type        = number
  
}

variable "hash_key" {
    description = "The hash key for the DynamoDB table"
    type        = string
  
}      