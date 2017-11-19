vagrant up mgmt-1 mgmt-server --color
sleep 300
vagrant up spine-1 spine-2 --color
sleep 60
vagrant up edge-1 edge-2 --color
sleep 60
vagrant up --color
sleep 300
export ANSIBLE_FORCE_COLOR=true
ansible-playbook ../site.yml
exit_code=$?
sleep 60
ansible-playbook ../netq_check_clag.yml
ansible-playbook ../netq_check_bgp.yml
vagrant destroy -f
exit $exit_code
