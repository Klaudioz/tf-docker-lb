variable "network_name" {
 description = "Human friendly private network name"
 default = "my_network"
}

variable "instances_number" {
 description = "Number of docker containers which will be behing the LB"
 default = 2
}

variable "int_port" {
  description = "Internal port for containers and LB"
  default     = "80"
}

variable "lb_ext_port" {
  description = "External port for LB."
  default     = "8080"
}

variable "index_html_path_destination" {
  description = "Hello from html file for containers destination path"
  default     = "/usr/share/nginx/html/index.html"
}

variable "nginx_conf_path_destination" {
  description = "Load balancer config file destination path"
  default     = "/etc/nginx/nginx.conf"
}

variable "nginx_image_name" {
  description = "Nginx image name"
  default     = "nginx"
}

variable "nginx_image_version" {
  description = "Nginx image version. latest is an antipattern"
  default     = "1.17.5"
}

