resource "null_resource" "webservers" {
  provisioner "local-exec" {
    command = <<EOH
      sleep 10
      ansible -i ${local_file.ansible_inventory_file.filename} pvt -m ping
    EOH
  }
  depends_on = [local_file.ansible_inventory_file]
}

