# Terraform S3 storage

A Terraform module to bootstrap S3 state storage.

## Usage

```hcl

module "my_storage" {
    name        = "my-s3-storage"
    common_tags = {
        Project    = "my-project"
        Maintainer = "me"
    }
}

```

## Requirements

/

## Inputs

| Variable | Description | Type | Default value |
|----------|-------------|------|---------------|
| `name` | Name for the S3 bucket and dynamodb table | `string` | |
| `versioning` | Should the S3 bucket keep old state versions? | `bool` | `true` |
| `encryption` | Should server side encryption be enabled by default? | `bool` | `true` |
| `common_tags` | Tags that will be added to all created resources | `map(string)`  | `{}` |
| `force_destroy` | Should the S3 bucket be destroyed even if data is present? | `bool` | `false` |

## Outputs

| Variable | Description | Type |
|----------|-------------|------|
| `bucket_id` | ID of the created bucket | `string` |
| `dynamodb_table_id` | ID of the created dynamodb table | `string` |
