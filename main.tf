# Create a new docker network
resource "docker_network" "private_network" {
  name = "${var.network_name}"
}

# Create NGINX container
resource "docker_container" "nginx" {
  # This will create n instances of nginx container
  count = 4

  name = "web-${format("%02d", count.index+1)}"
  image = "${docker_image.nginx.name}"
  networks_advanced {
    name = "${docker_network.private_network.name}"
  }
  ports {
    internal = 80
    external = "${8081 + count.index}"
  }
  upload {
    content = "<html><h1>Hello from web-${format("%02d", count.index+1)}</h1></html>"
    file = "/usr/share/nginx/html/index.html"
  }
}

resource "docker_image" "nginx" {
  name = "nginx:1.17.6"
}

#output "network_data" {
  #value = "${docker_container.nginx.network_data}"
#}
