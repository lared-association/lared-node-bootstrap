`lared-node-bootstrap stop`
===========================

It stops the docker-compose network if running (lared-node-bootstrap started with --detached). This is just a wrapper for the `docker-compose down` bash call.

* [`lared-node-bootstrap stop`](#lared-node-bootstrap-stop)

## `lared-node-bootstrap stop`

It stops the docker-compose network if running (lared-node-bootstrap started with --detached). This is just a wrapper for the `docker-compose down` bash call.

```
USAGE
  $ lared-node-bootstrap stop

OPTIONS
  -h, --help           It shows the help of this command.
  -t, --target=target  [default: target] The target folder where the lared-node-bootstrap network is generated

  --logger=logger      [default: Console,File] The loggers the command will use. Options are: Console,File,Silent. Use
                       ',' to select multiple loggers.

EXAMPLE
  $ lared-node-bootstrap stop
```

_See code: [src/commands/stop.ts](https://github.com/lared-association/lared-node-bootstrap/blob/v1.1.5/src/commands/stop.ts)_
