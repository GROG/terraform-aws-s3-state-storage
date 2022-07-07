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
  type        = bool
  default     = true
  description = <<EOF
Should the S3 bucket keep old state versions?
EOF
}

variable "encryption" {
  type        = bool
  default     = true
  description = <<EOF
Should server side encryption be enabled by default?

If enabled (default) transparent AES256 encryption with S3 managed keys is
used.
EOF
}

variable "common_tags" {
  type        = map(string)
  default     = {}
  description = <<EOF
Tags that will be added to all created resources
EOF
}

variable "force_destroy" {
  type        = bool
  default     = false
  description = <<EOF
Force destroy the state bucket
EOF
}

###############################################################################
