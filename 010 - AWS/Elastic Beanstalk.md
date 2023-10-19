# AWS Elastic Beanstalk

<img src="https://github.com/Vennilavan12/zen-class-devops-documentation/blob/main/010%20-%20AWS/img/1.png">

Elastic Beanstalk, you can quickly deploy and manage applications in the AWS Cloud without having to learn about the infrastructure that runs those applications.

## Features and Benefits

+ Elastic Beanstalk reduces management complexity without restricting choice or control. You simply upload your application, and Elastic Beanstalk automatically handles the details of capacity provisioning, load balancing, scaling, and application health monitoring.

+ Elastic Beanstalk supports applications developed in Go, Java, .NET, Node.js, PHP, Python, and Ruby.
  
+ When you deploy your application, Elastic Beanstalk builds the selected supported platform version and provisions one or more AWS resources, such as Amazon EC2 instances, to run your application.

+ You can interact with Elastic Beanstalk by using the Elastic Beanstalk console, the AWS Command Line Interface (AWS CLI), or eb, a high-level CLI designed specifically for Elastic Beanstalk.

+ You can also perform most deployment tasks, such as changing the size of your fleet of Amazon EC2 instances or monitoring your application, directly from the Elastic Beanstalk web interface (console). 

## Beanstalk Work Flow

+ To use Elastic Beanstalk, you create an application, upload an application version in the form of an application source bundle (for example, a Java .war file) to Elastic Beanstalk, and then provide some information about the application.
  
+  Elastic Beanstalk automatically launches an environment and creates and configures the AWS resources needed to run your code. After your environment is launched, you can then manage your environment and deploy new application versions.

<img src="https://github.com/Vennilavan12/zen-class-devops-documentation/blob/main/010%20-%20AWS/img/Bs2.png">


## Elastic Beanstalk Concepts

AWS Elastic Beanstalk enables you to manage all of the resources that run your application as environments. 

+ Here are some key Elastic Beanstalk concepts.

## Application

+ An Elastic Beanstalk application is a logical collection of Elastic Beanstalk components, including environments, versions, and environment configurations. 

+ In Elastic Beanstalk an application is conceptually similar to a folder.

## Application Version

+ In Elastic Beanstalk, an application version refers to a specific, labeled iteration of deployable code for a web application.

+ An application version points to an Amazon Simple Storage Service (Amazon S3) object that contains the deployable code, such as a Java WAR file.

+ An application version is part of an application. Applications can have many versions and each application version is unique.

+ In a running environment, you can deploy any application version you already uploaded to the application, or you can upload and immediately deploy a new application version.

+ You might upload multiple application versions to test differences between one version of your web application and another.

## Environment

+ An environment is a collection of AWS resources running an application version.

+ Each environment runs only one application version at a time, however, you can run the same application version or different application versions in many environments simultaneously.

+ When you create an environment, Elastic Beanstalk provisions the resources needed to run the application version you specified.

## Environment Tier

+ When you launch an Elastic Beanstalk environment, you first choose an environment tier.

+ The environment tier designates the type of application that the environment runs, and determines what resources Elastic Beanstalk provisions to support it.

+ An application that serves HTTP requests runs in a web server environment tier.

## Environment Configuration

+ An environment configuration identifies a collection of parameters and settings that define how an environment and its associated resources behave.

+ When you update an environment’s configuration settings, Elastic Beanstalk automatically applies the changes to existing resources or deletes and deploys new resources (depending on the type of change).

## Saved Configuration

+ A saved configuration is a template that you can use as a starting point for creating unique environment configurations.

+ You can create and modify saved configurations, and apply them to environments, using the Elastic Beanstalk console, EB CLI, AWS CLI, or API. The API and the AWS CLI refer to saved configurations as configuration templates.

## Platform

+ A platform is a combination of an operating system, programming language runtime, web server, application server, and Elastic Beanstalk components. You design and target your web application to a platform.

+ Elastic Beanstalk provides a variety of platforms on which you can build your applications.

## Elastic Beanstalk architecture for a web server environment tier

+ The environment is the heart of the application. In the diagram, the environment is shown within the top-level solid line.

+ When you create an environment, Elastic Beanstalk provisions the resources required to run your application.

+ AWS resources created for an environment include one elastic load balancer (ELB in the diagram), an Auto Scaling group, and one or more Amazon Elastic Compute Cloud (Amazon EC2) instances.

<img src="https://github.com/Vennilavan12/zen-class-devops-documentation/blob/main/010%20-%20AWS/img/aeb-architecture2.png">

+ The load balancer sits in front of the Amazon EC2 instances, which are part of an Auto Scaling group. 

+ Amazon EC2 Auto Scaling automatically starts additional Amazon EC2 instances to accommodate increasing load on your application. 

+ If the load on your application decreases, Amazon EC2 Auto Scaling stops instances, but always leaves at least one instance running.

