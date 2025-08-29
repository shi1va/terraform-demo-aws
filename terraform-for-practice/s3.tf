resource "aws_s3_bucket" "terraform-bucket-shivani"{
    bucket = "terraform-s3-practice-bucket-shivaniuser123"

    tags = {
        Name = "My Bucket"
        env = "test"
        terraform = "true"
    }
}