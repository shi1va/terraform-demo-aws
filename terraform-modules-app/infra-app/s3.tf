resource "aws_s3_bucket" "my-app-bucket" {
    bucket = "${var.env}-infra-app-bucket-g53dh"

    tags = {
        Name = "${var.env}-infra-app-bucket-g53dh"
        Environment = var.env
    }
}