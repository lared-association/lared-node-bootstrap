`lared-node-bootstrap config`
=============================

Command used to set up the configuration files and the nemesis block for the current network

* [`lared-node-bootstrap config`](#lared-node-bootstrap-config)

## `lared-node-bootstrap config`

Command used to set up the configuration files and the nemesis block for the current network

```
USAGE
  $ lared-node-bootstrap config

OPTIONS
  -a, --assembly=assembly           An optional assembly type, example "dual" for testnet

  -c, --customPreset=customPreset   External preset file. Values in this file will override the provided presets
                                    (optional)

  -h, --help                        It shows the help of this command.

  -p, --preset=(bootstrap|testnet)  [default: bootstrap] the network preset

  -r, --reset                       It resets the configuration generating a new one

  -t, --target=target               [default: target] The target folder where the lared-node-bootstrap network is
                                    generated

  -u, --user=user                   [default: current] User used to run docker images when creating configuration files
                                    like certificates or nemesis block. "current" means the current user.

  --pullImages                      It pulls the utility images from DockerHub when running the configuration. It only
                                    affects alpha/dev docker images.

  --report                          It generates reStructuredText (.rst) reports describing the configuration of each
                                    node.

  --upgrade                         It regenerates the configuration reusing the previous keys. Use this flag when
                                    upgrading the version of bootstrap to keep your node up to date without dropping the
                                    local data. The original preset (-t), assembly (-a), and custom preset (-a) must be
                                    used. Backup the target folder before upgrading.

EXAMPLE
  $ lared-node-bootstrap config -p bootstrap
```
