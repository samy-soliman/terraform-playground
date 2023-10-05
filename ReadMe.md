<h1>Terraform Project</h1>
Deploy a high availablle insfrustructure solution on aws using terraform, making use of variables, modules, aws SES and lambda,</br>
we are also triggering the terraform code from a jenkins docker based pipeline.

![alt text](https://github.com/samy-soliman/terraform-playground/blob/main/playground-2/photos/design.png)

<h2>Open playground-2 video to see it live :D</h2>

<h2>playgroung-1 task</h2>
First : configure remote backend and configure state locking using dynamo db</br>
<h2>Networking </h2>
1- create vpc </br>
2- create internet gateway </br>
3- 2 public subnets and 2 private subnets , seperated in two AZ's , every Az has one public and one private </br>
4- create public route table </br>
5- create public route </br>
6- attach public route table to subnets </br>
7- create nat gateway</br> 
8- create private route table </br>
9- create private route table</br>
10- attach it to private subnets</br>

</br>
<h2> Compute </h2></br>
7- create security group which allow ssh from 0.0.0.0/0 </br>
8- create security group that allow ssh and port 3000 from vpc cidr only </br>
7- create ec2(bastion) in public subnet with security group from 7 </br>
8- create ec2(application) private subnet with security group from 8 </br>


<h2>playgroung-2 task</h2>
<h2>manual</h2>
it deploys in the region of your choise:</br>
1- mandatory to enter 4 subnets configs , 2 public , 2 private</br>
2- two of your ec2 will be placed in your public subnets , the other two in the private subnets</br>
3- an ssh key will be created fot both public ec2 , and another one for the private</br>
4- security groups</br>
5- 2 natgateways</br>
6- internet gateway</br>
7- 2 elastix ip addresses</br>
</br>
<h2>Open playground-2 video to see it live :D</h2>
<h2>Lab2 Break Down </h2></br>
1-create two workspaces dev and prod</br>
2-create two variable definition files(.tfvars) for the two environments</br>
3-separate network resources into network module</br>
4-apply your code to create two environments one in us-east-1 and us-east-2</br>
5-run local-exec provisioner to print the public_ip of bastion ec2</br>
6- upload infrastructure code on github project</br>
7-create jenkins image with terraform installed inside it</br>
8- create pipeline that takes env-param to apply terraform code on certain env</br>
9-verify your email in ses service</br>
10- create lambda function to send email</br>
11-create trigger to detect changes in state file and send the email</br>





