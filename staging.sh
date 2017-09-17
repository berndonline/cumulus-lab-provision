vagrant up --color
exit_code=$?
sleep 300
export ANSIBLE_FORCE_COLOR=true
ansible-playbook ../site.yml
exit_code=$?
vagrant destroy -f
exit $exit_code
