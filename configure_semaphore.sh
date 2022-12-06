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
  "name": "github",
  "project_id": 1,
  "git_url": "https://github.com/jlunde-cisco/siwapp_vars.git",
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
            "description": "vcenter server name"
        },
        {
            "name": "vc_username",
            "title": "vc_username",
            "required": false,
            "type": "",
            "description": "username to log into vcenter"
        },
        {
            "name": "vc_password",
            "title": "vc_password",
            "required": false,
            "type": "",
            "description": "password for your vcenter"
        },
        {
            "name": "linux_pass",
            "title": "linux_pass",
            "required": false,
            "type": "",
            "description": "Linux machine root password"
        },
        {
            "name": "csw_activation_key",
            "title": "csw_activation_key",
            "required": false,
            "type": "",
            "description": "CSW activation key for tenant"
        },
        {
            "name": "vcenter_dc",
            "title": "vcenter_dc",
            "required": false,
            "type": "",
            "description": "vCenter DC name"
        },
        {
            "name": "vcenter_datastore",
            "title": "vcenter_datastore",
            "required": false,
            "type": "",
            "description": "vCenter datastore name"
        },
        {
            "name": "vcenter_cluster",
            "title": "vcenter_cluster",
            "required": false,
            "type": "",
            "description": "vCenter computer cluster name"
        },
        {
            "name": "vcenter_network",
            "title": "vcenter_network",
            "required": false,
            "type": "",
            "description": "vCenter Network Name"
        },
        {
            "name": "vcenter_vds",
            "title": "vcenter_vds",
            "required": false,
            "type": "",
            "description": "vCenter vds name"
        },
        {
            "name": "domain_name",
            "title": "domain_name",
            "required": false,
            "type": "",
            "description": "Network Domain Name"
        },
        {
            "name": "dns_ip",
            "title": "dns_ip",
            "required": false,
            "type": "",
            "description": "DNS Server IP address"
        }
    ]
}'