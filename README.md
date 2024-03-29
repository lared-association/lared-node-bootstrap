# lared-node-bootstrap

![](https://i.imgur.com/r8mM1TN.gif)


Tool that allows you creating, configuring and running Lared&#39;s complete networks or nodes to be sync with existing networks.


<!-- toc -->
* [lared-node-bootstrap](#lared-node-bootstrap)
* [Key benefits:](#key-benefits)
* [Concepts](#concepts)
* [Intro](#intro)
* [Requirements](#requirements)
* [Step-by-step](#step-by-step)
* [Usage](#usage)
* [Enabling harvesting](#enabling-harvesting)
* [Remove node](#remove-node)
* [Command Topics](#command-topics)
<!-- tocstop -->



# Key benefits:

-   It's an installable cli tool. It's not a repo you need to clone and compile.
-   The configuration is parametrized via CLI commands and presets instead of by changing properties files.
-   The tools code is unique for any type of network, new networks or nodes in a network. It doesn't need to be copied and pasted in different projects or assemblies.
-   The config command runs on the host machine, not via docker making it easier to debug or tune
-    It's uses the TS SDK for key generation, vrf transactions, address generation.
-   Easier to maintain, the properties files are reused for all nodes, assemblies and network types.
-   Network setup (how many database, nodes, rest gateways to run) is defined in presets, users can provide their own ones.
-   Docker-compose yaml files are generated based on the network setup/preset instead of being manually created/upgraded.
-   The created network (config, nemesis and docker-compose) can be zipped and distributed for other host machines to run it.
-   The used docker images versions can be changed via configuration/preset
-    It uses the [oclif](https://oclif.io) framework. New commands are easy to add and document.

# Concepts

## Preset:

Yaml files that define the configuration and layout of the network and nodes. It defines how many nodes, database, rest gateways, the modes, keys, etc.

Presets are defined at 4 levels from general to specific:

-   Shared: Default configurations for all the networks.
-   Network: It defines the main preset of a given network, example: `mainnet` or `testnet`.
-   Assembly: It defines a modification of a network, example: `testnet peer`, `tesnet dual`, `testnet api`. Assembly is required for some networks (like `testnet`).
-   Custom: A user provided yml file (`--customPreset` param) that could override some or all properties in the out-of-the-box presets.

Properties in each file override the previous values (by object deep merge).


### Custom preset:

It's the way you can tune the network without modifying the code. It's a yml file (`--customPreset` param) that could override some or all properties in the out-of-the-box presets.

Custom presets give Lared Bootstrap its versatility. Check out the custom preset [guides](docs/presetGuides.md)!

## Target:

The folder where the generated config, docker files and data are stored. The folder structure is:

-   `./preset.yml`: the final generated preset.yml that it's used to configure bootstrap, the nodes, docker, etc.
-   `./addresses.yml`: randomly generated data that wasn't provided in the preset. e.g.: SSL keys, nodes' keys, nemesis accounts, generation hash seed, etc.
-   `./nodes`: it holds the configuration, data and logs for all the defined node instances.
-   `./gateways`: it holds the configuration and logs for all the defined node rest gateways.
-   `./nemesis`: The folder used to hold the nemesis block. Block 1 data is generated via `nemgen` tool for new networks. For existing network, it is copied over.
-   `./databases`: the location where the mongo data is stored for the different database instances.
-   `./docker`: the generated docker-compose.yml, mongo init scripts and server basic bash scripts. 
-   `./reports`: the location of the generated reports.

# Intro

-   Tested well on Ubuntu 18.04 TLS
-   Don't run under root, run under power user:

```
adduser powerusername
usermod -aG sudo powerusername
su powerusername
cd
```

# Requirements

-   Node 12
-   Docker
-   Docker Compose 1.29+ (better to use https://docs.docker.com/engine/install/ubuntu/)
> <b>IMPORTANT: Please open `7900` and `3000` ports for communication with the network</b>

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

Get lared-node-bootstrap:

```
npm install -g @lared/lared-node-bootstrap
```

# Usage

### <span style="font-size:larger;"> 1. **Create directory for your node data.** </span>

It's recommended to run the commands from empty working dir.

The network configuration, data and docker files will be created inside the target folder ('./target') by default.

```
mkdir node
cd node
```

### <span style="font-size:larger;"> 2. **Add custom preset file for node customisation.** </span>

> <em>Either you can add custom preset file or skip this step (to enable default values) and go to step 3 </em>)

---


 Custom preset file properties:


- `friendlyName` - node friendly name (leave empty to use address)
- `minFeeMultiplier` - (default value = `10` ) minimum fee multiplier of transactions to propagate and include in blocks. 
> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Each block added to the blockchain has a different fee multiplier, set by the node that harvested it. The network also defines the dynamic fee multiplier as the median of the last 60 blocks<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;This value approximates the most common fee multiplier that nodes and transaction creators have agreed upon in the most recent blocks, and is used in the calculation of namespace and mosaic rental fees.<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;If a block did not include any transaction, a value of 100 is used to avoid 0 multipliers.

- `maxTrackedNodes` - (default value = `5000` ) number of nodes to track in memory
- `enableDelegatedHarvestersAutoDetection` - (default value = `true`) `true` if potential delegated harvesters should be automatically detected. Possible values are `true` and `false`.
- `delegatePrioritizationPolicy` - (default value = `Importance` ) Prioritization policy used to keep accounts once the maximum number of delegated harvesting accounts is reached. Possible values are `Age` and `Importance`.
- `maxUnlockedAccounts` - (default value = `10`) Maximum number of unlocked accounts, i.e., the maximum number of delegated harvesting accounts.

---



> <b>NOTE:</b> Example below is for demonstration purposes only!

```
echo "nodes:
  -
    friendlyName: 'REPLACE_NODE_NAME_HERE'
    minFeeMultiplier: 10
    maxTrackedNodes: 5000
" > custom.yml
```
<em> friendlyName will be displayed in Lared explorer node list </em> 
> After you have created custom preset file, please check if these values are correct <br> To edit your custom preset of the node, we recommend to use `nano` text editor in the terminal (`nano custom.yml`)


### <span style="font-size:larger;"> 3. **Start the node.** </span>

To deploy Lared node you need to execute these commmand:

> <b>IMPORTANT: Check if ports `7900` and  `3000` are OPEN. These ports will be used for communication with other nodes</b>

```
lared-node-bootstrap start -p mainnet -a dual --customPreset custom.yml -d
```
<b>OR</b>
```
lared-node-bootstrap config -p mainnet -a dual --customPreset custom.yml
lared-node-bootstrap compose
lared-node-bootstrap run -d
```
### <span style="font-size:larger;"> 4. **Check node health** </span>

Please wait until you node will be fully synched with Lared network. After few minutes check node health:

```
curl http://localhost:3000/node/health
```


# Enabling harvesting

lared-node-bootstrap creates peer nodes with remote harvesting enabled by default, but they still need to be registered by announcing the AccountKeyLink and VrfKeyLink transactions to the network.

This can be done by lared-node-bootstrap too, but it needs to be a step separated from lared-node-bootstrap start because funds are required to announce transactions.

### 1. **Send tokens to your main account**

You will find the main address to fund in the file located at node/target/addresses.yml)

If you want to export private keys first you have to decrypt by using following command:

```
lared-node-bootstrap decrypt --source target/addresses.yml --destination plain-addresses.yml
```

The decrypted file with your private keys will be located at node/plain-addresses.yml


### 2. **Link your account.** 

Once the node is running with lared-node-bootstrap start and you have funded its account, from a different terminal (but from the same folder), simply type:

```
lared-node-bootstrap link
```

In case the node can't find any node to transmit transaction, you may set an external URL:


```
lared-node-bootstrap link --url=https://mainnet-dual-2.lared.superhow.net

```

# Remove node


<i>If you need to start fresh, you may need to remove the target folder (docker volumes dirs may be created using sudo).

 Example:

```
cd node
lared-node-bootstrap stop
lared-node-bootstrap clean
```
</i>

<!-- commands -->
# Command Topics

* [`lared-node-bootstrap autocomplete`](docs/autocomplete.md) - display autocomplete installation instructions
* [`lared-node-bootstrap clean`](docs/clean.md) - It removes the target folder deleting the generated configuration and data
* [`lared-node-bootstrap compose`](docs/compose.md) - It generates the `docker-compose.yml` file from the configured network.
* [`lared-node-bootstrap config`](docs/config.md) - Command used to set up the configuration files and the nemesis block for the current network
* [`lared-node-bootstrap decrypt`](docs/decrypt.md) - It decrypts a yml file using the provided password. The source file can be a custom preset file, a preset.yml file or an addresses.yml.
* [`lared-node-bootstrap encrypt`](docs/encrypt.md) - It encrypts a yml file using the provided password. The source files would be a custom preset file, a preset.yml file or an addresses.yml.
* [`lared-node-bootstrap healthCheck`](docs/healthCheck.md) - It checks if the services created with docker compose are up and running.
* [`lared-node-bootstrap help`](docs/help.md) - display help for lared-node-bootstrap
* [`lared-node-bootstrap link`](docs/link.md) - It announces VRF and Voting Link transactions to the network for each node with 'Peer' or 'Voting' roles. This command finalizes the node registration to an existing network.
* [`lared-node-bootstrap modifyMultisig`](docs/modifyMultisig.md) - Create or modify a multisig account
* [`lared-node-bootstrap pack`](docs/pack.md) - It configures and packages your node into a zip file that can be uploaded to the final node machine.
* [`lared-node-bootstrap renewCertificates`](docs/renewCertificates.md) - It renews the SSL certificates of the node regenerating the node.csr.pem files but reusing the current private keys.
* [`lared-node-bootstrap report`](docs/report.md) - it generates reStructuredText (.rst) reports describing the configuration of each node.
* [`lared-node-bootstrap resetData`](docs/resetData.md) - It removes the data keeping the generated configuration, certificates, keys and block 1.
* [`lared-node-bootstrap run`](docs/run.md) - It boots the network via docker using the generated `docker-compose.yml` file and configuration. The config and compose methods/commands need to be called before this method. This is just a wrapper for the `docker-compose up` bash call.
* [`lared-node-bootstrap start`](docs/start.md) - Single command that aggregates config, compose and run in one line!
* [`lared-node-bootstrap stop`](docs/stop.md) - It stops the docker-compose network if running (lared-node-bootstrap started with --detached). This is just a wrapper for the `docker-compose down` bash call.
* [`lared-node-bootstrap updateVotingKeys`](docs/updateVotingKeys.md) - It updates the voting files containing the voting keys when required.
* [`lared-node-bootstrap verify`](docs/verify.md) - It tests the installed software in the current computer reporting if there is any missing dependency, invalid version, or software related issue.
* [`lared-node-bootstrap wizard`](docs/wizard.md) - An utility command that will help you configuring node!

<!-- commandsstop -->
