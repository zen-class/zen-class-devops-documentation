<a href="https://jenkins.io">
  <picture>
    <source width="200" media="(prefers-color-scheme: dark)" srcset="https://www.jenkins.io/images/jenkins-logo-title-dark.svg">
    <img width="200" src="https://www.jenkins.io/images/jenkins-logo-title.svg">
  </picture>
</a>

## What is Jenkins

Jenkins is an open-source automation tool written in Java with plugins built for Continuous Integration and Continuous deployment/delivery purposes.

## Why Jenkins

Jenkins is used to build and test your software projects continuously make it easier for developers to integrate changes to the project, and make it easier for users to obtain a fresh build. It provides many plugins that help to support building, deploying and automating any project.

## Jenkins Workflow

![Modern Project Management Process Infographic Graph (3)](https://user-images.githubusercontent.com/69889600/214857610-4fc3e64c-a262-4a6b-9e4d-b5b4eed057c6.png)

## Continuous Integration

Continuous Integration is a software development practice where code is continuously tested after a commit to ensure there are no bugs. The common practice is that whenever a code commit occurs, a build should be triggered. 

## Continuous Deployment

Continuous Deployment is a software development process where code changes to an application are released automatically into the production environment.

## Continuous Delivery

Continuous delivery is a software development practice where a code change is built, tested, and then pushed to a non-production testing or staging environment but final deploy to production is made after approval. 

## Advantages of Jenkins

* Open source tool
* Easy to install
* Platform Independent
* Support 1000+ plugins
* Free of cost
* Automates integration 

## Install jenkins

* Install Java Development Kit (JDK)
* Set path for the Environmental variable for JDK
* Download and Install [Jenkins](https://www.jenkins.io/doc/book/installing/)
* Check if jenkins service is running using (systemctl status jenkins)

## Webhook

Webhook in jenkins triggers pipeline automatically when any changes are done in github repo like commit and push.

* Copy jenkins URL 
* Go to repo settings in github
* Select Add webhook and paste URL
* Append url with /github-webhook/

## Continuous Deployment

Deploy code to production server 
* Go to Jenkins, manage jenkins.
* Install plugin remote ssh
* Connect remote server over ssh
* Configure global property in Jenkins to store the production IP.
* Add credentials, hostname of prod server
* Test connection
Use 
```bash
withCredentials([usernamePassword(credentialsId: 'prodserver_login', usernameVariable: 'USERNAME', passwordVariable: 'USERPASS')]) 
```
to connect to production server

## Continuous Deployment using Docker

Push docker image to docker hub

```bash
  withRegistry('https://registry.hub.docker.com', 'docker_hub_login')
```
Ask approval before deploying to production

```bash
  input 'Deploy to Production?'
```
Use milestone to accidently deploying old version over a new version 

```bash
  milestone(1)
```
## Create build agent on a second server 

* Login slave from master using ssh
* Create user's home directory at worker node
* sudo mkdir /var/lib/jenkins
* sudo useradd -d /var/lib/jenkins jenkins
* sudo chown -R jenkins:jenkins /var/lib/jenkins
* sudo mkdir /var/lib/jenkins/.ssh
* Copy the contents of ~/.ssh/id_rsa.pub to the file /var/lib/jenkins/.ssh/authorized_keys
* cat ~/.ssh/id_rsa.pub # Copy the output
* sudo vim /var/lib/jenkins/.ssh/authorized_keys 
* Paste id_rsa contents into jenkins
* Create an .ssh directory on the master in the jenkins directory:
   sudo mkdir /var/lib/jenkins/.ssh
* Copy the known_hosts entry over from the .ssh directory in master   jenkins user's .ssh directory:
  sudo cp ~/.ssh/known_hosts /var/lib/jenkins/.ssh
* Create new node on jenkins master 
* Remote dir:/var/lib/jenkins Labels:Linux Host:Ip of worker node
* Add creds worker node and paste private key

## Monitoring in Jenkins

* Install any monitoring plugins like Prometheus, grafana, datadog   and so on.
* SSH into prometheus server
* Edit vi /etc/prometheus/prometheus.yml file
* Add jenkins target - ip:8080
* Restart prometheus
* Hit endpoints and see data scrape by prometheus


## Backup in Jenkins

* Install Thin Backup plugin
* Create directory jenkinsbackupand cd into it.
* Set write permission to directory
* Go to jenkins enter dir path and backup and restore jenkins.










