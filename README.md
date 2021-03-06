![](https://i.imgur.com/r8mM1TN.gif)
# lared-node-bootstrap

LaRed tool that allows you to create, configure and run LaRed&#39;s complete networks or nodes to be synced with existing networks.

<!--  -->

<!-- toc -->
* [lared-node-bootstrap](#lared-node-bootstrap)
* [Key benefits](#key-benefits)
* [Intro](#Intro)
* [Requirements](#requirements)
* [Step-by-step preparation](#Step-by-step)
* [Usage](#usage)
* [Development](#development)
* [Command Topics](#command-topics)
<!-- tocstop -->

# Key benefits 💪

-   Installable CLI tool, no repo cloning and compiling needed!
-   The configuration is parameterized via CLI commands and presets instead of by changing properties files.
-   The tool's code is unique for any type of network, new networks, or nodes in a network. It doesn't need to be copied and pasted in different projects or assemblies.
-   The config command runs on the host machine, not via docker, making it easier to debug or tune.
-   Uses the TS SDK for key generation, vrf transactions, address generation instead of using catapult-tools (nemgen is still used to generate the nemesis block).
-   Easier to maintain, the properties files are reused for all nodes, assemblies, and network types.
-   Network setup (how many databases, nodes, rest gateways to run) is defined in presets, and users can create their own ones.
-   Docker-compose yaml files are generated based on the network setup/preset instead of being manually created/upgraded.
-   The created network (config, nemesis, and docker-compose) can be zipped and distributed to other host machines for running.
-   The used docker image versions can be changed via configuration/preset.
-   Uses the [oclif](https://oclif.io) framework, new commands are easy to add and document.
-   Can be included as an npm dependency for clients' e2e testing.
## Preset 📜

Yaml files define the configuration and layout of the network and nodes, the amount of nodes, databases, rest gateways, modes, keys, etc.

Presets are defined at 3 levels from general to specific:

-   Shared: Default configurations for all the networks.
-   Network: It defines the main preset of a given network, for example: `testnet`.
-   Assembly: It defines a modification of a network, for example: `testnet peer`, `tesnet dual`, `testnet api`.

Properties in each file override the previous values (by object deep merge).

### Out-of-the-box presets:


-   `-p testnet -a peer`: A [harvesting](https://github.com/lared-association/lared-node-bootstrap/blob/main/presets/testnet/assembly-peer.yml) peer node that connects to the current public [testnet](https://github.com/lared-association/lared-node-bootstrap/blob/main/presets/testnet/network.yml). [Nemesis block](https://github.com/lared-association/lared-node-bootstrap/tree/main/presets/testnet/seed/00000) is copied over.
-   `-p testnet -a api`: An [api](https://github.com/lared-association/lared-node-bootstrap/blob/main/presets/testnet/assembly-api.yml) peer node that connects to the current public [testnet](https://github.com/lared-association/lared-node-bootstrap/blob/main/presets/testnet/network.yml) running its own mongo database and rest gateway. [Nemesis block](https://github.com/lared-association/lared-node-bootstrap/tree/main/presets/testnet/seed/00000) is copied over.
-   `-p testnet -a dual`: A [dual](https://github.com/lared-association/lared-node-bootstrap/blob/main/presets/testnet/assembly-dual.yml) harvesting peer node that connects to the current public [testnet](https://github.com/lared-association/lared-node-bootstrap/blob/main/presets/testnet/network.yml) running its own mongo database and rest gateway. [Nemesis block](https://github.com/lared-association/lared-node-bootstrap/tree/main/presets/testnet/seed/00000) is copied over.

## Target 📁

The folder where the generated config, docker files, and data are stored. The folder structure is:

-   `./preset.yml`: The final generated preset.yml that is used to configure bootstrap, the nodes, docker, etc.
-   `./addresses.yml`: Randomly generated data that wasn't provided in the preset, e.g.: SSL keys, nodes' keys, nemesis accounts, generation hash seed, etc.
-   `./nodes`: Contains the configuration, data, and logs for all defined node instances.
-   `./gateways`: Contains the configuration and logs for all defined node rest gateways.
-   `./nemesis`: The folder used to contain the nemesis block. Block 1 data is generated via `nemgen` tool for new networks. For an existing network, it is copied over.
-   `./databases`: The location where the mongo data is stored for  different database instances.
-   `./docker`: The generated docker-compose.yml, mongo init scripts, and server basic bash scripts. 
-   `./reports`: The location of the generated reports.

# Intro

-   Tested well on Ubuntu 18.04 TLS
-   Don't run under root, run under power user:
-   It is good practice to change the username ('superuser') provided in the example below
```
adduser superuser
usermod -aG sudo superuser
su superuser
cd
```

# Requirements

-   Node 10+
-   Docker
-   Docker Compose 1.29+ (better to use https://docs.docker.com/engine/install/ubuntu/)

# Step-by-step

You may need NVM to manage node version

```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
```

To use NVM, you may need to logout and login to your session
Install Node 12:

```
nvm install 12
nvm use 12
```

Get the latest version of docker and docker compose:

```
sudo curl -fsSL https://get.docker.com -o get-docker.sh 
sudo sh get-docker.sh
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo groupadd docker
sudo usermod -aG docker $USER
```

Validate your environment by running:

```
node -v
docker -v
docker-compose -v
```

Check your user can run docker without sudo:

```
docker run hello-world
```

If you see an error like:

```
Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock
```

Try to logout and login, or please follow this [guide](https://www.digitalocean.com/community/questions/how-to-fix-docker-got-permission-denied-while-trying-to-connect-to-the-docker-daemon-socket).



# Usage

It's recommended to run the commands from en empty working dir.

The network configuration, data and docker files will be created inside the target folder ('./target') by default.

```
mkdir node
cd node
```

Create node custom name:

```
cd ~/node
touch name.yml
echo 'friendlyName: 'INSERT_YOUR_NODE_NAME_HERE'' > name.yml
```

Once in the working dir:

<!-- usage -->
```sh-session
$ npm install -g lared-node-bootstrap
$ lared-node-bootstrap COMMAND
running command...
$ lared-node-bootstrap (-v|--version|version)
lared-node-bootstrap/1.0.4 linux-x64 node-v10.24.0
$ lared-node-bootstrap --help [COMMAND]
USAGE
  $ lared-node-bootstrap COMMAND
...
```
<!-- usagestop -->

The general usage would be:

```
lared-node-bootstrap config -p testnet -a dual --customPreset name.yml
lared-node-bootstrap compose
lared-node-bootstrap run -d
```

<b>NOTE: Please open 7900 and 3000 for communication with the network</b>

If you need to start fresh, you may need to sudo remove the target folder (docker volumes dirs may be created using sudo). Example:

```
sudo rm -rf ./target
```


# Enabling harvesting


lared-node-bootstrap creates peer nodes with remote harvesting enabled by default, but they still need to be registered by announcing the AccountKeyLink and VrfKeyLink transactions to the network.

This can be done by lared-node-bootstrap too, but it needs to be a step separated from lared-node-bootstrap start because funds are required to announce transactions.

You can find the main address to fund in the file located at node/target/addresses.yml

To decrypt your private keys, you can use this command:

```
lared-node-bootstrap decrypt --source target/addresses.yml --destination plain-addresses.yml
```

The decrypted file with your provate keys will be located at node/plain-addresses.yml


Once the node is running with lared-node-bootstrap start and you have funded its account, from a different terminal (but from the same folder), simply type:

```
lared-node-bootstrap link
```

In case the node can't find any node to transmit transactio, you may set an external URL:


```
lared-node-bootstrap link --url=http://20.52.130.150:3000
```

# Development 🛠️

If you want to contribute to this tool, clone this repo and run:

```
npm install -g
```

Then, `lared-node-bootstrap` runs from the source code. You can now test your features after changing the code.

Pull Requests are appreciated! Please follow the contributing [guidelines](CONTRIBUTING.md).

Note: cloning this repo is intended only for people who want to tune the tool in a way it cannot otherwise be configured. In that case, please provide a feature request.
General users should install this tool like any other node module.

# Commands ⌨️

* [`lared-node-bootstrap clean`](docs/clean.md) - Removes the target folder, deleting the generated configuration and data.
* [`lared-node-bootstrap compose`](docs/compose.md) - Generates the `docker-compose.yml` file from the configured network.
* [`lared-node-bootstrap config`](docs/config.md) - Command used to set up the configuration files and the nemesis block for the current network.
* [`lared-node-bootstrap enrolSupernode`](docs/enrolSupernode.md) - Enrols the nodes in the supernode rewards program by announcing the enrol transaction to the registration address.
* [`lared-node-bootstrap healthCheck`](docs/healthCheck.md) - Checks if the services created with docker compose are up and running.
* [`lared-node-bootstrap help`](docs/help.md) - Displays help for lared-node-bootstrap.
* [`lared-node-bootstrap link`](docs/link.md) - Announces VRF and Voting Link transactions to the network for each node with 'Peer' or 'Voting' roles. This command finalizes the node registration to an existing network.
* [`lared-node-bootstrap report`](docs/report.md) - Generates reStructuredText (.rst) reports describing the configuration of each node.
* [`lared-node-bootstrap resetData`](docs/resetData.md) - Removes the data containing the generated configuration, certificates, keys and block 1.
* [`lared-node-bootstrap run`](docs/run.md) - Boots the network via docker using the generated `docker-compose.yml` file and configuration. The config and compose methods/commands need to be called before this method. This is just a wrapper for the `docker-compose up` bash call.
* [`lared-node-bootstrap start`](docs/start.md) - Single command that aggregates config, compose and run in one line.
* [`lared-node-bootstrap stop`](docs/stop.md) - Stops the docker-compose network if running (lared-node-bootstrap started with --detached). This is just a wrapper for the `docker-compose down` bash call.

<!-- commandsstop -->