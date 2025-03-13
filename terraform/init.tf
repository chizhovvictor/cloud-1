terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

# Set the variable value in *.tfvars file
# or using -var="do_token=..." CLI option
variable "do_token" {}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_droplet" "web" {
  image   = "ubuntu-20-04-x64"
  name    = "cloud-1"
  region  = "nyc3"
  size    = "s-1vcpu-1gb"
  ssh_keys = [
    "33:36:79:70:9b:41:73:f1:b1:87:d4:94:cb:44:8e:23"
    ]
}

output "server_ip" {
  value = digitalocean_droplet.web.ipv4_address
}
