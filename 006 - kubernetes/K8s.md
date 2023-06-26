# Kubernetes

## What is VM?

A virtual machine (VM) is a virtual environment that functions as a virtual computer system with its own CPU, memory, network interface, and storage, created on a physical hardware system (located off- or on-premises). Software called a hypervisor separates the machine’s resources from the hardware and provisions them appropriately so they can be used by the VM.

## What is Hypervisor?

A hypervisor is a software program that creates and manages virtual machines (VMs) on a physical host machine. It allows multiple guest operating systems (OSes) to share a single hardware host by abstracting the underlying hardware resources and allocating them to the VMs.

## There are two types of hypervisors: 

**Type 1 hypervisor,** which runs directly on the host machine's hardware,

It include VMware ESXi, Microsoft Hyper-V, and Citrix Hypervisor. and 

**Type 2 hypervisor,** which runs on a host operating system.

It include Oracle VirtualBox, VMware Workstation, and Parallels Desktop for Mac

<img src="https://github.com/Gitscooby/Images/blob/main/k8%20image%201.png">


## Difference between Docker and Kubernetes

<img src="https://github.com/Gitscooby/Images/blob/main/k8%20image%202.png">

<img src="https://github.com/Gitscooby/Images/blob/main/k8%20image%203.png">


## Difference between hypervisor and VM

<img src="https://github.com/Gitscooby/Images/blob/main/k8%20image%204.png">

## Difference between monolithic and microservice architecture

<img src="https://github.com/Gitscooby/Images/blob/main/k8%20image%205.png">





## What is monolithic architecture

Monolithic architecture is a software design approach where the entire application is built as a single, interconnected unit.

## What is microservice architecture

Microservices architecture is a software design approach where an application is broken down into small, independent services that communicate with each other through APIs, rather than being built as a single, interconnected unit like in monolithic architecture.

## History of kubernetes

Kubernetes is an open-source container orchestration platform originally developed by Google in 2014, based on their internal Borg system. It was designed to automate deployment, scaling, and management of containerized applications. It is now maintained by the Cloud Native Computing Foundation (CNCF) and has become one of the most widely used container orchestration systems.

## What is Kubernetes

Kubernetes is an open-source container management tool also known as container orchestration tool for automating software deployment, scaling, and management.

## Kubernetes installation methods

**Single-node Kubernetes installation** is a way to set up a local cluster on one machine for learning and testing purposes. It involves installing a container runtime, such as Docker, and then using a tool like Minikube or k3s to deploy Kubernetes on that machine.

**Manual cluster installation** involves setting up a Kubernetes cluster on your own hardware or virtual machines. This process can be complex and requires advanced knowledge of Kubernetes architecture and networking concepts. It involves downloading and installing Kubernetes binaries on each node, configuring the cluster, and setting up networking and storage. It's usually recommended for experienced users who need more control over their cluster.

**Automatic cluster installation** refers to the process of using a tool or script to automate the installation of a Kubernetes cluster. This method is designed to simplify the process of cluster deployment and configuration, and reduce the risk of human error. Popular tools for automatic cluster installation include kubeadm, kops, and Rancher. This method is recommended for those who want to deploy a cluster quickly and easily, without getting into the details of manual configuration.

**Managed Kubernetes clusters** are clusters that are provided and managed by cloud providers, such as AWS, GCP, and Azure. These clusters are fully managed and maintained by the provider, which takes care of the installation, upgrades, and scaling of the cluster. Managed clusters allow users to focus on their applications and workloads without having to worry about the underlying infrastructure. Users can easily deploy, manage, and monitor their applications using the cloud provider's management console or API. Managed clusters are typically charged based on usage, and are a good option for those who want to avoid the complexity of managing their own cluster.

**Kubernetes the hard way** is a popular tutorial created by Kelsey Hightower, which teaches how to manually deploy a Kubernetes cluster from scratch. The tutorial walks through the process of setting up a cluster on Google Cloud Platform (GCP) using command-line tools, including creating and configuring virtual machines, installing and configuring Kubernetes components, and setting up networking and load balancing. This method of cluster deployment is not recommended for beginners, as it requires advanced knowledge of Kubernetes architecture and networking concepts. However, it can be a valuable learning experience for those who want to understand the inner workings of Kubernetes.

