# AWS CodeDeploy



<img src="https://github.com/Vennilavan12/zen-class-devops-documentation/blob/main/010%20-%20AWS/img/cd1.png">



CodeDeploy is a deployment service that automates application deployments to Amazon EC2 instances, on-premises instances, serverless Lambda functions, or Amazon ECS services.

You can deploy a nearly unlimited variety of application content, including:

+ Code

+ Serverless AWS Lambda functions

+ Web and configuration files

+ Executables

+ Packages

+ Scripts

+ Multimedia files

+ CodeDeploy can deploy application content that runs on a server and is stored in Amazon S3 buckets, GitHub repositories, or Bitbucket repositories. 

+ CodeDeploy can also deploy a serverless Lambda function. You do not need to make changes to your existing code before you can use CodeDeploy. 

CodeDeploy makes it easier for you to:

+ Rapidly release new features.

+ Update AWS Lambda function versions.

+ Avoid downtime during application deployment.

+ Handle the complexity of updating your applications, without many of the risks associated with error-prone manual deployments.

+ CodeDeploy works with various systems for configuration management, source control, continuous integration, continuous delivery, and continuous deployment.


## Benefits of CodeDeploy

1. Server, serverless, and container applications
    
2. Automated deployments
    
3. Minimize downtime
    
4. Stop and roll back
    
5. Centralized control
    
6. Easy to adopt
    
7. Concurrent deployments


## CodeDeploy workflow



<img src="https://github.com/Vennilavan12/zen-class-devops-documentation/blob/main/010%20-%20AWS/img/cd2.png">




## CodeDeploy Compute Platforms

CodeDeploy is able to deploy applications to three compute platforms:

1. EC2/On-Premises
    
2. AWS Lambda
    
3. Amazon ECS 



## CodeDeploy Deployment Types

CodeDeploy provides two deployment type options:

1. In-place deployment

The application on each instance in the deployment group is stopped, the latest application revision is installed, and  the new version of the application is started and validated.

2. Blue/green deployment


   
<img src="https://github.com/Vennilavan12/zen-class-devops-documentation/blob/main/010%20-%20AWS/img/cd3.png">



The behavior of your deployment depends on which compute platform you use:

i. Blue/green on an EC2/On-Premises compute platform

+ The instances in a deployment group (the original environment) are replaced by a different set of instances (the replacement environment).

ii. Blue/green on an AWS Lambda or Amazon ECS compute platform

+ Traffic is shifted in increments according to a canary, linear, or all-at-once deployment configuration.

iii. Blue/green deployments through AWS CloudFormation

+ Traffic is shifted from your current resources to your updated resources as part of an AWS CloudFormation stack update. Currently, only ECS blue/green deployments are supported


## CodeDeploy Primary Components

+ Application
        
+ Compute platform
        
+ Deployment configuration
        
+ Deployment group
        
+ Deployment type
        
+ IAM instance profile
        
+ Revision
        
+ Service role
        
+ Target revision
        
+ Other components


## Application

+ An application is name that uniquely identifies the application you want to deploy.

+ CodeDeploy uses this name, which functions as a container, to ensure the correct combination of revision, deployment configuration, and deployment group are referenced during a deployment.


## Compute platform

+ A compute platform is a platform on which CodeDeploy deploys an application.

+ There are three compute platforms:

1. EC2/On-Premises
    
2. AWS Lambda
    
3. Amazon ECS 


## Deployment configuration

+ A deployment configuration is set of deployment rules and deployment success and failure conditions used by CodeDeploy during a deployment. 

+ The following deployment configurations specify how traffic is routed during a deployment that uses the Lambda or the ECS compute platform:



<img src="https://github.com/Vennilavan12/zen-class-devops-documentation/blob/main/010%20-%20AWS/img/cd5.png">



1. Canary

+ You update your application code in a canary deployment and point a tiny fraction of production traffic to it.

+ It checks if the code is valid.

+ You redirect all traffic to it after ensuring that the new version is secure and free of faults.

2. Linear

+ Linear strategy is similar to Canary strategy.

+ Initially, you route a good amount of traffic to your updated code version.

+ A certain amount of traffic is sent to the new version until it reaches 100% of production traffic.

3. All-at-once

+ All-at-once deployments instantaneously switch traffic from the old to the new Lambda function.

+ When speed is important, all-at-once deployments can help.

+ Using this method, you may quickly update your code and make it available to all users.


## Deployment group

+ A deployment group is a set of individual instances.

+ A deployment group contains individually tagged instances, Amazon EC2 instances in Amazon EC2 Auto Scaling groups, or both.


## Deployment type

+ A deployment type is a method used to make the latest application revision available on instances in a deployment group.

+ There are two deployment types:

1. In-place deployment  

2. Blue/green deployment


### Deployment configuration

+ Choose from a list of default and custom deployment configurations.

+ A deployment configuration is a set of rules that determines how fast an application is deployed and the success or failure conditions for a deployment.


 
<img src="https://github.com/Vennilavan12/zen-class-devops-documentation/blob/main/010%20-%20AWS/img/speed.png">




## IAM instance profile

+ An IAM instance profile is an IAM role that you attach to your Amazon EC2 instances.

+ This profile includes the permissions required to access the Amazon S3 buckets or GitHub repositories where the applications are stored.


## Revision

