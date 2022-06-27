`lared-node-bootstrap report`
======================

it generates reStructuredText (.rst) reports describing the configuration of each node.

* [`lared-node-bootstrap report`](#lared-node-bootstrap-report)

## `lared-node-bootstrap report`

it generates reStructuredText (.rst) reports describing the configuration of each node.

```
USAGE
  $ lared-node-bootstrap report

OPTIONS
  -h, --help           It shows the help of this command.
  -t, --target=target  [default: target] The target folder where the lared-node-bootstrap network is generated

  --logger=logger      [default: Console,File] The loggers the command will use. Options are: Console,File,Silent. Use
                       ',' to select multiple loggers.

EXAMPLE
  $ lared-node-bootstrap report
```

_See code: [src/commands/report.ts](https://github.com/lared-association/lared-node-bootstrap/blob/v1.1.4/src/commands/report.ts)_
