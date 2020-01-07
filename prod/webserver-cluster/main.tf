provider "docker" {
  host = "unix:///var/run/docker.sock"
}

module "webserver_cluster" {
  source = "../../modules/webserver-cluster"

  network_name = "prod-network"
  instances_number = "5"           # More instances needed in prod
  lb_ext_port = "8080"             # LBs from each environment should have different ports
  environment_name = "prod"
}
