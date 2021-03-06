# Network stack

Live network resources definition.

## Resources

- VPC
- Subnet
- Route Table
- Network ACL
- Internet Gateway

## Design

- Create a Subnet for each tier
- Create a Route Table for each tier
- Unused Default Network ACL

## Outputs

| Name                                | Description                                                        |
| ----------------------------------- | ------------------------------------------------------------------ |
| eip_nat_gateway_ids                 | Contains the EIP allocation IDs.                                   |
| eip_nat_gateway_private_ips         | Contains the private IP addresses (if in VPC).                     |
| eip_nat_gateway_public_ips          | Contains the public IP addresses.                                  |
| internet_gateway_id                 | The ID of the Internet Gateway.                                    |
| nat_gateway_allocation_ids          | The Allocation IDs of the Elastic IP address for the gateways.     |
| nat_gateway_ids                     | The IDs of the NAT Gateways.                                       |
| nat_gateway_network_interface_ids   | The ENI IDs of the network interface created by the NAT gateways.  |
| nat_gateway_private_ips             | The private IP addresses of the NAT Gateways.                      |
| nat_gateway_public_ips              | The public IP addresses of the NAT Gateways.                       |
| nat_gateway_subnet_ids              | The Subnet IDs of the subnet in which the NAT gateways are placed. |
| private_egress_network_acl_rule_id  | The ID of the private egress network ACL Rule.                     |
| private_ingress_network_acl_rule_id | The ID of the private ingress network ACL Rule.                    |
| private_network_acl_id              | The ID of the private network ACL.                                 |
| private_route_table_association_ids | The IDs of the private associations.                               |
| private_route_table_ids             | The IDs of the private routing tables.                             |
| private_subnet_arns                 | The ARNs of the private subnets.                                   |
| private_subnet_availability_zones   | The Availability Zones for the private subnets.                    |
| private_subnet_cidr_blocks          | The CIDR blocks for the private subnets.                           |
| private_subnet_ids                  | The IDs of the private subnets.                                    |
| public_egress_network_acl_rule_id   | The ID of the public egress network ACL Rule.                      |
| public_ingress_network_acl_rule_id  | The ID of the public ingress network ACL Rule.                     |
| public_network_acl_id               | The ID of the public network ACL.                                  |
| public_route_table_association_ids  | The IDs of the public associations.                                |
| public_route_table_id               | The ID of the public routing table.                                |
| public_subnet_arns                  | The ARNs of the public subnets.                                    |
| public_subnet_availability_zones    | The Availability Zones for the public subnets.                     |
| public_subnet_cidr_blocks           | The CIDR blocks for the public subnets.                            |
| public_subnet_ids                   | The IDs of the public subnets.                                     |
| vpc_arn                             | Amazon Resource Name (ARN) of VPC.                                 |
| vpc_cidr_block                      | The CIDR block of the VPC.                                         |
| vpc_default_network_acl_id          | The ID of the network ACL created by default on VPC creation.      |
| vpc_default_route_table_id          | The ID of the route table created by default on VPC creation.      |
| vpc_default_security_group_id       | The ID of the security group created by default on VPC creation.   |
| vpc_enable_dns_hostnames            | Whether or not the VPC has DNS hostname support.                   |
| vpc_enable_dns_support              | Whether or not the VPC has DNS support.                            |
| vpc_id                              | The ID of the VPC.                                                 |
| vpc_instance_tenancy                | Tenancy of instances spin up within VPC.                           |
| vpc_main_route_table_id             | The ID of the main route table associated with this VPC.           |

## Troubleshooting

### Not exist Hosted Zone

If you receive the following error message, Hosted Zone does not exist in Route 53.

```shell
Error: Error refreshing state: 1 error(s) occurred:

* data.aws_route53_zone.default: 1 error(s) occurred:

* data.aws_route53_zone.default: data.aws_route53_zone.default: no matching Route53Zone found
```

You should put domain name to SSM Parameter Store.

```shell
aws ssm put-parameter --overwrite --name "/terraform/network/domain_name/root" --type "SecureString" --value "<your_domain>"
```

## References

- [terraform-aws-vpc](https://github.com/tmknom/terraform-aws-vpc) - Terraform module which creates VPC resources on AWS.
- [terraform-aws-acm-certificate](https://github.com/tmknom/terraform-aws-acm-certificate) - Terraform module which creates ACM certificate resources on AWS.
