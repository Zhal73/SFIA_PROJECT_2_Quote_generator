#! /bin/bash

echo "Ansible Installation"
whoami
sudo apt-get update
sudo apt-get install python -y
mkdir -p ~/.local/bin
echo 'PATH=$PATH:~/.local/bin' >> ~/.bashrc
source ~/.bashrc
pip install --user ansible
~/.local/bin/ansible --version


echo "Run ansible Playbook"
~/.local/bin/ansible-playbook -v -i inventory.yaml playbook.yaml

sudo groupadd -f docker
sudo usermod -aG docker $(whoami)
sudo chmod 666 /var/run/docker.sock

docker-compose build
docker login
docker push zhal73/service1:latest
docker push zhal73/service2:latest
docker push zhal73/service3:latest
docker push zhal73/service4:latest
