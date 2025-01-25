Hi, ![](https://user-images.githubusercontent.com/18350557/176309783-0785949b-9127-417c-8b55-ab5a4333674e.gif)my name is Serhii Shypylov
=========================================================================================================================================

-------------------------------

### Socials
<p align="left">
  <a href="https://t.me/oneitpro">
    <img src="https://img.icons8.com/ios-glyphs/30/ffffff/telegram-app.png" alt="Telegram" width="30" height="30" />
  </a>
  <a href="https://www.linkedin.com/in/sergey-shipilov-7262a31b4/">
    <img src="https://img.icons8.com/ios-glyphs/30/ffffff/linkedin.png" alt="LinkedIn" width="30" height="30" />
  </a>
  <a href="https://www.instagram.com/shipssvpl/">
    <img src="https://img.icons8.com/ios-glyphs/30/ffffff/instagram-new.png" alt="Instagram" width="30" height="30" />
  </a>
  <a href="https://www.facebook.com/profile.php?id=100083345006373">
    <img src="https://img.icons8.com/ios-glyphs/30/ffffff/facebook.png" alt="Facebook" width="30" height="30" />
  </a>
  <a href="https://discord.com/invite/6z5EyagDyW?ref=1it.pro">
    <img src="https://img.icons8.com/ios-glyphs/30/ffffff/discord.png" alt="Discord" width="30" height="30" />
  </a>
  <a href="mailto:admin@1it.pro">
    <img src="https://img.icons8.com/ios-glyphs/30/ffffff/new-post.png" alt="Mail" width="30" height="30" />
  </a>
  <a href="https://1it.pro/">
    <img src="https://img.icons8.com/ios-glyphs/30/ffffff/domain.png" alt="Website" width="30" height="30" />
  </a>
</p>

# Terraform Setup for Zabbix Configuration

This project provides Terraform configurations for automating the deployment and configuration of Zabbix components.

---

## Overview

The Terraform configuration simplifies Zabbix management by automating the following tasks:

- **Zabbix Server Setup**: Configure the Zabbix server with desired templates and host groups.  
- **Host Management**: Add or update monitored hosts with predefined settings.  
- **Integration**: Automatically link Zabbix with external alerting or visualization tools like Grafana.  

---

## Prerequisites

Before using this configuration, ensure you have:

1. A Zabbix server deployed and accessible (version 6.0+ recommended).  
2. API access enabled on the Zabbix server with a valid token.  
3. Terraform installed (version 1.3+ recommended).  

---

## Variables

The Terraform configuration uses the following variables:

```hcl
variable "zabbix_api_url" {
  description = "URL of the Zabbix API endpoint"
  type        = string
}

variable "zabbix_api_user" {
  description = "Zabbix API username"
  type        = string
}

variable "zabbix_api_password" {
  description = "Zabbix API password"
  type        = string
}

variable "hosts" {
  description = "List of hosts to be managed by Zabbix"
  type        = list(object({
    hostname    = string
    ip_address  = string
    templates   = list(string)
    groups      = list(string)
  }))
}
Terraform Configuration
Providers
Use the Zabbix provider to interact with the Zabbix API:

hcl
Copy code
terraform {
  required_providers {
    zabbix = {
      source  = "djmitche/zabbix"
      version = "~> 0.3.0"
    }
  }
}

provider "zabbix" {
  url      = var.zabbix_api_url
  user     = var.zabbix_api_user
  password = var.zabbix_api_password
}
Example Resources
Host Configuration
This example creates a new host in Zabbix:

hcl
Copy code
resource "zabbix_host" "example_host" {
  name       = var.hosts[0].hostname
  interfaces = [{
    type    = "1"
    main    = true
    ip      = var.hosts[0].ip_address
    dns     = ""
    port    = "10050"
  }]
  groups = var.hosts[0].groups
  templates = var.hosts[0].templates
}

```
### How to Use

Example:
```hcl
export TF_VAR_zabbix_api_url="https://zabbix.example.com/api_jsonrpc.php"
export TF_VAR_zabbix_api_user="Admin"
export TF_VAR_zabbix_api_password="zabbix"

```

Initialize Terraform: Run the following command to download the necessary providers:
```hcl
terraform init
```

Plan Changes: To see what changes will be applied:
```hcl
terraform plan
```

Apply Changes: Run the following to apply the changes and create the DNS records:
```hcl
terraform apply
```

Destroy Resources: If you want to remove all resources managed by Terraform:
```hcl
terraform destroy
```

### Conclusion
This Terraform configuration automates the process of managing Zabbix configurations, making it easier to maintain consistency and scalability in your monitoring setup. Feel free to customize the variables and resources to fit your environment.

```
This **README** explains how to set up and use the Terraform configurations to manage Zabbix
```
