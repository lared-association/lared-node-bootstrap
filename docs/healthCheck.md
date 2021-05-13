`lared-node-bootstrap healthCheck`
==============================

It checks if the services created with docker compose are up and running.

This command checks:
- Whether the docker containers are running.
- Whether the services' exposed ports are listening.
- Whether the rest gateways' /node/health are OK.

The health check process handles 'repeat' and custom 'openPort' services.

* [`lared-node-bootstrap healthCheck`](#lared-node-bootstrap-healthcheck)

## `lared-node-bootstrap healthCheck`

It checks if the services created with docker compose are up and running.

```
USAGE
  $ lared-node-bootstrap healthCheck

OPTIONS
  -h, --help           It shows the help of this command.
  -t, --target=target  [default: target] The target folder where the lared-node-bootstrap network is generated

DESCRIPTION
  This command checks:
  - Whether the docker containers are running.
  - Whether the services' exposed ports are listening.
  - Whether the rest gateways' /node/health are OK.

  The health check process handles 'repeat' and custom 'openPort' services.

EXAMPLE
  $ lared-node-bootstrap healthCheck
```

_See code: [src/commands/healthCheck.ts](https://github.com/lared-association/lared-node-bootstrap/blob/master/src/commands/healthCheck.ts)_
