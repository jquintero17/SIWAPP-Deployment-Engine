## SIWAPP to vCenter or AWS Deployment Engine
###### The following will deploy a 4-tiered SIWAPP instance to vCenter or AWS. You can deploy as many SIWAPP instances as necessary
Dependency: DHCP must be present within a port-group in vCenter for deploying SIWAPP

1. Build an Ubuntu 20.04 machine with 2vCPU, 4G RAM, and min. 64GB HDD
2. Run the following commands. These will install any dependencies and the semaphore application + configuration:

```bash
    wget https://raw.githubusercontent.com/jlunde-cisco/siwapp_vars/main/requirements.sh && chmod +x requirements.sh
    wget https://raw.githubusercontent.com/jlunde-cisco/siwapp_vars/main/configure_semaphore.sh && chmod +x configure_semaphore.sh
    
    sudo bash requirements.sh
    sudo bash configure_semaphore.sh
    
```
3. Open a webbrower and go to http://[localip]:3000
4. Login with user1/user1
5. Navigate to Inventory(left side)-->edit the local host entry (pencil icon)
6. Change the ansible username and ssh password to the root credentials of your ubuntu box's local account.

#### For vCenter Deployment
Click on Task Templates, and run the 'Deploy Siwapp' job
1. Fill in the information within the menu. Try to use the IP address of your vCenter server
2. After this is complete you should see the VM's in your vCenter inventory, and you should be able to browse to the IP address of the app-lb machine, and login with siwapp/siwapp
3. Run the Deploy Load Generator Task Template. This will turn your local ubuntu box into a load-generator for the siwapp instances. It will install microk8s, and run the load-gen containers. 

#### For AWS Deployment
Dependency: AWS Key Pair generated, S3 bucket for flow logs created, AWS API access credentials (access id and secret key)

1. Click on Task Templates, and run the 'Deploy Siwapp to AWS' job template
![aws instructions](aws_siwapp_help.png)
