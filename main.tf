###############################################################################
# Bucket to store state

resource "aws_s3_bucket" "terraform_state" {
  bucket = var.name

  versioning {
    enabled = var.versioning
  }

  lifecycle {
    prevent_destroy = "true"
  }

  tags = merge( var.common_tags, {
      "Name" = var.name
  })
}

# Prevent state leaks by blocking public access
resource "aws_s3_bucket_public_access_block" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id

  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls  = true
}

# Dynamodb table to do state locking
resource "aws_dynamodb_table" "terraform_state_lock" {
  name           = "${var.name}-lock"
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = merge( var.common_tags, {
      "Name" = "${var.name}-lock"
  })
}

###############################################################################
