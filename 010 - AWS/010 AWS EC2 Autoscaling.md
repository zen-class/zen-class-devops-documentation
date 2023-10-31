---

## **AWS EC2 AUTOSCALING**

![INTRO](https://github.com/Ravivarman16/images/blob/main/ALTER-ALB-MAIN.png)

__AWS EC2 Autoscaling__ helps you maintain application availability according to the demand by automatically adding or removing Amazon Elastic Compute Cloud (Amazon EC2) instances according to conditions that you define.

### **Example:**


![example](https://github.com/Ravivarman16/images/blob/main/ALTER-EXAMPLE-ALB-EC2.png)


---


## Here are some key points about Amazon EC2 Autoscaling:

**1. Launch configuration & Launch template:** The launch configuration is the place where we set up all the details needed to create virtual machines through an **Autoscaling group.** This includes crucial information like the

+ **Amazon Machine Image (AMI)**


+ **Instance type**
+ **Security group settings**
+ **Key pair for secure access**
+ **Storage specifications**
+ **IAM roles for permissions**
+ **User data**

To simplify and replicate these settings easily, we create a **launch template.** This template captures the standardized configuration, ensuring that instances can be deployed consistently and at scale within the designated Autoscaling group.

---


**2. Amazon EC2 Autoscaling group:** is configured to manage the dynamic scaling of instances based on varying demands. It includes specifications on the number of instances to launch when there's a high load or demand, the minimum number of instances to maintain, and the desired number of instances for optimal performance. This setup allows for automatic adjustment of resources to ensure efficient and responsive scaling in response to changing conditions or requirements.


![grp](https://github.com/Ravivarman16/images/blob/main/autoscaling_group.png)


---


**3. Amazon EC2 Autoscaling Policy:** is a set of rules and instructions that govern the scaling behavior of an Autoscaling group in response to changing conditions. These policies define how the group should scale its capacity up or down based on criteria such as increased demand, decreased load, or other performance metrics.

+ **Scheduled Scaling**

+ **Dynamic Scaling:**

  + **Target tracking policy**


   + **Step scaling**
  + **Simple scaling**
+  **Predictive scaling**


![policies](https://github.com/Ravivarman16/images/blob/main/types%20of%20policies.png)


---


## Types of Termination policies in AWS Ec2 Autoscaling:

Amazon EC2 Auto Scaling supports custom termination policies, they are
 
  +  **OldestInstance:** Selects the longest running instance.
 
  
  +  **NewestInstance:** Selects the shortest running instance.
  +  **OldestLaunchConfiguration:** Terminates the instance with the oldest configuration(default).
  +  **ClosestToNextInstanceHour:** Terminates the instance that is closest to the next billable hour(default).

---


## Ways to Work with Auto Scaling groups:

You can create, access, and manage your Auto Scaling groups using any of the following interfaces:
  
  +  **AWS Management Console:** 

  
  +  **AWS Command Line Interface (AWS CLI):** 
  +  **AWS Tools for Windows PowerShell:** 
  +  **AWS SDKs:** 
  +  **AWS CloudFormation:**


---

## Services that can integrated with Amazon EC2 Autoscaling:


Some of the services that be combined or integrated with Amazon EC2 Autoscaling are
  
  + **AWS ECS (Elastic Container Service)**
 
  
  + **AWS EKS (Elastic Kubernetes Service)**
  + **AWS EC2 (Elastic Compute Cloud)**
  + **AWS CloudWatch**



![integration](https://github.com/Ravivarman16/images/blob/main/integration.png)


---


## Amazon EC2 Auto Scaling benefits:
  
  + **Better fault tolerance:** Amazon EC2 Auto Scaling can detect when an instance is unhealthy, terminate it, and launch an instance to replace it.
  
  
  + **Better availability:** Amazon EC2 Auto Scaling helps ensure that your application always has the right amount of capacity to handle the current traffic demand.
  + **Better cost management:** Amazon EC2 Auto Scaling can dynamically increase and decrease capacity as needed. Because you pay for the EC2 instances you use, you save money by launching instances when they are needed and terminating them when they aren't.
  + **Distribute instances across Availability Zones:** If one Availability Zone becomes unavailable, Amazon EC2 Auto Scaling can launch instances in another one to compensate.

---


## Pricing for Amazon EC2 Auto Scaling:

+ There are no additional fees with Amazon EC2 Auto Scaling, so it's easy to try it out and see how it can benefit your AWS architecture. You only pay for the AWS resources (for example, EC2 instances, EBS volumes, and CloudWatch alarms) that you use.

+ To calculate the price use [AWS Pricing calculator](https://calculator.aws/#/).


---


## How to create AWS EC2 Autoscaling group:


### **1. Login into** [AWS Management Console:](https://signin.aws.amazon.com/signin?redirect_uri=https%3A%2F%2Fconsole.aws.amazon.com%2Fconsole%2Fhome%3FhashArgs%3D%2523%26isauthcode%3Dtrue%26nc2%3Dh_ct%26src%3Dheader-signin%26state%3DhashArgsFromTB_eu-north-1_67569bb514fd7334&client_id=arn%3Aaws%3Asignin%3A%3A%3Aconsole%2Fcanvas&forceMobileApp=0&code_challenge=O-19Kk8URbYdcSReZJtf-59QKpGm4u3dALUVrpv1Fj4&code_challenge_method=SHA-256)



![Login](https://github.com/Ravivarman16/images/blob/main/Login%20into%20console.png)


---


### **2. Select the region, according to your preferences.**


![region](https://github.com/Ravivarman16/images/blob/main/region.png)

---


### **3. Create an AMI Image.**


**Example Source:**


![source](https://github.com/Ravivarman16/images/blob/main/SOURCE.png)


### To create an AMI Image, under instances click actions, then click image and templates, then click create image:



![AMI](https://github.com/Ravivarman16/images/blob/main/AMI.png)


---


### **4. Create Launch Template:**

### Under EC2 Console, left-side, click Launch template:



![template](https://github.com/Ravivarman16/images/blob/main/launch%20template.png)


---


### **5. Create Target groups:**

### Under EC2 Management Console, Left-side, click target groups:



![target](https://github.com/Ravivarman16/images/blob/main/Target%20group.png)


---


### **6. Create Load Balancer:**

### Under EC2 Management Console, Left-side, click Load balancers:



![balancer](https://github.com/Ravivarman16/images/blob/main/Loadbalancer.png)


---


### **7. Create Amazon EC2 Autoscaling:**

### Under EC2 Management Console, Left-side, Click Auto Scaling Groups


![Autoscaling group](https://github.com/Ravivarman16/images/blob/main/AUTOSCALING.png) 


### Click Create Autoscaling group, Then naming and selecting the launch template, click next:


![naming](https://github.com/Ravivarman16/images/blob/main/Naming%20the%20grouop%20.png)


---


### Then select the VPC and subnet, click next:


![autoscaling-vpc](https://github.com/Ravivarman16/images/blob/main/AUTOSCALING%20VPC.png)


---

### Then select the Load Balancer and Target groups:


![selecting](https://github.com/Ravivarman16/images/blob/main/SELECTING%20LOAD%20BALANCER.png)


---

### Then select the health checks value according to your preference:



![health_checks](https://github.com/Ravivarman16/images/blob/main/Health%20checks.png)


---


### Then enter the desired, minimum and maximum value according to your preference:



![value](https://github.com/Ravivarman16/images/blob/main/INSTANCE_VALUE.png)


---


### Then select the scaling policies and enter the target value & instance warmup value:



![scaling_policies](https://github.com/Ravivarman16/images/blob/main/SCALING_POLICIES.png)


---


### Adding notification (optional):



![autoscaling_notification](https://github.com/Ravivarman16/images/blob/main/AUTOSCALING_NOTIFICATION.png)


---


### Adding tags:



![Autoscaling_tags](https://github.com/Ravivarman16/images/blob/main/AUTOSCALING%20TAGS.png)


---


### Then review & Create, finally autoscaling groups will be created:


![output](https://github.com/Ravivarman16/images/blob/main/AUTOSCALING_FINAL.png)


---

### Autoscaling group working:


###  **Before:**


![before](https://github.com/Ravivarman16/images/blob/main/BEFORE.png)


---

### **Terminating the newly created instance:**


![Terminating](https://github.com/Ravivarman16/images/blob/main/TERMINATING.png)

---

### **After:**


![Testing_output](https://github.com/Ravivarman16/images/blob/main/TESTING_OUTPUT.png)


---


## Like to know more about AWS EC2 Autoscaling visit the [official website](https://aws.amazon.com/ec2/autoscaling/)

 

 




