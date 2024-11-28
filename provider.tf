terraform {
  required_providers {
    zabbix = {
      source = "tpretz/zabbix"
      # version = "0.17.0"
    }
  }
}

provider "zabbix" {
  username = var.zabbix_username
  password = var.zabbix_password
  url      = var.zabbix_url

  tls_insecure = true 
  serialize    = true
}

variable "zabbix_username" {
  description = "Username to connect to Zabbix"
  type        = string
}

variable "zabbix_password" {
  description = "Password for connecting to Zabbix"
  type        = string
}

variable "zabbix_url" {
  description = "URL for connecting to Zabbix API"
  type        = string
}
