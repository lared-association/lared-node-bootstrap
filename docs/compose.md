`lared-node-bootstrap compose`
==============================

It generates the `docker-compose.yml` file from the configured network.

* [`lared-node-bootstrap compose`](#lared-node-bootstrap-compose)

## `lared-node-bootstrap compose`

It generates the `docker-compose.yml` file from the configured network.

```
USAGE
  $ lared-node-bootstrap compose

OPTIONS
  -h, --help           It shows the help of this command.
  -t, --target=target  [default: target] The target folder where the symbol-bootstrap network is generated

  -u, --user=user      [default: current] User used to run the services in the docker-compose.yml file. "current" means
                       the current user.

  --upgrade            It regenerates the docker compose and utility files from the <target>/docker folder

EXAMPLE
  $ symbol-bootstrap compose
```
