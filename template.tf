data "zabbix_template" "linux" {
  host = "Linux by Zabbix agent"
}

data "zabbix_template" "zabbix_server" {
  host = "Zabbix server health"
}