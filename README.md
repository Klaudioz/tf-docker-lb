# Terraforming Docker environment using a Nginx Load balancer

Example about the Creation of a local environment with TF and Docker with n containers showing a "Hello from server n" message with a Nginx LB in front of them. 

## Install Docker and Terraform

If you don't have them installed previously, please do it.
For this demostration I used Terraform v0.11.11 and Docker version 19.03.5 using Mac.

## Terraform

There are two folders were you can create the infrastructure (stage and prod), choose any of these and follow the steps:

Checking if everything is OK:

`terraform plan`

Apply the changes if wasn't any error in the previous step:

`terraform apply`

There are two ways to check if the load balancer is working: 

- Go to your browser and load the following URL and refresh it several times: http://localhost:8080
(using Chrome Version 79.0.3945.88 I always get "Hello from web-01" but using Safari Version 13.0.3 I can see the message changing everytime.)

- Or (my prefered way to do it) run this command in your terminal:

`for ((i=1;i<=10;i++)); do curl localhost:port; printf '%s\n'; done` (change for the port of every environment 8080 for prod, 8180 for stage or if you use any particular one)

Verify the containers are running:

`docker ps -a`

Clean up:

`terraform destroy`

Youtube demo:

[![Alt text](http://i3.ytimg.com/vi/EXSq7ACueHE/hqdefault.jpg)](https://youtu.be/EXSq7ACueHE)

Terminal demo:

[![asciicast](https://asciinema.org/a/BknVZnVlfvwdXSlPd62zV85Ae.svg)](https://asciinema.org/a/BknVZnVlfvwdXSlPd62zV85Ae)

You can run both environment at the same time. Both are isolated and using different docker networks. Also, you can create new folders for new environments using the module created.

Bonus:

If you want for example 5 web containers instead the default number of 2, just execute terraform apply in this way:

`terraform apply -var instances_number="5"`

Or you want to use a different version of nginx:

`terraform apply -var nginx_image_version="1.17.6"`