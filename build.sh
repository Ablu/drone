#!/bin/bash

sudo yum install -y sqlite-devel make wget git || exit 1

wget https://storage.googleapis.com/golang/go1.6.2.linux-amd64.tar.gz || exit 1
sudo tar -C /usr/local -xzf go1.6.2.linux-amd64.tar.gz || exit 1
export PATH=$PATH:/usr/local/go/bin || exit 1

mkdir -p ~/go/src/github.com/drone/ || exit 1
mkdir ~/go/bin
export PATH="~/go/bin/:$PATH"
export GOPATH=~/go || exit 1
ln -s $(pwd) ~/go/src/github.com/drone/drone || exit 1

echo "PATH:"
echo $PATH

echo "which go-data:"
which go-bindata

go get -u github.com/jteeuwen/go-bindata/...

export GO15VENDOREXPERIMENT=1
make deps || exit 1
make gen || exit 1
make build || exit 1



