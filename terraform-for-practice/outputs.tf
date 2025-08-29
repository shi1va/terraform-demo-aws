# output for count
# output "ec2_public_ip" {
#   value = aws_instance.my-instance[*].public_ip    #if we use count then we need to use list syntax
# }

# output "ec2_public_dns" {
#   value = aws_instance.my-instance[*].public_dns
# }

# output "ec2_private_ip" {
#   value = aws_instance.my-instance[*].private_ip
# }

# output "s3_arn_name" {
#   value = aws_s3_bucket.terraform-bucket-shivani.arn
# }

# output "ec2_key_pair" {
#   value = aws_instance.my-instance[*].key_name
# }

#for_each loop outputs
output "ec2_public_ip" {
  description = "Public IP addresses of the EC2 instances"
  value = {
    for instance in aws_instance.my-instance : instance.tags["Name"] => instance.public_ip
  }
}