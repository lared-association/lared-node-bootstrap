`lared-node-bootstrap enrolSupernode`
=====================================

It enrols the nodes in the supernode rewards program by announcing the enrol transaction to the registration address.

* [`lared-node-bootstrap enrolSupernode`](#lared-node-bootstrap-enrolsupernode)

## `lared-node-bootstrap enrolSupernode`

It enrols the nodes in the supernode rewards program by announcing the enrol transaction to the registration address.

```
USAGE
  $ lared-node-bootstrap enrolSupernode

OPTIONS
  -h, --help              It shows the help of this command.
  -t, --target=target     [default: target] The target folder where the symbol-bootstrap network is generated
  -u, --url=url           [default: http://localhost:3000] the network url

  --maxFee=maxFee         the max fee used when announcing (absolute). The node min multiplier will be used if it is not
                          provided.

  --useKnownRestGateways  Use the best NEM node available when announcing. Otherwise the command will use the node
                          provided by the --url parameter.

EXAMPLE
  $ symbol-bootstrap enrolSupernode
```
