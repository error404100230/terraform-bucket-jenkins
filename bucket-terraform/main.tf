provider "aws" {
  region = "us-east-1" # Change this to your desired AWS region
}

provider "random" {
  # No specific configuration needed for the random provider
}

resource "random_id" "bucket_id" {
  byte_length = 8
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = "my-example-bucket-${random_id.bucket_id.hex}"
  acl    = "private"

  tags = {
    Name        = "my-example-bucket"
    Environment = "Dev"
  }
}

output "bucket_name" {
  value = aws_s3_bucket.example_bucket.bucket
}