+ A revision is a version of your application.

+ An AWS Lambda deployment revision is a YAML- or JSON-formatted file that specifies information about the Lambda function to deploy.

+ An EC2/On-Premises deployment revision is an archive file that contains source content (source code, webpages, executable files, and deployment scripts) and an application specification file (AppSpec file).

+ AWS Lambda revisions can be stored in Amazon S3 buckets. 

+ EC2/On-Premises revisions are stored in Amazon S3 buckets or GitHub repositories


## Service role 

+ A service role is an IAM role that grants permissions to an AWS service so it can access AWS resources.

+ The policies you attach to the service role determine which AWS resources the service can access and the actions it can perform with those resources.


## Target revision

+ A target revision is the most recent version of the application revision that you have uploaded to your repository and want to deploy to the instances in a deployment group.

+ In other words, the application revision currently targeted for deployment. This is also the revision that is pulled for automatic deployments.


## Other components

+ Choose a CodeDeploy repository type

+ Deployments

+ Application Specification Files

+ Instance Health

+ Working with the CodeDeploy agent

+ Working with On-Premises Instances


## CodeDeploy Agent

+ The AWS CodeDeploy agent is a software package that, when installed and configured on an instance, makes it possible for that instance to be used in CodeDeploy deployments.

+ A configuration file is placed on the instance when the agent is installed. 

+ This file is used to specify how the agent works.

+ This configuration file specifies directory paths and other settings for AWS CodeDeploy to use as it interacts with the instance.

+  The CodeDeploy agent communicates outbound using HTTPS over port 443.


## CodeDeploy Instances

+ CodeDeploy supports deployments to instances running Amazon Linux, Ubuntu Server, Red Hat Enterprise Linux (RHEL), and Windows Server.

+ You can use CodeDeploy to deploy to both Amazon EC2 instances and on-premises instances.

+ An on-premises instance is any physical device that is not an Amazon EC2 instance that can run the CodeDeploy agent and connect to public AWS service endpoints.

+ You can use CodeDeploy to simultaneously deploy an application to Amazon EC2 instances in the cloud and to desktop PCs in your office or servers in your own data center. 


## CodeDeploy Monitoring

+ Monitoring is an important part of maintaining the reliability, availability, and performance of CodeDeploy and your AWS solutions.

+ You should collect monitoring data from all of the parts of your AWS solution so that you can more easily debug a multi-point failure if one occurs.

1. Cloud watch

2. Cloud Trail 


## How to create CodeDeploy




### **Step 1: Login to aws management console and search CodeDeploy service**




<img src="https://github.com/Vennilavan12/zen-class-devops-documentation/blob/main/010%20-%20AWS/img/cd6.png">




### **Step 2: Click create application to create or CodeDeploy** 




<img src="https://github.com/Vennilavan12/zen-class-devops-documentation/blob/main/010%20-%20AWS/img/cd7.png">




### **Step 3: Give Application name and choose compute platform and click create application**




<img src="https://github.com/Vennilavan12/zen-class-devops-documentation/blob/main/010%20-%20AWS/img/cd8.png">




### **Step 4: Next create a deployment group**



<img src="https://github.com/Vennilavan12/zen-class-devops-documentation/blob/main/010%20-%20AWS/img/cd9.png">




### **Step 5: Choose deployment groupname and service role with CodeDeploy full access permission**




<img src="https://github.com/Vennilavan12/zen-class-devops-documentation/blob/main/010%20-%20AWS/img/cd10.png">



+ ### **Choose deployment type and environment for our application**




<img src="https://github.com/Vennilavan12/zen-class-devops-documentation/blob/main/010%20-%20AWS/img/cd11.png">




+ ### **Choose Deployment settings and loadbalancer then click create deployment group**




<img src="https://github.com/Vennilavan12/zen-class-devops-documentation/blob/main/010%20-%20AWS/img/cd12.png">




### **Step 6: Next create deployment** 




<img src="https://github.com/Vennilavan12/zen-class-devops-documentation/blob/main/010%20-%20AWS/img/cd13.png">




+ ### **choose deployment group and revision type**



<img src="https://github.com/Vennilavan12/zen-class-devops-documentation/blob/main/010%20-%20AWS/img/cd14.png">



+ ### **Give description and other options set to default and click create deployment**




<img src="https://github.com/Vennilavan12/zen-class-devops-documentation/blob/main/010%20-%20AWS/img/cd15.png">




+ **All the configuration done our codedeploy is ready to use.**



## Pricing


**For CodeDeploy on EC2, Lambda, ECS:** There is no additional charge for code deployments to Amazon EC2, AWS Lambda or Amazon ECS through AWS CodeDeploy.

**For CodeDeploy On-Premises:** You pay $0.02 per on-premises instance update using AWS CodeDeploy. There are no minimum fees and no upfront commitments. For example, a deployment to three instances equals three instance updates. You will only be charged if CodeDeploy performs an update to an instance. You will not be charged for any instances skipped during the deployment.

You pay for any other AWS resources (e.g. S3 buckets) you may use in conjunction with CodeDeploy to store and run your application. You only pay for what you use, as you use it; there are no minimum fees and no upfront commitments.

## Reference

Use this link to learn more about codedeploy:
               
        https://docs.aws.amazon.com/codedeploy/latest/userguide/welcome.html





































