## What is Container Orchestration

Orchestration enables developers to easily build containerized applications and services, as well as scale, schedule and monitor those containers.

## Nodes

Nodes are physical or virtual machines in which kubernetes is installed.

## Cluster

Cluster is a group of nodes, if one node fails we have our application accessible from other nodes.

## What is ClusterIP

A ClusterIP service is a type of service that exposes the pods of a deployment or replica set internally within the cluster. When a ClusterIP service is created, it assigns an internal IP address to the service that can be used by other pods in the cluster to access the pods associated with the service.

ClusterIP services are often used for internal communication between microservices within the cluster.


## What is Nodeport

A NodePort service is a type of service that exposes the pods of a deployment or replica set externally on a specific port on each node in the cluster. When a NodePort service is created, it assigns a port number that is available on all nodes in the cluster and forwards traffic to the pods associated with the service.

NodePort services are often used for external access to a service, such as when exposing a web application to the internet.



## What is Load Balancer

A LoadBalancer service is a type of service that exposes the pods of a deployment or replica set externally using a cloud provider's load balancer. When a LoadBalancer service is created, the cloud provider provisions a load balancer that distributes traffic to the pods associated with the service

LoadBalancer services can be created using a YAML manifest that specifies the type of service and its associated properties, such as the port number, target port, and protocol. Once created, the LoadBalancer service can be accessed using the external IP address assigned by the cloud provider's load balancer.


## Kubernetes architecture

<img src="https://github.com/Gitscooby/Images/blob/main/k8%20image%207.png">

## Master 

Master is other node in which kubernetes is installed and it manages other nodes

## Master node components

### Etcd

Etcd is like a database that stores important information about the Kubernetes cluster, such as the current state of the cluster, the configuration of each node, and other metadata. It provides a reliable and highly available data store for Kubernetes to use.

Etcd uses a distributed architecture to store data across multiple nodes, ensuring that the data is highly available and fault-tolerant. It supports atomic operations, allowing multiple clients to update the data simultaneously without conflicts. This makes it a suitable solution for managing the state of a large-scale distributed system like Kubernetes.

## API Server

API server is the control plane component that exposes the Kubernetes API, which allows clients to interact with the cluster to deploy, manage, and scale applications.

## Controller Manager

Control manager is the control plane component that runs a set of controllers to manage the state of the cluster, ensuring that the actual state matches the desired state specified by the user or the system.

## Scheduler

Scheduler is the control plane component that assigns newly created pods to nodes in the cluster, based on resource requirements, node affinity, and other factors. It ensures that the pods are scheduled to run on nodes that can meet their resource needs and constraints.


## Slave node components

### Kubelet service

The Kubelet service is a node-level agent that runs on each worker node in a Kubernetes cluster. It is responsible for communicating with the Kubernetes API server to receive instructions on what containers to run on the node, and then ensuring that those containers are running and healthy. The Kubelet also monitors the node's resources, such as CPU and memory usage, and reports them back to the control plane.

### Kubernetes Proxy Service

The Kubernetes Proxy Service, also known as kube-proxy, is a network proxy that runs on each node in a Kubernetes cluster. It is responsible for managing network communication between services within the cluster and from external clients to services. The kube-proxy listens for service and endpoint events from the Kubernetes API server and dynamically updates the network rules to ensure that traffic is properly routed to the correct pods. This allows Kubernetes services to be highly available and scalable, while providing a simple and consistent network interface for clients to access them.


## Master V/S Worker node

Master has kube-apiserver installed and nodes have kubelet installed (Kubelet is an agent which make sure nodes are healthy) which provides information to master which stores information in etcd (key value storage)

## Minikube

Minikube is a lightweight Kubernetes implementation that creates a VM on your local machine and deploys a simple cluster containing only one node.

+ Download kubectl and minikube to start using minikube

## PODS

+ A Pod is a group of one or more containers, with shared storage and network resources, and a specification for how to run the containers.

## Replication Controllers

+ Replication Controller used for high availability, it ensures that a specified number of pod replicas are running at any one time. It also helps load balancing and scaling when demand increases.

