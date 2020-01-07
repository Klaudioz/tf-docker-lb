provider "docker" {
  host = "unix:///var/run/docker.sock"
}

module "webserver_cluster" {
  source = "../../modules/webserver-cluster"

  network_name = "stage-network"
  instances_number = "2"           # Less instances needed in stage
  lb_ext_port = "8180"             # # LBs from each environment should have different ports
  nginx_image_version = "1.17.6"   # Newest version of nginx in stage for testing
  environment_name = "stage"
}

