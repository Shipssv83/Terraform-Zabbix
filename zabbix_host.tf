resource "zabbix_host" "zabbix_server" {
  host   = "Zabbix server"
  groups = [data.zabbix_hostgroup.linuxgr.id]
  templates = [
    data.zabbix_template.linux.id,
    data.zabbix_template.zabbix_server.id,
  ]
  interface {
    dns  = "monitoring"
    main = true
  }
  lifecycle {
    ignore_changes = [
      proxyid
    ]
  }
}