+ ReplicaSets replaced replication controllers. A ReplicaSet's purpose is to maintain a stable set of replica Pods running at any given time.

## What is Replica Set

+ ReplicaSet is a resource object that is responsible for ensuring that a specified number of replicas (identical copies) of a pod are running at any given time. It is the successor to the deprecated Replication Controller.

+ ReplicaSets are used to provide scalability and high availability for stateless applications. They define the desired state of a set of pods and automatically create or delete pods to match that desired state. For example, if a ReplicaSet is created with a desired replica count of 3, Kubernetes will ensure that 3 identical pods are running at all times, even if a pod crashes or a node fails.

## What is Daemonset

+ A DaemonSet is a type of workload object that ensures that a specific pod runs on all (or a subset of) nodes in a cluster. It is used for running daemon processes that provide system-level services, such as logging, monitoring, or node-level storage.

+ When a new node is added to the cluster, Kubernetes automatically creates a new pod on that node, ensuring that the desired number of pods are always running across the cluster. If a node is removed, the corresponding pod is automatically deleted.

## What is Deployment

A deployment is a high-level resource object that provides a declarative way to manage a set of replica pods. A deployment ensures that the desired number of replica pods are running and healthy, and allows for rolling updates and rollbacks.

The desired state of the replica set, which specifies the number of replicas, the container images and their configuration, and the desired network and storage resources. Once a deployment is created, Kubernetes automatically creates the necessary replica sets and pods to match the desired state.

## Deployments and Updates

## Create Deployment

kubectl create -f deployment.yml


## Get Deployment

kubectl get deployments


## Update Deployment

kubectl set image deployment/fitness-app mysql=mysql:8.0


## Status of Deployment

kubectl rollout status deployment/fitness-app


kubectl rollout history deployment/fitness-app


## Rollback Deployment

kubectl rollout undo deployment/fitness-app


## Kubernetes Commands

**kubectl**

Kubectl is a Command line tool for communicating with a Kubernetes cluster.

## Kubernetes version running on nodes

kubectl version

## Number of nodes

kubectl get nodes

## Command to create a pod and deploy docker container in PODs

kubectl run mysql --image mysql

## List of PODS in Cluster

kubectl get pods

## Get information about POD

kubectl describe pod mysql

## Additional Information about POD

kubectl get pods -o wide

## Create POD using pod-definition.yml file

kubectl create -f pod-definition.yml

## Delete Pod

kubectl delete pod pod-name

## Edit Pod

kubectl edit pod pod-name

## pod-definition.yml

Kubernetes uses yml file as an input to create pods, replicas, deployments, services and so on,

The yml files contain four top level fields-

+ apiVersion: Depending on what we need to create use apiVersion, for creating pods use version v1

+ kind: Type of object we want to create such as Pod

+ metadata: Data about the object like name, labels and app.

+ spec: Specification

## Create replica sets

kubectl create -f replicaset.yml


## Get replica sets

kubectl get replicaset


## Delete replica sets

kubectl delete replicaset replicaset-name


## Replace replica sets

kubectl replace -f replicaset.yml


## Scale replica sets

kubectl scale -replicas=6 -f replicaset.yml

## Viewing and finding resources

List all services in the namespace
kubectl get services                          

List all pods in all namespaces
kubectl get pods --all-namespaces             

List all pods in the current namespace, with more details
kubectl get pods -o wide                      

List a particular deployment
kubectl get deployment my-dep                 

List all pods in the namespace
kubectl get pods                              

Get a pod's YAML
kubectl get pod my-pod -o yaml                

## Trouble shooting

Display the logs of a pod
kubectl logs

Display the details of a pod, service or deployment


kubectl describe

Run a command inside a container
kubectl exec

# Syntax for creating pod

<img src="https://github.com/Gitscooby/Images/blob/main/k8%20image%208.png">
      
# Syntax for creating service

<img src="https://github.com/Gitscooby/Images/blob/main/k8%20image%209.png">
   
# Syntax for creating Ingress file

<img src="https://github.com/Gitscooby/Images/blob/main/k8%20image%2010.png">
