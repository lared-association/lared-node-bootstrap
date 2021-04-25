#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
node_dir=$DIR/blockchain-node

if [[ $(lsb_release -rs) == "18.04" ]]; then

	echo "Compatible version - Ubuntu 18.04"
else
	echo "FATAL: Non-compatible version"
	exit 1

fi

function install_docker(){

	sudo apt-get -y remove docker docker-engine docker.io containerd runc
	sudo apt-get -y update 
	sudo apt-get -y install \
	    apt-transport-https \
	    ca-certificates \
	    curl \
	    gnupg-agent \
	    software-properties-common
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	sudo apt-key fingerprint 0EBFCD88
	sudo add-apt-repository \
	   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
	   $(lsb_release -cs) \
	   stable"
	sudo apt-get -y update
	sudo apt-get -y install docker-ce docker-ce-cli containerd.io
	sudo usermod -aG docker $USER
	newgrp docker
}

function install_docker_compose(){

	sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
	sudo chmod +x /usr/local/bin/docker-compose

}

function install_nvm(){
	
	echo "==> Installing nvm..."
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash > /dev/null 2>&1 

}

function install_node(){
	echo "==> Installing node"
	. ~/.nvm/nvm.sh
	nvm install lts/erbium > /dev/null
	nvm use lts/erbium > /dev/null 
}

function git_pull(){
	command -v git >/dev/null 2>&1 ||
	{ echo >&2 "===> Installing git...";
	  sudo apt install git
	}
	cd $DIR
	git clone https://matasvosylius:pkPq83teZ3pZ9S838Hh5@bitbucket.org/superhow/docker-node-lared.git > /dev/null 2>&1 
}

function cli_install(){

	if [ -d "$DIR/docker-node-lared" ] 
	then
		# echo "===> Installing dependencies"
		cd $DIR/docker-node-lared
		
		npm install > /dev/null 2>&1 
        npm run install-cli > /dev/null 2>&1 
		
	else
		echo "NOT FOUND: Directory $DIR/docker-node-lared does not exists."
	fi
}

function network_setup(){
	mkdir -p $node_dir
	cd $node_dir
	lared-node-bootstrap config -p lared -a dual 
	sleep 3
	lared-node-bootstrap compose
	sleep 2
	
}

function start_node(){
	cd $node_dir
	lared-node-bootstrap run --detached
}

function checkHealth(){
	cd $node_dir
	lared-node-bootstrap healthCheck
	sleep 1
}

function display_address(){
	cp $node_dir/target/addresses.yml $DIR/lared-addresses.yml
	echo "************************************** LARED ADDRESSES **************************************"
	cat $DIR/lared-addresses.yml
	echo "**********************************************************************************************"

}

# Docker installation
if [ -x "$(command -v docker)" ]; then
	echo "SKIP: 'docker' already installed..."
else
	echo "===> PROCESS: Install docker"
	install_docker
fi

if [ -x "$(command -v docker-compose)" ]; then
        echo "SKIP: 'docker-compose' already installed..."
else
        echo "===> PROCESS: Install docker-compose"
        install_docker_compose
fi

# nvm installation
if [ ! -d ~/.nvm ]; then
	echo "===> PROCESS: Install nvm"
	install_nvm
else
	echo "SKIP: 'nvm' is already installed..."
fi

# node installation
if which node > /dev/null 
then
	echo "SKIP: 'node' is already installed..."
else
	echo "===> PROCESS: Install node"
	install_node
fi

# repo pull
if [ ! -d $DIR/docker-node-lared ]; then
	echo "===> PROCESS: Pulling git repository"
	git_pull 
else
	echo "SKIP: git repository already pulled..."
fi

# cli installation
if [ -d $DIR/docker-node-lared ]; then
	echo "===> PROCESS: Installing Blockchain CLI"
	cli_install	
else
	echo "SKIP: lared-cli already installed..."
fi



# client node preparation
if [ ! command -v lared-node-bootstrap &> /dev/null ]; then
	echo "NOT FOUND: lared-node-bootstrap could not be found"
	exit 1
else
	if [ ! -d $DIR/blockchain-node/target ]; then
		echo "===> PROCESS: Preparing network"
		network_setup
	else
		echo "SKIP: Blockchain node is already prepared..."
	fi
fi

if [ -d $DIR/blockchain-node/target ]; then
	echo "==> PROCESS: Starting node"
	start_node
else
	echo "ERROR: Blockchain node is not prepared"
fi

if [ ! command -v lared-node-bootstrap &> /dev/null ];; then
        echo "==> PROCESS: Checking if node is running"
        checkHealth
else
        echo "ERROR: Blockchain node is not prepared"
fi


# display address
if [ -f $DIR/blockchain-node/target/addresses.yml ]; then
        display_address
else
        echo "ERROR: Addresses were not generated..."
fi

