#  **AMAZON STORAGE SERVICES**



![AWS_STORAGE_SERVICE](https://github.com/zen-class/zen-class-devops-documentation/assets/129171351/424a4d21-4e36-4409-baa2-6dd340e5f37b)



Storage is a critical category in cloud computing, and Amazon Web Services (AWS) provides an extensive suite of storage services that empower businesses to securely and efficiently manage their data across diverse use cases. These services are designed to offer scalable, durable, and cost-effective storage solutions, addressing the dynamic needs of modern applications and enterprises.



---


## **Amazon Storage Service Categories:**


The main AWS Cloud storage services are grouped into three categories:

+  **Block Storage:**

   -  Elastic Block Storage(EBS)
 
   -  Instance Store

+  **Object Storage:**

   -  Amazon Simple Storage Service(S3)
 
   -  Amazon S3 Glacier
     
+  **File Storage:**

   - Elastic File System
 
   - Amazon FSx for Lustre
 
   - Amazon FSx for Windows File Server
     




![TYPES](https://github.com/zen-class/zen-class-devops-documentation/assets/129171351/8cf1d29f-6eaa-463f-b469-11ce0d1823c8)



---


## **Difference between Block vs Object vs File Storage:**



<p align="center">
  <img src="https://github.com/zen-class/zen-class-devops-documentation/assets/129171351/4b9e3a7b-e23b-4ad9-8177-634b236200f4" alt="DIFFERENCE_STORAGE">
</p>




| Feature          | Block Storage                       | File Storage                      | Object Storage                           |
|:-----------------|:-----------------------------------:|:----------------------------------:|:-----------------------------------------:|
| **Structure**        | Fixed-sized blocks                   | Files and directories             | Objects with unique identifiers         |
| **Use Case**         | High-performance, random access      | Shared environments, hierarchical | Unstructured data, scalable, cloud-based |
| **Access Method**    | Block-level access                  | File-level access                 | Object-level access (via URL)            |
| **Flexibility**      | Supports individual block operations| Supports sequential and random access| Efficient storage and retrieval of large data |
| **Scalability**      | Scalable by adding more blocks       | Scalable, but managing directories may become complex | Highly scalable, efficient for large volumes of data |
| **Example Service**  | Amazon Elastic Block Store (EBS)    | Amazon Elastic File System (EFS)  | Amazon Simple Storage Service (S3)      |



---





## **1. Block Storage:**

+  Block storage is a type of data storage that is used to store data in fixed-sized blocks or chunks.

+  Each block is treated as an individual hard drive, and they can be individually formatted with file systems.
+  Unlike file storage, which organizes data hierarchically using directories and folders,
   block storage does not organize data into a hierarchical structure and is typically used for raw storage purposes.





### **Types of Block Storages in AWS:**
   

Amazon Web Services provide two types of Block Storages, they are
   

-  **Instance Store(temporary)**
     
-  **Elastic Block Storage(permanent)**


---


### **Instance Store:**



![INSTANCE STORE](https://github.com/zen-class/zen-class-devops-documentation/assets/129171351/0f5cde3c-663f-487b-97da-b1eaf4038745)



+  An instance store provides **temporary block-level storage** for your instance.

+  This storage is located on disks that are **physically** attached to the host computer.
+  Volatile, temporary storage that is attached to your instances & It is only **present during the running lifetime of the instance.**
+  The size of an instance store and the number of available devices varies by **instance type.**
+  Instance store is dedicated to a particular instance, the disk subsystem is shared among instances on a host computer.
+  Instance store volumes do not their own management application programming interface (API).
+  You cannot make an instance store volume available after you launch the instance.




### **Use-Case:**

   -  AWS instance store volumes work well for temporary storage of information that is continually changing, such as buffers, caches, scratch data, and other temporary content.
     
   -  You can also use them for data that is replicated across a fleet of instances, such as a load balanced pool of web servers.





### **How the Instance Store Works:**


+  An Amazon EC2 instance running with an attached instance store.


![image 1](https://github.com/zen-class/zen-class-devops-documentation/assets/129171351/57626ffb-0052-41b8-93e2-4db4a0bdf62a)


+  The instance has been stopped or terminated.


![image 2](https://github.com/zen-class/zen-class-devops-documentation/assets/129171351/0c23d4fa-1272-4c46-8f57-ff192d36b6c4)


+  All data on the attached instance store is deleted when the instance is stopped or terminated.


![image 3](https://github.com/zen-class/zen-class-devops-documentation/assets/129171351/68274fcc-7bcb-458b-b30e-5ac23de4e208)



### **To know more about [Instance Store just click here:](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/InstanceStorage.html)**


---



### **Elastic Block Storage(EBS):**


![EBS2](https://github.com/zen-class/zen-class-devops-documentation/assets/129171351/bb9e7da9-8ebb-4969-a141-2c63727de557)




+  Amazon Elastic Block Storage provides **persistent block-storage volumes** for use with EC2 instances.

+  It is also known as **on-volatile storage** because it retains data even after power to that device is shut off.
+  Each EBS volume is **automatically replicated within its Availability Zone** to protect against component failure, offering **high availability and durability.**
+  With Amazon EBS, you can scale your usage up or down within minutes—all while paying only for the resources that you provision.
+  To achieve an even higher level of data durability, you can utilize Amazon EBS to **create point-in-time snapshots of your volumes,** a feature known as **EBS Snapshots.**
+  Additionally, you can recreate a new volume from a snapshot at any time, share snapshots, or even copy snapshots to different AWS Regions for enhanced **Disaster Recovery (DR) protection.**
+  An EBS snapshot functions as **an incremental backup.** In the initial backup of a volume all the data is copied, Subsequent backups only
   save the blocks of data that have changed since the latest snapshot.



![EBS_SNAP](https://github.com/zen-class/zen-class-devops-documentation/assets/129171351/300b5710-1b87-423a-884d-9755ef8df518)






### **Use-Cases:**


+  EBS provides scalable and durable storage for database files, supporting relational and NoSQL databases on Amazon EC2 instances.
   It enables dynamic adjustments in size and performance, along with reliable backup solutions using EBS snapshots.

   
+  EBS is utilized for high-performance applications, including real-time analytics and simulations, offering low-latency and consistent I/O performance.
   Users can select EBS volume types like Provisioned IOPS to meet specific throughput and IOPS requirements.





### **How does Elastic Block Storage works:**



![EBS_WORKS](https://github.com/zen-class/zen-class-devops-documentation/assets/129171351/7d5df190-c7dd-4009-8ddd-e7da4e2dc75d)



### **To know more about [Elastic Block Storage just click here:](https://aws.amazon.com/ebs/)**



---


### **The difference between Instance Store & Elastic Block Storage:**



| **Feature**          | **Amazon EBS**                     | **Instance Store**                  |
|:---------------------|:---------------------------------|:-----------------------------------|
| **Persistence**      | Persistent storage                 | Non-persistent storage              |
| **Use Cases**        | Suitable for databases, applications| Temporary data storage, caching     |
| **Volume Types**     | Various types                      | Local instance storage is ephemeral |
| **High Availability** | Volumes can be attached/detached    | Local to the instance               |
| **Snapshot Support** | Supports point-in-time snapshots   | No snapshot support                 |
| **Scalability**      | Can be dynamically resized         | Size is fixed based on instance type|
| **Cost Implications**| Incurs additional costs for storage | No additional storage costs         |
| **Data Durability**  | Data is durably stored              | Data is lost if instance fails      |



---


## **2. Object Storage:**


![STORAGE_OBJECT](https://github.com/zen-class/zen-class-devops-documentation/assets/129171351/a02d61e6-af2a-45e7-9f22-87f0a4ee9b22)



+  Object storage redefines data storage, treating information as self-contained objects with unique identifiers, metadata, and data.

+  Unlike traditional systems, it dispenses with hierarchical structures, enabling seamless scaling for unstructured data.
+  Emphasizing high durability and reliability through replication, it ensures data availability despite hardware failures.
+  Its cost-effective scalability, API accessibility, and metadata-driven organization make it crucial for modern data management.


## **Types of Object Storage in Amazon Web Services:**

The Object Storage Services provided by Amazon Web Services are

+  **Amazon Simple Storage Services(S3)**

+  **Amazon Simple Storage Service Glacier**


---

### **Amazon Simple Storage Service(S3):**



![STORAGE_S3](https://github.com/zen-class/zen-class-devops-documentation/assets/129171351/3425d47f-11a6-4736-88a6-516e8326ac36)



+  Amazon S3 is a managed cloud storage solution that allows you to store data as objects in a bucket.

+  Objects can be nearly any data file, such as documents, images, or videos.
+  Buckets serve as logical containers for objects.
+  When adding objects to a bucket, a unique name, known as an object key, must be assigned.
+  Amazon S3 is designed for seamless scalability and offers over 11 nines (99.999999999 percent) of durability.
+  Unlike EC2 instances, Amazon S3 is a global service, not region-specific.
+  The data stored in Amazon S3 isn't tied to any specific server, eliminating the need for self-managing infrastructure.
+  Additionally, Amazon S3 acts as a Version Control management system and supports static website hosting.
+  Its characteristics include the ability to virtually store an unlimited number of objects, redundant storage of data.
+  Amazon S3 also provides low-latency access to data over the internet via HTTP or HTTPS, allowing data retrieval from anywhere at any time.
+  Amazon S3 provides different types of storage classes based on features, availability, and pricing, allowing users to select the most
   suitable option for their work. The available storage classes are:

   - **Amazon S3 Standard**
 
   - **Amazon S3 Intelligent-Tiering**
   - **Amazon S3 Standard-Infrequent Access (Amazon S3 Standard-IA)**
   - **Amazon S3 One Zone-Infrequent Access (Amazon S3 One Zone-IA)**
   - **Amazon S3 Glacier**
   - **Amazon S3 Glacier Deep Archive**

+  These classes offer a range of capabilities, enabling users to optimize costs while meeting specific accessibility and durability requirements for their data.
    

![AMAZON_S3_STORAGE_CLASSES](https://github.com/zen-class/zen-class-devops-documentation/assets/129171351/4638caa8-c5ed-435a-a7f0-b9cd44572e40)



###  **Use-Case:**


Some of the use cases of amazon S3 include:


+  **Static Website Hosting:**

   - Amazon S3 helps in hosting static websites. Hence users can use their domain. Serverless Web Applications can be developed using S3 and by using generated URLs, users can access the application.


+  **Backup & Recovery:**

   - Amazon S3 helps create backups and archive critical data by supporting Cross Region Replication. Due to versioning, which stores multiple versions of each file, it is easy to recover the files.


+  **Low-cost data archiving:**

   -  It is possible to move data archives to certain levels of AWS S3 services like Glacier storage classes, which is one of the cheap and durable archiving solutions for compliance purposes; thus, data can be retained for a longer time



## **To know more about [Amazon S3 just click here](https://github.com/zen-class/zen-class-devops-documentation/blob/main/010%20-%20AWS/005%20S3.md)**



---



## **Comparison between Amazon Elastic Block Storage vs Amazon Simple Storage Service:**


**Scenario:**
Consider a video editing project where an 80-gigabyte video file undergoes corrections. For efficient and granular editing, Amazon EBS is well-suited as it allows updates to specific 
blocks affected by the edits, optimizing data transfer. In contrast, if the scenario involves a photo analysis website where users upload images to be indexed and viewed by a large audience, Amazon S3 proves ideal. S3's web-enabled nature, distributed architecture, and cost-effectiveness make it a seamless choice for scalable and accessible storage.



| **Aspect**                               | **Amazon EBS**                                      | **Amazon S3**                                              |
|------------------------------------------|-----------------------------------------------------|------------------------------------------------------------|
| **Storage Type**                         | Block storage that presents as volumes to EC2 instances | Object storage with a flat structure, treats files as objects|
| **Use Case Scenario**                    | Video Editing: Requires efficient block-level updates | Photo Analysis Website: Web-enabled, distributed, and accessible|
| **Editing Efficiency**                   | Updates only specific blocks affected by edits      | Requires re-uploading the entire object for each change     |
| **Access Method**                        | Block-level access                                   | Object-level access via URL, suitable for web-enabled scenarios|
| **Durability**                           | High durability, replicated within Availability Zone | 11 9's of durability, distributed across multiple Availability Zones|
| **Backup Strategy**                      | Suitable as a primary storage solution and for backups | Inherently serves as a backup strategy with versioning and durability|
| **Cost Structure**                       | Incurs costs based on provisioned storage and IOPS   | Cost-effective for storing large volumes with pay-as-you-go pricing|
| **Scalability**                          | Scalable by adding more EBS volumes to instances    | Highly scalable, accommodating vast amounts of data globally|
| **Accessibility**                        | Directly attached to EC2 instances                  | Web-enabled, accessible via unique URLs with fine-grained access control|
| **Example Service**                      | Amazon Elastic Block Store (EBS)                    | Amazon Simple Storage Service (S3)                            |




---



## **3. File Storage:**



![EFS_ALTER](https://github.com/zen-class/zen-class-devops-documentation/assets/129171351/1266c4a4-a4cd-4470-a9a1-3ee5410af38d)



+  File storage is a type of data storage method that organizes and stores data in a hierarchical structure, using directories and files. 


+  In file storage systems, data is grouped into files, and these files are organized within directories or folders.
+  Each file is assigned a unique name within its directory, allowing for easy navigation and retrieval. 



## **Types of File Storage in Amazon Web Services:**


The most important File Storage Service provided by Amazon Web Services are

+  **Amazon Elastic File System (Amazon EFS)**


---


### **Amazon Elastic File System: (Amazon EFS)**



![EFS](https://github.com/zen-class/zen-class-devops-documentation/assets/129171351/39ce268f-a46b-4a96-89c1-e42abbec7a0e)


- **Scalable Storage:** Amazon Elastic File System (Amazon EFS) offers scalable, Petabyte-scale, low-latency, fully managed, and elastic Network File System (NFS) storage designed for use with AWS Cloud services and on-premises resources.

- **Network File System (NFS):** Enables storing and retrieving data in a network.

- **User-Friendly Interface:** EFS provides an easy-to-use interface for quick and simple file system creation and configuration.

- **Compatibility:** Compatible with all Linux-based Amazon Machine Images (AMIs) for Amazon Elastic Compute Cloud (Amazon EC2).

- **Elastic Scaling:** Built to elastically scale on demand without disrupting applications.

- **Automatic Growth and Shrinkage:** EFS file systems automatically grow and shrink based on file additions or removals, ensuring applications have the required storage.

- **Concurrent Access:** Access your Amazon EFS file system concurrently from Amazon EC2 instances in your Amazon Virtual Private Cloud (Amazon VPC), facilitating access for applications that scale beyond a single connection.

- **Versatile Use Cases:** An easy solution for building file systems supporting big data and analytics, media processing workflows, content management, web serving, and home directories.

- **Performance Attributes:** To support various cloud storage workloads, Amazon EFS exposes attributes allowing you to control file system performance. These attributes include performance mode, storage class, and throughput mode.



### **Architecture Diagram:**


![EFS_OVERVIEW](https://github.com/zen-class/zen-class-devops-documentation/assets/129171351/e5f5e738-a925-4cb6-820b-27b7402bf607)



### **Use-Case:**


+  **Application testing and development** – Amazon EFS provides your development environments with a common storage repository. With an Amazon EFS file system,
   you can share code and other files in a secure and organized way. Amazon EFS delivers a scalable and highly available solution
   that works well for testing and development workloads.

+  **Big Data analytics** – Amazon EFS provides scale and performance for big data applications that require high throughput to compute nodes.
   It also provides read-after-write consistency and low-latency file operations.

+  **Home directories** – Amazon EFS can provide storage for organizations that have many users who must access and share common datasets.



### **How does Amazon Elastic File System works:**


![EFS WORKS](https://github.com/zen-class/zen-class-devops-documentation/assets/129171351/a683c66f-8a96-4df0-ba48-72c1985b44f6)


### **To know more [Elastic File Storage just click here:](https://aws.amazon.com/efs/)**


---

















