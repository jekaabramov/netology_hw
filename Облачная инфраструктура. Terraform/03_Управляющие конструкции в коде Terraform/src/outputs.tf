output "vm_list" {
  value = concat([
    for instance in yandex_compute_instance.web : {
      name = instance.name
      id   = instance.id
      fqdn = instance.network_interface[0]
    }],
  [
    for instance in yandex_compute_instance.vm : {
      name = instance.name
      id   = instance.id
      fqdn = instance.network_interface[0]
    }]
 )
}