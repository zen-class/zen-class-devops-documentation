#!/bin/bash
STATUS = `systemctl is-active jenkins`

sudo apt update -y

#Download jdk:
sudo apt install -y java-11-openjdk

#Download the repo:
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

#Import the required key:
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt-get update

sudo apt-get install jenkins -y

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
