# Terraforming Docker environment using a Nginx Load balancer

Example about the Creation of a local environment with TF and Docker with n containers showing a "Hello from server n" message with a Nginx LB in front of them. 

## Terraform

Checking if everything is OK.

`terraform plan`

Apply the changes.

`terraform apply`

Basic check about the containers creation.

`docker ps -a`

Checking the Load Balancing.

[Link](http://localhost:8080){:target="_blank"}{:style="color: pink; font-size:20px;"}

Destroy changes.

`terraform destroy`
