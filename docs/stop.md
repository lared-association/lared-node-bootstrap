`lared-node-bootstrap stop`
===========================

It stops the docker-compose network if running (symbol-bootstrap started with --detached). This is just a wrapper for the `docker-compose down` bash call.

* [`lared-node-bootstrap stop`](#lared-node-bootstrap-stop)

## `lared-node-bootstrap stop`

It stops the docker-compose network if running (symbol-bootstrap started with --detached). This is just a wrapper for the `docker-compose down` bash call.

```
USAGE
  $ lared-node-bootstrap stop

OPTIONS
  -h, --help           It shows the help of this command.
  -t, --target=target  [default: target] The target folder where the symbol-bootstrap network is generated

EXAMPLE
  $ symbol-bootstrap stop
```
