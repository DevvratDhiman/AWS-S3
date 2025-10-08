# Configure the AWS provider
provider "aws" {
  region = "us-east-1"
}

# Create an S3 bucket
resource "aws_s3_bucket" "demo_bucket" {
  bucket = "devvrat-s3-demo"   # change this to a unique name
  acl    = "private"

  # Enable versioning
  versioning {
    enabled = true
  }

  # Lifecycle rules
  lifecycle_rule {
    id      = "archive-old"
    enabled = true

    # Move files to Standard-IA after 30 days
    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    # Move files to Glacier after 60 days
    transition {
      days          = 60
      storage_class = "GLACIER"
    }

    # Expire/delete files after 365 days
    expiration {
      days = 365
    }
  }
}

# Optional: Upload a sample file (requires local path)
resource "aws_s3_bucket_object" "sample_file" {
  bucket = aws_s3_bucket.demo_bucket.id
  key    = "example.txt"
  source = "../sample-files/example.txt"   # relative path to your file
}
