#!/bin/bash
STATUS = `systemctl is-active jenkins`

#Download jdk:
sudo yum install -y java-11-openjdk

#Install wget:
sudo yum install -y wget

#Download the repo:
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo

#Import the required key:
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

#Install Jenkins:
sudo yum install -y jenkins

#Enable Jenkins:
sudo systemctl enable jenkins

#Start Jenkins:
sudo systemctl start jenkins

if [STATUS == 'active']
   then
   echo "Jenkins is running"
else
   echo "Jenkins is not running, starting the service"
   systemctl start jenkins
fi
