resource "proxmox_vm_qemu" "k3s_servers" {
  count       = 1
  os_type     = "cloud-init"
  agent       = 1
  name        = "k3s-server-${count.index + 1}"
  desc        = "k3s server node"
  target_node = "MiddleEarth"
  clone       = "ubuntu-cloud"
  full_clone  = true
  pool        = "forbidden_pool"
  vmid        = var.k3s_server_ids[count.index]
  cpu         = "host"
  sockets     = 1
  cores       = 4
  memory      = 4096
  balloon     = 1024

  network {
    bridge = "vmbr0"
    model  = "virtio"
  }

  disk {
    storage = "Imladris"
    type    = "scsi"
    size    = "80G"
  }

  ipconfig0  = "ip=${var.k3s_server_ips[count.index]}/24,gw=192.168.0.1"
  nameserver = "192.168.0.3"
}

resource "proxmox_vm_qemu" "k3s_agents" {
  count       = 2
  os_type     = "cloud-init"
  agent       = 1
  name        = "k3s-agent-${count.index + 1}"
  desc        = "k3s agent node"
  target_node = "MiddleEarth"
  clone       = "ubuntu-cloud"
  full_clone  = true
  pool        = "forbidden_pool"
  vmid        = var.k3s_agent_ids[count.index]
  cpu         = "host"
  sockets     = 1
  cores       = 4
  memory      = 4096
  balloon     = 1024

  network {
    bridge = "vmbr0"
    model  = "virtio"
  }

  disk {
    storage = "Imladris"
    type    = "scsi"
    size    = "80G"
  }

  ipconfig0  = "ip=${var.k3s_agent_ips[count.index]}/24,gw=192.168.0.1"
  nameserver = "192.168.0.3"
}
