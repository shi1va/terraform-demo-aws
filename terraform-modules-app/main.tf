module "dev-infra-app" {
  source = "./infra-app"
  env = "dev"
  instance_count = 1
  aws_instance_type = "t2.micro"
  ec2_ami_id = "ami-0bc691261a82b32bc" #ubuntu
  hash_key = "studentID"
  root_volume_size = 8
  
}

module "stg-infra-app" {
  source = "./infra-app"
  env = "stg"
  instance_count = 1
  aws_instance_type = "t2.micro"
  ec2_ami_id = "ami-0bc691261a82b32bc" #ubuntu
  hash_key = "studentID"
  root_volume_size = 8
  
}

