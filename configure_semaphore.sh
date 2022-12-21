#!/bin/bash

curl -c cookie.txt -v --location --request POST 'http://127.0.0.1:3000/api/auth/login' \
--header 'Content-Type: application/json' \
--data-raw '{
  "auth": "user1",
  "password": "user1"
}'

sleep 5s

curl -v -b cookie.txt --location --request POST 'http://127.0.0.1:3000/api/projects' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "siwapp",
  "alert": true
}'

sleep 5s

curl -v -b cookie.txt --location --request POST 'http://127.0.0.1:3000/api/project/1/keys' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "none",
  "type": "none",
  "project_id": 1
}'

sleep 5s

curl -v -b cookie.txt --location --request POST 'http://127.0.0.1:3000/api/project/1/repositories' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "vcenter_deploy",
  "project_id": 1,
  "git_url": "https://github.com/jlunde-cisco/SIWAPP-Deployment-Engine.git",
  "git_branch": "main",
  "ssh_key_id": 1
}'
sleep 5s

curl -v -b cookie.txt --location --request POST 'http://127.0.0.1:3000/api/project/1/repositories' \
--header 'Content-Type: application/json' \
--data-raw '{
    "name": "aws_deploy",
    "project_id": 1,
    "git_url": "https://github.com/jlunde-cisco/terraform-aws-siwapp.git",
    "git_branch": "main",
    "ssh_key_id": 1
}'

sleep 5s

curl -v -b cookie.txt --location --request POST 'http://127.0.0.1:3000/api/project/1/environment' \
--header 'Content-Type: application/json' \
--data-raw '{
    "name": "Local",
    "project_id": 1,
    "password": null,
    "json": "{}"
}'

sleep 5s

curl -v -b cookie.txt --location --request POST 'http://127.0.0.1:3000/api/project/1/inventory' \
--header 'Content-Type: application/json' \
--data-raw '    {
        "name": "localhost",
        "project_id": 1,
        "inventory": "localhost ansible_ssh_user=root ansible_ssh_password=Emsee123!",
        "ssh_key_id": 1,
        "become_key_id": null,
        "type": "static"
    }'

sleep 5s

curl -v -b cookie.txt --location --request POST 'http://127.0.0.1:3000/api/project/1/templates' \
--header 'Content-Type: application/json' \
--data-raw '{
  "project_id": 1,
  "inventory_id": 1,
  "repository_id": 1,
  "environment_id": 1,
  "view_id": null,
  "name": "Deploy Siwapp",
  "playbook": "entrypoint.yml",
  "arguments": "[]",
  "description": "Deploys the SIWAPP 3-tiered applicaton",
  "allow_override_args_in_task": true,
  "survey_vars": [
        {
            "name": "vc_server",
            "title": "vc_server",
            "required": false,
            "type": "",
            "description": "REQUIRED: vcenter server IP Address - PLEASE USE IP"
        },
        {
            "name": "vc_username",
            "title": "vc_username",
            "required": false,
            "type": "",
            "description": "REQUIRED: username to log into vcenter"
        },
        {
            "name": "vc_password",
            "title": "vc_password",
            "required": false,
            "type": "",
            "description": "REQUIRED: password for your vcenter"
        },
        {
            "name": "linux_pass",
            "title": "linux_pass",
            "required": false,
            "type": "",
            "description": "REQUIRED: Linux machine root password"
        },
        {
            "name": "csw_activation_key",
            "title": "csw_activation_key",
            "required": false,
            "type": "",
            "description": "OPTIONAL: CSW activation key for tenant"
        },
        {
            "name": "vcenter_dc",
            "title": "vcenter_dc",
            "required": false,
            "type": "",
            "description": "REQUIRED: vCenter DC name"
        },
        {
            "name": "vcenter_datastore",
            "title": "vcenter_datastore",
            "required": false,
            "type": "",
            "description": "REQUIRED: vCenter datastore name"
        },
        {
            "name": "vcenter_cluster",
            "title": "vcenter_cluster",
            "required": false,
            "type": "",
            "description": "REQUIRED: vCenter computer cluster name"
        },
        {
            "name": "vcenter_network",
            "title": "vcenter_network",
            "required": false,
            "type": "",
            "description": "REQUIRED: vCenter Network Name"
        },
        {
            "name": "vcenter_vds",
            "title": "vcenter_vds",
            "required": false,
            "type": "",
            "description": "REQUIRED: vCenter vds name"
        },
        {
            "name": "domain_name",
            "title": "domain_name",
            "required": false,
            "type": "",
            "description": "REQUIRED: Network Domain Name"
        },
        {
            "name": "dns_ip",
            "title": "dns_ip",
            "required": false,
            "type": "",
            "description": "REQUIRED: DNS Server IP address"
        }
    ]
}'

curl -v -b cookie.txt --location --request POST 'http://127.0.0.1:3000/api/project/1/templates' \
--header 'Content-Type: application/json' \
--data-raw '{
  "project_id": 1,
  "inventory_id": 1,
  "repository_id": 1,
  "environment_id": 1,
  "view_id": null,
  "name": "Deploy Load-Generator",
  "playbook": "lb_deploy.yml",
  "arguments": "[]",
  "description": "Deploys the load-generator for SIWAPP",
  "allow_override_args_in_task": true,
  "survey_vars": [
        {
            "name": "vc_server",
            "title": "vc_server",
            "required": false,
            "type": "",
            "description": "REQUIRED: vcenter server IP Address - PLEASE USE IP"
        },
        {
            "name": "vc_username",
            "title": "vc_username",
            "required": false,
            "type": "",
            "description": "REQUIRED: username to log into vcenter"
        },
        {
            "name": "vc_password",
            "title": "vc_password",
            "required": false,
            "type": "",
            "description": "REQUIRED: password for your vcenter"
        }
    ]
}'

sleep 5s

curl -v -b cookie.txt --location --request POST 'http://127.0.0.1:3000/api/project/1/templates' \
--header 'Content-Type: application/json' \
--data-raw '{
    "id": 3,
    "project_id": 1,
    "inventory_id": 1,
    "repository_id": 2,
    "environment_id": 1,
    "name": "Deploy Siwapp to AWS",
    "playbook": "entrypoint.yml",
    "arguments": "[]",
    "allow_override_args_in_task": true,
    "description": "Siwapp to AWS",
    "survey_vars": [
        {
            "name": "aws_access",
            "title": "AWS Access Key",
            "required": false,
            "type": "",
            "description": "Your API Access Key"
        },
        {
            "name": "aws_secret",
            "title": "AWS Secret Key",
            "required": false,
            "type": "",
            "description": "Your AWS Secret Key"
        },
        {
            "name": "aws_region",
            "title": "AWS Region to Deploy",
            "required": false,
            "type": "",
            "description": "AWS Region to Deploy (example format: us-east-1)"
        },
        {
            "name": "key_pair_name",
            "title": "AWS Key Pair Name",
            "required": false,
            "type": "",
            "description": "Your AWS Key Pair Name"
        },
        {
            "name": "private_key",
            "title": "SSH Private Key Contents (see ReadME for format)",
            "required": false,
            "type": "",
            "description": "AWS Private Key contents"
        },
        {
            "name": "owner",
            "title": "Your Name",
            "required": false,
            "type": "",
            "description": "Your name for tagging"
        },
        {
            "name": "bucket_name",
            "title": "S3 Bucket Name",
            "required": false,
            "type": "",
            "description": "Your S3 bucket name for vpc flow logs"
        }
    ]
}'

