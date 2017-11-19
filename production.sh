vagrant up mgmt-1 mgmt-server --color
exit_code=$?
sleep 300
vagrant up spine-1 spine-2 --color
exit_code=$?
sleep 60
vagrant up edge-1 edge-2 --color
exit_code=$?
sleep 60
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

