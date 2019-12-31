output "ips" {
  value = "${join(",", docker_container.web.*.ip_address)}"
}

