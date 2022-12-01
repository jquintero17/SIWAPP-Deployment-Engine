#resource "local_sensitive_file" "foo" {
#    content  = local.creds.vault_pass
#    filename = "${path.module}/scratch"
#    file_permission = 0600
#}

resource "local_file" "ansible_inventory" {
    content  = templatefile("${path.module}/inventory.vmware.tftpl", {
        vm_name = random_pet.random_name.id
    })
    filename = "${path.module}/inventory.vmware.yml"
}