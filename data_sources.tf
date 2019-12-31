data "template_file" "load-balancer" {
  template = "${file("${path.module}/nginx.conf")}"
  vars {
    web_ip_list = "${join(",", docker_container.web.*.ip_address)}"
  }
}
