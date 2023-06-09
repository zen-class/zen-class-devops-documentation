## What is AWS EC2?

<img src="https://github.com/Gitscooby/Images/blob/main/Ec2%20image%201.png">
Amazon Elastic Compute Cloud, EC2 is a web service from Amazon that provides resizable compute services in the cloud.

 ## How are they re-sizable?
 
<img src="https://github.com/Gitscooby/Images/blob/main/Ec2%20image%202.png">
They are re-sizable because you can quickly scale up or scale down the number of server instances you are using if your computing requirements change.


## What is an Instance?

An instance is a virtual server for running applications on Amazon’s EC2. It can also be understood as a tiny part of a larger computer, a tiny part which has its own Hard drive, network connection, OS etc. But it is actually all virtual. You can have multiple “tiny” computers on a single physical machine, and all these tiny machines are called Instances.

## Difference between a service and an Instance?

Let’s understand it this way:
EC2 is a service along with other Amazon Web Services like S3 etc.
When we use EC2 or any other service, we use it through an instance, e.g. t2.micro instance, in EC2 etc.

## Why AWS EC2?
Why not buy your own stack of servers and work independently? Because, suppose you are a developer, and since you want to work independently you buy some servers, you estimate the correct capacity, and the computing power is enough. 
Now, you have to look after the updation of security patches every day, you have to troubleshoot any problem which might occur at a back-end level in the servers and so on. These are all extra chores that you will be doing or maybe you will hire someone else to do these things for you.
But if you buy an EC2 instance, you don’t have to worry about any of these things as it will all be managed by Amazon; you just have to focus on your application. That too, at a fraction of a cost that you were incurring earlier.




## Types of EC2 Computing Instances:
Computing is a very broad term, the nature of your task decides what kind of computing you need.

**Therefore, AWS EC2 offers 5 types of instances which are as follows**

**General Instances:** 
For applications that require a balance of performance and cost. E.g email responding systems, where you need a prompt response as well as it should be cost-effective since it doesn’t require much processing.

**Compute Instances:**
For applications that require a lot of processing from the CPU. E.g analysis of data from a stream of data, like a Twitter stream

**Memory Instances:**
For applications that are heavy in nature, therefore, require a lot of RAM. E.g when your system needs a lot of applications running in the background i.e multitasking.

**Storage Instances:**
For applications that are huge in size or have a data set that occupies a lot of space. E.g When your application is of huge size.

**GPU Instances:**
For applications that require some heavy graphics rendering. E.g 3D modeling etc.
Now, every instance type has a set of instances which are optimized for different workloads:
General Instances - t2, m4, m3
Compute Instances - c4, c3
Memory Instances - r3, x1
 Storage Instances - i2, d2
GPU Instances - G2
Instances which are not a part of that group are limited to 5 Gbps speed in multi-flow traffic. Cluster Networking is ideal for a high-performance analytics system.

## Dedicated Instances

**1**.They are the instances that run on single-tenant hardware dedicated to a single customer.

**2**.They are perfect for workloads where a corporate policy or industry regulation requires that your instance should be isolated from any other customer’s instance, therefore they go for their own separate machines, and their instances are isolated at the hardware level.
## How to run systems in EC2?

**1**. Login to your AWS account and click on AWS EC2.

**2**. Under create an instance, click on launch instance.

Now you have to select an **Amazon Machine Image (AMI)**,
AMIs are templates of OS and they provide the information needed to launch an instance.

When we want to launch an instance we have to specify which AMI we want to use. It could be Ubuntu, windows server etc.

**1** .The AMIs could be preconfigured or you can configure it on your own according to your requirements.

 **2**. While configuring you will reach a point where you have to select an EBS storage option.
 
**Elastic Block Storage **(EBS)** is a persistent block level storage volume which is used with EC2. Here each block acts as a hard drive.

**Security in AWS EC2**

<img src="https://github.com/Gitscooby/Images/blob/main/Ec2%20image%203.png">

To authenticate users to their instances, AWS employs a key pair method.

**What is a key pair?**

Amazon EC2 uses public–key cryptography to encrypt and decrypt login information. Public–key cryptography uses a public key to encrypt a piece of data, such as a password, then the recipient uses the private key to decrypt the data. The public and private keys are known as a key pair.

