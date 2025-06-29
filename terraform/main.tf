resource "digitalocean_droplet" "web" {
  image  = "ubuntu-20-04-x64"
  name   = "cloud-1"
  region = "nyc3"
  size   = "s-4vcpu-8gb"
  ssh_keys = [
    "33:36:79:70:9b:41:73:f1:b1:87:d4:94:cb:44:8e:23",
    "79:27:00:ff:c0:a6:5e:d3:10:d7:ac:06:ac:f0:8f:4a",
    "87:e1:58:b6:94:2b:01:4f:1d:40:cb:2c:3e:50:b2:a1"
  ]
  
}


resource "digitalocean_firewall" "web" {
  name = "only-22-80-and-443"

  droplet_ids = [digitalocean_droplet.web.id]

  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  # HTTP
  inbound_rule {
    protocol         = "tcp"
    port_range       = "80"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
  
  # HTTPS
  inbound_rule {
    protocol         = "tcp"
    port_range       = "443"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  # ICMP (ping, traceroute)
  # inbound_rule {
  #   protocol         = "icmp"
  #   source_addresses = ["0.0.0.0/0", "::/0"]
  # }

  # DNS
  outbound_rule {
    protocol              = "udp"
    port_range            = "53"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "53"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  # HTTPS (curl, apt, composer, git и т.п.)
  outbound_rule {
    protocol              = "tcp"
    port_range            = "443"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  # HTTP (если нужно скачивать с http-сайтов — не обязательно)
  outbound_rule {
    protocol              = "tcp"
    port_range            = "80"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  # ICMP (ping, traceroute)
  # outbound_rule {
  #   protocol              = "icmp"
  #   destination_addresses = ["0.0.0.0/0", "::/0"]
  # }

}
