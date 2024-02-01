###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "ssh_public_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCRxdcX62gYIsf0t8pLZMLcDnWye6MXEzWoIsYwe6ma6ANRVD5TcY7U2+ijejTEeA+xAP6jg1JtBCGSQH6dMBQ9zrqYRQOTBBvzrB+QV9gUa6spVNZANLerWXmUVzFgXnr1J1F8LgkTdsLP5+uXBf99QJD732qPwcjaqQQmbRPxYCak1bdCOvUMh7S9Qu0XE5GN8wZu3ycuAZnxi4MVxCdQ5qyxcq0wN0v3830zVfeN18JGdumU0ff5kewtjVRUlM5Ro7z06nYHxhLfyraObykXYrqii1w+FebbF06x4T3QYb1Vx4I5JA7yt0JrCUBMfcBcAxQSfxhEwwjv4nuDHw7S6isXObuDkMPPSEo+PwjAb46HC96RsfoTG2UJtK6YPmG2Uuu0eTRAbEyzsyYJmhV+tYV1eV3akf9tTxn/Kd460VMsCnHO6V+oPDlgebsyme6wyU59Cc9AfIFD/13WkKUuGQqo2PvkSnWKaMhJ0v/OSU9InkhE6uekQy9N6G/hujk= abramov@abramov"
}