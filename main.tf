# Create a new docker network
resource "docker_network" "private_network" {
  name = "${var.network_name}"
}

# Create web containers
resource "docker_container" "web" {
  # This will create n instances of nginx container
  count = "${var.instances_number}"

  name = "web-${format("%02d", count.index+1)}"
  image = "${docker_image.nginx.name}"

  networks_advanced {
    name = "${docker_network.private_network.name}"
  }

  ports {
    internal = "${var.container_int_port}"
    external = "${8081 + count.index}"
  }

  upload {
    content = "<html><h1>Hello from web-${format("%02d", count.index+1)}</h1></html>"
    file = "${var.index_html_path_destination}"
  }
}

# Create LB container
resource "docker_container" "lb" {
  depends_on = ["docker_container.web"]

  name = "nginx-lb"
  image = "${docker_image.nginx.name}"

  networks_advanced {
    name = "${docker_network.private_network.name}"
  }

  ports {
    internal = "${var.lb_int_port}"
    external = "${var.lb_ext_port}"
  }

  upload {
    content = "${data.template_file.load-balancer.rendered}"
    file = "${var.nginx_conf_path_destination}"
  }
}

resource "docker_image" "nginx" {
  name = "${var.nginx_image_version}"
}
