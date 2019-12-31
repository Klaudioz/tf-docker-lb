# Terraforming Docker environment using a Nginx Load balancer

Example about the Creation of a local environment with TF and Docker with n containers showing a "Hello from server n" message with a Nginx LB in front of them. 

## Install Docker and Terraform

If you don't have them installed previously, please do it.

## Terraform

Checking if everything is OK.

`terraform plan`

Apply the changes.

`terraform apply`

There are two ways to check if the load balancer is working: 

- Go to your browser and load the following URL and refresh it several times: http://localhost:8080

- Or (my prefered way to do it) run this command in your terminal:

`for ((i=1;i<=10;i++)); do curl localhost:8080; printf '%s\n'; done`


Basic check about the containers creation.

`docker ps -a`

Destroy changes.

`terraform destroy`
