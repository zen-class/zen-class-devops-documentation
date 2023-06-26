# VPC - VIRTUAL PRIVATE NETWORK

<img src="https://github.com/Gitscooby/Images/blob/main/vpc%20imgae%201.png">

Amazon Virtual Private Cloud (Amazon VPC) enables you to launch AWS resources into a virtual network that you've defined. This virtual network closely resembles a traditional network that you'd operate in your own data center, with the benefits of using the scalable infrastructure of AWS.


## Features 

The following features help you configure a VPC to provide the connectivity that your applications need:

### Virtual private clouds (VPC)

A VPC is a virtual network that closely resembles a traditional network that you'd operate in your own data center. After you create a VPC, you can add subnets.

### Subnets

A subnet is a range of IP addresses in your VPC. A subnet must reside in a single Availability Zone. After you add subnets, you can deploy AWS resources in your VPC.

### IP addressing

You can assign IPv4 addresses and IPv6 addresses to your VPCs and subnets. You can also bring your public IPv4 and IPv6 GUA addresses to AWS and allocate them to resources in your VPC, such as EC2 instances, NAT gateways, and Network Load Balancers.

### Routing

Use route taables to determine where network traffic from your subnet or gateway is directed.

### Gateways and endpoints

A gateway connects your VPC to another network. For example, use an internet gateway to connect your VPC to the internet. Use a VPC endpoint to connect to AWS services privately, without the use of an internet gateway or NAT device.

### Peering connections

Use a VPC peering connection to route traffic between the resources in two VPCs.

### Traffic Mirroring

Copy network traffic from network interfaces and send it to security and monitoring appliances for deep packet inspection.

### Transit gateways

Use a transit gateway, which acts as a central hub, to route traffic between your VPCs, VPN connections, and AWS Direct Connect connections.


### VPC Flow Logs

A flow log captures information about the IP traffic going to and from network interfaces in your VPC.

### VPN connections

Connect your VPCs to your on-premises networks using AWS Virtual Private Network (AWS VPN).

# Getting started with Amazon VPC

Your AWS account includes a default VPC in each AWS Region. Your default VPCs are configured such that you can immediately start launching and connecting to EC2 instances. For more information, see Get started with Amazon VPC.

You can choose to create additional VPCs with the subnets, IP addresses, gateways and routing that you need. For more information, see Create a VPC.

# Working with Amazon VPC

You can create and manage your VPCs using any of the following interfaces:

+ AWS Management Console — Provides a web interface that you can use to access your VPCs.

+ AWS Command Line Interface (AWS CLI) — Provides commands for a broad set of AWS services, including Amazon VPC, and is supported on Windows, Mac, and Linux. For more information, see AWS Command Line Interface.

+ AWS SDKs — Provides language-specific APIs and takes care of many of the connection details, such as calculating signatures, handling request retries, and error handling. For more information, see AWS SDKs.

+ Query API — Provides low-level API actions that you call using HTTPS requests. Using the Query API is the most direct way to access Amazon VPC, but it requires that your application handle low-level details such as generating the hash to sign the request, and error handling. For more information, see Amazon VPC actions in the Amazon EC2 API Reference.



## Pricing for Amazon VPC

There's no additional charge for using a VPC. There are charges for some VPC components, such as NAT gateways, IP Address Manager, traffic mirroring, Reachability Analyzer, and Network Access Analyzer. For more information, see Amazon VPC Pricing.

## How VPC Works

+ VPC (Virtual Private Cloud) works by creating an isolated virtual network within the AWS cloud environment. 

+ When you create a VPC, you specify the IP address range for your VPC and divide it into subnets. Each subnet is associated with a specific availability zone within a region.

+ You can launch various AWS resources, such as EC2 instances, RDS databases, and Lambda functions, within the VPC. These resources are assigned private IP addresses from the IP address range you specified for the VPC.

+ You can also create security groups and network access control lists (ACLs) to control inbound and outbound traffic to and from the resources in your VPC. This enables you to set up fine-grained access control for your resources.

+ To access the internet or other AWS services outside of your VPC, you can configure an internet gateway or a NAT gateway. An internet gateway enables resources in your VPC to access the internet directly, while a NAT gateway allows resources in your private subnets to access the internet via a public subnet.

+ If you need to connect your VPC to your on-premises network, you can use AWS Direct Connect or a VPN connection. This enables you to extend your network into the cloud and use resources in the cloud as if they were on your own network.

+ VPC is highly scalable, and you can add or remove resources as needed. You can also use VPC peering to connect multiple VPCs in the same or different regions.

+ Overall, VPC provides a flexible and scalable way to create a virtual network infrastructure in the cloud, with fine-grained control over network traffic and access.


## Components of Amazon VPC

### Amazon VPC comprises a variety of objects :

**A Virtual Private Cloud:** A logically isolated virtual network in the AWS cloud. You define a VPC’s IP address space from the ranges you select.

**Subnet:** A segment of a VPC’s IP address range where you can place groups of isolated resources.

**Internet Gateway:** The Amazon VPC side of a connection to the public Internet.

**NAT Gateway:** A highly available, managed Network Address Translation (NAT) service for your resources in a private subnet to access the Internet.

**Route Table:** A route table contains a set of rules, called routes, that are used to determine where network traffic from your subnet or gateway is directed.

**DNS Hostname:**  The Amazon DNS server resolves a public DNS hostname to the public IPv4 address of the instance outside the network of the instance.

**CIDR:** Classless Inter-Domain Routing