+ Amazon Route 53 is a highly available and scalable Domain Name System (DNS) web service. It provides secure and reliable routing to your infrastructure.

+ The software stack running on the Amazon EC2 instances is dependent on the container type. A container type defines the infrastructure topology and software stack to be used for that environment.

+ The Amazon EC2 instances shown in the diagram are part of one security group. A security group defines the firewall rules for your instances.

+ By default, Elastic Beanstalk defines a security group, which allows everyone to connect using port 80 (HTTP). You can define more than one security group.
  
### Example

+ Elastic Beanstalk environment with an Apache Tomcat container uses the Amazon Linux operating system, Apache web server, and Apache Tomcat software.
  
+ Each Amazon EC2 instance that runs your application uses one of these container types.

## Host Manager

a software component called the host manager (HM) runs on each Amazon EC2 instance. 

The host manager is responsible for the following:

    1. Deploying the application

    2. Aggregating events and metrics for retrieval via the console, the API, or the command line

    3. Generating instance-level events

    4. Monitoring the application log files for critical errors

    5. Monitoring the application server

    6. Patching instance components

    7. Rotating your application's log files and publishing them to Amazon S3

## Presets

+ Each preset includes recommend values for several configuration options.

+ The Single instance presets are primarily recommended for development use cases and will save costs.

+ The High availability presets are recommended for production environments. They include a load balancer and scale with multiple instances in response to load.

+ If Custom configurations is selected, Elastic Beanstalk will provide the standard default values. Choose this option if you are deploying a source bundle with configuration files.

## Elastic Beanstalk architecture for a Worker environment tier

+ AWS resources created for a worker environment tier include an Auto Scaling group, one or more Amazon EC2 instances, and an IAM role.

+ For the worker environment tier, Elastic Beanstalk also creates and provisions an Amazon SQS queue if you don’t already have one.

+ When you launch a worker environment, Elastic Beanstalk installs the necessary support files for your programming language of choice and a daemon on each EC2 instance in the Auto Scaling group.

+ The daemon reads messages from an Amazon SQS queue.

+ The daemon sends data from each message that it reads to the web application running in the worker environment for processing.

+ If you have multiple instances in your worker environment, each instance has its own daemon, but they all read from the same Amazon SQS queue.

+ Amazon CloudWatch is used for alarms and health monitoring

<img src="https://github.com/Vennilavan12/zen-class-devops-documentation/blob/main/010%20-%20AWS/img/aeb-architecture_worker.png">

## Amazon SQS

+ Amazon Simple Queue Service (Amazon SQS) offers a secure, durable, and available hosted queue that lets you integrate and decouple distributed software systems and components.

+ It exchanges and stores messages between software components. 
  
+ It provides a generic web services API that you can access using any programming language that the AWS SDK supports.

<img src="https://github.com/Vennilavan12/zen-class-devops-documentation/blob/main/010%20-%20AWS/img/sqsbean.jpg">

# Design Consideration

Because applications deployed using AWS Elastic Beanstalk run on AWS Cloud resources, you should keep several configuration factors in mind to optimize your applications: 

1. Scalability

2. Security

3. Persistent storage

4. Fault tolerance

5. Content delivery

6. Software updates and patching

7. Connectivity.

https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/concepts.concepts.design.html >> Use this link to know more about design consideration.

## Permissions

When you create an environment, AWS Elastic Beanstalk prompts you to provide the following AWS Identity and Access Management (IAM) roles:

**Servicerole**
      
Elastic Beanstalk assumes a service role to use other AWS services on your behalf.

Example : example, Elastic Beanstalk uses a service role when it calls Amazon Elastic Compute Cloud (Amazon EC2), Elastic Load Balancing, and Amazon EC2 Auto Scaling APIs to gather information. The service role that Elastic Beanstalk uses is the one that you specified when you create the Elastic Beanstalk environment.

**Instance profile**

+ Elastic Beanstalk applies instances profile to the instances in your environment.An instance profile is a container for an IAM role that you can use to pass role information to an EC2 instance when the instance starts.

+ If your web application requires access to other additional AWS services, add statements or managed policies to the instance profile that allow access to those services.

**User policies**  

+ Applying user policies allows the users to create and manage Elastic Beanstalk applications and environments. Elastic Beanstalk also provides managed policies for full access and read-only access.

+ Elastic Beanstalk requires permissions not only for its own API actions, but also for several other AWS services. Elastic Beanstalk uses user permissions to launch resources in an environment. 

+ These resources include EC2 instances, an Elastic Load Balancing load balancer, and an Auto Scaling group.

## Platforms

+ AWS Elastic Beanstalk provides a variety of platforms on which you can build your applications. You design your web application to one of these platforms, and Elastic Beanstalk deploys your code to the platform version you selected to create an active application environment.

