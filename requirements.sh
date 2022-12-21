#!/bin/bash -x

echo ========== INSTALLING ANSIBLE  ============

sudo apt-add-repository ppa:ansible/ansible -y
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt update

sudo apt update
sudo apt install ansible -y
sudo apt install git -y
sudo apt install python3-pip -y
pip3 install pyvmomi
ansible-galaxy collection install community.vmware
ansible-galaxy collection install amazon.aws
pip install testresources
pip install --upgrade setuptools==62.0.0
pip install --upgrade git+https://github.com/vmware/vsphere-automation-sdk-python.git
pip install gdown
pip3 install botocore
pip3 install boto3

echo ========== INSTALLING ANSIBLE COMPLETE ============


sudo snap install semaphore

sudo snap start semaphore
sleep 1m
sudo snap stop semaphore

sudo semaphore user add --admin --login user1 --name=User1 --email=user1@user1.com --password=user1

echo ========== Trying to configure Semaphore User  ============

sudo snap start semaphore


echo ========== INSTALLING SEMAPHORE COMPLETE ============
echo ==== Username: user1, password: user1, URL: http://[local ip]:3000 ====

echo ========== INSTALLING TERRAFORM ==============

sudo apt install terraform -y

echo ========== INSTALLING AWS CLI ==============

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo apt install unzip -y
unzip awscliv2.zip
sudo ./aws/install