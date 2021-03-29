#!/bin/bash
set -e
lared-node-bootstrap start -p testnet -a peer -t target/testnet-peer $1 $2 $3
