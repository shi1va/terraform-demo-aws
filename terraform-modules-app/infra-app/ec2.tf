#key pair file
resource aws_key_pair my_key{
    key_name = "${var.env}-infra-app-key"
    public_key = file("terra-key-shivaniuser.pub")

    tags = {
      Name = var.env
    }
}

#vpc & security group
resource aws_default_vpc default{


}

resource aws_security_group my_sg{
    name = "${var.env}-infra-app-sg"
    description = "this is automated by TF"
    vpc_id = aws_default_vpc.default.id     #interpolation
    
    #inbound rules
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "ssh open managed by terraform"
        
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "http open managed by terraform"
        
    }    
    
    #outbound rules

    egress{
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    tags = {
      Name = "${var.env}-infra-app-sg"
    }

}


#ec2
resource aws_instance "my-instance"{
   count = var.instance_count
    
    depends_on = [ aws_security_group.my_sg, aws_key_pair.my_key, aws_default_vpc.default ]

    key_name = aws_key_pair.my_key.key_name
    security_groups = [aws_security_group.my_sg.name]
    ami = var.ec2_ami_id #ubuntu
    instance_type = var.aws_instance_type
    user_data = file("scripts.sh")

    root_block_device {
      volume_size = var.env == "prod" ? 20 : 10
      volume_type = "gp3"
    }

    tags = {
        Name = "${var.env}-infra-app-ec2"
        Environment = var.env
    }

}
