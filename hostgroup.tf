data "zabbix_host" "Zabbix" {
  host = "Zabbix server"
}

data "zabbix_hostgroup" "linuxgr" {
  name = "Linux servers"
}

data "zabbix_hostgroup" "Hypervisors" {
  name = "Hypervisors"
}
