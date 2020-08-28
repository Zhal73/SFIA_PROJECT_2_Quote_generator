#! /bin/bash

echo "Ansible Installation"
sudo apt-get update
sudo apt-get install python -y
mkdir -p ~/.local/bin
echo 'PATH=$PATH:~/.local/bin' >> ~/.bashrc
source ~/.bashrc
pip3 install --user ansible
ansible --versioni


echo "Run ansible Playbook"
ansible-playbook -v -i ../inventory.yaml ../playbook.yaml

source ~/.bashrc
docker-compose build
docker login
docker push zhal73/service1:latest
docker push zhal73/service2:latest
docker push zhal73/service3:latest
docker push zhal73/service4:latest