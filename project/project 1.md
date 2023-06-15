# Project 1: Continuous Integration and Deployment of Node.js Application with Jenkins, AWS EC2 and Docker.

## Set up an EC2 instance:

+ Launch an EC2 instance in AWS and install Docker on it.

+ Create a new security group and configure it to allow incoming traffic on port 22 (SSH) and 80 (HTTP).

## Install and configure Jenkins:

+ Install Jenkins on the EC2 instance and start the Jenkins service.

+ Configure Jenkins with any necessary plugins and settings.

+ Create a new Jenkins job to build the Node.js application and push it to a Docker registry.

## Build the Node.js application:

+ Create a new Node.js application that serves a simple "Hello World" webpage.

+ Use npm to install any necessary dependencies.

+ Write tests to verify that the application is functioning correctly.

+ Use a package.json file to specify the application's dependencies.

## Build the Docker image:

+ Create a Dockerfile that specifies the application's dependencies and how to run it.

+ Use the Dockerfile to build a Docker image of the Node.js application.

## Push the Docker image to the registry:

+ Use Jenkins to push the Docker image to a Docker registry (e.g. Docker Hub).

+ Deploy the Docker image to the EC2 instance:

+ Use Jenkins to SSH into the EC2 instance and pull the Docker image from the registry.

+ Start a new Docker container on the EC2 instance using the Docker image.

## Verify the deployment:

+ Access the application in a web browser to confirm that it is running correctly.





















