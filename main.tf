# Create a new docker network
resource "docker_network" "private_network" {
  name = "${var.network_name}"
}

# Create web containers
resource "docker_container" "web" {
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

# Create LB container
resource "docker_container" "lb" {
  depends_on = ["docker_container.web"]

  name = "nginx-lb"
  image = "${docker_image.nginx.name}"
  #command = ["rm", "/etc/nginx/sites-enabled/default"]
  #command = ["mv", "/etc/nginx/conf.d/default.conf", "/etc/nginx/conf.d/default.conf.disabled"]
  #restart = "always"

  networks_advanced {
    name = "${docker_network.private_network.name}"
  }

  ports {
    internal = 80
    external = 8080
  }

  upload {
    content = "${data.template_file.load-balancer.rendered}"
    file = "/etc/nginx/nginx.conf"
  }
  
}

resource "docker_image" "nginx" {
  name = "nginx:1.17.6"
}
