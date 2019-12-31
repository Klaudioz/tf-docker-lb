output "list_containers_ip" {
  value = "${join(",", docker_container.web.*.ip_address)}"
}

output "list_containers_name" {
  value = "${join(",", docker_container.web.*.name)}"
}

output "load_balancer_ip" {
  value = "${join(",", docker_container.lb.*.ip_address)}"
}

output "load_balancer_name" {
  value = "${join(",", docker_container.lb.*.name)}"
}
