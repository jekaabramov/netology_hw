## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_template"></a> [template](#provider\_template) | 2.2.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_test-vm"></a> [test-vm](#module\_test-vm) | git::https://github.com/udjin10/yandex_compute_instance.git | main |
| <a name="module_vpc_dev"></a> [vpc\_dev](#module\_vpc\_dev) | ./modules/vpc_dev | n/a |

## Resources

| Name | Type |
|------|------|
| [template_file.cloudinit](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloud_id"></a> [cloud\_id](#input\_cloud\_id) | https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id | `string` | n/a | yes |
| <a name="input_default_cidr"></a> [default\_cidr](#input\_default\_cidr) | https://cloud.yandex.ru/docs/vpc/operations/subnet-create | `list(string)` | <pre>[<br>  "10.0.1.0/24"<br>]</pre> | no |
| <a name="input_default_zone"></a> [default\_zone](#input\_default\_zone) | https://cloud.yandex.ru/docs/overview/concepts/geo-scope | `string` | `"ru-central1-a"` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id | `string` | n/a | yes |
| <a name="input_ssh_public_key"></a> [ssh\_public\_key](#input\_ssh\_public\_key) | n/a | `string` | `"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCRxdcX62gYIsf0t8pLZMLcDnWye6MXEzWoIsYwe6ma6ANRVD5TcY7U2+ijejTEeA+xAP6jg1JtBCGSQH6dMBQ9zrqYRQOTBBvzrB+QV9gUa6spVNZANLerWXmUVzFgXnr1J1F8LgkTdsLP5+uXBf99QJD732qPwcjaqQQmbRPxYCak1bdCOvUMh7S9Qu0XE5GN8wZu3ycuAZnxi4MVxCdQ5qyxcq0wN0v3830zVfeN18JGdumU0ff5kewtjVRUlM5Ro7z06nYHxhLfyraObykXYrqii1w+FebbF06x4T3QYb1Vx4I5JA7yt0JrCUBMfcBcAxQSfxhEwwjv4nuDHw7S6isXObuDkMPPSEo+PwjAb46HC96RsfoTG2UJtK6YPmG2Uuu0eTRAbEyzsyYJmhV+tYV1eV3akf9tTxn/Kd460VMsCnHO6V+oPDlgebsyme6wyU59Cc9AfIFD/13WkKUuGQqo2PvkSnWKaMhJ0v/OSU9InkhE6uekQy9N6G/hujk= abramov@abramov"` | no |
| <a name="input_token"></a> [token](#input\_token) | OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token | `string` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | VPC network&subnet name | `string` | `"develop"` | no |

## Outputs

No outputs.
