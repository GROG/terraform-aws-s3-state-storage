###############################################################################
# Required variables

variable "name" {
  type        = string
  description = <<EOF
Name for the S3 bucket and dynamodb table
EOF
}

###############################################################################
# Optional variables

variable "versioning" {
  type        = string
  default     = true
  description = <<EOF
Should the S3 bucket keep old state versions?
EOF
}

variable "read_capacity" {
  type        = number
  default     = 5
  description = <<EOF
DynamoDB Read capacity
EOF
}

variable "write_capacity" {
  type        = number
  default     = 5
  description = <<EOF
DynamoDB write capacity
EOF
}

variable "common_tags" {
  type        = map(string)
  default     = {}
  description = <<EOF
Tags that will be added to all created resources
EOF
}

###############################################################################
