# Project 5: Container Orchestration with Kubernetes on AWS EKS

## 1.  Create a sample application with a Dockerfile

+ Create a new directory for the application files.

+ Create a new Dockerfile that specifies the application dependencies and configuration.

## 2.  Create a Kubernetes deployment configuration file that specifies the Docker image and any necessary replicas, environment variables, and other settings

Create a new file called deployment.yaml and specify the desired deployment settings (e.g. Docker image, replicas, environment variables).

## 3.  Use kubectl to deploy the application to an AWS EKS cluster

+ Install kubectl on your local machine or a separate server.

+ Authenticate kubectl with your AWS account and configure the necessary Kubernetes permissions.

+ Run the "kubectl apply -f deployment.yaml" command to create the Kubernetes deployment and deploy the application.

## 4. Scale the application up or down by adjusting the replica count in the Kubernetes deployment configuration file

+ Modify the deployment.yaml file to change the number of replicas for the application.

+ Run the "kubectl apply -f deployment.yaml" command again to update the deployment and scale the application up or down.












