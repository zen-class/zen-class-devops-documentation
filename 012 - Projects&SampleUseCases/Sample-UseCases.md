# 20 DevOps Sample UseCases
## 1: React App Deployment with Docker
Description: Dockerize a React application using a multi-stage Docker build, and automate the process of building and deploying the Docker image to Docker Hub using bash scripts in jenkins pipeline.

## 2: Web Application Deployment with AWS EC2, Load Balancer, and Route 53
Description:
Deploy a web application using AWS EC2 instances, Application Load Balancer, and Route 53. Use EC2 instances to host the applications, while the Application Load Balancer distributes traffic across multiple instances for increased availability and scalability. Create Route 53 DNS service to route traffic to the appropriate EC2 instances.

## 3: Continuous Integration for a Node.js Application using Git, Jenkins, and
AWS Elastic Beanstalk
Description:
Set up a Continuous integration pipeline using Jenkins to build and test the Node.js application in Git. Use AWS Elastic Beanstalk service to automate the deployment and scaling of web applications.

## 4: Infrastructure as Code using Terraform and AWS VPC
Description:
Create a Terraform template to create AWS VPC by incorporating attributes like CIDR, private and public subnets,route table Internet gateway etc.

## 5: Container Orchestration with Kubernetes on AWS EKS
Description:
Configure a Kubernetes cluster on AWS Elastic Kubernetes Service (EKS) to orchestrate ,deploy and scale containerized applications on it.

## 6.Continuous Integration and Deployment of Node.js Application with Jenkins, AWS EC2 and Docker.
Description: Set up a Continuous integration and deployment pipeline using Jenkins to dockerize and test the Node.js application and push the docker image in docker hub repo.

## 7.Infrastructure Monitoring and Alerting with AWS CloudWatch.
Description: Configure CloudWatch alarms to trigger notifications (e.g. email, SMS) when the thresholds are breached

## 8.Infrastructure Automation with AWS Lambda
Description:1.Create a sample AWS S3 bucket and define an event trigger that calls a Lambda function.
2.Create a Lambda function that automates a predefined task (e.g. resizing images, encrypting files, copying files to another location)
3.Test the automation by uploading files to the S3 bucket and verifying that the Lambda function is triggered and automates the predefined task.

## 9. Create a multi node kubernetes cluster using AWS EKS
Description:  Create three worker node in AWS EKS using eksctl and deploy a nginx application in it.

## 10. Continuous Integration and Deployment with Docker, Jenkins, AWS EKS, and establish monitoring with Prometheus, and Grafana

## 11. Create dockerfile and docker compose file for the java, python, nodejs applications
Description: Create Dockerfiles and Docker Compose files for different applications written in Java, Python, and Node.js. Dockerfiles define the instructions for building Docker images, 
while Docker Compose files orchestrate the deployment of multiple containers.

## 12. Create an Auto Scaling group using the AWS Management Console and configure it to launch EC2 instances.

## 13. How to deploy your React app in s3
Description: Deploy a React application to Amazon S3 (Simple Storage Service). S3 can host static websites,
making it a convenient option for deploying React apps. 

##  14. AWS S3 Event Triggering Shell Script Used by Netflix, Airbnb, Adobe, Expedia, and Others
Description: AWS S3 event trigger to execute a shell script. When specific events occur in an S3 bucket, such as file uploads or deletions, the trigger invokes the shell script. 
This mechanism is employed by various companies to automate actions based on S3 events.

## 15. Create a jenkins freestyle project for a nodejs application by building and deploying it to ec2 instances .Create dockerfile and docker compose file for build and deployment.

## 16. Create a 3 tier project in AWS - Presentation tier, Application tier and database tier (setup VPC, subnet, IG, NAT gateway, route table, ec2 launch template, auto scaling group)
Description: involves setting up a three-tier architecture in AWS, including a presentation tier (front-end), application tier (back-end logic), and database tier. You'll create a Virtual Private Cloud (VPC), subnets, internet gateway (IG), NAT gateway, route table, EC2 instances, launch templates, and auto scaling groups to distribute the workload across different tiers.## 17. Jenkins Multi Branch CICD Pipeline using dev and prod environment 

## 18.Create a continuous integration and deployment for Dockerised Node app to AWS Elastic Beanstalk with AWS CodePipeline

## 19. Write a shell script to report the usage of AWS resources in your project

## 20. Create a Nginx AMI in aws
