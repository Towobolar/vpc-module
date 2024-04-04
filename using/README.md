## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_my_vpc"></a> [my\_vpc](#module\_my\_vpc) | ../module/vpc | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_az_private_subnet"></a> [az\_private\_subnet](#input\_az\_private\_subnet) | availability zone for private subnet | `string` | n/a | yes |
| <a name="input_az_public_subnet"></a> [az\_public\_subnet](#input\_az\_public\_subnet) | availability zone for public subnet | `string` | n/a | yes |
| <a name="input_private_subnet_cidr_block"></a> [private\_subnet\_cidr\_block](#input\_private\_subnet\_cidr\_block) | private subnet cidr block | `string` | n/a | yes |
| <a name="input_public_subnet_cidr_block"></a> [public\_subnet\_cidr\_block](#input\_public\_subnet\_cidr\_block) | public subnet cidr block | `string` | n/a | yes |
| <a name="input_tag_internet_gateway"></a> [tag\_internet\_gateway](#input\_tag\_internet\_gateway) | internet gateway | `string` | n/a | yes |
| <a name="input_tag_private_subnet_name"></a> [tag\_private\_subnet\_name](#input\_tag\_private\_subnet\_name) | tag for private subnet | `string` | n/a | yes |
| <a name="input_tag_public_route_table"></a> [tag\_public\_route\_table](#input\_tag\_public\_route\_table) | public route table tag | `string` | n/a | yes |
| <a name="input_tag_public_subnet_name"></a> [tag\_public\_subnet\_name](#input\_tag\_public\_subnet\_name) | tag for public subnet | `string` | n/a | yes |
| <a name="input_tag_vpc_name"></a> [tag\_vpc\_name](#input\_tag\_vpc\_name) | tag name for vpc | `string` | n/a | yes |
| <a name="input_vpc_cidr_block"></a> [vpc\_cidr\_block](#input\_vpc\_cidr\_block) | vpc cidr block | `string` | n/a | yes |

## Outputs

No outputs.
