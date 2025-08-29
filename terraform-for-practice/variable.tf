variable "aws_region" {
  description = "AWS region where resources will be provisioned"
  default     = "eu-west-1"
}

variable "aws_instance_type"{
    default = "t2.micro"
    type = string
}

variable "ec2_ami_id" {
    default = "ami-0df368112825f8d8f"
    type = string
  
}

variable "root_volume_size" {
    default = 8
    type = number
}