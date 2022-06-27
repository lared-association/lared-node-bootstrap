`lared-node-bootstrap resetData`
=========================

It removes the data keeping the generated configuration, certificates, keys and block 1.

* [`lared-node-bootstrap resetData`](#lared-node-bootstrap-resetdata)

## `lared-node-bootstrap resetData`

It removes the data keeping the generated configuration, certificates, keys and block 1.

```
USAGE
  $ lared-node-bootstrap resetData

OPTIONS
  -h, --help           It shows the help of this command.
  -t, --target=target  [default: target] The target folder where the lared-node-bootstrap network is generated

  --logger=logger      [default: Console,File] The loggers the command will use. Options are: Console,File,Silent. Use
                       ',' to select multiple loggers.

EXAMPLE
  $ lared-node-bootstrap resetData
```

_See code: [src/commands/resetData.ts](https://github.com/lared-association/lared-node-bootstrap/blob/v1.1.4/src/commands/resetData.ts)_