**Auto Scaling** 

Auto Scaling is a service designed by AWS EC2, which automatically launches or terminates EC2’s instances based on user-defined policies, schedules, and health checks.

**Elastic Load Balancing**

**Elastic Load Balancing (ELB)** automatically distributes incoming application traffic across multiple EC2 instances, in multiple Availability Zones.
Availability zones are basically places where Amazon has set up their servers. Since they have customers from the whole globe, they have set up multiple Availability zones to reduce the latency.
Elastic IP Addresses are static IP addresses which are associated with your AWS account, they can be used to mask the failure of an instance by automatically remapping your address to another working instance in your account.

**AWS EC2 Pricing**

AWS EC2 free tier allows 750 hrs of t2.micro instance usage per month! The free tier for EC2 is valid for 1 year from the SignUp of your AWS account.

**There are basically 3 pricing options in EC2:**

**1** Spot Instances

**2** On-Demand Instances

**3** Reserved Instances


**Spot Instances** 
is a pricing option which enables you to bid on unused EC2 instances. The hourly price for a Spot Instance is set by AWS EC2, and it fluctuates according to the availability of the instances in a specific Availability Zone.
Basically, you will set a price for an instance above which you do not wish to get charged for.
The price that you set is for per hour basis, therefore the moment the price for that instance becomes greater than what you have set, the instance gets shut down automatically.

**On-Demand Instances**
are used when you want to pay for the hour, with no long-term commitments and upfront payments. They are useful for applications that may have unpredictable workloads or for test applications that are being deployed for the first time.

**Reserved Instances** provide you with significant discounts as compared to On-Demand Instances. With Reserved Instances you reserve instances for a specific period of time with three payment options:

**1** No Upfront

**2** Partial Upfront

**3** Full Upfront

And two-term lengths: One Year Term and Three Year Term

**AWS EC2 
Login to AWS Management Console.

<img src="https://github.com/Gitscooby/Images/blob/main/Ec2%20image%204.png">









**2. Select your preferred Region.** Select a region from the drop-down, the selection of the region can be done on the basis of the criteria discussed earlier in the blog.



<img src="https://github.com/Gitscooby/Images/blob/main/Ec2%20image%205.png">






**3. Select EC2 Service** Click EC2 under Compute section. This will take you to the EC2 dashboard.


<img src="https://github.com/Gitscooby/Images/blob/main/Ec2%20image%206.png">


**4. Click** Launch Instance.

<img src="https://github.com/Gitscooby/Images/blob/main/lauch%20instance%20image.png">

**5. Select an AMI:** because you require a Linux instance, in the row for the basic 64-bit Ubuntu AMI, click Select.

<img src="https://github.com/Gitscooby/Images/blob/main/Ec2%20image%207.png">

**6. Choose an Instance** - Select t2.micro instance, which is free tier eligible.

<img src="https://github.com/Gitscooby/Images/blob/main/Ec2%20image%208.png">


**7. Configure Instance Details.** - Configure all the details and then click on add storage

<img src="https://github.com/Gitscooby/Images/blob/main/Ec2%20image%209.png">


**8. Add Storage**

<img src="https://github.com/Gitscooby/Images/blob/main/Ec2%20image%2010.png">


**9. Tag an Instance**

Type a name for your AWS EC2 instance in the value box. This name, more correctly known as a tag, will appear in the console when the instance launches. It makes it easy to keep track of running machines in a complex environment. Use a name that you can easily recognize and remember.

<img src="https://github.com/Gitscooby/Images/blob/main/Ec2%20image%2011.png">

**10. Create a Security Group**

<img src= "https://github.com/Gitscooby/Images/blob/main/Ec2%20image%2012.png">

**11. Review and Launch an Instance**
Verify the details that you have configured to launch an instance.

<img src="https://github.com/Gitscooby/Images/blob/main/Ec2%20image%2013.png">


**12. Create a Key Pair & launch an Instance:** Next, in this AWS EC2 Tutorial, select the option ‘Create a new key pair’ and give a name of a key pair. After that, download it in your system and save it for future use.

**13. Check the details of a launched instance.**

<img src="https://github.com/Gitscooby/Images/blob/main/Ec2%20image%2014.png">

