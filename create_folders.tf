resource "vsphere_folder" "folder" {
  path          = "${random_pet.random_name.id}"
  type          = "vm"
  datacenter_id = data.vsphere_datacenter.dc.id
}