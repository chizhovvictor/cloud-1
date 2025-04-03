resource "digitalocean_droplet" "web" {
  image  = "ubuntu-20-04-x64"
  name   = "cloud-1"
  region = "nyc3"
  size   = "s-1vcpu-1gb"
  ssh_keys = [
    "33:36:79:70:9b:41:73:f1:b1:87:d4:94:cb:44:8e:23"
  ]
  
}


# resource "digitalocean_firewall" "web_firewall" {
#   name = "web-firewall"

#   droplet_ids = [
#     digitalocean_droplet.web.id
#   ]

#   # Правила для порта 22 (SSH)
#   inbound_rule {
#     protocol         = "tcp"
#     port_range       = "22"
#     source_addresses = ["0.0.0.0/0"]
#   }

#   # Правила для порта 443 (HTTPS)
#   inbound_rule {
#     protocol         = "tcp"
#     port_range       = "443"
#     source_addresses = ["0.0.0.0/0"]
#   }

#   outbound_rule {
#     protocol              = "icmp"
#     destination_addresses = ["0.0.0.0/0", "::/0"]
#   }

#   outbound_rule {
#     protocol              = "tcp"
#     port_range            = "0-65535"
#     destination_addresses = ["0.0.0.0/0"]
#   }
# 
# }
