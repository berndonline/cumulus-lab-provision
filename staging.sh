#!/bin/bash

EXIT=0
vagrant up mgmt-1 --color <<< 'mgmt-1 boot' || EXIT=$?
vagrant up netq-1 --color <<< 'netq-1 boot' || EXIT=$?
sleep 300
vagrant up spine-1 --color <<< 'spine-1 boot' || EXIT=$?
vagrant up spine-2 --color <<< 'spine-2 boot' || EXIT=$?
sleep 60
vagrant up edge-1 --color <<< 'edge-1 boot' || EXIT=$?
vagrant up edge-2 --color <<< 'edge-2 boot' || EXIT=$?
sleep 60
vagrant up leaf-1 --color <<< 'leaf-1 boot' || EXIT=$?
vagrant up leaf-2 --color <<< 'leaf-2 boot' || EXIT=$?
vagrant up leaf-3 --color <<< 'leaf-3 boot' || EXIT=$?
vagrant up leaf-4 --color <<< 'leaf-4 boot' || EXIT=$?
vagrant up leaf-5 --color <<< 'leaf-5 boot' || EXIT=$?
vagrant up leaf-6 --color <<< 'leaf-6 boot' || EXIT=$?
sleep 60
vagrant up server-1 --color <<< 'server-1 boot' || EXIT=$?
vagrant up server-2 --color <<< 'server-2 boot' || EXIT=$?
vagrant up server-3 --color <<< 'server-3 boot' || EXIT=$?
vagrant up server-4 --color <<< 'server-4 boot' || EXIT=$?
vagrant up server-5 --color <<< 'server-5 boot' || EXIT=$?
vagrant up server-6 --color <<< 'server-6 boot' || EXIT=$?
sleep 60
export ANSIBLE_FORCE_COLOR=true
ansible-playbook ./helper_scripts/configure_servers.yml <<< 'ansible playbook' || EXIT=$?
ansible-playbook ../site.yml <<< 'ansible playbook' || EXIT=$?
sleep 60
ansible-playbook ../icmp_check.yml <<< 'icmp check' || EXIT=$?
vagrant destroy -f
echo $EXIT
exit $EXIT
