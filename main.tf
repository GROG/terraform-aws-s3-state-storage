###############################################################################
# Bucket to store state

resource "aws_s3_bucket" "terraform_state" {
  bucket = var.name

  force_destroy = var.force_destroy

  tags = merge(var.common_tags, {
    "Name" = var.name
  })
}

###############################################################################
# Enable versioning

resource "aws_s3_bucket_versioning" "terraform_state" {
  count  = var.versioning ? 1 : 0
  bucket = aws_s3_bucket.terraform_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

###############################################################################
# Enable server side encryption

resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state" {
  count  = var.encryption ? 1 : 0
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

###############################################################################
# Prevent state leaks by blocking public access

resource "aws_s3_bucket_public_access_block" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id

  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls  = true
}

###############################################################################
# Dynamodb table to do state locking

resource "aws_dynamodb_table" "terraform_state_lock" {
  name         = "${var.name}-lock"
  hash_key     = "LockID"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = merge(var.common_tags, {
    "Name" = "${var.name}-lock"
  })
}

###############################################################################
