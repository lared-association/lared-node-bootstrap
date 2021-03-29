#!/bin/bash
set -e
lared-node-bootstrap start -p testnet -a api -t target/testnet-api $1 $2 $3
