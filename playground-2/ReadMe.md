<h1>Terraform Lab2</h1>
This is a follow up on playground-1</br>

<p>Assumpiotion</p>: to limit the scope of our design and to define it , we design it to make a high available program, the infrustructure is explained in this simple diagram</br>

![alt text](https://github.com/samy-soliman/terraform-playground/blob/main/playground-2/photos/design.png)

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


