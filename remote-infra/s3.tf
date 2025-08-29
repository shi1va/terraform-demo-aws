
resource "aws_s3_bucket" "remote_s3" {
  bucket = "my-tf-remote-state-bucket"

  tags = {
    Name = "my-tf-remote-state-bucket"
  }

}