resource "vsphere_virtual_machine" "app1" {
  name             = "${random_pet.random_name.id}-app1"
  resource_pool_id = data.vsphere_compute_cluster.compute_cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id
  folder           = "${vsphere_folder.folder.path}"
  num_cpus         = 2
  memory           = 4096
  guest_id         = data.vsphere_virtual_machine.template.guest_id
  scsi_type        = data.vsphere_virtual_machine.template.scsi_type
  network_interface {
    network_id   = data.vsphere_network.automation_net.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }
  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.template.disks.0.size
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customize {
      linux_options {
        host_name = "${random_pet.random_name.id}-app1"
        domain    = "${var.domain}"
      }
      network_interface {}
    }
  }
  tags = ["${data.vsphere_tag.siwapp_tag.id}", "${data.vsphere_tag.app_tag.id}"]
}


resource "vsphere_virtual_machine" "app2" {
  name             = "${random_pet.random_name.id}-app2"
  resource_pool_id = data.vsphere_compute_cluster.compute_cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id
  folder           = "${vsphere_folder.folder.path}"
  num_cpus         = 2
  memory           = 4096
  guest_id         = data.vsphere_virtual_machine.template.guest_id
  scsi_type        = data.vsphere_virtual_machine.template.scsi_type
  network_interface {
    network_id   = data.vsphere_network.automation_net.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }
  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.template.disks.0.size
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customize {
      linux_options {
        host_name = "${random_pet.random_name.id}-app2"
        domain    = "${var.domain}"
      }
      network_interface {}
    }  
  }
  tags = ["${data.vsphere_tag.siwapp_tag.id}", "${data.vsphere_tag.app_tag.id}"]
}


resource "vsphere_virtual_machine" "app3" {
  name             = "${random_pet.random_name.id}-app3"
  resource_pool_id = data.vsphere_compute_cluster.compute_cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id
  folder           = "${vsphere_folder.folder.path}"
  num_cpus         = 2
  memory           = 4096
  guest_id         = data.vsphere_virtual_machine.template.guest_id
  scsi_type        = data.vsphere_virtual_machine.template.scsi_type
  network_interface {
    network_id   = data.vsphere_network.automation_net.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }
  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.template.disks.0.size
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customize {
      linux_options {
        host_name = "${random_pet.random_name.id}-app3"
        domain    = "${var.domain}"
      }
      network_interface {}
    }
  }
  tags = ["${data.vsphere_tag.siwapp_tag.id}", "${data.vsphere_tag.app_tag.id}"]
}


resource "vsphere_virtual_machine" "db1" {
  name             = "${random_pet.random_name.id}-db1"
  resource_pool_id = data.vsphere_compute_cluster.compute_cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id
  folder           = "${vsphere_folder.folder.path}"
  num_cpus         = 2
  memory           = 4096
  guest_id         = data.vsphere_virtual_machine.template.guest_id
  scsi_type        = data.vsphere_virtual_machine.template.scsi_type
  network_interface {
    network_id   = data.vsphere_network.automation_net.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }
  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.template.disks.0.size
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customize {
      linux_options {
        host_name = "${random_pet.random_name.id}-db1"
        domain    = "${var.domain}"
      }
      network_interface {}
    }
  }
  tags = ["${data.vsphere_tag.siwapp_tag.id}", "${data.vsphere_tag.db_tag.id}", "${data.vsphere_tag.lead_tag.id}"]
}

resource "vsphere_virtual_machine" "db2" {
  name             = "${random_pet.random_name.id}-db2"
  resource_pool_id = data.vsphere_compute_cluster.compute_cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id
  folder           = "${vsphere_folder.folder.path}"
  num_cpus         = 2
  memory           = 4096
  guest_id         = data.vsphere_virtual_machine.template.guest_id
  scsi_type        = data.vsphere_virtual_machine.template.scsi_type
  network_interface {
    network_id   = data.vsphere_network.automation_net.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }
  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.template.disks.0.size
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customize {
      linux_options {
        host_name = "${random_pet.random_name.id}-db2"
        domain    = "${var.domain}"
      }
      network_interface {}
    }
  }
  tags = ["${data.vsphere_tag.siwapp_tag.id}", "${data.vsphere_tag.db_tag.id}"]
}

resource "vsphere_virtual_machine" "db3" {
  name             = "${random_pet.random_name.id}-db3"
  resource_pool_id = data.vsphere_compute_cluster.compute_cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id
  folder           = "${vsphere_folder.folder.path}"
  num_cpus         = 2
  memory           = 4096
  guest_id         = data.vsphere_virtual_machine.template.guest_id
  scsi_type        = data.vsphere_virtual_machine.template.scsi_type
  network_interface {
    network_id   = data.vsphere_network.automation_net.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }
  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.template.disks.0.size
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customize {
      linux_options {
        host_name = "${random_pet.random_name.id}-db3"
        domain    = "${var.domain}"
      }
      network_interface {}
    }
  }
  tags = ["${data.vsphere_tag.siwapp_tag.id}", "${data.vsphere_tag.db_tag.id}"]
}

resource "vsphere_virtual_machine" "db-lb" {
  name             = "${random_pet.random_name.id}-db-lb"
  resource_pool_id = data.vsphere_compute_cluster.compute_cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id
  folder           = "${vsphere_folder.folder.path}"
  num_cpus         = 2
  memory           = 4096
  guest_id         = data.vsphere_virtual_machine.template.guest_id
  scsi_type        = data.vsphere_virtual_machine.template.scsi_type
  network_interface {
    network_id   = data.vsphere_network.automation_net.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }
  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.template.disks.0.size
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customize {
      linux_options {
        host_name = "${random_pet.random_name.id}-db-lb"
        domain    = "${var.domain}"
      }
      network_interface {}
    }
  }
  tags = ["${data.vsphere_tag.siwapp_tag.id}", "${data.vsphere_tag.db_lb_tag.id}"]
}

resource "vsphere_virtual_machine" "app-lb" {
  name             = "${random_pet.random_name.id}-app-lb"
  resource_pool_id = data.vsphere_compute_cluster.compute_cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id
  folder           = "${vsphere_folder.folder.path}"
  num_cpus         = 2
  memory           = 4096
  guest_id         = data.vsphere_virtual_machine.template.guest_id
  scsi_type        = data.vsphere_virtual_machine.template.scsi_type
  network_interface {
    network_id   = data.vsphere_network.automation_net.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }
  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.template.disks.0.size
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customize {
      linux_options {
        host_name = "${random_pet.random_name.id}-app-lb"
        domain    = "${var.domain}"
      }
      network_interface {}
    }
  }
  tags = ["${data.vsphere_tag.siwapp_tag.id}", "${data.vsphere_tag.app_lb_tag.id}"]
    depends_on = [
    vsphere_virtual_machine.app1,
    vsphere_virtual_machine.app2,
    vsphere_virtual_machine.app3,
    vsphere_virtual_machine.db1,
    vsphere_virtual_machine.db2,
    vsphere_virtual_machine.db3,
    vsphere_virtual_machine.db-lb,
  ]
    provisioner "remote-exec" {
    inline =  ["echo Done!"]

    connection {
      host        = self.default_ip_address
      type        = "ssh"
      user        = "root"
      password = "C1sco12345!"
    }
  }
  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i inventory.vmware.yml --extra-vars \"activation_key=${var.activation_key} cco_username=${var.cco_username} cco_pass=${var.cco_password} application_name=${var.application_name}\" ansible/site.yml >> outputlog.txt"
  }
}
