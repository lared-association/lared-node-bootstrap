# lared-node-bootstrap

Symbol CLI tool that allows you creating, configuring and running Symbol&#39;s complete networks or nodes to be sync with existing networks.

<!--  -->

<!-- toc -->
* [lared-node-bootstrap](#lared-node-bootstrap)
* [Key benefits:](#key-benefits)
* [Requirements](#requirements)
* [Usage](#usage)
* [Development](#development)
* [Command Topics](#command-topics)
<!-- tocstop -->

# Key benefits:

-   It's an installable cli tool. It's not a repo you need to clone and compile.
-   The configuration is parametrized via CLI commands and presets instead of by changing properties files.
-   The tools code is unique for any type of network, new networks or nodes in a network. It doesn't need to be copied and pasted in different projects or assemblies.
-   The config command runs on the host machine, not via docker making it easier to debug or tune
-   It's uses the TS SDK for key generation, vrf transactions, address generation instead of using catapult-tools (nemgen is still used to generate the nemesis block).
-   Easier to maintain, the properties files are reused for all nodes, assemblies and network types.
-   Network setup (how many database, nodes, rest gateways to run) is defined in presets, users can provide their own ones.
-   Docker-compose yaml files are generated based on the network setup/preset instead of being manually created/upgraded.
-   The created network (config, nemesis and docker-compose) can be zipped and distributed for other host machines to run it.
-   The used docker images versions can be changed via configuration/preset
-   It uses the [oclif](https://oclif.io) framework. New commands are easy to add and document.
-   It can be included as a npm dependency for clients' e2e testing.
## Preset:

Yaml files that define the configuration and layout of the network and nodes. It defines how many nodes, database, rest gateways, the modes, keys, etc.

Presets are defined at 4 levels from general to specific:

-   Shared: Default configurations for all the networks.
-   Network: It defines the main preset of a given network, example: `testnet`.
-   Assembly: It defines a modification of a network, example: `testnet peer`, `tesnet dual`, `testnet api`.

Properties in each file override the previous values (by object deep merge).

### Out-of-the-box presets:


-   `-p testnet -a peer`: A [harvesting](https://github.com/lared-association/lared-node-bootsrap/blob/main/presets/testnet/assembly-peer.yml) peer node that connects to the current public [testnet](https://github.com/lared-association/lared-node-bootsrap/blob/main/presets/testnet/network.yml). [Nemesis block](https://github.com/lared-association/lared-node-bootsrap/tree/main/presets/testnet/seed/00000) is copied over.
-   `-p testnet -a api`: A [api](https://github.com/lared-association/lared-node-bootsrap/blob/main/presets/testnet/assembly-api.yml) peer node that connects to the current public [testnet](https://github.com/lared-association/lared-node-bootsrap/blob/main/presets/testnet/network.yml) running its own mongo database and rest gateway. [Nemesis block](https://github.com/lared-association/lared-node-bootsrap/tree/main/presets/testnet/seed/00000) is copied over.
-   `-p testnet -a dual`: A [dual](https://github.com/lared-association/lared-node-bootsrap/blob/main/presets/testnet/assembly-dual.yml) haversting peer node that connects to the current public [testnet](https://github.com/lared-association/lared-node-bootsrap/blob/main/presets/testnet/network.yml) running its own mongo database and rest gateway. [Nemesis block](https://github.com/lared-association/lared-node-bootsrap/tree/main/presets/testnet/seed/00000) is copied over.

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

# Requirements

-   Node 10+
-   Docker
-   Docker Compose

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

Please follow this [guide](https://www.digitalocean.com/community/questions/how-to-fix-docker-got-permission-denied-while-trying-to-connect-to-the-docker-daemon-socket).

# Usage

It's recommended to run the commands from en empty working dir.

The network configuration, data and docker files will be created inside the target folder ('./target') by default.

```
mkdir my-networks
cd my-networks
```

Once in the working dir:

<!-- usage -->
```sh-session
$ npm install -g @lared/lared-node-bootstrap
$ lared-node-bootstrap COMMAND
running command...
$ lared-node-bootstrap (-v|--version|version)
@lared/lared-node-bootstrap/0.4.2 win32-x64 node-v12.19.0
$ lared-node-bootstrap --help [COMMAND]
USAGE
  $ lared-node-bootstrap COMMAND
...
```
<!-- usagestop -->

The general usage would be:

```
lared-node-bootsrap config -p testnet -a dual
lared-node-bootsrap compose
lared-node-bootsrap run
```

If you need to start fresh, you many need to sudo remove the target folder (docker volumes dirs may be created using sudo). Example:

```
sudo rm -rf ./target
```



# Development

If you want to contribute to this tool, clone this repo and run:

```
npm install -g
```

Then, `lared-node-bootsrap` runs from the source code. You can now try your features after changing the code.

Pull Requests are appreciated! Please follow the contributing [guidelines](CONTRIBUTING.md).

Note: cloning this repo is only for people that want to tune the tool in a way it cannot be configured. If this is your case, please provide a feature request.
General users should install this tool like any other node module.

# Command Topics

* [`lared-node-bootsrap clean`](docs/clean.md) - It removes the target folder deleting the generated configuration and data
* [`lared-node-bootsrap compose`](docs/compose.md) - It generates the `docker-compose.yml` file from the configured network.
* [`lared-node-bootsrap config`](docs/config.md) - Command used to set up the configuration files and the nemesis block for the current network
* [`lared-node-bootsrap enrolSupernode`](docs/enrolSupernode.md) - It enrols the nodes in the supernode rewards program by announcing the enrol transaction to the registration address.
* [`lared-node-bootsrap healthCheck`](docs/healthCheck.md) - It checks if the services created with docker compose are up and running.
* [`lared-node-bootsrap help`](docs/help.md) - display help for lared-node-bootsrap
* [`lared-node-bootsrap link`](docs/link.md) - It announces VRF and Voting Link transactions to the network for each node with 'Peer' or 'Voting' roles. This command finalizes the node registration to an existing network.
* [`lared-node-bootsrap report`](docs/report.md) - it generates reStructuredText (.rst) reports describing the configuration of each node.
* [`lared-node-bootsrap resetData`](docs/resetData.md) - It removes the data keeping the generated configuration, certificates, keys and block 1.
* [`lared-node-bootsrap run`](docs/run.md) - It boots the network via docker using the generated `docker-compose.yml` file and configuration. The config and compose methods/commands need to be called before this method. This is just a wrapper for the `docker-compose up` bash call.
* [`lared-node-bootsrap start`](docs/start.md) - Single command that aggregates config, compose and run in one line!
* [`lared-node-bootsrap stop`](docs/stop.md) - It stops the docker-compose network if running (lared-node-bootsrap started with --detached). This is just a wrapper for the `docker-compose down` bash call.

<!-- commandsstop -->

```

```
