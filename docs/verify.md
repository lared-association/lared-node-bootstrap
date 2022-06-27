`lared-node-bootstrap verify`
======================

It tests the installed software in the current computer reporting if there is any missing dependency, invalid version, or software related issue.

* [`lared-node-bootstrap verify`](#lared-node-bootstrap-verify)

## `lared-node-bootstrap verify`

It tests the installed software in the current computer reporting if there is any missing dependency, invalid version, or software related issue.

```
USAGE
  $ lared-node-bootstrap verify

OPTIONS
  -h, --help       It shows the help of this command.

  --logger=logger  [default: Console,File] The loggers the command will use. Options are: Console,File,Silent. Use ','
                   to select multiple loggers.

EXAMPLE
  $ lared-node-bootstrap verify
```

_See code: [src/commands/verify.ts](https://github.com/lared-association/lared-node-bootstrap/blob/v1.1.4/src/commands/verify.ts)_
