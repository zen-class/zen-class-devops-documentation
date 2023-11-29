# AWS Elastic Load Balancer


![ELB](https://github.com/zen-class/zen-class-devops-documentation/assets/77039703/046092af-a6b3-4fd8-9964-ff247ef53740)


Elastic Load Balancing automatically distributes your incoming traffic across multiple targets, such as EC2 instances, containers, and IP addresses, in one or more Availability Zones. 


## Benifits of ELB

1. A load balancer distributes workloads across multiple compute resources, such as virtual servers. Using a load balancer increases the availability and fault tolerance of your applications.
   
2. You can add and remove compute resources from your load balancer as your needs change, without disrupting the overall flow of requests to your applications.
   
3. You can configure health checks, which monitor the health of the compute resources, so that the load balancer sends requests only to the healthy ones. 


## Types of ELB

+ Application Load Balancers
+ Network Load Balancers
+ Gateway Load Balancers 
+ Classic Load Balancers. 


## Regions & Availability Zones

Region is a separate geographic area.

Availability Zones are multiple, isolated locations within each Region.



![reg avail](https://github.com/zen-class/zen-class-devops-documentation/assets/77039703/f368ea03-0a3d-4358-9613-0e2deb082dc1)



## How ELB Works

+ A load balancer accepts incoming traffic from clients and routes requests to its registered targets (such as EC2 instances) in one or more Availability Zones.
+ The load balancer also monitors the health of its registered targets and ensures that it routes traffic only to healthy targets.
+ When the load balancer detects an unhealthy target, it stops routing traffic to that target.
+ It then resumes routing traffic to that target when it detects that the target is healthy again.



![networking-load_balancing](https://github.com/zen-class/zen-class-devops-documentation/assets/77039703/5d5a4f59-0576-41c4-ad74-3f282b94f16e)



## Components of ELB

 * Listeners
 * Load balancer
 * Target group


## Listeners

A listener is a process that checks for connection requests. It is configured with a protocol and port number for       connections from clients to the load balancer.You configure your load balancer to accept incoming traffic by specifying one or more listeners.


## Target Groups

+ Target groups route requests to individual registered targets, such as EC2 instances, using the protocol and port number that you specify. You can register a target with multiple target groups. 
+ Each target group is used to route requests to one or more registered targets. When you create each listener rule, you specify a target group and conditions.


## Rules

Every listener has a default action, also known as the default rule. The default rule cannot be deleted and is always performed last.


## Cross-zone Load Balancing

+ The nodes for your load balancer distribute requests from clients to registered targets.

+ When cross-zone load balancing is enabled, each load balancer node distributes traffic across the registered targets in all enabled Availability Zones.

+ When cross-zone load balancing is disabled, each load balancer node distributes traffic only across the registered targets in its Availability Zone.


  
![cross_zone_load_balancing_enabled](https://github.com/zen-class/zen-class-devops-documentation/assets/77039703/f80877a9-1002-4739-8581-b360589dac4f)




If cross-zone load balancing is enabled, each of the 10 targets receives 10% of the traffic. This is because each load balancer node can route its 50% of the client traffic to all 10 targets.

If cross-zone load balancing is disabled:
   
+ Each of the two targets in Availability Zone A receives 25% of the traffic.
   
+ Each of the eight targets in Availability Zone B receives 6.25% of the traffic.

cross-zone load balancing is always enabled at the load balancer level. At the target group level, cross-zone load balancing can be disabled.


## Application Load Balancer

+ Application Load Balancers intelligently provide scalability, performance, and availability. They also guarantee that your servers are not overworked and are prepared to handle traffic spikes.
  
+ Application Load Balancer, aka ALB, is an Elastic Load Balancer or ELB on AWS. It operates at the application layer (the seventh layer) of the Open Systems Interconnection (OSI) model.
  
+ The Application Load Balancer distributes incoming HTTP and HTTPS traffic across multiple targets.


## Benefits of ALB

+ **Support for Path conditions:** You can configure your listener with rules that forward requests based on the URL in the request. This allows you to break down your application into smaller services (microservices) and route requests to the appropriate service based on the URL’s content.
  
+ **Support for Host conditions:** You can configure your listener with rules that forward requests based on the host field in the HTTP header. This allows you to route requests to many domains using a single load balancer.
  
+ Routing is supported based on request information such as HTTP header conditions and methods, query parameters, and source IP addresses.
  
+ You can send routing requests to numerous applications on a single EC2 server.
  
+ An instance or IP address can be registered with numerous target groups on a separate port.


## How to Create ALB



### **1. Sign into AWS Management Console**





### **2. Select your preferred Region. Select a region from the drop-down, the selection of the region can be done on the basis of the criteria discussed earlier in the blog.**







<img width="806" alt="Screenshot 2023-10-27 174417" src="https://github.com/zen-class/zen-class-devops-documentation/assets/77039703/11b62397-fa61-4acd-88fe-0545c71954c8">







### **3. Select ELB Service in Management console**






   
<img width="629" alt="ELB_service" src="https://github.com/zen-class/zen-class-devops-documentation/assets/77039703/eaaf2cb5-b5a1-4c9e-b9cd-fdf2d079fc84">







### **4. Click Create LoadBalancer buttton**







   
<img width="775" alt="CreateELB" src="https://github.com/zen-class/zen-class-devops-documentation/assets/77039703/3d84195f-2467-45b8-9448-4cf95eca7e20">







### **5. Choose ELB type and click create**







<img width="409" alt="ChooseELB" src="https://github.com/zen-class/zen-class-devops-documentation/assets/77039703/657eeeca-0625-4689-80ea-73d75df97473">


  



### **6. Make Basic Configuration Name, Schema and IP Address Type**



## Scheme

Scheme is the type of load balancer.

1. Internet-facing
   
2. Internal

+ If Scheme is internet-facing , the load balancer has a public DNS name that resolves to a public IP address.
  
+ If Scheme is internal , the load balancer has a public DNS name that resolves to a private IP address.

+ Both internet-facing and internal load balancers route requests to your targets using private IP addresses. Therefore, your targets don't need public IP addresses to receive requests from an internal or an internet-facing load balancer.



## IP Address Type

1. IPV4

2. Dual Stack

+ IPv4 if your clients use IPv4 addresses to communicate with the load balancer, or choose Dualstack if your clients use both IPv4 and IPv6 addresses to communicate with the load balancer.

+ If the load balancer is an internal load balancer, you must choose IPv4.






<img width="654" alt="Basic_conf" src="https://github.com/zen-class/zen-class-devops-documentation/assets/77039703/ebcba2b8-4bfe-4e48-a891-5708c7134054">








### **7. Configure Network mapping section - Choose VPC and Availability Zones**
   


## Mapping

+ Enable two or more Availability Zones, to increase the fault tolerance of your application.

+ Select one subnet per zone. If you enabled dual-stack mode for the load balancer, select subnets with associated IPv6 CIDR blocks.






  
<img width="654" alt="nwmapp" src="https://github.com/zen-class/zen-class-devops-documentation/assets/77039703/463cad22-08e0-43d1-a2c7-62ceb9e2b9f6">








### **8. Add Security Groups for Loadbalancer**









<img width="657" alt="sg" src="https://github.com/zen-class/zen-class-devops-documentation/assets/77039703/4e5c3130-bd68-4673-b948-da34c85104b3">







### **9. Add Listeners and Routing info - Add a Target Group**









<img width="660" alt="listener_routing" src="https://github.com/zen-class/zen-class-devops-documentation/assets/77039703/cf640a3d-dbfc-42cd-b22d-e24530a75977">








### **10.Create Target Group and adding our servers**





**11. Click create target group button to start specifying group details**








<img width="794" alt="TGcreate" src="https://github.com/zen-class/zen-class-devops-documentation/assets/77039703/add924dd-5971-43e2-9a36-09146465ae6f">








### **12. Choose target Type - Instances, Ip Address, Lambda, ALB**







### **13. Add Target Group Name,Protocol, Ports, IP address type, VPC and Protocol Version.**







<img width="610" alt="TG1" src="https://github.com/zen-class/zen-class-devops-documentation/assets/77039703/f6809e50-868e-4229-8c5e-566dbf6da145">









<img width="406" alt="TG2" src="https://github.com/zen-class/zen-class-devops-documentation/assets/77039703/71590b7c-e424-4572-9a6c-d23626c36a6a">








## Protocol version

By default, Application Load Balancers send requests to targets using HTTP/1.1. You can use the protocol version to send requests to targets using HTTP/2 or gRPC(HTTP-Hyper Text Transfer Protocol and gRPC-High Performance Remote Procedure calls) .








<img width="410" alt="TG3" src="https://github.com/zen-class/zen-class-devops-documentation/assets/77039703/737b9a36-de0e-4f9e-94b3-ea6685dcd1c3">








### **14. Adding Health check path to store logs**







<img width="920" alt="TG4" src="https://github.com/zen-class/zen-class-devops-documentation/assets/77039703/cfe39e03-58da-409a-b3fc-e3e78b88f63d">







### **15. Register our intsances as targets only running instance are shown in the Page.**





### **16. Select and include below option to add our instance.**





### **17. Finally review our targets and create targets group.**






  
<img width="730" alt="TG5" src="https://github.com/zen-class/zen-class-devops-documentation/assets/77039703/5bbe6fd4-8c77-45b9-9653-a4dd2b90c417">








### **18. Once target group was created continue with **Step 9** and choose our new target group.**




### **19. Review our configuration and create it.**








<img width="657" alt="Final" src="https://github.com/zen-class/zen-class-devops-documentation/assets/77039703/7700e88e-4863-47be-95d8-1f106c1f3d41">









## Network Load Balancer

+ Network Load Balancer operates at the connection level (Layer 4), routing connections to targets (Amazon EC2 instances, microservices, and containers) within Amazon VPC, based on IP protocol data.

+ Ideal for load balancing of both TCP and UDP traffic, Network Load Balancer is capable of handling millions of requests per second while maintaining ultra-low latencies.

+ Network Load Balancer is optimized to handle sudden and volatile traffic patterns while using a single static IP address per Availability Zone.

+ It is integrated with other popular AWS services such as Auto Scaling, Amazon EC2 Container Service (ECS), Amazon CloudFormation, and AWS Certificate Manager (ACM).





  
<img width="216" alt="nwlbimg" src="https://github.com/zen-class/zen-class-devops-documentation/assets/77039703/591027d7-84d1-4338-9e52-b801fd0c2b7e">






## Features of Network Load Balancer

1. Connection-based Layer 4 Load Balancing
2. Low Latency
3. Static IP and Elastic IP support
4. Integration with Amazon Route 53
5. Integration with AWS Services


## How Network Load Balancer Works 

1. Clients make requests to your application.

2. The load balancer receives the request either directly or through an endpoint for private connectivity (via AWS PrivateLink).

3. The listeners in your load balancer receive requests of matching protocol and port, and route these requests based on the default action that you specify. You can use a TLS listener to offload the work of encryption and decryption to your load balancer.

4. Healthy targets in one or more target groups receive traffic according to the flow hash algorithm


## How to create Network Load Balancer




+ ###  **Network Load Balancer creation also same as Application Load Balancer only changes in **Step 9** Protocols**








<img width="655" alt="nlb" src="https://github.com/zen-class/zen-class-devops-documentation/assets/77039703/d2a05db5-6e4d-4748-af62-80a9f7a9c96b">








## Gateway Load Balancer

Gateway Load Balancer helps you easily deploy, scale, and manage your third-party virtual appliances. It gives you one gateway for distributing traffic across multiple virtual appliances while scaling them up or down, based on demand. This decreases potential points of failure in your network and increases availability.








<img width="221" alt="gwlb" src="https://github.com/zen-class/zen-class-devops-documentation/assets/77039703/f8a9ab80-a084-406d-beec-48ace8480308">






## Benefits

+ Scale your virtual appliance instances automatically.

+ Bring higher availability to your third-party virtual appliances.

+ Monitor continuous health and performance metrics.


## How Gateway Load Balancer Works

1. Clients make requests to your application.

2. The load balancer receives the request based on the route table configurations that are set within your VPC, Internet Gateway, or Transit Gateway.

3. The load balancer routes requests to a target group consisting of a scalable fleet of appliances (for example, firewalls, deep packet inspection systems, URL filtering systems etc.) to process traffic flows.

4. The virtual appliance processes the traffic, and forwards it back to the load balancer, or drops the traffic based on its configuration. This type of load balancer acts as a bump-in-the-wire between the source and destination.

5. The load balancer forwards the traffic to its destination.






![gwlb_sideways_flow](https://github.com/zen-class/zen-class-devops-documentation/assets/77039703/b393bd2b-a5fe-45ac-a0e2-e93d50a2e06d)






## How to create Gateway Load Balancer






### **1. Start with ALB creation **Step 6** basic configuration for create GatewayLB.**







### **2. Next step same as Step 7**







<img width="658" alt="gwlb1" src="https://github.com/zen-class/zen-class-devops-documentation/assets/77039703/830caf1a-e39a-43a0-acec-ebbe9e9dcebc">








### **3. Complete steps and click create loadbalancer.** 





## Classic Load Balancer

+ Classic Load Balancer provides basic load balancing across multiple Amazon EC2 instances and operates at both the request level and connection level. Classic Load Balancer is intended for applications that are built within the EC2-Classic network.

+ CLB operates at Layer 4 and 7 of the OSI model. This means routes traffic between clients and backend servers based on IP address and TCP port.


## Benefits

Using a Classic Load Balancer instead of an Application Load Balancer has the following benefits:

1. Support for TCP and SSL listeners.



## How Classic Load Balancer Works
+ To ensure that your registered instances are able to handle the request load in each Availability Zone, it is important to keep approximately the same number of instances in each Availability Zone registered with the load balancer. 

For example, if you have ten instances in Availability Zone us-west-2a and two instances in us-west-2b, the requests are distributed evenly between the two Availability Zones. As a result, the two instances in us-west-2b serve the same amount of traffic as the ten instances in us-west-2a. Instead, you should have six instances in each Availability Zone.

+ By default, the load balancer distributes traffic evenly across the Availability Zones that you enable for your load balancer. To distribute traffic evenly across all registered instances in all enabled Availability Zones, enable cross-zone load balancing on your load balancer.
  
+ However, we still recommend that you maintain approximately equivalent numbers of instances in each Availability Zone for better fault tolerance.






![C_load_balancer](https://github.com/zen-class/zen-class-devops-documentation/assets/77039703/53ab3843-88ef-402c-905c-9023adbd066a)







## How to create Classic Load Balancer


Classic Load Balancer creation also same as Application Load Balancer changes are showed below




### **1.Select Listener and instance protocol.**








<img width="656" alt="clb1" src="https://github.com/zen-class/zen-class-devops-documentation/assets/77039703/c50bac85-9bac-4aa7-8a77-225d9c745be3">








### **2.Add Instances to create our Classic Load Balancer.**








<img width="657" alt="clb2" src="https://github.com/zen-class/zen-class-devops-documentation/assets/77039703/83fee38f-7736-49f8-a0b8-e43a7c49da34">







## Security in Elastic Load Balancing

+ Cloud security at AWS is the highest priority. As an AWS customer, you benefit from a data center and network architecture that are built to meet the requirements of the most security-sensitive organizations.

+ Security is a shared responsibility between AWS and you.

**Security of the cloud** – AWS is responsible for protecting the infrastructure that runs AWS services in the AWS Cloud. AWS also provides you with services that you can use securely.

**Security in the cloud** – Your responsibility is determined by the AWS service that you use. You are also responsible for other factors including the sensitivity of your data, your company's requirements, and applicable laws and regulations. 


## Pricing


### Application Load Balancer

You are charged for each hour or partial hour that an Application Load Balancer is running, and the number of Load Balancer Capacity Units (LCU) used per hour.

### Network Load Balancer

You are charged for each hour or partial hour that a Network Load Balancer is running, and the number of Network Load Balancer Capacity Units (NLCU) used by Network Load Balancer per hour.

### Gateway Load Balancer

You are charged for each hour or partial hour that a Gateway Load Balancer is running, and the number of Gateway Load Balancer Capacity Units (GLCU) used by Gateway Load Balancer per hour.

### Classic Load Balancer

You are charged for each hour or partial hour that a Classic Load Balancer is running and for each GB of data transferred through your load balancer.

### AWS Free Tier

Get started with Elastic Load Balancing for free with the AWS Free Tier. Upon sign-up, new AWS customers receive 750 hours per month shared between Classic and Application load balancers; 15 GB of data processing for Classic load balancers; and 15 LCUs for Application Load Balancers.

### LCU Details

An LCU measures the dimensions on which the Application Load Balancer processes your traffic (averaged over an hour). The four dimensions measured are:

+ **New connections**: Number of newly established connections per second. Typically, many requests are sent per connection. 

+ **Active connections**: Number of active connections per minute.

+ **Processed bytes**: The number of bytes processed by the load balancer in GBs for HTTP(S) requests and responses.

+ **Rule evaluations**: The product of the number of rules processed by your load balancer and the request rate. The first 10 processed rules are free (Rule evaluations = Request rate * (Number of rules processed - 10 free rules).





