+ Elastic Beanstalk provides platforms for different programming languages, application servers, and Docker containers. Some platforms have multiple concurrently-supported versions.

AWS Elastic Beanstalk provides a variety of platforms on which you can build your applications.

1. Linux

2. Docker

3. Go

4. Java

5. .NET and .NET core

6. Node.js

7. PHP

8. Python

9. Ruby

Use this link to know more about platforms >> https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/concepts-all-platforms.html

## How to create Elastic Beanstalk

**Step 1:** Logon to the AWS management console

**Step 2:** Click on the Elastic Beanstalk service under the services dropdown

<img src="https://github.com/Vennilavan12/zen-class-devops-documentation/blob/main/010%20-%20AWS/img/bs4.png">

**Step 3:** Click on Get Started on the opening page and then create a Web Application by providing the required details.

### Configure Environment

+ In Environment tier we can choose beanstalk environment and give name for your application

<img src="https://github.com/Vennilavan12/zen-class-devops-documentation/blob/main/010%20-%20AWS/img/Createbean.png">

Key details you provide here:

    + Environment name

    + Domain – A subdomain for accessing your web application.


<img src="https://github.com/Vennilavan12/zen-class-devops-documentation/blob/main/010%20-%20AWS/img/create1.png">

+ Choose platform type and choose platform, branch and version  (example: python, docker, go, etc...)

<img src="https://github.com/Vennilavan12/zen-class-devops-documentation/blob/main/010%20-%20AWS/img/c2.png">

+ In Application code choose upload your code.

+ we can choose local code Zip file or provide s3 URL.  

<img src="https://github.com/Vennilavan12/zen-class-devops-documentation/blob/main/010%20-%20AWS/img/c3a.png">

+ Select a preset configuration that matches your use case. Each preset includes recommend values for several configuration options.

<img src="https://github.com/Vennilavan12/zen-class-devops-documentation/blob/main/010%20-%20AWS/img/c4.png">

### Configure service access

**Step 4:** In this step we need to provide service role, key pair, instance profile details and click next 

<img src="https://github.com/Vennilavan12/zen-class-devops-documentation/blob/main/010%20-%20AWS/img/c5.png">

### Set up networking, database, and tags 

**Step 5:** This steps are optional when we create application. values for this fields are  assigned automatically.

+ Select our VPC

<img src="https://github.com/Vennilavan12/zen-class-devops-documentation/blob/main/010%20-%20AWS/img/c6.png">

+ Add public IP and Instance subnetes

<img src="https://github.com/Vennilavan12/zen-class-devops-documentation/blob/main/010%20-%20AWS/img/c7.png">

+ when we need to integrate our database to our application provide all information. 

<img src="https://github.com/Vennilavan12/zen-class-devops-documentation/blob/main/010%20-%20AWS/img/c8.png">

<img src="https://github.com/Vennilavan12/zen-class-devops-documentation/blob/main/010%20-%20AWS/img/c9.png">

+ Use tags to group and filter resources.

<img src="https://github.com/Vennilavan12/zen-class-devops-documentation/blob/main/010%20-%20AWS/img/c10.png">

### Configure instance traffic and scaling

**Step 6:** This steps are optional when we create application. values for this fields are  assigned automatically.

<img src="https://github.com/Vennilavan12/zen-class-devops-documentation/blob/main/010%20-%20AWS/img/c11.png">

<img src="https://github.com/Vennilavan12/zen-class-devops-documentation/blob/main/010%20-%20AWS/img/c12.png">

<img src="https://github.com/Vennilavan12/zen-class-devops-documentation/blob/main/010%20-%20AWS/img/c13.png">


### Configure updates, monitoring, and logging

**Step 7:** This steps are optional when we create application. Values for this fields are  assigned automatically.

<img src="https://github.com/Vennilavan12/zen-class-devops-documentation/blob/main/010%20-%20AWS/img/c14.png">

<img src="https://github.com/Vennilavan12/zen-class-devops-documentation/blob/main/010%20-%20AWS/img/c15.png">

<img src="https://github.com/Vennilavan12/zen-class-devops-documentation/blob/main/010%20-%20AWS/img/c16.png">

<img src="https://github.com/Vennilavan12/zen-class-devops-documentation/blob/main/010%20-%20AWS/img/c17.png">

<img src="https://github.com/Vennilavan12/zen-class-devops-documentation/blob/main/010%20-%20AWS/img/c18.png">

### Review

**Step 8:** Review our Configuration and Submit to create our application using beanstalk

## Pricing

There is no additional charge for Elastic Beanstalk. You pay only for the underlying AWS resources that your application consumes.

## Tutorials and samples

Language and framework specific tutorials are spread throughout the AWS Elastic Beanstalk Developer Guide.

Use this link to know more about beanstalk deployment samples in all platforms
     https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/tutorials.html





















