#!/bin/bash
set -e
lared-node-bootstrap start -p testnet -a dual -t target/testnet-dual $1 $2 $3
