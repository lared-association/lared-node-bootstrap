#!/bin/bash
set -e
lared-node-bootstrap start -p testnet -a demo -t target/testnet-demo --noPassword $1 $2 $3
