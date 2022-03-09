#!/bin/bash
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
yum update -y
yum install -y jenkins
yum install -y java-1.8.0-openjdk
yum install -y java-1.8.0-openjdk-devel
systemctl enable jenkins