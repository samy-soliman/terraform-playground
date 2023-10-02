<h1>Terraform Lab2</h1>

<h2>Open playground-2 video to see it live :D</h2>

This is a follow up on playground-1</br>

<h2>Lab2 Steps </h2></br>
1-create two workspaces dev and prod
2-create two variable definition files(.tfvars) for the two environments
3-separate network resources into network module
4-apply your code to create two environments one in us-east-1 and us-east-2
5-run local-exec provisioner to print the public_ip of bastion ec2
6- upload infrastructure code on github project
7-create jenkins image with terraform installed inside it
8- create pipeline that takes env-param to apply terraform code on certain env
9-verify your email in ses service
10- create lambda function to send email
11-create trigger to detect changes in state file and send the email
