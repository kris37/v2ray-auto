#!/bin/bash
source /etc/profile

#install docker on centos7
dockerversion=
echo "install docker on centos"
sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

sudo yum-config-manager --enable docker-ce-edge

sudo yum install -y docker-ce

dockerlist=`yum list docker-ce --showduplicates | sort -r`
echo ${dockerlist}
#sudo yum install ${dockerversion}
sudo systemctl start docker

#test docker
