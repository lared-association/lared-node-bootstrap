`lared-node-bootstrap clean`
=====================

It removes the target folder deleting the generated configuration and data

* [`lared-node-bootstrap clean`](#lared-node-bootstrap-clean)

## `lared-node-bootstrap clean`

It removes the target folder deleting the generated configuration and data

```
USAGE
  $ lared-node-bootstrap clean

OPTIONS
  -h, --help           It shows the help of this command.
  -t, --target=target  [default: target] The target folder where the lared-node-bootstrap network is generated

  --logger=logger      [default: Console,File] The loggers the command will use. Options are: Console,File,Silent. Use
                       ',' to select multiple loggers.

EXAMPLE
  $ lared-node-bootstrap clean
```

_See code: [src/commands/clean.ts](https://github.com/lared-association/lared-node-bootstrap/blob/v1.1.4/src/commands/clean.ts)_
