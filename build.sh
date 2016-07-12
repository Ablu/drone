#!/bin/bash

wget https://storage.googleapis.com/golang/go1.6.2.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.6.2.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin

yum install -y sqlite-devel make

mkdir -p ~/go/src/github.com/drone/
export GOPATH=~/go
ln -s $(pwd) ~/go/src/github.com/drone/drone

export GO15VENDOREXPERIMENT=1
make deps
make gen
make build



