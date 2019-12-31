# Terraforming Docker environment using a Nginx Load balancer

Example about the Creation of a local environment with TF and Docker with n containers showing a "Hello from server n" message with a Nginx LB in front of them. 

## Install Docker and Terraform

If you don't have them installed previously, please do it.
For this demostration I used Terraform v0.11.11 and Docker version 19.03.5 using Mac.

## Terraform

Checking if everything is OK:

`terraform plan`

Apply the changes if wasn't any error in the previous step:

`terraform apply`

There are two ways to check if the load balancer is working: 

- Go to your browser and load the following URL and refresh it several times: http://localhost:8080
(using Chrome Version 79.0.3945.88 I always get "Hello from web-01" but using Safari Version 13.0.3 I can see the message changing everytime.)

- Or (my prefered way to do it) run this command in your terminal:

`for ((i=1;i<=10;i++)); do curl localhost:8080; printf '%s\n'; done`

Verify the containers are running:

`docker ps -a`

Clean up:

`terraform destroy`

Youtube demo:

[![Alt text](https://img.youtube.com/vi/VID/0.jpg)](https://youtu.be/EXSq7ACueHE)

Terminal demo:

[![asciicast](https://asciinema.org/a/BknVZnVlfvwdXSlPd62zV85Ae.svg)](https://asciinema.org/a/BknVZnVlfvwdXSlPd62zV85Ae)