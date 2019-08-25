###############################################################################
# Optional variables

variable "versioning" {
  type    = string
  default = true
}

variable "read_capacity" {
  type    = number
  default = 5
}

variable "write_capacity" {
  type    = number
  default = 5
}

###############################################################################
# Required variables

variable "name" {
  type = string
}

variable "common_tags" {
  type = map(string)
}

###############################################################################
