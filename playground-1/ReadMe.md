configure remote backend and configure state locking using dynamo db</br>
</br>

Networking </br>
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
Compute </br>
7- create security group which allow ssh from 0.0.0.0/0 </br>
8- create security group that allow ssh and port 3000 from vpc cidr only </br>
7- create ec2(bastion) in public subnet with security group from 7 </br>
8- create ec2(application) private subnet with security group from 8 </br>
</br></br>


