variable "proxmox_api_url" {
  type      = string
  sensitive = true
}

variable "proxmox_api_token_id" {
  type      = string
  sensitive = true
}

variable "proxmox_api_token_secret" {
  type      = string
  sensitive = true
}

variable "k3s_server_ids" {
  type    = list(string)
  default = [201, 202]
}

variable "k3s_agent_ids" {
  type    = list(string)
  default = [203, 204, 205, 206]
}

variable "k3s_server_ips" {
  type    = list(string)
  default = ["192.168.0.121", "192.168.0.122"]
}

variable "k3s_agent_ips" {
  type    = list(string)
  default = ["192.168.0.123", "192.168.0.124", "192.168.0.125", "192.168.0.126"]
}
