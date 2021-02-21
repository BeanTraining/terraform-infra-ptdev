This module creates AWS VPC and enables collection of flow logs.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| additional\_cidr\_blocks | List of additional VPC CIDR blocks | list | `[]` | no |
| app\_name | Name of the application | string | n/a | yes |
| aws\_account\_id | AWS account ID in which flow logs will be stored | string | n/a | yes |
| aws\_region | AWS region in which flow logs will be stored. Used for creating default domain name | string | n/a | yes |
| cidr\_block | Main VPC CIDR block | string | n/a | yes |
| domain\_name | Custom domain name | string | `""` | no |
| domain\_name\_servers | Custom DNS servers | list | `[ "AmazonProvidedDNS" ]` | no |
| enable\_private\_dns | Enable VPC private DNS | string | `"false"` | no |
| environment | Name of the environment | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| this\_aws\_vpc\_id | ID of the created VPC |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
