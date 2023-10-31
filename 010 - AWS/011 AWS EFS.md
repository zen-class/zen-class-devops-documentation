# **Amazon Elastic File Storage (EFS)**

![EFS](https://github.com/Ravivarman16/images/blob/main/EFS/EFS%20OVERVIEW.png) 


+ **Amazon Elastic File System (Amazon EFS)** is a simple, scalable, serverless, fully managed elastic (**network file system**) NFS storage.

  
+ so that you can share file data without **provisioning or managing storage capacity and performance.**
+ Amazon EFS is built to scale **on demand to petabytes** without disrupting applications.
+ You can use Amazon EFS with AWS Cloud services and **on-premises resources.**
+ It is easy to use and offers a simple interface that enables you to create and configure file systems **quickly and easily.**

___


# **Amazon EFS Features:**


+ **Fully managed:** It is a fully managed service providing NFS shared file system storage for Linux workloads.

  
+ **Highly available and durable:** Amazon EFS is designed for 99.999999999 percent (11 nines) of durability and up to 99.99 percent (4 nines) of availability. 
+ **Shared file storage with NFS v4.0 and v4.1 support:** Amazon EFS provides secure access for thousands of connections for Amazon Elastic Compute Cloud (EC2) instances, as well as AWS container and serverless compute services. 
+ **Elastic & scalable capacity:** Amazon EFS is built to elastically scale on demand without disrupting applications, you’re **billed only for what you use.**
+ **Encryption:** Amazon EFS provides a comprehensive encryption solution to help you secure both your stored data and data in flight.


![FEATURES](https://github.com/Ravivarman16/images/blob/main/EFS/EFS_FEATURES.png)


___

## **Amazon EFS performance attributes:**


To support a variety of cloud storage workloads, **Amazon EFS** exposes attributes that enable you to control the performance of your file system. The performance attributes such as  
+ **performance mode.**


+ **Storage class.**
+ **Throughput mode.**


**Performance mode:**

Under Performance mode, there will be two types:
+ **General Purpose performance mode:** it is recommended for the majority of your Amazon EFS file systems. 

  - General Purpose works well for latency-sensitive use cases, like web serving environments, content management systems, home directories, and general file serving.

  - If you don't choose a performance mode when you create your file system, Amazon EFS selects the General-Purpose mode for you by default.

+ **Max I/O performance mode:** File systems in the Max I/O mode can scale to higher levels of aggregate throughput and operations per second with a tradeoff of slightly higher latencies for file operations.
  
  - Highly parallelized applications and workloads, such as big data analysis and media processing, can benefit from this mode.

  - Note that you cannot change the performance mode of a file system after it has been created.

---

**Storage Class:**

Amazon EFS offers a two types of storage classes, such as 

+ **Standard Storage Class:** It is designed for active file system workloads and works well for storing frequently accessed files.

+ **Infrequent Access Storage Class:** It is a lower-cost storage class that is cost-optimized for storing long-lived, infrequently accessed files.

---

**Throughput Mode:**

Under Throughput Mode there will be two types, such as 

+ **Bursting Throughput Mode:** With Bursting Throughput, throughput on Amazon EFS scales as the size of your file system in the standard storage class grows. This is the default mode setting.

+ **Provisioned Throughput Mode:** With Provisioned Throughput, you can instantly provision the throughput of your file system (in mebibytes per second, or MiB/s) independent of the amount of data that is stored. 

  - This mode enables you to grow beyond the limits allowed by the Bursting Throughput mode.

___


## **How Amazon EFS Works:**


![EFS_WORKS](https://github.com/Ravivarman16/images/blob/main/EFS/efs%20works.png)


+ With Amazon EFS, you can create a file system, mount the file system on an Amazon EC2 instance.


+ And then read and write data from to and from your file system. 
+ You can mount an Amazon EFS file system in your VPC, through the Network File System versions 4.0 and 4.1 (NFSv4) protocol.
+ You can access your Amazon EFS file system concurrently from Amazon EC2 instances in your Amazon VPC, so applications that scale beyond a single connection can access a file system. 
+ Amazon EC2 instances running in multiple Availability Zones within the same AWS Region can access the file system, so that many users can access and share a common data source.


**Example Architecture:**


![example](https://github.com/Ravivarman16/images/blob/main/EFS/efs-ec2-how-it-works-Regional.png)

___


## **Ways to access Amazon EFS:**

Amazon EFS can be accessed via 

+ **Management Console**


+ **API**
+ **Command Line Interface**


![INTEGRATE](https://github.com/Ravivarman16/images/blob/main/EFS/INTEGRATE.png)


___


## **Amazon EFS use cases:**

+ **Home directories:**


+ **File system for enterprise applications:** 
+ **Application testing and development:** 
+ **Database backups:** 
+ **Web serving and content management:** 
+ **Big Data analytics:** 


___



## **Amazon EFS Pricing:**

+ There is no minimum fee or setup charge.

  
+ You pay only for the storage you use, for read and write access to data stored in Infrequent Access storage classes, for read and write access using Elastic Throughput, and for any Provisioned Throughput.
+ **Free tier:** Within your first 12 months on AWS, you can use up to 5 GB/month on the EFS Standard storage class at no charge.
+ To calculate your pricing use [AWS Prcing Calculator:](https://calculator.aws/#/)


![pricing](https://github.com/Ravivarman16/images/blob/main/EFS/storage_pricing.png)


___



## **Steps To Create Amazon EFS:**


### **1. Login into** [AWS Management Console:](https://signin.aws.amazon.com/signin?redirect_uri=https%3A%2F%2Fconsole.aws.amazon.com%2Fconsole%2Fhome%3FhashArgs%3D%2523%26isauthcode%3Dtrue%26nc2%3Dh_ct%26src%3Dheader-signin%26state%3DhashArgsFromTB_eu-north-1_67569bb514fd7334&client_id=arn%3Aaws%3Asignin%3A%3A%3Aconsole%2Fcanvas&forceMobileApp=0&code_challenge=O-19Kk8URbYdcSReZJtf-59QKpGm4u3dALUVrpv1Fj4&code_challenge_method=SHA-256)



![Login](https://github.com/Ravivarman16/images/blob/main/Login%20into%20console.png)



---


### **2. Launch minimum 2 AWS EC2 instances with different availability zones:**



![INSTANCES_EFS](https://github.com/Ravivarman16/images/blob/main/EFS/INSTANCE_EFS.png)


---


### **3. Install NFS Agent on these instances:**


+ **For Ubuntu based instances:**

      apt-get update
      apt-get upgrade -y
      apt-get install -y nfs-common


+ **For RedHat & CentOS based instances:**

      yum update
      yum upgrade -y
      yum install -y nfs-utils


---


### **4. Then search EFS on service panel:**



![EFS](https://github.com/Ravivarman16/images/blob/main/EFS/EFS.png)


---


### **5. Then click Create file system:**



![CREATE_EFS](https://github.com/Ravivarman16/images/blob/main/EFS/CREATE_EFS.png)


---


### **6. Then name the EFS file system, select the VPC and Then select Customize option:**


    
![CREATION](https://github.com/Ravivarman16/images/blob/main/EFS/CUSTOMIZE.png)


---


### **7. Selecting the Storage class according to your preferences:**



![storage_class](https://github.com/Ravivarman16/images/blob/main/EFS/STORAGE_CLASS_SELECTING.png)


---


### **8. Then under lifecycle management select according to your preferences:**


![management](https://github.com/Ravivarman16/images/blob/main/EFS/LIFECYCLE_MANAGEMENT.png)


---


### **9. Then under performance settings:** 

Throughput mode, there will be two options

+ Enhanced: (**it will automatically scaled based on traffic**)
  
  - Elastic 
  - Provisioned (**we specify the performance value**)
       
+ Bursting: (**its a default performance mode for basic purpose**)

Select according to your preferences: click next



![performance](https://github.com/Ravivarman16/images/blob/main/EFS/performance_enhanced.png)


---


### **10. Then select the VPC where your instance is running, mount the targets according to the instance availability zones, click next**



![mount](https://github.com/Ravivarman16/images/blob/main/EFS/mount_targets.png)


---


### **11. Under File policies keeping as default & click next:**



![policies](https://github.com/Ravivarman16/images/blob/main/EFS/FILE_POLICIES.png)


---


### **12. Then review & create page will appear, just review the configurations, click create:**



![OUTPUT](https://github.com/Ravivarman16/images/blob/main/EFS/EFS_OUTPUT.png)


---


### **13. Then the create EFS File system, then click attach option:**



![attach](https://github.com/Ravivarman16/images/blob/main/EFS/ATTACH_EFS.png)


---


### **14. For attaching there will be two options:**

+ Mount via DNS


+ Mount via IP



![attach_options](https://github.com/Ravivarman16/images/blob/main/EFS/attach_options.png)


---

Here I am selecting **Mount via DNS** option:



![MOUNTING_DNS](https://github.com/Ravivarman16/images/blob/main/EFS/MOUNTING_DNS.png)


---


### **15. Then connect the instances and create a directory inside it with different name:**


+ **1st Instance:**


  
![1st](https://github.com/Ravivarman16/images/blob/main/EFS/ALTER-1ST-ONE-EFS.png)



+ **2nd Instance:**


  
![2nd](https://github.com/Ravivarman16/images/blob/main/EFS/ALTER-EFS-2ND-INSTANCE.png)


---


### **16. Copy the NFS Client DNS name and change the last word from efs to dir1 for 1st instance & dir2 for 2nd instance. Paste it on the instance servers respectively.**



![NFS_CLIENT](https://github.com/Ravivarman16/images/blob/main/EFS/copy_dns.png)



+ **1st Instance:**
    
      sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport fs-0f4a0a28b85c0ba96.efs.ap-south-1.amazonaws.com:/ dir1


![1st_instance_dns](https://github.com/Ravivarman16/images/blob/main/EFS/1st_instance_efs.png)



+ **2nd Instance:**

      sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport fs-0f4a0a28b85c0ba96.efs.ap-south-1.amazonaws.com:/ dir2


![2nd_instance_dns](https://github.com/Ravivarman16/images/blob/main/EFS/2nd_instance_efs.png)


---


### **17. For checking create file under 2nd instance:**



![creating_file](https://github.com/Ravivarman16/images/blob/main/EFS/2nd%20instance%20creating%20file.png)



### **Checking in the 1st instance:**



![checking](https://github.com/Ravivarman16/images/blob/main/EFS/file_sharing.png)


### **We could able to see file created in 2nd instance its shared in 1st instance with the help of Amazon EFS.**

---


## **To know more about Amazon EFS visit the [official website](https://aws.amazon.com/efs/):** 
