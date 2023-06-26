# Project 2:  Web Application Deployment with AWS EC2, Load Balancer, and Route 53

## Set up EC2 instances:

+ Launch multiple EC2 instances in different availability zones and install Nginx on each instance.

+ Create a new security group and configure it to allow incoming traffic on port 80 (HTTP).

## Configure Nginx:

+ Configure Nginx to serve the web application on port 80.
  
+ Verify that Nginx is serving the web application correctly on each instance.

## Set up an Application Load Balancer:

+ Create an Application Load Balancer in AWS and configure it to distribute traffic across the EC2 instances.

+ Create a new target group and add the EC2 instances to it.

## Configure Route 53:

+ Create a new DNS record in Route 53 that points to the Load Balancer's DNS name.

+ Verify that the DNS record is resolving correctly.

## Test the deployment:

+ Access the web application in a web browser using the DNS name in the Route 53 record.

+ Verify that the Load Balancer is distributing traffic evenly across the EC2 instances.



