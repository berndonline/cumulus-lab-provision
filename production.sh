vagrant up mgmt-1 mgmt-server --color
exit_code=$?
sleep 300
vagrant up --color
exit_code=$?
sleep 600
export ANSIBLE_FORCE_COLOR=true
ansible-playbook ../site.yml
exit_code=$?
sleep 60
vagrant ssh spine-1 -c 'netq show agents'
vagrant destroy -f
exit $exit_code

